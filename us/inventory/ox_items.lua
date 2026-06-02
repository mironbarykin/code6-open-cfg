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
			usetime = 4000,
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

	['medikit'] = {
		label = 'Аптечка',
		weight = 900,
		client = {
			anim = { dict = 'missheistdockssetup1clipboard@idle_a', clip = 'idle_a', flag = 49 },
			prop = { model = `prop_ld_health_pack`, pos = vec3(0.08, 0.0, 0.02), rot = vec3(0.0, 0.0, 0.0) },
			disable = { move = true, car = true, combat = true },
			usetime = 4000,
			cancel = true,
			notification = 'Вы использовали аптечку'
		},
		consume = 1,
	},

	['narcan'] = {
		label = 'Наркан',
		weight = 80,
		client = {
			anim = { dict = 'mp_suicide', clip = 'pill', flag = 49 },
			prop = { model = `prop_cs_pills`, bone = 28422, pos = vec3(0.02, 0.02, 0.0), rot = vec3(0.0, 0.0, 0.0) },
			disable = { move = true, car = true, combat = true },
			usetime = 3000,
			cancel = true,
			notification = 'Вы использовали Наркан'
		},
		consume = 1,
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
			notification = 'Вы съели бургер'
		},
		consume = 1,
	},

	['sandwich'] = {
		label = 'Сэндвич',
		weight = 180,
		client = {
			status = { hunger = 160000 },
			anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
			prop = { model = `prop_sandwich_01`, pos = vec3(0.02, 0.02, -0.02), rot = vec3(15.0, 0.0, 0.0) },
			usetime = 2500,
			cancel = true,
			notification = 'Вы съели сэндвич'
		},
		consume = 1,
	},

	['donut'] = {
		label = 'Пончик',
		weight = 120,
		client = {
			status = { hunger = 120000 },
			anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
			prop = { model = `prop_donut_02`, pos = vec3(0.02, 0.02, -0.02), rot = vec3(15.0, 0.0, 0.0) },
			usetime = 2200,
			cancel = true,
			notification = 'Вы съели пончик'
		},
		consume = 1,
	},

	['sprunk'] = {
		label = 'Sprunk',
		weight = 350,
		stack = false,
		durability = true,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_can_01`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 4000,
			cancel = true,
			notification = 'Вы отпили Sprunk'
		},
		consume = 0.25,
	},

	['cola'] = {
		label = 'eCola',
		weight = 350,
		stack = false,
		durability = true,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ecola_can`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 4000,
			cancel = true,
			notification = 'Вы отпили eCola'
		},
		consume = 0.25,
	},

	['coffee'] = {
		label = 'Кофе',
		weight = 250,
		stack = false,
		durability = true,
		client = {
			status = { thirst = 120000 },
			anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_c', flag = 49 },
			prop = { model = `p_amb_coffeecup_01`, pos = vec3(0.0, 0.0, 0.0), rot = vec3(0.0, 0.0, 0.0) },
			usetime = 4500,
			cancel = true,
			notification = 'Вы отпили кофе'
		},
		consume = 0.25,
	},

	['beer'] = {
		label = 'Пиво',
		weight = 400,
		stack = false,
		durability = true,
		client = {
			anim = { dict = 'amb@world_human_drinking@beer@male@idle_a', clip = 'idle_c', flag = 49 },
			prop = { model = `prop_amb_beer_bottle`, bone = 28422, pos = vec3(0.0, 0.0, 0.06), rot = vec3(0.0, 15.0, 0.0) },
			usetime = 5000,
			cancel = true,
			notification = 'Вы отпили пиво'
		},
		consume = 0.25,
	},

	['whiskey'] = {
		label = 'Виски',
		weight = 300,
		client = {
			anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_c', flag = 49 },
			prop = { model = `prop_drink_whisky`, bone = 28422, pos = vec3(0.01, -0.01, -0.06), rot = vec3(0.0, 0.0, 0.0) },
			usetime = 4500,
			cancel = true,
			notification = 'Вы выпили виски'
		},
		consume = 1,
	},

	['wine'] = {
		label = 'Вино',
		weight = 500,
		stack = false,
		durability = true,
		client = {
			anim = { dict = 'amb@world_human_drinking@beer@female@idle_a', clip = 'idle_e', flag = 49 },
			prop = { model = `prop_wine_rose`, bone = 28422, pos = vec3(0.0, 0.04, -0.19), rot = vec3(10.0, 0.0, 0.0) },
			usetime = 5000,
			cancel = true,
			notification = 'Вы отпили вино'
		},
		consume = 0.25,
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

	['carry_box'] = {
		label = 'Box',
		weight = 600,
		stack = false,
		close = false,
		consume = 0,
		client = {
			image = 'carry_box.png'
		}
	},

	['carry_cash_box'] = {
		label = 'Cash Box',
		weight = 1200,
		stack = false,
		close = false,
		consume = 0,
		client = {
			image = 'carry_cash_box.png'
		}
	},

	['carry_beer_box'] = {
		label = 'Beer Box',
		weight = 1200,
		stack = false,
		close = false,
		consume = 0,
		client = {
			image = 'carry_beer_box.png'
		}
	},

	['carry_tool_box'] = {
		label = 'Tool Box',
		weight = 2000,
		stack = false,
		close = false,
		consume = 0,
		client = {
			image = 'carry_tool_box.png'
		}
	},

	['carry_medic_box'] = {
		label = 'Medic Box',
		weight = 1500,
		stack = false,
		close = false,
		consume = 0,
		client = {
			image = 'carry_medic_box.png'
		}
	},

	['medic_bag'] = {
		label = 'Medic Bag 1',
		weight = 1400,
		stack = false,
		close = false,
		consume = 0,
		client = {
			image = 'medic_bag.png'
		}
	},

	['medic_bag_2'] = {
		label = 'Medic Bag 2',
		weight = 700,
		stack = false,
		close = false,
		consume = 0,
		client = {
			image = 'medic_bag_2.png'
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
		stack = false,
		durability = true,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 4000,
			cancel = true,
			notification = 'Вы отпили воду'
		},
		consume = 0.25,
	},

	['joint'] = {
		label = 'Косяк',
		weight = 20,
		stack = false,
		durability = true,
		client = {
			anim = { dict = 'amb@world_human_aa_smoke@male@idle_a', clip = 'idle_c', flag = 49 },
			prop = { model = `p_cs_joint_01`, pos = vec3(0.0, 0.0, 0.0), rot = vec3(0.0, 0.0, 0.0) },
			usetime = 8500,
			cancel = true,
			notification = 'Вы затянулись косяком'
		},
		consume = 0.25,
	},

	['bong'] = {
		label = 'Заряженный бонг',
		weight = 650,
		stack = false,
		durability = true,
		client = {
			anim = { dict = 'sit_bong@dark', clip = 'sit_bong_clip', flag = 49 },
			prop = { model = `prop_bong_01`, bone = 60309, pos = vec3(0.049, -0.2, 0.08), rot = vec3(-85.0199, 102.332, -15.0085) },
			usetime = 7000,
			cancel = true,
			notification = 'Вы затянулись из бонга'
		},
		consume = 0.25,
	},

	['cocaine_bag'] = {
		label = 'Пакетик кокаина',
		weight = 30,
		stack = false,
		durability = true,
		client = {
			anim = { dict = 'anim@scripted@island@special_peds@pavel@hs4_pavel_ig5_caviar_p1', clip = 'base_idle', flag = 49 },
			prop = { model = `h4_prop_h4_coke_spoon_01`, bone = 28422, pos = vec3(0.0, 0.0, 0.0), rot = vec3(0.0, 20.0, 0.0) },
			usetime = 5500,
			cancel = true,
			notification = 'Вы употребили кокаин'
		},
		consume = 0.5,
	},

	['crack_rock'] = {
		label = 'Крэк',
		weight = 25,
		client = {
			anim = { dict = 'special_ped@zombie@base', clip = 'base', flag = 49 },
			prop = { model = `ng_proc_cigpak01a`, pos = vec3(0.01, -0.02, 0.09), rot = vec3(-82.0, 178.0, 30.0) },
			usetime = 6500,
			cancel = true,
			notification = 'Вы употребили крэк'
		},
		consume = 1,
	},

	['meth_bag'] = {
		label = 'Пакетик мета',
		weight = 30,
		stack = false,
		durability = true,
		client = {
			anim = { dict = 'timetable@trevor@smoking_meth@base', clip = 'base', flag = 49 },
			prop = { model = `prop_cs_meth_pipe`, pos = vec3(0.08, -0.02, 0.02), rot = vec3(75.0, 10.0, 10.0) },
			usetime = 7500,
			cancel = true,
			notification = 'Вы употребили мет'
		},
		consume = 0.5,
	},

	['heroin_syringe'] = {
		label = 'Шприц с героином',
		weight = 40,
		client = {
			anim = { dict = 'anim@heists@humane_labs@finale@keycards', clip = 'ped_a_enter_loop', flag = 49 },
			prop = { model = `prop_syringe_01`, bone = 18905, pos = vec3(0.11, 0.03, 0.01), rot = vec3(90.0, 0.0, -50.0) },
			usetime = 6500,
			cancel = true,
			notification = 'Вы использовали шприц'
		},
		consume = 1,
	},

	['pill_bottle'] = {
		label = 'Баночка таблеток',
		weight = 80,
		stack = false,
		durability = true,
		client = {
			anim = { dict = 'mp_suicide', clip = 'pill', flag = 49 },
			prop = { model = `prop_cs_pills`, pos = vec3(0.02, 0.02, 0.0), rot = vec3(0.0, 0.0, 0.0) },
			usetime = 5000,
			cancel = true,
			notification = 'Вы приняли таблетки'
		},
		consume = 0.25,
	},

	['lean_cup'] = {
		label = 'Стакан лина',
		weight = 300,
		stack = false,
		durability = true,
		client = {
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_plastic_cup_02`, pos = vec3(0.02, 0.01, 0.02), rot = vec3(5.0, 5.0, -180.0) },
			usetime = 5000,
			cancel = true,
			notification = 'Вы отпили лин'
		},
		consume = 0.25,
	},

	['empty_bottle'] = {
		label = 'Пустая бутылка',
		weight = 30,
	},

	['empty_can'] = {
		label = 'Пустая банка',
		weight = 20,
	},

	['empty_cup'] = {
		label = 'Пустой стакан',
		weight = 15,
	},

	['food_wrapper'] = {
		label = 'Обертка от еды',
		weight = 5,
	},

	['joint_roach'] = {
		label = 'Окурок косяка',
		weight = 2,
	},

	['empty_bong'] = {
		label = 'Пустой бонг',
		weight = 600,
		stack = false,
	},

	['empty_baggie'] = {
		label = 'Пустой пакетик',
		weight = 2,
	},

	['used_syringe'] = {
		label = 'Использованный шприц',
		weight = 15,
	},

	['empty_pill_bottle'] = {
		label = 'Пустая баночка таблеток',
		weight = 25,
	},

	['empty_lean_cup'] = {
		label = 'Пустой стакан лина',
		weight = 15,
	},

	['bac_tester'] = {
		label = 'Алкотестер',
		weight = 350,
		stack = false,
		consume = 0,
	},

	['blood_sample_kit'] = {
		label = 'Набор для забора крови',
		weight = 250,
		stack = false,
		durability = true,
		consume = 0,
	},

	['blood_sample'] = {
		label = 'Образец крови',
		weight = 80,
		stack = false,
		consume = 0,
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
