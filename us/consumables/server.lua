local substances = {}

local function testResponse(ok, message, notifyType, title, duration)
    return {
        ok = ok == true,
        message = message,
        type = notifyType or (ok and 'success' or 'error'),
        title = title,
        duration = duration or 7000,
    }
end

local function notify(sourceId, description, notifyType, title, duration)
    TriggerClientEvent('ox_lib:notify', sourceId, {
        type = notifyType or 'inform',
        title = title,
        description = description,
        duration = duration or 5000,
    })
end

local function getState(sourceId)
    local state = substances[sourceId]

    if not state then
        state = {
            alcohol = { bac = 0.0, updatedAt = os.time(), effectUntil = 0, intensity = 0.0 },
            drugs = {},
        }
        substances[sourceId] = state
    end

    return state
end

local function applyAlcoholDecay(state, now)
    local alcohol = state.alcohol
    local elapsed = math.max(0, now - (alcohol.updatedAt or now))
    local decay = (Config.Metabolism.bacDecayPerHour or 0.015) * (elapsed / 3600)

    alcohol.bac = math.max(0.0, (alcohol.bac or 0.0) - decay)
    alcohol.updatedAt = now

    if alcohol.bac <= 0.0005 then
        alcohol.bac = 0.0
    end
end

local function pruneDrugs(state, now)
    for name, drug in pairs(state.drugs) do
        if (drug.positiveUntil or 0) <= now and (drug.impairmentUntil or 0) <= now then
            state.drugs[name] = nil
        end
    end
end

local function snapshot(sourceId)
    local now = os.time()
    local state = getState(sourceId)

    applyAlcoholDecay(state, now)
    pruneDrugs(state, now)

    local drugs = {}

    for name, drug in pairs(state.drugs) do
        drugs[name] = {
            label = Config.DrugLabels[name] or name,
            positive = (drug.positiveUntil or 0) > now,
            impaired = (drug.impairmentUntil or 0) > now,
            positiveUntil = drug.positiveUntil or 0,
            impairmentUntil = drug.impairmentUntil or 0,
            intensity = drug.intensity or 0.0,
        }
    end

    return {
        bac = state.alcohol.bac or 0.0,
        alcoholEffectUntil = state.alcohol.effectUntil or 0,
        alcoholIntensity = state.alcohol.intensity or 0.0,
        drugs = drugs,
        serverTime = now,
    }
end

local function syncState(sourceId)
    if GetPlayerPing(sourceId) <= 0 then return end

    TriggerClientEvent('code6_consumables:syncSubstances', sourceId, snapshot(sourceId))
end

local function finalUseAction(itemName, metadata)
    local item = exports.ox_inventory:Items(itemName)
    local consume = item and item.consume

    if not consume or consume >= 1 then
        return true, false
    end

    local durability = metadata and metadata.durability

    if type(durability) ~= 'number' then
        return false, false
    end

    if durability > 100 then
        local degrade = (metadata.degrade or item.degrade or 1) * 60
        local percent = ((durability - os.time()) * 100) / degrade
        return percent <= 0.01, false
    end

    if durability <= 0.01 then
        return true, false
    end

    return false, false
end

local function applyConsumable(sourceId, itemName, slot, metadata)
    local profile = Config.Consumables[itemName]
    if not profile then return end

    local finalUse, removeSource = finalUseAction(itemName, metadata or {})

    if profile.remainder and finalUse then
        exports.ox_inventory:AddItem(sourceId, profile.remainder, 1)
    end

    if removeSource and slot then
        exports.ox_inventory:RemoveItem(sourceId, itemName, 1, nil, slot)
    end

    local state = getState(sourceId)
    local now = os.time()

    if profile.antidote then
        state.alcohol.bac = 0.0
        state.alcohol.updatedAt = now
        state.alcohol.effectUntil = 0
        state.alcohol.intensity = 0.0
        state.drugs = {}
        syncState(sourceId)
        return notify(sourceId, 'Симптомы и тест-положительные статусы очищены.', 'success')
    end

    applyAlcoholDecay(state, now)

    if profile.alcohol then
        state.alcohol.bac = math.min(0.35, (state.alcohol.bac or 0.0) + (profile.alcohol.bac or 0.0))
        state.alcohol.effectUntil = math.max(state.alcohol.effectUntil or 0, now + (profile.alcohol.duration or 600))
        state.alcohol.intensity = math.min(1.0, math.max(state.alcohol.intensity or 0.0, profile.alcohol.intensity or 0.25))
    end

    if profile.drug then
        local name = profile.drug.name
        state.drugs[name] = {
            positiveUntil = math.max(state.drugs[name] and state.drugs[name].positiveUntil or 0, now + (profile.drug.positiveSeconds or 3600)),
            impairmentUntil = math.max(state.drugs[name] and state.drugs[name].impairmentUntil or 0, now + (profile.drug.impairmentSeconds or 600)),
            intensity = math.min(1.0, math.max(state.drugs[name] and state.drugs[name].intensity or 0.0, profile.drug.intensity or 0.5)),
            lastUse = now,
        }
    end

    syncState(sourceId)
end

local function canReach(sourceId, targetId)
    if not targetId or targetId == sourceId or GetPlayerPing(targetId) <= 0 then return false end

    local sourcePed = GetPlayerPed(sourceId)
    local targetPed = GetPlayerPed(targetId)

    if not sourcePed or sourcePed == 0 or not targetPed or targetPed == 0 or IsEntityDead(targetPed) then return false end

    return #(GetEntityCoords(sourcePed) - GetEntityCoords(targetPed)) <= ((Config.Targeting.distance or 2.0) + 0.5)
end

local function positiveList(snap)
    local positives = {}

    for name, drug in pairs(snap.drugs or {}) do
        if drug.positive then
            positives[#positives + 1] = drug.label or Config.DrugLabels[name] or name
        end
    end

    table.sort(positives)
    return positives
end

local function bacResultText(bac)
    bac = bac or 0.0

    if bac <= 0.0005 then
        return ('BAC: %.3f%% | Алкоголь не обнаружен'):format(0.0)
    end

    return ('BAC: %.3f%%'):format(bac)
end

local function sampleResultText(snap, positives)
    return ('%s | Наркотики: %s'):format(
        bacResultText(snap.bac or 0.0),
        #positives > 0 and table.concat(positives, ', ') or 'не обнаружены'
    )
end

local function getItemSlot(sourceId, itemName)
    return exports.ox_inventory:GetSlotWithItem(sourceId, itemName)
end

local function getItemCount(sourceId, itemName)
    return exports.ox_inventory:GetItemCount(sourceId, itemName) or 0
end

local function cloneMetadata(slot)
    local metadata = {}

    for key, value in pairs(slot.metadata or {}) do
        metadata[key] = value
    end

    return metadata
end

local function setKitMetadata(sourceId, kitSlot, durability)
    local metadata = cloneMetadata(kitSlot)
    local consume = Config.Targeting.bloodSampleKitConsume or 0.10
    local chargesRemaining = math.max(0, math.ceil((durability / 100) / consume))

    metadata.durability = durability
    metadata.chargesRemaining = chargesRemaining
    metadata.description = ('Осталось проб: %s'):format(chargesRemaining)

    exports.ox_inventory:SetMetadata(sourceId, kitSlot.slot, metadata)
end

local function writeTesterResult(sourceId, testerSlot, targetId, result, snap)
    if not testerSlot then return end

    local metadata = cloneMetadata(testerSlot)
    metadata.lastResult = result
    metadata.lastBac = tonumber(('%0.3f'):format(snap.bac or 0.0))
    metadata.lastTestedPlayer = GetPlayerName(targetId) or ('ID %s'):format(targetId)
    metadata.lastTestedServerId = targetId
    metadata.lastTestedAt = os.date('!%Y-%m-%dT%H:%M:%SZ')
    metadata.description = ('Последний тест: %s | %s'):format(metadata.lastTestedPlayer, result)

    exports.ox_inventory:SetMetadata(sourceId, testerSlot.slot, metadata)
end

local function consumeKitCharge(sourceId, kitSlot)
    if not kitSlot then return false end

    local consume = Config.Targeting.bloodSampleKitConsume or 0.10
    local durability = tonumber(kitSlot.metadata and kitSlot.metadata.durability) or 100
    local nextDurability = durability - (consume * 100)

    if (kitSlot.count or 1) > 1 then
        local metadata = cloneMetadata(kitSlot)
        metadata.durability = math.max(0, nextDurability)
        metadata.chargesRemaining = math.max(0, math.ceil((metadata.durability / 100) / consume))
        metadata.description = ('Осталось проб: %s'):format(metadata.chargesRemaining)

        local removed = exports.ox_inventory:RemoveItem(sourceId, kitSlot.name, 1, nil, kitSlot.slot)
        if not removed then return false end

        if nextDurability > 0.01 then
            local added = exports.ox_inventory:AddItem(sourceId, kitSlot.name, 1, metadata)

            if not added then
                exports.ox_inventory:AddItem(sourceId, kitSlot.name, 1, kitSlot.metadata)
                return false
            end
        end

        return true
    end

    if nextDurability <= 0.01 then
        return exports.ox_inventory:RemoveItem(sourceId, kitSlot.name, 1, nil, kitSlot.slot) == true
    end

    setKitMetadata(sourceId, kitSlot, nextDurability)
    return true
end

local function refundKitCharge(sourceId, kitSlot)
    if not kitSlot then return end

    local consume = Config.Targeting.bloodSampleKitConsume or 0.10
    local currentSlot = exports.ox_inventory:GetSlot(sourceId, kitSlot.slot)

    if currentSlot and currentSlot.name == kitSlot.name then
        local durability = tonumber(currentSlot.metadata and currentSlot.metadata.durability) or 0
        setKitMetadata(sourceId, currentSlot, math.min(100, durability + (consume * 100)))
    else
        exports.ox_inventory:AddItem(sourceId, Config.Targeting.bloodSampleKitItem, 1, kitSlot.metadata)
    end
end

AddEventHandler('ox_inventory:usedItem', function(inventoryId, itemName, slot, metadata)
    if type(inventoryId) ~= 'number' then return end

    applyConsumable(inventoryId, itemName, slot, metadata or {})
end)

RegisterNetEvent('code6_consumables:requestSync', function()
    syncState(source)
end)

local function runBacTest(sourceId, targetId)
    targetId = tonumber(targetId)

    local testerSlot = getItemSlot(sourceId, Config.Targeting.bacTesterItem)

    if not testerSlot and getItemCount(sourceId, Config.Targeting.bacTesterItem) <= 0 then
        return false, 'Нужен алкотестер.', 'error'
    end

    if not canReach(sourceId, targetId) then
        return false, 'Цель слишком далеко.', 'error'
    end

    local snap = snapshot(targetId)
    local result = bacResultText(snap.bac or 0.0)

    if testerSlot then
        writeTesterResult(sourceId, testerSlot, targetId, result, snap)
    end

    notify(targetId, ('%s проверил вас алкотестером. Результат: %s'):format(GetPlayerName(sourceId) or 'Кто-то', result), 'inform', 'Проверка BAC', 9000)

    return true, result, 'success', 'Результат алкотестера', 9000
end

local function takeBloodSample(sourceId, targetId)
    targetId = tonumber(targetId)

    local kitSlot = getItemSlot(sourceId, Config.Targeting.bloodSampleKitItem)

    if not kitSlot then
        return false, 'Нужен набор для забора крови.', 'error'
    end

    if not canReach(sourceId, targetId) then
        return false, 'Цель слишком далеко.', 'error'
    end

    local consumed = consumeKitCharge(sourceId, kitSlot)
    if not consumed then
        return false, 'Не удалось использовать набор для забора крови.', 'error'
    end

    local snap = snapshot(targetId)
    local positives = positiveList(snap)
    local result = sampleResultText(snap, positives)
    local metadata = {
        label = ('Образец крови - %s'):format(GetPlayerName(targetId) or ('ID %s'):format(targetId)),
        sampledPlayer = GetPlayerName(targetId) or ('ID %s'):format(targetId),
        sampledServerId = targetId,
        collector = GetPlayerName(sourceId) or ('ID %s'):format(sourceId),
        collectorServerId = sourceId,
        collectedAt = os.date('!%Y-%m-%dT%H:%M:%SZ'),
        bac = tonumber(('%0.3f'):format(snap.bac or 0.0)),
        drugPositives = positives,
        description = result,
    }

    local added = exports.ox_inventory:AddItem(sourceId, Config.Targeting.bloodSampleItem, 1, metadata)

    if not added then
        refundKitCharge(sourceId, kitSlot)
        return false, 'Не удалось взять образец крови.', 'error'
    end

    notify(targetId, ('%s взял у вас образец крови. Результат: %s'):format(GetPlayerName(sourceId) or 'Кто-то', result), 'inform', 'Образец крови', 11000)

    return true, result, 'success', 'Результат образца крови', 11000
end

local function runTestSafely(testFn, sourceId, targetId)
    local ok, success, message, notifyType, title, duration = pcall(testFn, sourceId, targetId)

    if not ok then
        print(('[code6_consumables] testing callback failed for source %s target %s: %s'):format(sourceId, targetId, success))
        return testResponse(false, 'Не удалось выполнить тест. Подробности записаны в консоль сервера.', 'error', 'Ошибка теста', 9000)
    end

    return testResponse(success, message, notifyType, title, duration)
end

lib.callback.register('code6_consumables:runBacTest', function(sourceId, targetId)
    return runTestSafely(runBacTest, sourceId, targetId)
end)

lib.callback.register('code6_consumables:takeBloodSample', function(sourceId, targetId)
    return runTestSafely(takeBloodSample, sourceId, targetId)
end)

RegisterNetEvent('code6_consumables:runBacTest', function(targetId)
    local ok, message, notifyType, title, duration = runBacTest(source, targetId)
    notify(source, message, notifyType, title, duration)
end)

RegisterNetEvent('code6_consumables:takeBloodSample', function(targetId)
    local ok, message, notifyType, title, duration = takeBloodSample(source, targetId)
    notify(source, message, notifyType, title, duration)
end)

AddEventHandler('playerDropped', function()
    substances[source] = nil
end)
