using System;
using System.Windows.Forms;
using OPC_CFGCS.Core;
using OPC_CFGCS.Data;
using OPC_CFGCS.UI.Controls;

namespace OPC_CFGCS.UI.Forms
{
    public sealed partial class MainForm : Form
    {
        private readonly SqlRepository _repository = new SqlRepository();
        private SchemaObjectType _currentSchemaType = SchemaObjectType.PowerStation;

        public MainForm()
        {
            InitializeComponent();

            if (!_repository.TestConnection(out var error))
            {
                MessageBox.Show(
                    "Не удалось подключиться к SQL Server.\r\n\r\n" + error +
                    "\r\n\r\nПроверьте App.config (Data Source, Initial Catalog, Integrated Security).",
                    "OPC_CFGCS",
                    MessageBoxButtons.OK,
                    MessageBoxIcon.Error);
            }

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
