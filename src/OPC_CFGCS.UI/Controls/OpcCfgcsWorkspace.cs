using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Windows.Forms;
using OPC_CFGCS.Core;
using OPC_CFGCS.Data;
using OPC_CFGCS.UI;

namespace OPC_CFGCS.UI.Controls
{
    /// <summary>
    /// Рабочая область конфигуратора: объекты схемы, привязка тегов, список тегов.
    /// </summary>
    public sealed partial class OpcCfgcsWorkspace : UserControl
    {
        private SchemaObjectType _currentSchemaType = SchemaObjectType.PowerStation;
        private SchemaObjectPanel psPanel;
        private SchemaObjectPanel busPanel;
        private SchemaObjectPanel switchPanel;
        private TagsPanel tagsPanel;

        /// <summary>Инициализирует разметку и кастомные панели (не в design time).</summary>
        public OpcCfgcsWorkspace()
        {
            InitializeComponent();
            InitializeCustomControls();
            bindButtonPanel.Resize += (s, e) => CenterBindButton();
            CenterBindButton();
            SetConnected(false);
        }

        /// <summary>Загружает данные после успешного подключения к базам.</summary>
        public IList<string> ReloadAllData()
        {
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

            return loadErrors;
        }

        /// <summary>Обновляет теги и подсветку связей после диалогов редактирования.</summary>
        public void ReloadTagsAndHighlights()
        {
            tagsPanel.ReloadData();
            RefreshSchemaBindingHighlights();
        }

        /// <summary>Включает или отключает рабочую область (до/после подключения).</summary>
        public void SetConnected(bool connected)
        {
            gridsLayout.Enabled = connected;
            bindHeaderLabel.Enabled = connected;
        }

        /// <summary>Подключение установлено и рабочая область активна.</summary>
        public bool EnabledForConnection => gridsLayout.Enabled;

        /// <summary>Заменяет placeholder-Label на реальный контрол (runtime).</summary>
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

        private static void ReplacePlaceholder(Control parent, Label placeholder, Control replacement)
        {
            parent.Controls.Remove(placeholder);
            placeholder.Dispose();
            replacement.Dock = DockStyle.Fill;
            parent.Controls.Add(replacement);
        }

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

        private static void AppendLoadError(ICollection<string> errors, string section, string error)
        {
            if (!string.IsNullOrWhiteSpace(error))
            {
                errors.Add(section + ": " + error);
            }
        }

        private void CenterBindButton()
        {
            btnBind.Left = Math.Max(0, (bindButtonPanel.ClientSize.Width - btnBind.Width) / 2);
            btnBind.Top = Math.Max(0, (bindButtonPanel.ClientSize.Height - btnBind.Height) / 2);
        }

        /// <summary>Смена вкладки ПС / Шина / Выключатель — синхронизация с гридом тегов.</summary>
        private void OnSchemaTabChanged(object sender, EventArgs e)
        {
            _currentSchemaType = (SchemaObjectType)schemaTabs.SelectedIndex;
            tagsPanel.SetSchemaObjectType(_currentSchemaType);
            OnSchemaObjectChanged(sender, EventArgs.Empty);
            tagsPanel.RefreshTagState();
        }

        /// <summary>Выбор объекта схемы — обновление BindPanel и выделение тега.</summary>
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

        /// <summary>Изменение связи тега — обновление текста кнопки bind.</summary>
        private void OnTagChanged(object sender, EventArgs e)
        {
            UpdateBindButtonCaption();
        }

        /// <summary>Привязка или отвязка текущего тега к выбранному объекту схемы.</summary>
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
            if (!gridsLayout.Enabled)
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
    }
}
