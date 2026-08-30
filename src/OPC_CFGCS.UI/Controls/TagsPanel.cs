using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Linq;
using System.Windows.Forms;
using OPC_CFGCS.Core;
using OPC_CFGCS.Data;
using OPC_CFGCS.Data.Models;
using OPC_CFGCS.UI;

namespace OPC_CFGCS.UI.Controls
{
    public sealed class TagsPanel : UserControl
    {
        private readonly SqlRepository _repository = new SqlRepository();
        private readonly DataGridView _grid = new DataGridView();
        private readonly Panel _editorPanel = new Panel();
        private readonly CheckBox _chkEdit = new CheckBox { Text = "Редактирование" };
        private readonly Button _btnAdd = new Button { Text = "Добавить", AutoSize = true };
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
        private TextBox _txtAreaSearch;

        private BindingList<Tag> _tags;
        private IList<Tag> _allTags = new List<Tag>();
        private BindingList<Tag2Group> _tag2Groups;
        private bool _isInserting;
        private bool _groupChanged;
        private SchemaObjectType _schemaObjectType = SchemaObjectType.PowerStation;

        private readonly bool _editable;

        public event EventHandler TagChanged;

        public TagsPanel(bool editable = true)
        {
            _editable = editable;
            Dock = DockStyle.Fill;
            BuildLayout();
            _tags = new BindingList<Tag>();
            _tag2Groups = new BindingList<Tag2Group>();
            _grid.DataSource = _tags;
            if (_editable)
            {
                SetEditMode(false);
            }
            else
            {
                SetViewOnlyMode();
            }
        }

        public void ReloadData()
        {
            LoadLookups();
            LoadTags();
        }

        public string LastLoadError => _repository.LastError;

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
            if (!_repository.UpdateTagObjectId(tag.Id, objectId))
            {
                ShowDataError();
                return;
            }

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
            if (!_repository.UpdateTagObjectId(tag.Id, null))
            {
                ShowDataError();
                return;
            }

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
            _grid.AllowUserToAddRows = false;
            _grid.AutoGenerateColumns = false;
            var areaColumn = new DataGridViewTextBoxColumn
            {
                DataPropertyName = "Area",
                HeaderText = _editable ? "Area" : "Подстанция",
                Width = 120
            };
            _grid.Columns.Add(areaColumn);
            _grid.Columns.Add(new DataGridViewTextBoxColumn { DataPropertyName = "Source", HeaderText = "Source", Width = 160 });
            _grid.Columns.Add(new DataGridViewTextBoxColumn { DataPropertyName = "ItemName", HeaderText = "ItemName", Width = 160 });
            _grid.Columns.Add(new DataGridViewTextBoxColumn { DataPropertyName = "ServerName", HeaderText = "Server", AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill });
            _grid.SelectionChanged += OnTagSelectionChanged;
            _grid.KeyDown += OnGridKeyDown;
            _grid.CellFormatting += OnGridCellFormatting;

            var gridHost = new TableLayoutPanel
            {
                Dock = DockStyle.Fill,
                ColumnCount = 1,
                RowCount = _editable ? 1 : 2,
                Padding = new Padding(0)
            };
            gridHost.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 100F));

            if (!_editable)
            {
                gridHost.RowStyles.Add(new RowStyle(SizeType.AutoSize));
                gridHost.RowStyles.Add(new RowStyle(SizeType.Percent, 100F));

                var searchPanel = new TableLayoutPanel
                {
                    Dock = DockStyle.Fill,
                    AutoSize = true,
                    ColumnCount = 2,
                    Padding = new Padding(4, 4, 4, 2)
                };
                searchPanel.ColumnStyles.Add(new ColumnStyle(SizeType.Absolute, 80));
                searchPanel.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 100));
                searchPanel.Controls.Add(new Label
                {
                    Text = "Подстанция:",
                    AutoSize = true,
                    Anchor = AnchorStyles.Left,
                    Margin = new Padding(3, 6, 8, 3)
                }, 0, 0);

                _txtAreaSearch = new TextBox { Dock = DockStyle.Fill, Margin = new Padding(3, 3, 3, 3) };
                _txtAreaSearch.TextChanged += OnAreaSearchChanged;
                searchPanel.Controls.Add(_txtAreaSearch, 1, 0);

                gridHost.Controls.Add(searchPanel, 0, 0);
                gridHost.Controls.Add(_grid, 0, 1);
            }
            else
            {
                gridHost.RowStyles.Add(new RowStyle(SizeType.Percent, 100F));
                gridHost.Controls.Add(_grid, 0, 0);
            }

            split.Panel1.Controls.Add(gridHost);

            _editorPanel.Dock = DockStyle.Fill;
            _editorPanel.Padding = new Padding(8);
            var table = new TableLayoutPanel
            {
                Dock = DockStyle.Top,
                AutoSize = true,
                ColumnCount = 4,
                RowCount = 5
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

            if (_editable)
            {
                var buttonsPanel = new FlowLayoutPanel { Dock = DockStyle.Top, AutoSize = true };
                buttonsPanel.Controls.Add(_btnAdd);
                buttonsPanel.Controls.Add(_btnSave);
                buttonsPanel.Controls.Add(_chkEdit);
                buttonsPanel.Controls.Add(_chkNormalState);

                _btnAdd.Click += OnAddClick;
                _chkEdit.CheckedChanged += (s, e) => SetEditMode(_chkEdit.Checked);
                _btnSave.Click += OnSaveClick;
                _cmbServer.SelectedIndexChanged += OnServerChanged;
                _cmbGroup.SelectedIndexChanged += (s, e) => _groupChanged = !_isInserting;
                _cmbGroup.DropDown += OnGroupDropDown;

                _editorPanel.Controls.Add(buttonsPanel);
            }

            _editorPanel.Controls.Add(table);
            split.Panel2.Controls.Add(_editorPanel);

            if (!_editable)
            {
                split.SplitterDistance = 280;
            }

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
            _allTags = _repository.GetTags();
            ApplyAreaFilter();
        }

        private void ApplyAreaFilter()
        {
            IEnumerable<Tag> filtered = _allTags;
            if (!_editable && _txtAreaSearch != null)
            {
                var searchText = _txtAreaSearch.Text.Trim();
                if (searchText.Length > 0)
                {
                    filtered = _allTags.Where(tag =>
                        tag.Area != null &&
                        tag.Area.IndexOf(searchText, StringComparison.OrdinalIgnoreCase) >= 0);
                }
            }

            _tags = new BindingList<Tag>(filtered.ToList());
            _grid.DataSource = _tags;
        }

        private void OnAreaSearchChanged(object sender, EventArgs e)
        {
            ApplyAreaFilter();
        }

        private void RefreshTagsPreserveSelection(int tagId)
        {
            _allTags = _repository.GetTags();
            ApplyAreaFilter();
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
            if (_isInserting && _grid.SelectedRows.Count > 0)
            {
                _isInserting = false;
            }

            RefreshCurrentTagState();
            TagChanged?.Invoke(this, EventArgs.Empty);
        }

        private void RefreshCurrentTagState()
        {
            if (_isInserting)
            {
                return;
            }

            var tag = CurrentTag;
            if (tag == null)
            {
                ClearDetailFields();
                return;
            }

            if (_editable && _groupChanged && tag.Id > 0)
            {
                var groupId = GetSelectedGroupId();
                if (groupId.HasValue)
                {
                    _repository.UpdateTag2Group(groupId.Value, tag.Id);
                    _tag2Groups = new BindingList<Tag2Group>(_repository.GetTag2Groups());
                }

                _groupChanged = false;
            }

            PopulateDetailFields(tag);

            if (!string.IsNullOrWhiteSpace(tag.Area))
            {
                AppState.CurrentArea = AreaHelper.GetParentObj(tag.Area);
            }
        }

        private void PopulateDetailFields(Tag tag)
        {
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
        }

        private void ClearDetailFields()
        {
            _cmbServer.SelectedIndex = -1;
            _cmbGroup.SelectedIndex = -1;
            _cmbParameter.SelectedIndex = -1;
            _txtArea.Clear();
            _txtSource.Clear();
            _txtItemName.Clear();
            _txtMultiplier.Clear();
            _txtOffset.Clear();
            _txtBitMask.Clear();
            _txtDeadBand.Clear();
            _chkNormalState.Checked = false;
        }

        private void OnAddClick(object sender, EventArgs e)
        {
            _isInserting = true;
            _groupChanged = false;
            _grid.ClearSelection();
            ClearDetailFields();
            _chkEdit.Checked = true;
            SetEditMode(true);

            if (_cmbServer.Items.Count > 0)
            {
                _cmbServer.SelectedIndex = 0;
            }

            _txtMultiplier.Text = "1";
            _txtOffset.Text = "0";
            _txtBitMask.Text = "0";
            _txtDeadBand.Text = "0";
            _txtArea.Focus();
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

            try
            {
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
                else
                {
                    if (_cmbServer.SelectedValue == null)
                    {
                        MessageBox.Show(
                            "Выберите сервер.",
                            "OPC_CFGCS",
                            MessageBoxButtons.OK,
                            MessageBoxIcon.Warning);
                        return;
                    }

                    tag.Id = _repository.InsertTag(tag);
                    var groupId = GetSelectedGroupId();
                    if (groupId.HasValue)
                    {
                        _repository.InsertTag2Group(groupId.Value, tag.Id);
                    }

                    _groupChanged = false;
                }

                RefreshTagsPreserveSelection(tag.Id);
                _isInserting = false;
                SetEditMode(_chkEdit.Checked);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "OPC_CFGCS", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
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
            if (tag != null)
            {
                ReloadGroups(tag.ServerId);
                return;
            }

            if (_cmbServer.SelectedValue is int serverId)
            {
                ReloadGroups(serverId);
            }
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

            var tag = row.DataBoundItem as Tag;
            if (tag == null || !tag.ObjectId.HasValue)
            {
                return;
            }

            e.CellStyle.BackColor = row.Selected
                ? GridColors.BoundRowSelectedBackColor
                : GridColors.BoundRowBackColor;
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

        private void SetViewOnlyMode()
        {
            _cmbServer.Enabled = false;
            _cmbGroup.Enabled = false;
            _cmbParameter.Enabled = false;
            _txtArea.ReadOnly = true;
            _txtSource.ReadOnly = true;
            _txtItemName.ReadOnly = true;
            _txtMultiplier.ReadOnly = true;
            _txtOffset.ReadOnly = true;
            _txtBitMask.ReadOnly = true;
            _txtDeadBand.ReadOnly = true;
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

        private void ShowDataError()
        {
            MessageBox.Show(
                _repository.LastError ?? "Ошибка доступа к базе данных.",
                "OPC_CFGCS",
                MessageBoxButtons.OK,
                MessageBoxIcon.Error);
        }
    }
}
