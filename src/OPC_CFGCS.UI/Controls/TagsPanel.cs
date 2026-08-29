using System;
using System.ComponentModel;
using System.Drawing;
using System.Linq;
using System.Windows.Forms;
using OPC_CFGCS.Core;
using OPC_CFGCS.Data;
using OPC_CFGCS.Data.Models;

namespace OPC_CFGCS.UI.Controls
{
    public sealed class TagsPanel : UserControl
    {
        private readonly SqlRepository _repository = new SqlRepository();
        private readonly DataGridView _grid = new DataGridView();
        private readonly Panel _editorPanel = new Panel();
        private readonly CheckBox _chkEdit = new CheckBox { Text = "Редактирование" };
        private readonly Button _btnSave = new Button { Text = "Сохранить", Enabled = false };
        private readonly ComboBox _cmbServer = new ComboBox { DropDownStyle = ComboBoxStyle.DropDownList };
        private readonly ComboBox _cmbGroup = new ComboBox { DropDownStyle = ComboBoxStyle.DropDownList };
        private readonly ComboBox _cmbParameter = new ComboBox { DropDownStyle = ComboBoxStyle.DropDownList };
        private readonly TextBox _txtArea = new TextBox();
        private readonly TextBox _txtSource = new TextBox();
        private readonly TextBox _txtItemName = new TextBox();
        private readonly TextBox _txtMultiplier = new TextBox();
        private readonly TextBox _txtOffset = new TextBox();
        private readonly TextBox _txtBitMask = new TextBox();
        private readonly TextBox _txtDeadBand = new TextBox();
        private readonly CheckBox _chkNormalState = new CheckBox { Text = "Норм. состояние" };

        private BindingList<Tag> _tags;
        private BindingList<Tag2Group> _tag2Groups;
        private bool _isInserting;
        private bool _groupChanged;
        private SchemaObjectType _schemaObjectType = SchemaObjectType.PowerStation;

        public event EventHandler TagChanged;
        public event EventHandler CloseRequested;

        public TagsPanel()
        {
            Dock = DockStyle.Fill;
            BuildLayout();
            LoadLookups();
            LoadTags();
            SetEditMode(false);
        }

        public Tag CurrentTag
        {
            get
            {
                if (_grid.CurrentRow == null)
                {
                    return null;
                }

                return _grid.CurrentRow.DataBoundItem as Tag;
            }
        }

        public void SetSchemaObjectType(SchemaObjectType schemaObjectType)
        {
            _schemaObjectType = schemaObjectType;
            RefreshCurrentTagState();
        }

        public void BindToObject(int objectId)
        {
            var tag = CurrentTag;
            if (tag == null)
            {
                return;
            }

            tag.ObjectId = objectId;
            _repository.UpdateTagObjectId(tag.Id, objectId);
            RefreshTagsPreserveSelection(tag.Id);
            TagChanged?.Invoke(this, EventArgs.Empty);
        }

        public void UnbindObject()
        {
            var tag = CurrentTag;
            if (tag == null)
            {
                return;
            }

            tag.ObjectId = null;
            _repository.UpdateTagObjectId(tag.Id, null);
            RefreshTagsPreserveSelection(tag.Id);
            TagChanged?.Invoke(this, EventArgs.Empty);
        }

        public bool HasObjectBinding
        {
            get
            {
                var tag = CurrentTag;
                return tag != null && tag.ObjectId.HasValue;
            }
        }

        public void RefreshTagState()
        {
            RefreshCurrentTagState();
        }

        private void BuildLayout()
        {
            var split = new SplitContainer
            {
                Dock = DockStyle.Fill,
                Orientation = Orientation.Horizontal,
                SplitterDistance = 220
            };

            _grid.Dock = DockStyle.Fill;
            _grid.ReadOnly = true;
            _grid.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            _grid.MultiSelect = false;
            _grid.AllowUserToAddRows = true;
            _grid.AutoGenerateColumns = false;
            _grid.Columns.Add(new DataGridViewTextBoxColumn { DataPropertyName = "Area", HeaderText = "Area", Width = 120 });
            _grid.Columns.Add(new DataGridViewTextBoxColumn { DataPropertyName = "Source", HeaderText = "Source", Width = 160 });
            _grid.Columns.Add(new DataGridViewTextBoxColumn { DataPropertyName = "ItemName", HeaderText = "ItemName", Width = 160 });
            _grid.Columns.Add(new DataGridViewTextBoxColumn { DataPropertyName = "ServerName", HeaderText = "Server", AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill });
            _grid.SelectionChanged += OnTagSelectionChanged;
            _grid.UserAddedRow += OnUserAddedRow;
            _grid.KeyDown += OnGridKeyDown;

            split.Panel1.Controls.Add(_grid);

            _editorPanel.Dock = DockStyle.Fill;
            _editorPanel.Padding = new Padding(8);
            var table = new TableLayoutPanel
            {
                Dock = DockStyle.Top,
                AutoSize = true,
                ColumnCount = 4,
                RowCount = 6
            };
            table.ColumnStyles.Add(new ColumnStyle(SizeType.Absolute, 120));
            table.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 50));
            table.ColumnStyles.Add(new ColumnStyle(SizeType.Absolute, 120));
            table.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 50));

            AddEditorRow(table, 0, "Сервер", _cmbServer, "Группа", _cmbGroup);
            AddEditorRow(table, 1, "Параметр", _cmbParameter, "Area", _txtArea);
            AddEditorRow(table, 2, "Source", _txtSource, "ItemName", _txtItemName);
            AddEditorRow(table, 3, "Multiplier", _txtMultiplier, "Offset", _txtOffset);
            AddEditorRow(table, 4, "BitMask", _txtBitMask, "DeadBand", _txtDeadBand);

            var buttonsPanel = new FlowLayoutPanel { Dock = DockStyle.Top, AutoSize = true };
            buttonsPanel.Controls.Add(_chkEdit);
            buttonsPanel.Controls.Add(_chkNormalState);
            buttonsPanel.Controls.Add(_btnSave);

            _chkEdit.CheckedChanged += (s, e) => SetEditMode(_chkEdit.Checked);
            _btnSave.Click += OnSaveClick;
            _cmbServer.SelectedIndexChanged += OnServerChanged;
            _cmbGroup.SelectedIndexChanged += (s, e) => _groupChanged = !_isInserting;
            _cmbGroup.DropDown += OnGroupDropDown;

            _editorPanel.Controls.Add(buttonsPanel);
            _editorPanel.Controls.Add(table);
            split.Panel2.Controls.Add(_editorPanel);
            Controls.Add(split);
        }

        private static void AddEditorRow(TableLayoutPanel table, int row, string leftLabel, Control leftControl, string rightLabel, Control rightControl)
        {
            table.Controls.Add(new Label { Text = leftLabel, AutoSize = true, Anchor = AnchorStyles.Left }, 0, row);
            leftControl.Dock = DockStyle.Fill;
            table.Controls.Add(leftControl, 1, row);
            table.Controls.Add(new Label { Text = rightLabel, AutoSize = true, Anchor = AnchorStyles.Left }, 2, row);
            rightControl.Dock = DockStyle.Fill;
            table.Controls.Add(rightControl, 3, row);
        }

        private void LoadLookups()
        {
            _cmbServer.DataSource = _repository.GetServers();
            _cmbServer.DisplayMember = "ServerName";
            _cmbServer.ValueMember = "Id";

            _cmbParameter.DataSource = _repository.GetParameters();
            _cmbParameter.DisplayMember = "Description";
            _cmbParameter.ValueMember = "Id";

            _tag2Groups = new BindingList<Tag2Group>(_repository.GetTag2Groups());
        }

        private void LoadTags()
        {
            _tags = new BindingList<Tag>(_repository.GetTags());
            _grid.DataSource = _tags;
        }

        private void RefreshTagsPreserveSelection(int tagId)
        {
            _tags = new BindingList<Tag>(_repository.GetTags());
            _grid.DataSource = _tags;
            _tag2Groups = new BindingList<Tag2Group>(_repository.GetTag2Groups());

            foreach (DataGridViewRow row in _grid.Rows)
            {
                var tag = row.DataBoundItem as Tag;
                if (tag != null && tag.Id == tagId)
                {
                    row.Selected = true;
                    _grid.CurrentCell = row.Cells[0];
                    break;
                }
            }
        }

        private void OnTagSelectionChanged(object sender, EventArgs e)
        {
            RefreshCurrentTagState();
            TagChanged?.Invoke(this, EventArgs.Empty);
        }

        private void RefreshCurrentTagState()
        {
            var tag = CurrentTag;
            if (tag == null)
            {
                return;
            }

            if (_groupChanged && tag.Id > 0)
            {
                var groupId = GetSelectedGroupId();
                if (groupId.HasValue)
                {
                    _repository.UpdateTag2Group(groupId.Value, tag.Id);
                    _tag2Groups = new BindingList<Tag2Group>(_repository.GetTag2Groups());
                }

                _groupChanged = false;
            }

            SelectComboValue(_cmbServer, tag.ServerId);
            SelectComboValue(_cmbParameter, tag.ParameterId);
            _txtArea.Text = tag.Area ?? string.Empty;
            _txtSource.Text = tag.Source ?? string.Empty;
            _txtItemName.Text = tag.ItemName ?? string.Empty;
            _txtMultiplier.Text = tag.Multiplier?.ToString() ?? string.Empty;
            _txtOffset.Text = tag.Offset?.ToString() ?? string.Empty;
            _txtBitMask.Text = tag.BitMask?.ToString() ?? string.Empty;
            _txtDeadBand.Text = tag.DeadBand?.ToString() ?? string.Empty;
            _chkNormalState.Checked = tag.ZeroNormalState ?? false;

            var mapping = _tag2Groups.FirstOrDefault(x => x.TagId == tag.Id);
            if (mapping != null)
            {
                ReloadGroups(tag.ServerId);
                SelectComboValue(_cmbGroup, mapping.GroupId);
            }
            else
            {
                ReloadGroups(tag.ServerId);
                _cmbGroup.SelectedIndex = -1;
            }

            if (!string.IsNullOrWhiteSpace(tag.Area))
            {
                AppState.CurrentArea = AreaHelper.GetParentObj(tag.Area);
            }
        }

        private void OnUserAddedRow(object sender, DataGridViewRowEventArgs e)
        {
            _isInserting = true;
            SetEditMode(true);
        }

        private void OnSaveClick(object sender, EventArgs e)
        {
            var tag = CurrentTag ?? new Tag();
            tag.ServerId = _cmbServer.SelectedValue is int serverId ? serverId : tag.ServerId;
            tag.ParameterId = _cmbParameter.SelectedValue as int?;
            tag.Area = _txtArea.Text;
            tag.Source = _txtSource.Text;
            tag.ItemName = _txtItemName.Text;
            tag.Multiplier = ParseDouble(_txtMultiplier.Text);
            tag.Offset = ParseDouble(_txtOffset.Text);
            tag.BitMask = ParseInt(_txtBitMask.Text);
            tag.DeadBand = ParseDouble(_txtDeadBand.Text);
            tag.ZeroNormalState = _chkNormalState.Checked;

            if (tag.Id > 0)
            {
                _repository.UpdateTag(tag);
                if (_groupChanged)
                {
                    var groupId = GetSelectedGroupId();
                    if (groupId.HasValue)
                    {
                        _repository.UpdateTag2Group(groupId.Value, tag.Id);
                    }

                    _groupChanged = false;
                }
            }

            RefreshTagsPreserveSelection(tag.Id);
            _isInserting = false;
            SetEditMode(_chkEdit.Checked);
        }

        private void OnServerChanged(object sender, EventArgs e)
        {
            if (_cmbServer.SelectedValue is int serverId)
            {
                ReloadGroups(serverId);
            }
        }

        private void OnGroupDropDown(object sender, EventArgs e)
        {
            var tag = CurrentTag;
            if (tag == null)
            {
                return;
            }

            ReloadGroups(tag.ServerId);
        }

        private void ReloadGroups(int serverId)
        {
            _cmbGroup.DataSource = _repository.GetOpcGroups(serverId);
            _cmbGroup.DisplayMember = "Name";
            _cmbGroup.ValueMember = "Id";
        }

        private void OnGridKeyDown(object sender, KeyEventArgs e)
        {
            if (e.Alt && e.KeyCode == Keys.Down)
            {
                return;
            }

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

        private void SetEditMode(bool enabled)
        {
            _cmbServer.Enabled = enabled;
            _cmbGroup.Enabled = enabled;
            _cmbParameter.Enabled = enabled;
            _txtArea.ReadOnly = !enabled;
            _txtSource.ReadOnly = !enabled;
            _txtItemName.ReadOnly = !enabled;
            _txtMultiplier.ReadOnly = !enabled;
            _txtOffset.ReadOnly = !enabled;
            _txtBitMask.ReadOnly = !enabled;
            _txtDeadBand.ReadOnly = !enabled;
            _chkNormalState.Enabled = enabled;
            _btnSave.Enabled = enabled;
        }

        private int? GetSelectedGroupId()
        {
            return _cmbGroup.SelectedValue as int?;
        }

        private static void SelectComboValue(ComboBox comboBox, int? value)
        {
            if (!value.HasValue)
            {
                comboBox.SelectedIndex = -1;
                return;
            }

            comboBox.SelectedValue = value.Value;
        }

        private static double? ParseDouble(string value)
        {
            double parsed;
            return double.TryParse(value, out parsed) ? parsed : (double?)null;
        }

        private static int? ParseInt(string value)
        {
            int parsed;
            return int.TryParse(value, out parsed) ? parsed : (int?)null;
        }
    }
}
