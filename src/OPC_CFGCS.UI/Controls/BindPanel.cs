using System;
using System.ComponentModel;
using System.Drawing;
using System.Windows.Forms;
using OPC_CFGCS.Core;
using OPC_CFGCS.Data;
using OPC_CFGCS.Data.Models;

namespace OPC_CFGCS.UI.Controls
{
    /// <summary>
    /// Нижняя панель главной формы: список OPC-тегов (Area, Source) связанных с выбранным объектом схемы.
    /// </summary>
    public sealed class BindPanel : UserControl
    {
        private readonly SqlRepository _repository = new SqlRepository();
        private readonly DataGridView _grid = new DataGridView();

        public BindPanel()
        {
            Dock = DockStyle.Fill;
            _grid.Dock = DockStyle.Fill;
            _grid.ReadOnly = true;
            _grid.AllowUserToAddRows = false;
            _grid.AllowUserToDeleteRows = false;
            _grid.AutoGenerateColumns = false;
            _grid.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            _grid.Columns.Add(new DataGridViewTextBoxColumn { DataPropertyName = "Area", HeaderText = "Area", Width = 200 });
            _grid.Columns.Add(new DataGridViewTextBoxColumn { DataPropertyName = "Source", HeaderText = "Source", AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill });
            Controls.Add(_grid);
        }

        /// <summary>Показывает связи тегов для объекта схемы с указанным Id.</summary>
        public void ShowBindings(int objectId)
        {
            _grid.DataSource = new BindingList<TagBinding>(_repository.GetBindingsByObjectId(objectId));
        }

        /// <summary>Очищает грид связей.</summary>
        public void ClearBindings()
        {
            _grid.DataSource = new BindingList<TagBinding>();
        }
    }
}
