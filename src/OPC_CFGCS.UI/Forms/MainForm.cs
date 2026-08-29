using System;
using System.Drawing;
using System.IO;
using System.Windows.Forms;
using OPC_CFGCS.Core;
using OPC_CFGCS.Data;
using OPC_CFGCS.UI.Controls;

namespace OPC_CFGCS.UI.Forms
{
    public sealed partial class MainForm : Form
    {
        private SchemaObjectType _currentSchemaType = SchemaObjectType.PowerStation;

        public MainForm()
        {
            InitializeComponent();

            LoadApplicationIcons();
            bindButtonPanel.Resize += (s, e) => CenterBindButton();
            CenterBindButton();
            txtConnectionString.Text = DatabaseConnection.ConnectionString;
            mainWorkPanel.Enabled = false;
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
            var connectionString = txtConnectionString.Text.Trim();
            DatabaseConnection.ConnectionString = connectionString;

            if (!DatabaseConnection.TestConnection(out var error))
            {
                lblConnectionStatus.Text = "Ошибка подключения";
                lblConnectionStatus.ForeColor = Color.DarkRed;
                mainWorkPanel.Enabled = false;
                MessageBox.Show(
                    "Не удалось подключиться к SQL Server.\r\n\r\n" + error,
                    "OPC_CFGCS",
                    MessageBoxButtons.OK,
                    MessageBoxIcon.Error);
                return;
            }

            lblConnectionStatus.Text = "Подключено";
            lblConnectionStatus.ForeColor = Color.DarkGreen;
            mainWorkPanel.Enabled = true;

            psPanel.Reload();
            busPanel.Reload();
            switchPanel.Reload();
            tagsPanel.ReloadData();
            bindPanel.ClearBindings();
            UpdateBindings();
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
