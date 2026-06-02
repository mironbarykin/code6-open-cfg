local currentState = nil
local effectThread = false
local targetOptions = { 'code6_consumables:bac_test', 'code6_consumables:blood_sample' }
local activeTimecycle = nil
local activeWalkset = nil
local camShaking = false

local function hasItem(itemName)
    return exports.ox_inventory:GetItemCount(itemName) > 0
end

local function targetServerId(entity)
    if not entity or entity == 0 or IsEntityDead(entity) then return end

    local playerIndex = NetworkGetPlayerIndexFromPed(entity)
    if playerIndex == -1 then return end

    local serverId = GetPlayerServerId(playerIndex)
    if not serverId or serverId == 0 or serverId == cache.serverId then return end

    return serverId
end

local function normalizeTestResponse(response, legacyMessage, legacyType, legacyTitle, legacyDuration)
    if type(response) == 'table' then
        return response.ok == true, response.message, response.type, response.title, response.duration
    end

    return response == true, legacyMessage, legacyType, legacyTitle, legacyDuration
end

local function requestTest(action, entity)
    local serverId = targetServerId(entity)

    if not serverId then
        return lib.notify({ type = 'error', description = 'Не удалось определить игрока.' })
    end

    local progress = lib.progressBar({
        duration = action == 'blood' and 4500 or 2500,
        label = action == 'blood' and 'Забор крови' or 'Проверка BAC',
        canCancel = true,
        disable = { move = true, combat = true, car = true },
        anim = { dict = 'missheistdockssetup1clipboard@idle_a', clip = 'idle_a', flag = 49 },
    })

    if not progress then return end

    local callbackOk, response, legacyMessage, legacyType, legacyTitle, legacyDuration

    if action == 'blood' then
        callbackOk, response, legacyMessage, legacyType, legacyTitle, legacyDuration = pcall(lib.callback.await, 'code6_consumables:takeBloodSample', false, serverId)
    else
        callbackOk, response, legacyMessage, legacyType, legacyTitle, legacyDuration = pcall(lib.callback.await, 'code6_consumables:runBacTest', false, serverId)
    end

    if not callbackOk then
        return lib.notify({
            type = 'error',
            title = 'Ошибка теста',
            description = 'Не удалось получить результат теста. Проверьте, что code6_consumables перезапущен на сервере.',
            duration = 9000,
        })
    end

    local ok, message, notifyType, title, duration = normalizeTestResponse(response, legacyMessage, legacyType, legacyTitle, legacyDuration)

    lib.notify({
        type = notifyType or (ok and 'success' or 'error'),
        title = title,
        description = message or 'Не удалось получить результат теста.',
        duration = duration or 7000,
    })
end

local function strongestDrugIntensity()
    local strongest = 0.0

    if not currentState or type(currentState.drugs) ~= 'table' then return strongest end

    for _, drug in pairs(currentState.drugs) do
        if drug.impaired then
            strongest = math.max(strongest, tonumber(drug.intensity) or 0.0)
        end
    end

    return strongest
end

local function applyWalkset(walkset)
    if activeWalkset == walkset then return end

    if not walkset then
        ResetPedMovementClipset(cache.ped, 0.25)
        activeWalkset = nil
        return
    end

    lib.requestAnimSet(walkset, 1000)
    SetPedMovementClipset(cache.ped, walkset, 0.25)
    activeWalkset = walkset
end

local function applyTimecycle(name, strength)
    if activeTimecycle ~= name then
        SetTimecycleModifier(name)
        activeTimecycle = name
    end

    SetTimecycleModifierStrength(strength)
end

local function clearEffects()
    StopGameplayCamShaking(true)
    ClearTimecycleModifier()
    ResetPedMovementClipset(cache.ped, 0.25)
    activeTimecycle = nil
    activeWalkset = nil
    camShaking = false
end

local function ensureEffectThread()
    if effectThread then return end

    effectThread = true

    CreateThread(function()
        while currentState do
            local now = (currentState.serverTime or os.time()) + math.floor((GetGameTimer() - (currentState.receivedAt or GetGameTimer())) / 1000)
            local alcoholActive = (currentState.alcoholEffectUntil or 0) > now and (currentState.alcoholIntensity or 0) > 0
            local drugIntensity = strongestDrugIntensity()

            if not alcoholActive and drugIntensity <= 0 then
                clearEffects()
                break
            end

            local alcoholIntensity = alcoholActive and math.min(1.0, currentState.alcoholIntensity or 0.0) or 0.0
            local intensity = math.max(alcoholIntensity, drugIntensity)

            if drugIntensity > alcoholIntensity then
                applyTimecycle('spectator5', math.min(0.45, 0.18 + (drugIntensity * 0.25)))
                applyWalkset(drugIntensity >= 0.7 and 'move_m@buzzed' or 'move_m@shadyped@a')
            else
                applyTimecycle('Drunk', math.min(0.35, 0.12 + (alcoholIntensity * 0.2)))
                applyWalkset((currentState.bac or 0) >= 0.08 and 'move_m@drunk@slightlydrunk' or nil)
            end

            if intensity >= 0.55 then
                if not camShaking then
                    ShakeGameplayCam('DRUNK_SHAKE', math.min(0.45, intensity * 0.25))
                    camShaking = true
                end
            else
                StopGameplayCamShaking(true)
                camShaking = false
            end

            Wait(2500)
        end

        currentState = nil
        effectThread = false
    end)
end

RegisterNetEvent('code6_consumables:syncSubstances', function(state)
    currentState = state or {}
    currentState.receivedAt = GetGameTimer()

    ensureEffectThread()
end)

CreateThread(function()
    exports.ox_target:addGlobalPlayer({
        {
            name = 'code6_consumables:bac_test',
            icon = 'fas fa-gauge-high',
            label = 'Проверить BAC',
            distance = Config.Targeting.distance or 2.0,
            canInteract = function(entity)
                return hasItem(Config.Targeting.bacTesterItem) and targetServerId(entity) ~= nil
            end,
            onSelect = function(data)
                requestTest('bac', data.entity)
            end,
        },
        {
            name = 'code6_consumables:blood_sample',
            icon = 'fas fa-vial',
            label = 'Взять кровь',
            distance = Config.Targeting.distance or 2.0,
            canInteract = function(entity)
                return hasItem(Config.Targeting.bloodSampleKitItem) and targetServerId(entity) ~= nil
            end,
            onSelect = function(data)
                requestTest('blood', data.entity)
            end,
        },
    })

    TriggerServerEvent('code6_consumables:requestSync')
end)

AddEventHandler('onResourceStop', function(resourceName)
    if resourceName ~= GetCurrentResourceName() then return end

    exports.ox_target:removeGlobalPlayer(targetOptions)
    clearEffects()
end)
