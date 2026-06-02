Config = Config or {}

Config.Debug = false

Config.Metabolism = {
    bacDecayPerHour = 0.015,
}

Config.Targeting = {
    distance = 2.0,
    bacTesterItem = 'bac_tester',
    bloodSampleKitItem = 'blood_sample_kit',
    bloodSampleItem = 'blood_sample',
    bloodSampleKitConsume = 0.10,
}

Config.Consumables = {
    narcan = {
        antidote = true,
    },
    water = {
        remainder = 'empty_bottle',
    },
    cola = {
        remainder = 'empty_can',
    },
    sprunk = {
        remainder = 'empty_can',
    },
    coffee = {
        remainder = 'empty_cup',
    },
    burger = {
        remainder = 'food_wrapper',
    },
    sandwich = {
        remainder = 'food_wrapper',
    },
    donut = {
        remainder = 'food_wrapper',
    },
    beer = {
        remainder = 'empty_bottle',
        alcohol = { bac = 0.018, intensity = 0.25, duration = 8 * 60 },
    },
    whiskey = {
        remainder = 'empty_cup',
        alcohol = { bac = 0.03, intensity = 0.4, duration = 10 * 60 },
    },
    wine = {
        remainder = 'empty_bottle',
        alcohol = { bac = 0.022, intensity = 0.3, duration = 9 * 60 },
    },
    joint = {
        remainder = 'joint_roach',
        drug = { name = 'weed', positiveSeconds = 45 * 60, impairmentSeconds = 8 * 60, intensity = 0.3 },
    },
    bong = {
        remainder = 'empty_bong',
        drug = { name = 'weed', positiveSeconds = 60 * 60, impairmentSeconds = 10 * 60, intensity = 0.45 },
    },
    cocaine_bag = {
        remainder = 'empty_baggie',
        drug = { name = 'cocaine', positiveSeconds = 90 * 60, impairmentSeconds = 12 * 60, intensity = 0.65 },
    },
    crack_rock = {
        remainder = 'empty_baggie',
        drug = { name = 'crack', positiveSeconds = 90 * 60, impairmentSeconds = 14 * 60, intensity = 0.75 },
    },
    meth_bag = {
        remainder = 'empty_baggie',
        drug = { name = 'meth', positiveSeconds = 120 * 60, impairmentSeconds = 16 * 60, intensity = 0.8 },
    },
    heroin_syringe = {
        remainder = 'used_syringe',
        drug = { name = 'heroin', positiveSeconds = 120 * 60, impairmentSeconds = 15 * 60, intensity = 0.8 },
    },
    pill_bottle = {
        remainder = 'empty_pill_bottle',
        drug = { name = 'pills', positiveSeconds = 75 * 60, impairmentSeconds = 12 * 60, intensity = 0.55 },
    },
    lean_cup = {
        remainder = 'empty_lean_cup',
        drug = { name = 'lean', positiveSeconds = 90 * 60, impairmentSeconds = 14 * 60, intensity = 0.48 },
    },
}

Config.DrugLabels = {
    weed = 'THC',
    cocaine = 'Кокаин',
    crack = 'Крэк-кокаин',
    meth = 'Метамфетамин',
    heroin = 'Героин / опиаты',
    pills = 'Таблетки',
    lean = 'Лин / кодеин',
}
