using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Windows.Forms;
using OPC_CFGCS.Core;
using OPC_CFGCS.Data;
using OPC_CFGCS.Data.Models;
using OPC_CFGCS.UI;

namespace OPC_CFGCS.UI.Controls
{
    /// <summary>
    /// Панель со списком объектов схемы (ПС, шина, выключатель) в DataGridView.
    /// Подсвечивает строки объектов, для которых уже заданы связи с тегами.
    /// </summary>
    public sealed class SchemaObjectPanel : UserControl
    {
        private readonly SchemaObjectType _objectType;
        private readonly SqlRepository _repository = new SqlRepository();
        private readonly DataGridView _grid = new DataGridView();
        private BindingList<SchemaObject> _items;
        private HashSet<int> _boundObjectIds = new HashSet<int>();

        /// <summary>Вызывается при изменении выбранного объекта в списке.</summary>
        public event EventHandler CurrentObjectChanged;

        /// <summary>Текст последней ошибки загрузки данных из базы.</summary>
        public string LastLoadError => _repository.LastError;

        /// <summary>Конструктор для WinForms-дизайнера (тип по умолчанию — ПС).</summary>
        public SchemaObjectPanel()
        {
            _objectType = SchemaObjectType.PowerStation;
            InitializePanel();
        }

        /// <summary>Создаёт панель для указанного типа объектов схемы.</summary>
        public SchemaObjectPanel(SchemaObjectType objectType)
        {
            _objectType = objectType;
            InitializePanel();
        }

        private void InitializePanel()
        {
            Dock = DockStyle.Fill;

            _grid.Dock = DockStyle.Fill;
            _grid.ReadOnly = true;
            _grid.AllowUserToAddRows = false;
            _grid.AllowUserToDeleteRows = false;
            _grid.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            _grid.MultiSelect = false;
            _grid.AutoGenerateColumns = false;
            _grid.Columns.Add(new DataGridViewTextBoxColumn { DataPropertyName = "ParentTypeName", HeaderText = "Тип", Width = 120 });
            _grid.Columns.Add(new DataGridViewTextBoxColumn { DataPropertyName = "ParentName", HeaderText = "Родитель", Width = 120 });
            _grid.Columns.Add(new DataGridViewTextBoxColumn { DataPropertyName = "Type", HeaderText = "Тип объекта", Width = 120 });
            _grid.Columns.Add(new DataGridViewTextBoxColumn { DataPropertyName = "Name", HeaderText = "Имя", AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill });
            _grid.SelectionChanged += OnSelectionChanged;
            _grid.KeyDown += OnKeyDown;
            _grid.CellFormatting += OnGridCellFormatting;

            Controls.Add(_grid);
            _items = new BindingList<SchemaObject>();
            _grid.DataSource = _items;
        }

        private bool IsDesignMode =>
            LicenseManager.UsageMode == LicenseUsageMode.Designtime || DesignMode;

        /// <summary>Текущий выбранный объект в гриде.</summary>
        public SchemaObject CurrentObject
        {
            get
            {
                if (_grid.CurrentRow == null)
                {
                    return null;
                }

                return _grid.CurrentRow.DataBoundItem as SchemaObject;
            }
        }

        /// <summary>Перезагружает список объектов, сохраняя выделение по Id.</summary>
        public void Reload()
        {
            if (IsDesignMode)
            {
                return;
            }

            var selectedId = CurrentObject == null ? (int?)null : CurrentObject.Id;
            LoadData();
            if (selectedId.HasValue)
            {
                SelectById(selectedId.Value);
            }
        }

        /// <summary>Обновляет подсветку строк объектов с существующими связями тегов.</summary>
        public void RefreshBindingHighlights()
        {
            if (IsDesignMode)
            {
                return;
            }

            _boundObjectIds = _repository.GetBoundObjectIds();
            _grid.Invalidate();
        }

        private void LoadData()
        {
            if (IsDesignMode)
            {
                return;
            }

            _boundObjectIds = _repository.GetBoundObjectIds();

            switch (_objectType)
            {
                case SchemaObjectType.PowerStation:
                    _items = new BindingList<SchemaObject>(_repository.GetPowerStations());
                    break;
                case SchemaObjectType.CellBus:
                    _items = new BindingList<SchemaObject>(_repository.GetCellBuses());
                    break;
                case SchemaObjectType.CellSwitch:
                    _items = new BindingList<SchemaObject>(_repository.GetCellSwitches());
                    break;
                default:
                    _items = new BindingList<SchemaObject>();
                    break;
            }

            _grid.DataSource = _items;
        }

        private void SelectById(int id)
        {
            foreach (DataGridViewRow row in _grid.Rows)
            {
                var item = row.DataBoundItem as SchemaObject;
                if (item != null && item.Id == id)
                {
                    row.Selected = true;
                    _grid.CurrentCell = row.Cells[0];
                    break;
                }
            }
        }

        private void OnSelectionChanged(object sender, EventArgs e)
        {
            var current = CurrentObject;
            if (current != null)
            {
                AppState.CurrentArea = current.ParentObj;
            }

            CurrentObjectChanged?.Invoke(this, EventArgs.Empty);
        }

        private void OnKeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Up && _grid.CurrentRow != null && _grid.CurrentRow.Index > 0)
            {
                _grid.CurrentCell = _grid.Rows[_grid.CurrentRow.Index - 1].Cells[0];
                e.Handled = true;
            }
            else if (e.KeyCode == Keys.Down && _grid.CurrentRow != null && _grid.CurrentRow.Index < _grid.Rows.Count - 1)
            {
                _grid.CurrentCell = _grid.Rows[_grid.CurrentRow.Index + 1].Cells[0];
                e.Handled = true;
            }
        }

        private void OnGridCellFormatting(object sender, DataGridViewCellFormattingEventArgs e)
        {
            if (e.RowIndex < 0)
            {
                return;
            }

            var row = _grid.Rows[e.RowIndex];
            if (row.IsNewRow)
            {
                return;
            }

            var item = row.DataBoundItem as SchemaObject;
            if (item == null || !_boundObjectIds.Contains(item.Id))
            {
                return;
            }

            e.CellStyle.BackColor = row.Selected
                ? GridColors.BoundRowSelectedBackColor
                : GridColors.BoundRowBackColor;
        }
    }
}
