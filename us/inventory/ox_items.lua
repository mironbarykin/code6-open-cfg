return {
	['testburger'] = {
		label = 'Тестовый бургер',
		weight = 220,
		degrade = 60,
		client = {
			image = 'burger_chicken.png',
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			export = 'ox_inventory_examples.testburger'
		},
		server = {
			export = 'ox_inventory_examples.testburger',
			test = 'what an amazingly delicious burger, amirite?'
		},
		buttons = {
			{
				label = 'Lick it',
				action = function(slot)
					print('You licked the burger')
				end
			},
			{
				label = 'Squeeze it',
				action = function(slot)
					print('You squeezed the burger :(')
				end
			},
			{
				label = 'What do you call a vegan burger?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('A misteak.')
				end
			},
			{
				label = 'What do frogs like to eat with their hamburgers?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('French flies.')
				end
			},
			{
				label = 'Why were the burger and fries running?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('Because they\'re fast food.')
				end
			}
		},
		consume = 0.3
	},

	['bandage'] = {
		label = 'Бинт',
		weight = 115,
		client = {
			anim = { dict = 'missheistdockssetup1clipboard@idle_a', clip = 'idle_a', flag = 49 },
			prop = { model = `prop_rolled_sock_02`, pos = vec3(-0.14, -0.14, -0.08), rot = vec3(-50.0, -50.0, 0.0) },
			disable = { move = true, car = true, combat = true },
			usetime = 2500,
		}
	},

	['black_money'] = {
		label = 'Грязные деньги',
	},

	['burger'] = {
		label = 'Бургер',
		weight = 220,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate a delicious burger'
		},
	},

	['sprunk'] = {
		label = 'Sprunk',
		weight = 350,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_can_01`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
			notification = 'You quenched your thirst with a sprunk'
		}
	},

	['parachute'] = {
		label = 'Парашют',
		weight = 8000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 1500
		}
	},

	['garbage'] = {
		label = 'Мусор',
	},

	['paperbag'] = {
		label = 'Бумажный пакет',
		weight = 1,
		stack = false,
		close = false,
		consume = 0
	},

	['police_duffle_bag'] = {
		label = 'Duffle Bag',
		weight = 1200,
		stack = false,
		close = false,
		consume = 0,
		client = {
			image = 'police_duffle_bag.png'
		}
	},

	['police_duffle_bag_large'] = {
		label = 'Duffle Bag 2',
		weight = 1800,
		stack = false,
		close = false,
		consume = 0,
		client = {
			image = 'police_duffle_bag_large.png'
		}
	},

	['police_backpack'] = {
		label = 'Backpack',
		weight = 1600,
		stack = false,
		close = false,
		consume = 0,
		client = {
			image = 'police_backpack.png'
		}
	},

	['identification'] = {
		label = 'Удостоверение личности',
		client = {
			image = 'card_id.png'
		}
	},

	['custom_item'] = {
		label = 'Пользовательский предмет',
		description = 'A user-created item.',
		weight = 100,
		stack = true,
		consume = 0,
		client = {
			image = 'paperbag.png'
		}
	},

	['custom_document'] = {
		label = 'Пользовательский документ',
		description = 'A user-created document.',
		weight = 20,
		stack = true,
		consume = 0,
		client = {
			image = 'card_id.png'
		}
	},

	['custom_tool'] = {
		label = 'Пользовательский инструмент',
		description = 'A user-created tool.',
		weight = 400,
		stack = true,
		consume = 0,
		client = {
			image = 'lockpick.png'
		}
	},

	['custom_prop'] = {
		label = 'Пользовательский объект',
		description = 'A user-created prop.',
		weight = 250,
		stack = true,
		consume = 0,
		client = {
			image = 'paperbag.png'
		}
	},

	['panties'] = {
		label = 'Нижнее белье',
		weight = 10,
		consume = 0,
		client = {
			status = { thirst = -100000, stress = -25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_cs_panties_02`, pos = vec3(0.03, 0.0, 0.02), rot = vec3(0.0, -13.5, -1.5) },
			usetime = 2500,
		}
	},

	['lockpick'] = {
		label = 'Отмычка',
		weight = 160,
	},

	['handcuffs'] = {
		label = 'Наручники',
		weight = 250,
		stack = true,
		close = true,
		client = {
			image = 'WEAPON_HANDCUFFS.png'
		}
	},

	['handcuff_key'] = {
		label = 'Ключ от наручников',
		weight = 50,
		stack = true,
		close = true,
		client = {
			image = 'key.png'
		}
	},

	['cable_ties'] = {
		label = 'Стяжки',
		weight = 100,
		stack = true,
		close = true,
		client = {
			image = 'ziptie.png'
		}
	},

	['phone'] = {
		label = 'Телефон',
		weight = 190,
		stack = false,
		consume = 0,
		client = {
			export = 'lb-phone.UsePhoneItem'
		}
	},

	['money'] = {
		label = 'Деньги',
	},

	['mustard'] = {
		label = 'Горчица',
		weight = 500,
		client = {
			status = { hunger = 25000, thirst = 25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_food_mustard`, pos = vec3(0.01, 0.0, -0.07), rot = vec3(1.0, 1.0, -1.5) },
			usetime = 2500,
			notification = 'You.. drank mustard'
		}
	},

	['water'] = {
		label = 'Вода',
		weight = 500,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = 'You drank some refreshing water'
		}
	},

	['radio'] = {
		label = 'Рация',
		weight = 1000,
		stack = false,
		allowArmed = true,
		close = true,
		consume = 0,
		client = {
			event = 'code6_selfmanage:openRadioItem'
		}
	},

	['bodycam'] = {
		label = 'Нагрудная камера',
		description = 'Wearable recording camera.',
		weight = 170,
		stack = false,
		allowArmed = true,
		close = true,
		consume = 0,
		client = {
			image = 'bodycam.png',
			event = 'code6_selfmanage:toggleBodycamItem'
		}
	},

	['armour'] = {
		label = 'Бронежилет',
		weight = 3000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 3500
		}
	},

	['clothing'] = {
		label = 'Одежда',
		consume = 0,
	},

	['mastercard'] = {
		label = 'Карта Fleeca',
		stack = false,
		weight = 10,
		client = {
			image = 'card_bank.png'
		}
	},

	['scrapmetal'] = {
		label = 'Металлолом',
		weight = 80,
	},
}
