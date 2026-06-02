# code6-open-cfg

Открытый репозиторий с конфигами сервера code6. Здесь лежат файлы, которые можно править без доступа к основному репозиторию `code6-game-us`: точки телепорта, списки транспорта и оружия, пресеты формы, переводы меню, предметы инвентаря и похожие настройки.

Изменения принимаются через Pull Request. В описании PR коротко напишите, что меняется и зачем.

## Структура

Основная папка сейчас одна:

- `us/` - конфиги для US-сервера.
- `us/inventory/` - предметы, арсеналы и настройки инвентаря.
- `us/inventory/images/` - иконки предметов для инвентаря.

## Что можно редактировать

| Файл | Что внутри | Что обычно менять |
| --- | --- | --- |
| `us/us_vmenu_locations.json` | Точки телепорта vMenu | Название точки, координаты `x/y/z`, поворот `heading`, добавление или удаление точек |
| `us/us_vmenu_addons.json` | Списки addon-транспорта, педов и оружия для vMenu | Добавление моделей в `vehicles`, `peds`, `weapons` |
| `us/us_vmenu_fit_presets.json` | Готовые наборы одежды | Названия, описания, папки, `fitCode` для формы и гражданских пресетов |
| `us/us_vmenu_menu_localizer.json` | Перевод пунктов vMenu | Тексты меню и кнопок |
| `us/us_vk_tp_config.lua` | Переходы между интерьерами и улицей | Пары точек входа/выхода, координаты, названия, связи `destination` |
| `us/us_sm_animmenu_config.lua` | Настройки меню анимаций | Горячие клавиши, быстрые слоты, список новых анимаций, тексты |
| `us/us_sm_animmenu_anims.lua` | Список доступных анимаций | Добавление или правка анимаций, названий, категорий и props |
| `us/us_globalconfig_weapons_on_back.lua` | Отображение оружия на спине/груди | Какие оружия показывать на персонаже и в каком профиле крепления |
| `us/us_holsterscript_config.lua` | Настройки кобуры | Какие оружия используют кобуру и какие компоненты одежды переключаются |
| `us/us_helicam_shared.lua` | Настройки HeliCam | Клавиши, единицы измерения, дальность, зум, маркеры, доступ |
| `us/us_px_spotlight_config.lua` | Настройки прожектора на транспорте | Разрешенные машины, положение прожектора, цвет и дальность света |
| `us/us_weaponwheel_client.lua` | Названия оружия в колесе оружия | Отображаемые имена оружия |
| `us/inventory/ox_items.lua` | Предметы ox_inventory | Название, вес, картинка, время использования, еда/вода, анимации |
| `us/inventory/ox_shops.lua` | Магазины ox_inventory | Ассортимент магазинов, вендинга, ликерных и служебных точек |
| `us/inventory/selfmanage_config_rolearmories.lua` | Локеры, арсеналы и стартовые предметы ролей | Состав арсеналов PD/SO/HP/FD/DOT/FIB, доступ по ролям, лимиты |
| `us/consumables/*.lua` | Конфиги и слой code6_consumables | Еда, напитки, алкоголь, наркотики, остатки, BAC/кровь, метаданные тестов |
| `us/inventory/images/*.png` | Иконки предметов | Добавление или замена картинок предметов (100х100px) |
| `us/inventory/images/item_editor.psd` | Шаблон для иконок | Исходник для подготовки новых картинок |

## Связь с `code6-game-us`

Для проверки можно смотреть, куда эти файлы попадают в основном серверном репозитории:

| Файл здесь | Примерный файл в `code6-game-us` |
| --- | --- |
| `us/us_vmenu_locations.json` | `resources/[scripts]/vMenu/config/locations.json` |
| `us/us_vmenu_addons.json` | `resources/[scripts]/vMenu/config/addons.json` |
| `us/us_vmenu_fit_presets.json` | `resources/[scripts]/vMenu/config/fit_presets.json` |
| `us/us_vmenu_menu_localizer.json` | `resources/[scripts]/vMenu/config/menu_localizer.json` |
| `us/us_vk_tp_config.lua` | `resources/[scripts]/vk_tp/config.lua` |
| `us/us_sm_animmenu_config.lua` | `resources/[scripts]/[paid]/sm_animmenu/config.lua` |
| `us/us_sm_animmenu_anims.lua` | `resources/[scripts]/[paid]/sm_animmenu/anims.lua` |
| `us/us_px_spotlight_config.lua` | `resources/[scripts]/px_spotlight/shared/config.lua` |
| `us/us_helicam_shared.lua` | `resources/[scripts]/HeliCam/Nabla/shared.lua` |
| `us/us_holsterscript_config.lua` | `resources/[scripts]/GunAnim/data/holster.lua` |
| `us/us_weaponwheel_client.lua` | `resources/[scripts]/weaponwheel/client.lua` |
| `us/us_globalconfig_weapons_on_back.lua` | `resources/[scripts]/globalconfig/client.lua` |
| `us/inventory/ox_items.lua` | `resources/[scripts]/ox_inventory/data/items.lua` |
| `us/inventory/ox_shops.lua` | `resources/[scripts]/ox_inventory/data/shops.lua` |
| `us/inventory/ox_containers.lua` | `resources/[scripts]/ox_inventory/modules/items/containers.lua` |
| `us/inventory/selfmanage_config_rolearmories.lua` | `resources/[scripts]/code6_selfmanage/config.lua` |
| `us/consumables/config.lua` | `resources/[scripts]/code6_consumables/config.lua` |
| `us/consumables/client.lua` | `resources/[scripts]/code6_consumables/client.lua` |
| `us/consumables/server.lua` | `resources/[scripts]/code6_consumables/server.lua` |

## Простые правила правок

- Для `.json` файлов сохраняйте правильный JSON: кавычки вокруг строк, запятые между элементами, без лишней запятой в конце списка.
- Для `.lua` файлов не удаляйте скобки `{}` и `end`, если не уверены, что они относятся к вашей правке.
- Если добавляете предмет с картинкой, имя файла в `client.image` должно совпадать с файлом в `us/inventory/images/`.
- Если добавляете оружие, используйте тот же `WEAPON_...`, который используется в ресурсах сервера.
- Если меняете координаты, указывайте `x`, `y`, `z` и, где нужно, `heading`.
- Не добавляйте секреты, токены, пароли и приватные данные.

## Как предложить изменение

1. Сделайте правку в нужном файле.
2. Проверьте, что файл не сломан по синтаксису.
3. Создайте Pull Request.
4. В описании напишите, например: "добавлена точка телепорта LSSD Davis" или "обновлены предметы арсенала FD".
