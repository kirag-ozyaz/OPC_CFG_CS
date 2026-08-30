# OPC_CFGCS — миграция с Access ADP на WinForms

Миграция приложения `OPC_CFGCS.adp` (Конфигурация OPC) на **C# WinForms / .NET Framework 4.8.1** с подключением к **MS SQL Server** (базы `OPC_Config` и `GES`).

## Требования

- Windows с .NET Framework 4.8.1
- Visual Studio 2019+ или MSBuild
- SQL Server 2005+ с базами `OPC_Config` и `GES` (представления на `OPC_Config` ссылаются на `GES.dbo.*`)
- Windows Authentication (как в исходном ADP)

## Структура решения

```
OPC_CFGCS.sln
├── src/OPC_CFGCS.UI/       WinForms-приложение
├── src/OPC_CFGCS.Data/     ADO.NET, SqlRepository
└── src/OPC_CFGCS.Core/     Бизнес-логика (AreaHelper, AppState, BindingService)
```

## Подключение к БД

Строки подключения по умолчанию — в `src/OPC_CFGCS.UI/App.config`:

```xml
<add name="OpcConfig"
     connectionString="Data Source=ULGES-SQL2;Initial Catalog=OPC_Config;Integrated Security=True"
     providerName="System.Data.SqlClient" />
<add name="Ges"
     connectionString="Data Source=ULGES-SQL2;Initial Catalog=GES;Integrated Security=True"
     providerName="System.Data.SqlClient" />
```

На главной форме — два поля (**OPC_Config** и **GES**) с выпадающим списком последних подключений. При успешном подключении пара строк сохраняется в профиле пользователя:

`%AppData%\Roaming\OPC_CFGCS\recent-connections.xml`

Если файла ещё нет, подставляются значения из `App.config`.

## Сборка

```bat
msbuild OPC_CFGCS.sln /p:Configuration=Release
```

Или откройте `OPC_CFGCS.sln` в Visual Studio и соберите решение.

## Главная форма

После подключения к обеим базам:

| Область | Назначение |
|---------|------------|
| Вкладки ПС / Шина / Выключатель | Объекты схемы (`SchemaObjectPanel`) |
| Кнопка `<=>` / `<X>` | Привязка / отвязка выбранного тега к объекту схемы |
| Грид тегов (справа) | Список тегов, просмотр полей выбранного тега |
| Фильтр «Подстанция» | Поиск по колонке Area; кнопка **×** — сброс фильтра |
| Панель внизу слева | Привязанные к объекту теги (`BindPanel`) |

Поведение:

- Строки с привязкой к объекту подсвечиваются бледно-зелёным (`#DCFFDC`).
- При выборе объекта слева справа выделяется **первый привязанный** тег (если есть).
- Редактирование тегов на главной форме **не выполняется** — только просмотр и привязка.

## Меню

| Пункт | Форма | Описание |
|-------|-------|----------|
| **Данные → Заполнение тегов…** | `TagsEditForm` | Добавление и редактирование тегов (Сервер, Группа, Параметр, Area, Source, ItemName и др.) |
| **Настройки → Справочники…** | `ReferenceDataForm` | Справочники: Alias, Типы OPC, OPC-серверы, Параметры, OPC-группы |

## Соответствие ADP → WinForms

| ADP | WinForms |
|-----|----------|
| frm_Main | MainForm |
| frm_Tags | TagsEditForm + TagsPanel (просмотр на главной форме) |
| frm_Ps / frm_PsCellBus / frm_PsCellSwitch | SchemaObjectPanel (3 вкладки) |
| frm_Bind | BindPanel |
| Module1.ShowBinding | SqlRepository.GetBindingsByObjectId |
| Module1.gCurrArea | AppState.CurrentArea |
| GetParentObj() | AreaHelper.GetParentObj |

## Схема БД

См. `data/OPC_Config.ddl`.

Ключевые таблицы: `Tags`, `Tag2Group`, `OpcGroups`, `Servers`, `Parameters`, `Alias`, `OPC_Types`.

Ключевые представления (требуют доступ к БД `GES` на том же сервере):

- `viewOpc_Ps`
- `viewOpc_Ps_Cell_Bus`
- `viewOpc_Ps_Cell_Switch`

## Иконки

| Файл | Назначение |
|------|------------|
| `Assets/OPC_CFGCS.ico` | Приложение, главное окно |
| `Assets/Bind.ico` | Форма «Заполнение тегов» |
| `Assets/ReferenceData.ico` | Форма «Справочники» |

## Известные ограничения

- Представления схемы обращаются к `GES.dbo.*` по имени базы на сервере SQL (не через строку GES из приложения).
- При недоступности части данных (например, отсутствует `GES`) приложение продолжает работу с предупреждением, а не аварийным завершением.
