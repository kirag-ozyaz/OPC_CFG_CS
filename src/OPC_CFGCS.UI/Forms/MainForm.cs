using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Windows.Forms;
using OPC_CFGCS.Data;
using OPC_CFGCS.UI.Controls;

namespace OPC_CFGCS.UI.Forms
{
    /// <summary>
    /// Главная форма standalone: подключение к БД и рабочая область конфигуратора.
    /// </summary>
    public sealed partial class MainForm : Form
    {
        private IList<RecentConnectionEntry> _recentConnections = new List<RecentConnectionEntry>();
        private OpcCfgcsWorkspace _workspace;

        /// <summary>Инициализирует форму, workspace и меню.</summary>
        public MainForm()
        {
            InitializeComponent();
            InitializeWorkspace();
            LoadApplicationIcons();
            LoadRecentConnections();
            cmbConnectionString.SelectedIndexChanged += OnOpcConnectionHistorySelected;
            InitializeMenu();
        }

        /// <summary>Создаёт <see cref="OpcCfgcsWorkspace"/> и размещает в <see cref="workspaceHost"/>.</summary>
        private void InitializeWorkspace()
        {
            _workspace = new OpcCfgcsWorkspace { Dock = DockStyle.Fill };
            workspaceHost.Controls.Add(_workspace);
            _workspace.SetConnected(false);
        }

        /// <summary>Заполняет комбобоксы из истории или App.config.</summary>
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

        /// <summary>При выборе OPC_Config из истории подставляет парную строку GES.</summary>
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

        /// <summary>Меню «Данные» и «Настройки» (теги, справочники).</summary>
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

        /// <summary>Открывает <see cref="TagsEditForm"/> после проверки подключения.</summary>
        private void OnTagsEditClick(object sender, EventArgs e)
        {
            if (!_workspace.EnabledForConnection)
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

            _workspace.ReloadTagsAndHighlights();
        }

        /// <summary>Открывает <see cref="ReferenceDataForm"/> после проверки подключения.</summary>
        private void OnReferenceDataClick(object sender, EventArgs e)
        {
            if (!_workspace.EnabledForConnection)
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

            _workspace.ReloadTagsAndHighlights();
        }

        /// <summary>Загружает иконку из Assets/OPC_CFGCS.ico.</summary>
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

        /// <summary>Подключается к OPC_Config и GES, обновляет статус и workspace.</summary>
        private void OnConnectClick(object sender, EventArgs e)
        {
            var result = OpcCfgcsConnectionService.Connect(
                _workspace,
                cmbConnectionString.Text,
                cmbGesConnectionString.Text,
                this,
                showDialogs: true,
                saveRecent: true);

            lblConnectionStatus.Text = result.StatusText;
            lblConnectionStatus.ForeColor = result.Success ? Color.DarkGreen : Color.DarkRed;

            if (result.Success)
            {
                LoadRecentConnections();
            }
        }

        /// <summary>Обработчик закрытия формы (в ADP — Application.Quit).</summary>
        private void OnFormClosing(object sender, FormClosingEventArgs e)
        {
            // Form_Close в ADP вызывал Application.Quit acQuitSaveNone
        }
    }
}
