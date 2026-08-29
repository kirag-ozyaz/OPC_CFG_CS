# OPC_CFGCS — миграция с Access ADP на WinForms

Миграция приложения `OPC_CFGCS.adp` (Конфигурация OPC) на **C# WinForms / .NET Framework 4.8.1** с подключением к **MS SQL Server 2005** (`OPC_Config`).

## Требования

- Windows с .NET Framework 4.8.1
- Visual Studio 2019+ или MSBuild
- SQL Server 2005+ с базами `OPC_Config` и `GES` (views ссылаются на `GES.dbo.*`)
- Windows Authentication (как в исходном ADP)

## Структура решения

```
OPC_CFGCS.sln
├── src/OPC_CFGCS.UI/       WinForms-приложение
├── src/OPC_CFGCS.Data/     ADO.NET, SqlRepository
└── src/OPC_CFGCS.Core/     Бизнес-логика (из VBA Module1, GetParentObj)
```

## Подключение к БД

Строка подключения в `src/OPC_CFGCS.UI/App.config`:

```xml
<add name="OpcConfig"
     connectionString="Data Source=ULGES-SQL2;Initial Catalog=OPC_Config;Integrated Security=True"
     providerName="System.Data.SqlClient" />
```

Измените `Data Source` при необходимости.

## Сборка

```bat
msbuild OPC_CFGCS.sln /p:Configuration=Release
```

Или откройте `OPC_CFGCS.sln` в Visual Studio и соберите решение.

## Соответствие ADP → WinForms

| ADP | WinForms |
|-----|----------|
| frm_Main | MainForm |
| frm_Tags | TagsPanel |
| frm_Ps / frm_PsCellBus / frm_PsCellSwitch | SchemaObjectPanel (3 вкладки) |
| frm_Bind | BindPanel |
| Module1.ShowBinding | SqlRepository.GetBindingsByObjectId |
| Module1.gCurrArea | AppState.CurrentArea |
| GetParentObj() | AreaHelper.GetParentObj |

## Схема БД

См. `OPC_Config.ddl` в корне репозитория.

Ключевые таблицы: `Tags`, `Tag2Group`, `OpcGroups`, `Servers`, `Parameters`.

Ключевые views (требуют доступ к БД `GES`):

- `viewOpc_Ps`
- `viewOpc_Ps_Cell_Bus`
- `viewOpc_Ps_Cell_Switch`

## Иконки

- `src/OPC_CFGCS.UI/Assets/OPC_CFGCS.ico` — иконка приложения (exe, заголовок окна)
- `src/OPC_CFGCS.UI/Assets/Bind.ico` — иконка привязки тегов (дополнительный ресурс)
