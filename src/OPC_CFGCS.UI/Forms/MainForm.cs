using System;
using System.Drawing;
using System.Windows.Forms;
using OPC_CFGCS.Core;
using OPC_CFGCS.Data;
using OPC_CFGCS.UI.Controls;

namespace OPC_CFGCS.UI.Forms
{
    public sealed partial class MainForm : Form
    {
        private readonly SqlRepository _repository = new SqlRepository();
        private readonly TagsPanel _tagsPanel = new TagsPanel();
        private readonly BindPanel _bindPanel = new BindPanel();
        private readonly SchemaObjectPanel _psPanel = new SchemaObjectPanel(SchemaObjectType.PowerStation);
        private readonly SchemaObjectPanel _busPanel = new SchemaObjectPanel(SchemaObjectType.CellBus);
        private readonly SchemaObjectPanel _switchPanel = new SchemaObjectPanel(SchemaObjectType.CellSwitch);
        private readonly TabControl _schemaTabs = new TabControl();
        private readonly Button _btnBind = new Button { Text = "<=>", Width = 60, Height = 28 };

        private SchemaObjectType _currentSchemaType = SchemaObjectType.PowerStation;

        public MainForm()
        {
            Text = "Конфигурация OPC";
            StartPosition = FormStartPosition.CenterScreen;
            Size = new Size(1280, 800);

            if (!_repository.TestConnection(out var error))
            {
                MessageBox.Show(
                    "Не удалось подключиться к SQL Server.\r\n\r\n" + error +
                    "\r\n\r\nПроверьте App.config (Data Source, Initial Catalog, Integrated Security).",
                    "OPC_CFGCS",
                    MessageBoxButtons.OK,
                    MessageBoxIcon.Error);
            }

            BuildLayout();
            WireEvents();
            UpdateBindings();
        }

        private void BuildLayout()
        {
            var root = new SplitContainer
            {
                Dock = DockStyle.Fill,
                Orientation = Orientation.Horizontal,
                SplitterDistance = 420
            };

            var topSplit = new SplitContainer
            {
                Dock = DockStyle.Fill,
                Orientation = Orientation.Vertical,
                SplitterDistance = 760
            };

            var schemaPanel = new Panel { Dock = DockStyle.Fill, Padding = new Padding(8) };
            var bindHeader = new Label
            {
                Text = "Связь OPC тэгов с объектами схемы",
                Dock = DockStyle.Top,
                Height = 24,
                Font = new Font(Font, FontStyle.Bold)
            };

            _schemaTabs.Dock = DockStyle.Fill;
            _schemaTabs.TabPages.Add(CreateSchemaTab("ПС", _psPanel));
            _schemaTabs.TabPages.Add(CreateSchemaTab("Шина", _busPanel));
            _schemaTabs.TabPages.Add(CreateSchemaTab("Выключатель", _switchPanel));
            _schemaTabs.SelectedIndexChanged += OnSchemaTabChanged;

            var bindToolbar = new Panel { Dock = DockStyle.Top, Height = 36 };
            _btnBind.Location = new Point(8, 4);
            bindToolbar.Controls.Add(_btnBind);

            schemaPanel.Controls.Add(_schemaTabs);
            schemaPanel.Controls.Add(bindToolbar);
            schemaPanel.Controls.Add(bindHeader);

            topSplit.Panel1.Controls.Add(schemaPanel);
            topSplit.Panel2.Controls.Add(_tagsPanel);
            root.Panel1.Controls.Add(topSplit);
            root.Panel2.Controls.Add(_bindPanel);
            Controls.Add(root);
        }

        private static TabPage CreateSchemaTab(string title, Control content)
        {
            var page = new TabPage(title);
            content.Dock = DockStyle.Fill;
            page.Controls.Add(content);
            return page;
        }

        private void WireEvents()
        {
            _btnBind.Click += OnBindClick;
            _psPanel.CurrentObjectChanged += OnSchemaObjectChanged;
            _busPanel.CurrentObjectChanged += OnSchemaObjectChanged;
            _switchPanel.CurrentObjectChanged += OnSchemaObjectChanged;
            _tagsPanel.TagChanged += OnTagChanged;
            FormClosing += OnFormClosing;
        }

        private void OnSchemaTabChanged(object sender, EventArgs e)
        {
            _currentSchemaType = (SchemaObjectType)_schemaTabs.SelectedIndex;
            _tagsPanel.SetSchemaObjectType(_currentSchemaType);
            OnSchemaObjectChanged(sender, EventArgs.Empty);
            _tagsPanel.RefreshTagState();
        }

        private void OnSchemaObjectChanged(object sender, EventArgs e)
        {
            var current = GetCurrentSchemaPanel().CurrentObject;
            if (current != null)
            {
                AppState.CurrentArea = current.ParentObj;
            }

            UpdateBindings();
            UpdateBindButtonCaption();
        }

        private void OnTagChanged(object sender, EventArgs e)
        {
            UpdateBindButtonCaption();
        }

        private void OnBindClick(object sender, EventArgs e)
        {
            if (_tagsPanel.HasObjectBinding)
            {
                _tagsPanel.UnbindObject();
            }
            else
            {
                var current = GetCurrentSchemaPanel().CurrentObject;
                if (current != null)
                {
                    _tagsPanel.BindToObject(current.Id);
                }
            }

            UpdateBindings();
            UpdateBindButtonCaption();
        }

        private void UpdateBindings()
        {
            var current = GetCurrentSchemaPanel().CurrentObject;
            if (current == null)
            {
                _bindPanel.ClearBindings();
                return;
            }

            _bindPanel.ShowBindings(current.Id);
        }

        private void UpdateBindButtonCaption()
        {
            _btnBind.Text = _tagsPanel.HasObjectBinding ? "<X>" : "<=>";
        }

        private SchemaObjectPanel GetCurrentSchemaPanel()
        {
            switch (_currentSchemaType)
            {
                case SchemaObjectType.CellBus:
                    return _busPanel;
                case SchemaObjectType.CellSwitch:
                    return _switchPanel;
                default:
                    return _psPanel;
            }
        }

        private void OnFormClosing(object sender, FormClosingEventArgs e)
        {
            // Form_Close в ADP вызывал Application.Quit acQuitSaveNone
        }
    }
}
