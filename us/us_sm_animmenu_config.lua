Config = {}

Config.PersistentFace = true -- Make face emote save after leaving server
Config.PersistentWalk = true -- Make walk style save after leaving server

Config.MenuKey = "F3" -- Key to open menu

Config.EnableQuickSlots = true
Config.QuickSlotCount = 5
Config.QuickSlotPresetCount = 3
-- RegisterKeyMapping не поддерживает «SHIFT+1», только одиночные клавиши.
-- Shift проверяется отдельно в коде через Config.RequireShiftForQuickSlots ниже.
Config.QuickSlotKeybinds = { "1", "2", "3", "4", "5" }
Config.RequireShiftForQuickSlots = true

-- Animation keys that should appear in the "NEW" tab.
-- You can use either:
-- 1) array style: { "key1", "key2" }
-- 2) map style:   { key1 = true, key2 = true }
Config.NewAnimations = {
    "idveh",
    "lapdshieldb",
    "doorclipbrd",
    "lholdsg",
    "lholdsglspd",
    "lholdsglssd",
    "lholdsgsahp",
    "fuckyouholster",
    "wholdweapona",
    "clenchfbelt",
    "formalposeclow",
    "formalposec",
    "formalposebh",
    "formalposebal",
    "holsterbelta",
    "vehtrafficc",
    "ceclipboard",
    "handheldear",
    "radiohwater",
    "radiohva",
    "radiohlv",
    "holdradiochesta",
    "adjustradiov",
    "adjradiolow",
    "waimp",
    "searchvehv",
    "altvesta",
    "highbothvesta",
    "highholdr",
    "highvholdr",
    "holdvesrrl",
    "holdvestllow",
    "vestholdcenlb",
    "vestholdceno",
    "vestholdcl",
    "sticklervesta",
    "sticklervestba",
    "sticklervestleft",
    "fistvicstatic",
    "vehpointlow",
    "viccm",
    "viceblown",
    "vicfa",
    "vicfb",
    "vicguna",
    "vichout",
    "vicpassangerarm",
    "vicpassangerarmoa",
    "vicpassangerarmrest",
    "vicpassangergrabr",
    "vicpassangerpoint",
    "vicpassangerpointarm",
    "vicpassangerspotlighta",
    "vicpoint",
    "vicpointv",
    "vicposea",
    "vicposeb",
    "vicpv",
    "vicspotlightdr",
    "vicvha",
    "chainsawidle",
    "chainsawidle2",
    "chainsawsawing"
}

Config.Locales = { -- Locales
    ['noonenearby'] = "Никого рядом.",
    ['refused'] = 'Анимация отклонена.',
    ['acceptrefuse'] = '~y~Y~w~ принять, ~r~L~w~ отклонить (~g~',
    ['help_keys'] = "Перемещение\n~INPUT_FRONTEND_RDOWN~ - Подтвердить\n~INPUT_VEH_DUCK~ - Отменить\n~INPUT_COVER~ - Повернуть влево\n~INPUT_PICKUP~ - Повернуть вправо\n~INPUT_RELOAD~ - Вверх\n~INPUT_ENTER~ - Вниз\n~INPUT_MOVE_LEFT_ONLY~ - Влево\n~INPUT_MOVE_RIGHT_ONLY~ - Вправо\n~INPUT_MOVE_UP_ONLY~ - Вперед\n~INPUT_MOVE_DOWN_ONLY~ - Назад",
    ['help_keys_cancel'] = "~INPUT_VEH_DUCK~ - Отменить",
    ['quickslot_empty'] = "В этом слоте нет анимации.",
    ['quickslot_assigned'] = "Анимация сохранена в слот %s.",
    ['quickslot_preset_changed'] = "Выбран пресет быстрых анимаций %s."
}

Config.keys = {
    confirm = {191, 'Enter'},
    cancel = {73, 'X'},
    rleft = {44, 'Q'},
    rright = {38, 'E'},
    up = {45, 'R'},
    down = {23, 'F'},
    left = {34, 'A'},
    right = {35, 'D'},
    forward = {32, 'W'},
    backward = {33, 'S'}
}

Config.setupPed = function(ped)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskSetBlockingOfNonTemporaryEvents(ped, true)
    FreezeEntityPosition(ped, true)
end

Config.FpsMode = false

Config.maxDistance = 30
Config.rotateSpeed = 5
Config.movementSpeed = 0.05
Config.cloneAlpha = 204
Config.returnToStart = true
Config.walkToPosition = true

Config.UseRagdoll = false
Config.RagdollKeybind = "U"
Config.RagdollAsToggle = false


Config.UseCrouch = true
Config.CrouchKeybindEnabled = true
Config.CrouchKeybind = "C"
Config.CrouchOverrideStealthMode = false

Config.UseCrawl = true
Config.CrawlKeybindEnabled = true
Config.CrawlKeybind = "RCONTROL"

Config.UseHandsup = true
Config.DisabledHandsupControls = false
Config.HandsupInCar = true
Config.HoldToHandsUp = false
Config.HandsupKeybindEnabled = true
Config.HandsupKeybind = "U"
Config.HandsupShiftEmote = "lie"

Config.UsePointing = false
Config.PointingInCar = true
Config.PointingKeybindEnabled = true
Config.PointingKeybind = "B"

Config.UseBackwardMovement = true
Config.BackwardMovementKeybind = "J"

-- Клавиша для вращения камерой при открытом меню анимаций (нажать — включить, нажать ещё раз — выключить).
-- Toggle-режим выбран потому, что ALT в CEF/Windows перехватывается на системном уровне и hold-режим
-- для ALT нестабилен. Если ставишь не-ALT клавишу — поведение остаётся toggle для единообразия.
-- Привязка с этим именем появится в Settings → Key Bindings → FiveM ("Меню анимаций: вращение камеры").
-- RotateCamKey    — FiveM-идентификатор клавиши, только для отображения в настройках игры.
--   Список ID: https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
-- RotateCamJsKey  — JavaScript event.key для детекта нажатия в NUI (включает режим вращения).
--   Примеры: "Alt", "Shift", "Control", "Tab", "z", "F10".
-- RotateCamRawKey — Windows VK-код для опроса удержания клавиши (выключает режим вращения).
--   Примеры: 18=ALT, 16=SHIFT, 17=CTRL, 9=TAB, 90=Z, 121=F10. Полный список:
--   https://learn.microsoft.com/en-us/windows/win32/inputdev/virtual-key-codes
-- При смене клавиши синхронизируй все три значения.
Config.RotateCamKey = "LMENU"
Config.RotateCamJsKey = "Alt"
Config.RotateCamRawKey = 18

-- Положение клона-предпросмотра анимации на экране.
-- PreviewScreenX / PreviewScreenY — экранные координаты (0.0 - 1.0).
--   X: 0 = слева, 1 = справа.
--   Y: 0 = сверху, 1 = снизу.
-- PreviewDistance — расстояние от камеры до клона в метрах (меньше = ближе/крупнее).
Config.PreviewScreenX = 0.55
Config.PreviewScreenY = 0.50
Config.PreviewDistance = 3.2
