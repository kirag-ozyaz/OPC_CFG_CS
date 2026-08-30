# Подключение конфигуратора OPC в стороннее приложение

Встраивание **OPC_CFGCS** в WinForms-приложение на **.NET Framework 4.8.1**.

## Обзор

Три зоны: в standalone (`OPC_CFGCS.exe`) — через форму и меню; при встраивании **меню у хоста**, библиотека даёт API и `OpcCfgcsWorkspace`.

| Зона | Действие | Вызов из хоста |
|------|----------|----------------|
| Конфигуратор | ПС / Шина / Выключатель, привязка тегов | `session.CreateWorkspace()` на панели |
| Заполнение тегов | Редактирование тегов | `session.ShowTagsEditor(owner)` |
| Справочники | Alias, серверы, параметры, группы | `session.ShowReferenceData(owner)` |

Меню хоста (пример):
```
OPC → Конфигуратор (панель) | Заполнение тегов… | Справочники…
```

## Требования

- Windows, .NET **4.8.1**, WinForms **STA** (`[STAThread]`)
- SQL Server: **OPC_Config** + **GES**, Windows Authentication
- Схема БД и ограничения — [README.md](../README.md)

## Сборки

Ссылка на `OPC_CFGCS.Integration`; в output хоста:

| Файл | Назначение |
|------|------------|
| `OPC_CFGCS.Integration.dll` | `OpcCfgcsHost`, `OpcCfgcsSession` |
| `OPC_CFGCS.UI.dll` | `OpcCfgcsWorkspace`, диалоги |
| `OPC_CFGCS.Core.dll` | `OpcCfgcsSessionOptions`, `OpcCfgcsConnectResult` |
| `OPC_CFGCS.Data.dll` | SQL Server |

Автономно: `OPC_CFGCS.exe` (проект `OPC_CFGCS.UI`).

## Строки подключения

Приоритет: **явно** (`OpcCfgcsSessionOptions` / `Connect`) → **история** (`%AppData%\Roaming\OPC_CFGCS\recent-connections.xml`) → **App.config хоста**:

```xml
<connectionStrings>
  <add name="OpcConfig" connectionString="Data Source=СЕРВЕР;Initial Catalog=OPC_Config;Integrated Security=True" providerName="System.Data.SqlClient" />
  <add name="Ges" connectionString="Data Source=СЕРВЕР;Initial Catalog=GES;Integrated Security=True" providerName="System.Data.SqlClient" />
</connectionStrings>
```

Имена `OpcConfig` и `Ges` обязательны. Если хост всегда передаёт строки в коде, `App.config` не нужен (при наличии истории или явного `Connect`).

## Ресурсы

Папка `Assets` рядом с exe хоста: `OPC_CFGCS.ico`, `Bind.ico`, `ReferenceData.ico`.

## API

**OpcCfgcsHost:** `CreateSession(OpcCfgcsSessionOptions options = null)`

**OpcCfgcsSessionOptions:** `OpcConnectionString`, `GesConnectionString` (null → история → config), `AutoConnect` (default true, без диалогов ошибок).

**OpcCfgcsSession:** `IsConnected` | `CreateWorkspace()` | `Connect(opc, ges, owner, showDialogs)` | `EnsureConnected(owner)` | `ShowTagsEditor(owner)` | `ShowReferenceData(owner)`

**OpcCfgcsConnectResult:** `Success`, `StatusText`, `Message`, `LoadErrors`

**OpcCfgcsWorkspace:** UserControl — `Dock = Fill`, `hostPanel.Controls.Add(workspace)`.

## Добавление пунктов в MenuStrip хоста

Библиотека **не создаёт** меню — пункты добавляете в **главную форму хоста** (дизайнер или код) и в обработчиках вызываете методы **одной** сессии `OpcCfgcsSession`.

### 1. Поле сессии

Создайте сессию при загрузке формы (или при первом входе в раздел OPC):

```csharp
private OpcCfgcsSession _opcSession;

private void HostMainForm_Load(object sender, EventArgs e)
{
    _opcSession = OpcCfgcsHost.CreateSession(new OpcCfgcsSessionOptions { AutoConnect = true });
    InitializeOpcMenu();
}
```

### 2. Пункты меню (код)

Аналог standalone: `MainForm.InitializeMenu()` в `src/OPC_CFGCS.UI/Forms/MainForm.cs`.

```csharp
private void InitializeOpcMenu()
{
    var opcMenu = new ToolStripMenuItem("OPC");
    menuStrip1.Items.Add(opcMenu);

    var configuratorItem = new ToolStripMenuItem("Конфигуратор...");
    configuratorItem.Click += OnOpcConfiguratorMenuClick;
    opcMenu.DropDownItems.Add(configuratorItem);

    var tagsItem = new ToolStripMenuItem("Заполнение тегов...");
    tagsItem.Click += (s, e) => _opcSession.ShowTagsEditor(this);
    opcMenu.DropDownItems.Add(tagsItem);

    var referenceItem = new ToolStripMenuItem("Справочники...");
    referenceItem.Click += (s, e) => _opcSession.ShowReferenceData(this);
    opcMenu.DropDownItems.Add(referenceItem);
}
```

Три пункта на одном уровне главного меню (без подменю «OPC»):

```csharp
var itemConfigurator = new ToolStripMenuItem("Конфигуратор OPC...");
itemConfigurator.Click += OnOpcConfiguratorMenuClick;
menuStrip1.Items.Add(itemConfigurator);

var itemTags = new ToolStripMenuItem("Заполнение тегов OPC...");
itemTags.Click += (s, e) => _opcSession.ShowTagsEditor(this);
menuStrip1.Items.Add(itemTags);

var itemRef = new ToolStripMenuItem("Справочники OPC...");
itemRef.Click += (s, e) => _opcSession.ShowReferenceData(this);
menuStrip1.Items.Add(itemRef);
```

### 3. Обработчик «Конфигуратор»

Показывает вкладку/панель и вставляет `OpcCfgcsWorkspace` (один раз на сессию):

```csharp
private void OnOpcConfiguratorMenuClick(object sender, EventArgs e)
{
    opcTabPage.Visible = true; // или tabControl.SelectedTab = opcTabPage;
    opcHostPanel.Controls.Clear();
    var workspace = _opcSession.CreateWorkspace();
    workspace.Dock = DockStyle.Fill;
    opcHostPanel.Controls.Add(workspace);
}
```

`opcHostPanel` — `Panel` / `TabPage` на форме хоста, `Dock = Fill`.

### Соответствие пунктов и API

| Пункт меню | Вызов сессии |
|------------|----------------|
| Конфигуратор | `CreateWorkspace()` + добавить на панель |
| Заполнение тегов | `ShowTagsEditor(this)` |
| Справочники | `ShowReferenceData(this)` |

`ShowTagsEditor` / `ShowReferenceData` внутри проверяют `IsConnected` и при необходимости показывают «Сначала подключитесь…». Для диалогов передайте форму хоста как `IWin32Window` (`this`).

## Примеры

Минимальный сценарий:
```csharp
using OPC_CFGCS.Core;
using OPC_CFGCS.Integration;
using System.Windows.Forms;

public partial class HostMainForm : Form
{
    private OpcCfgcsSession _opcSession;
    private void OnLoad(object sender, EventArgs e)
    {
        _opcSession = OpcCfgcsHost.CreateSession(new OpcCfgcsSessionOptions
        {
            OpcConnectionString = null,
            GesConnectionString = null,
            AutoConnect = true
        });
    }
    private void OnOpenConfiguratorClick(object sender, EventArgs e)
    {
        configuratorPanel.Controls.Clear();
        var workspace = _opcSession.CreateWorkspace();
        workspace.Dock = DockStyle.Fill;
        configuratorPanel.Controls.Add(workspace);
    }
    private void OnEditTagsClick(object sender, EventArgs e) => _opcSession.ShowTagsEditor(this);
    private void OnReferenceDataClick(object sender, EventArgs e) => _opcSession.ShowReferenceData(this);
}
```

Строки от хоста:
```csharp
var session = OpcCfgcsHost.CreateSession(new OpcCfgcsSessionOptions
{
    OpcConnectionString = "Data Source=SERVER;Initial Catalog=OPC_Config;Integrated Security=True",
    GesConnectionString = "Data Source=SERVER;Initial Catalog=GES;Integrated Security=True",
    AutoConnect = false
});
var workspace = session.CreateWorkspace();
hostPanel.Controls.Add(workspace);
workspace.Dock = DockStyle.Fill;
var result = session.Connect(opcCs, gesCs, this, showDialogs: true);
if (!result.Success) { /* StatusText / Message */ }
```

При `AutoConnect = false` вызовите `Connect` до работы с данными.

## Жизненный цикл

Одна `OpcCfgcsSession` на модуль OPC → `CreateWorkspace()` при открытии раздела → повторный вызов возвращает тот же контрол. Диалоги обновляют workspace. `AppState.CurrentArea` — глобально на процесс.

## Standalone vs embedded

| | Standalone | Embedded |
|---|------------|----------|
| Подключение OPC/GES | Панель на MainForm | Строки от хоста / default |
| Меню тегов / справочников | MainForm | Меню хоста |
| Рабочая область | OpcCfgcsWorkspace | То же |

## Неполадки

| Проблема | Проверка |
|----------|----------|
| Строка не задана | App.config или `Connect` |
| Пустой конфигуратор | `AutoConnect=false`, нет `Connect` |
| «Сначала подключитесь» | `Connect` / `IsConnected` |
| Часть данных не загрузилась | `LoadErrors`, доступ к GES |
| Нет иконок | Папка `Assets` |
| STA ошибки | `[STAThread]` на Main |

## Ссылки

[README.md](../README.md) · [ARCHITECTURE.md](ARCHITECTURE.md) · `src/OPC_CFGCS.Integration` · `src/OPC_CFGCS.UI/Controls/OpcCfgcsWorkspace.cs`
