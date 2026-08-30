using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.IO;
using System.Windows.Forms;
using OPC_CFGCS.Core;
using OPC_CFGCS.Data;
using OPC_CFGCS.UI.Controls;

namespace OPC_CFGCS.UI.Forms
{
    /// <summary>
    /// Главная форма приложения: подключение к OPC_Config и GES, связывание OPC-тегов с объектами схемы.
    /// </summary>
    public sealed partial class MainForm : Form
    {
        private SchemaObjectType _currentSchemaType = SchemaObjectType.PowerStation;
        private IList<RecentConnectionEntry> _recentConnections = new List<RecentConnectionEntry>();
        private SchemaObjectPanel psPanel;
        private SchemaObjectPanel busPanel;
        private SchemaObjectPanel switchPanel;
        private TagsPanel tagsPanel;

        public MainForm()
        {
            InitializeComponent();
            InitializeCustomControls();

            LoadApplicationIcons();
            bindButtonPanel.Resize += (s, e) => CenterBindButton();
            CenterBindButton();
            LoadRecentConnections();
            cmbConnectionString.SelectedIndexChanged += OnOpcConnectionHistorySelected;
            mainWorkPanel.Enabled = false;
            InitializeMenu();
        }

        /// <summary>
        /// Создаёт кастомные панели во время выполнения и заменяет подсказки из дизайнера.
        /// В режиме дизайнера не выполняется — на форме остаются placeholder-Label.
        /// </summary>
        private void InitializeCustomControls()
        {
            if (LicenseManager.UsageMode == LicenseUsageMode.Designtime)
            {
                return;
            }

            psPanel = new SchemaObjectPanel(SchemaObjectType.PowerStation);
            psPanel.Name = "psPanel";
            ReplacePlaceholder(tabPs, lblPsPlaceholder, psPanel);
            psPanel.CurrentObjectChanged += OnSchemaObjectChanged;

            busPanel = new SchemaObjectPanel(SchemaObjectType.CellBus);
            busPanel.Name = "busPanel";
            ReplacePlaceholder(tabBus, lblBusPlaceholder, busPanel);
            busPanel.CurrentObjectChanged += OnSchemaObjectChanged;

            switchPanel = new SchemaObjectPanel(SchemaObjectType.CellSwitch);
            switchPanel.Name = "switchPanel";
            ReplacePlaceholder(tabSwitch, lblSwitchPlaceholder, switchPanel);
            switchPanel.CurrentObjectChanged += OnSchemaObjectChanged;

            tagsPanel = new TagsPanel(false);
            tagsPanel.Name = "tagsPanel";
            tagsPanel.TagChanged += OnTagChanged;
            ReplacePlaceholderInTable(gridsLayout, lblTagsPlaceholder, tagsPanel, 2, 0);
        }

        /// <summary>Удаляет placeholder и добавляет реальный контрол в обычный контейнер.</summary>
        private static void ReplacePlaceholder(Control parent, Label placeholder, Control replacement)
        {
            parent.Controls.Remove(placeholder);
            placeholder.Dispose();
            replacement.Dock = DockStyle.Fill;
            parent.Controls.Add(replacement);
        }

        /// <summary>Удаляет placeholder и добавляет реальный контрол в ячейку TableLayoutPanel.</summary>
        private static void ReplacePlaceholderInTable(
            TableLayoutPanel table,
            Label placeholder,
            Control replacement,
            int column,
            int row)
        {
            table.Controls.Remove(placeholder);
            placeholder.Dispose();
            replacement.Dock = DockStyle.Fill;
            table.Controls.Add(replacement, column, row);
        }

        private void LoadRecentConnections()
        {
            _recentConnections = RecentConnectionsStore.Load();

            cmbConnectionString.Items.Clear();
            cmbGesConnectionString.Items.Clear();

            foreach (var entry in _recentConnections)
            {
                if (!string.IsNullOrWhiteSpace(entry.OpcConfig) && !cmbConnectionString.Items.Contains(entry.OpcConfig))
                {
                    cmbConnectionString.Items.Add(entry.OpcConfig);
                }

                if (!string.IsNullOrWhiteSpace(entry.Ges) && !cmbGesConnectionString.Items.Contains(entry.Ges))
                {
                    cmbGesConnectionString.Items.Add(entry.Ges);
                }
            }

            if (_recentConnections.Count > 0)
            {
                var last = _recentConnections[0];
                cmbConnectionString.Text = last.OpcConfig;
                cmbGesConnectionString.Text = last.Ges;
                return;
            }

            cmbConnectionString.Text = DatabaseConnection.ConnectionString;
            cmbGesConnectionString.Text = DatabaseConnection.GesConnectionString;
        }

        private void OnOpcConnectionHistorySelected(object sender, EventArgs e)
        {
            if (cmbConnectionString.SelectedIndex < 0)
            {
                return;
            }

            var opcConfig = cmbConnectionString.SelectedItem as string;
            if (string.IsNullOrWhiteSpace(opcConfig))
            {
                return;
            }

            foreach (var entry in _recentConnections)
            {
                if (string.Equals(entry.OpcConfig, opcConfig, StringComparison.OrdinalIgnoreCase))
                {
                    cmbGesConnectionString.Text = entry.Ges;
                    break;
                }
            }
        }

        private void InitializeMenu()
        {
            var menuStrip = new MenuStrip();

            var dataMenu = new ToolStripMenuItem("Данные");
            var tagsMenuItem = new ToolStripMenuItem("Заполнение тегов...");
            tagsMenuItem.Click += OnTagsEditClick;
            dataMenu.DropDownItems.Add(tagsMenuItem);
            menuStrip.Items.Add(dataMenu);

            var settingsMenu = new ToolStripMenuItem("Настройки");
            var referenceMenuItem = new ToolStripMenuItem("Справочники...");
            referenceMenuItem.Click += OnReferenceDataClick;
            settingsMenu.DropDownItems.Add(referenceMenuItem);
            menuStrip.Items.Add(settingsMenu);
            MainMenuStrip = menuStrip;
            Controls.Add(menuStrip);
        }

        private void OnTagsEditClick(object sender, EventArgs e)
        {
            if (!mainWorkPanel.Enabled)
            {
                MessageBox.Show(
                    "Сначала подключитесь к базе данных.",
                    "OPC_CFGCS",
                    MessageBoxButtons.OK,
                    MessageBoxIcon.Information);
                return;
            }

            using (var form = new TagsEditForm())
            {
                form.ShowDialog(this);
            }

            tagsPanel.ReloadData();
            RefreshSchemaBindingHighlights();
        }

        private void OnReferenceDataClick(object sender, EventArgs e)
        {
            if (!mainWorkPanel.Enabled)
            {
                MessageBox.Show(
                    "Сначала подключитесь к базе данных.",
                    "OPC_CFGCS",
                    MessageBoxButtons.OK,
                    MessageBoxIcon.Information);
                return;
            }

            using (var form = new ReferenceDataForm())
            {
                form.ShowDialog(this);
            }

            tagsPanel.ReloadData();
        }

        private void CenterBindButton()
        {
            btnBind.Left = Math.Max(0, (bindButtonPanel.ClientSize.Width - btnBind.Width) / 2);
            btnBind.Top = Math.Max(0, (bindButtonPanel.ClientSize.Height - btnBind.Height) / 2);
        }

        private void LoadApplicationIcons()
        {
            try
            {
                var appIconPath = Path.Combine(Application.StartupPath, "Assets", "OPC_CFGCS.ico");
                if (File.Exists(appIconPath))
                {
                    Icon = new Icon(appIconPath);
                }
            }
            catch
            {
                // Оставляем иконку по умолчанию, если файл недоступен.
            }
        }

        private void OnConnectClick(object sender, EventArgs e)
        {
            var opcConnectionString = cmbConnectionString.Text.Trim();
            var gesConnectionString = cmbGesConnectionString.Text.Trim();
            DatabaseConnection.ConnectionString = opcConnectionString;
            DatabaseConnection.GesConnectionString = gesConnectionString;

            if (!DatabaseConnection.TestConnection(out var error))
            {
                lblConnectionStatus.Text = "Ошибка OPC_Config";
                lblConnectionStatus.ForeColor = Color.DarkRed;
                mainWorkPanel.Enabled = false;
                MessageBox.Show(
                    "Не удалось подключиться к базе OPC_Config.\r\n\r\n" + error,
                    "OPC_CFGCS",
                    MessageBoxButtons.OK,
                    MessageBoxIcon.Error);
                return;
            }

            if (!DatabaseConnection.TestGesConnection(out var gesError))
            {
                lblConnectionStatus.Text = "Ошибка GES";
                lblConnectionStatus.ForeColor = Color.DarkRed;
                mainWorkPanel.Enabled = false;
                MessageBox.Show(
                    "Не удалось подключиться к базе GES.\r\n\r\n" + gesError,
                    "OPC_CFGCS",
                    MessageBoxButtons.OK,
                    MessageBoxIcon.Error);
                return;
            }

            lblConnectionStatus.Text = "Подключено";
            lblConnectionStatus.ForeColor = Color.DarkGreen;
            mainWorkPanel.Enabled = true;

            RecentConnectionsStore.SaveRecent(opcConnectionString, gesConnectionString);
            LoadRecentConnections();

            var loadErrors = new List<string>();

            psPanel.Reload();
            AppendLoadError(loadErrors, "ПС", psPanel.LastLoadError);

            busPanel.Reload();
            AppendLoadError(loadErrors, "Шина", busPanel.LastLoadError);

            switchPanel.Reload();
            AppendLoadError(loadErrors, "Выключатель", switchPanel.LastLoadError);

            tagsPanel.ReloadData();
            AppendLoadError(loadErrors, "Теги", tagsPanel.LastLoadError);

            bindPanel.ClearBindings();
            UpdateBindings();

            if (loadErrors.Count > 0)
            {
                MessageBox.Show(
                    "Подключение установлено, но часть данных не загружена:\r\n\r\n" + string.Join("\r\n", loadErrors),
                    "OPC_CFGCS",
                    MessageBoxButtons.OK,
                    MessageBoxIcon.Warning);
            }
        }

        private static void AppendLoadError(ICollection<string> errors, string section, string error)
        {
            if (!string.IsNullOrWhiteSpace(error))
            {
                errors.Add(section + ": " + error);
            }
        }

        private void OnSchemaTabChanged(object sender, EventArgs e)
        {
            _currentSchemaType = (SchemaObjectType)schemaTabs.SelectedIndex;
            tagsPanel.SetSchemaObjectType(_currentSchemaType);
            OnSchemaObjectChanged(sender, EventArgs.Empty);
            tagsPanel.RefreshTagState();
        }

        private void OnSchemaObjectChanged(object sender, EventArgs e)
        {
            var current = GetCurrentSchemaPanel().CurrentObject;
            if (current != null)
            {
                AppState.CurrentArea = current.ParentObj;
                tagsPanel.SelectFirstBoundTag(current.Id);
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
            if (tagsPanel.HasObjectBinding)
            {
                tagsPanel.UnbindObject();
            }
            else
            {
                var current = GetCurrentSchemaPanel().CurrentObject;
                if (current != null)
                {
                    tagsPanel.BindToObject(current.Id);
                }
            }

            UpdateBindings();
            UpdateBindButtonCaption();
            RefreshSchemaBindingHighlights();
        }

        private void RefreshSchemaBindingHighlights()
        {
            psPanel.RefreshBindingHighlights();
            busPanel.RefreshBindingHighlights();
            switchPanel.RefreshBindingHighlights();
        }

        private void UpdateBindings()
        {
            if (!mainWorkPanel.Enabled)
            {
                bindPanel.ClearBindings();
                return;
            }

            var current = GetCurrentSchemaPanel().CurrentObject;
            if (current == null)
            {
                bindPanel.ClearBindings();
                return;
            }

            bindPanel.ShowBindings(current.Id);
        }

        private void UpdateBindButtonCaption()
        {
            btnBind.Text = tagsPanel.HasObjectBinding ? "<X>" : "<=>";
        }

        private SchemaObjectPanel GetCurrentSchemaPanel()
        {
            switch (_currentSchemaType)
            {
                case SchemaObjectType.CellBus:
                    return busPanel;
                case SchemaObjectType.CellSwitch:
                    return switchPanel;
                default:
                    return psPanel;
            }
        }

        private void OnFormClosing(object sender, FormClosingEventArgs e)
        {
            // Form_Close в ADP вызывал Application.Quit acQuitSaveNone
        }
    }
}
