using System;
using System.ComponentModel;
using System.Drawing;
using System.Windows.Forms;
using OPC_CFGCS.Data;
using OPC_CFGCS.Data.Models;

namespace OPC_CFGCS.UI.Forms
{
    public sealed class ReferenceDataForm : Form
    {
        private readonly SqlRepository _repository = new SqlRepository();

        private readonly TabControl _tabs = new TabControl { Dock = DockStyle.Fill };
        private readonly DataGridView _aliasesGrid = CreateGrid();
        private readonly DataGridView _serversGrid = CreateGrid();
        private readonly DataGridView _parametersGrid = CreateGrid();
        private readonly DataGridView _groupsGrid = CreateGrid();
        private readonly TextBox _txtAliasName = new TextBox();
        private readonly TextBox _txtServerHost = new TextBox();
        private readonly TextBox _txtServerName = new TextBox();
        private readonly ComboBox _cmbServerAlias = new ComboBox { DropDownStyle = ComboBoxStyle.DropDownList };
        private readonly ComboBox _cmbServerType = new ComboBox { DropDownStyle = ComboBoxStyle.DropDownList };
        private readonly TextBox _txtParameterDescription = new TextBox();
        private readonly TextBox _txtParameterObject = new TextBox();
        private readonly ComboBox _cmbGroupServer = new ComboBox { DropDownStyle = ComboBoxStyle.DropDownList };
        private readonly TextBox _txtGroupName = new TextBox();

        private BindingList<Alias> _aliases;
        private BindingList<Server> _servers;
        private BindingList<Parameter> _parameters;
        private BindingList<OpcGroup> _groups;

        public ReferenceDataForm()
        {
            Text = "Справочники";
            StartPosition = FormStartPosition.CenterParent;
            Size = new Size(900, 560);
            MinimumSize = new Size(720, 480);

            _cmbServerType.Items.AddRange(new object[]
            {
                new ServerTypeItem(0, "DA (данные)"),
                new ServerTypeItem(1, "AE (события)")
            });
            _cmbServerType.DisplayMember = "Text";
            _cmbServerType.ValueMember = "Value";

            _tabs.TabPages.Add(CreateAliasesTab());
            _tabs.TabPages.Add(CreateServersTab());
            _tabs.TabPages.Add(CreateParametersTab());
            _tabs.TabPages.Add(CreateGroupsTab());
            Controls.Add(_tabs);

            Load += OnFormLoad;
        }

        private void OnFormLoad(object sender, EventArgs e)
        {
            ReloadAll();
        }

        private TabPage CreateAliasesTab()
        {
            var page = new TabPage("Alias");
            var layout = CreateTabLayout(
                _aliasesGrid,
                new[]
                {
                    Tuple.Create("Alias", (Control)_txtAliasName)
                },
                OnAddAlias,
                OnSaveAlias,
                OnDeleteAlias);
            page.Controls.Add(layout);
            ConfigureAliasGrid();
            return page;
        }

        private TabPage CreateServersTab()
        {
            var page = new TabPage("OPC-серверы");
            var layout = CreateTabLayout(
                _serversGrid,
                new[]
                {
                    Tuple.Create("Alias", (Control)_cmbServerAlias),
                    Tuple.Create("HostName", (Control)_txtServerHost),
                    Tuple.Create("ServerName", (Control)_txtServerName),
                    Tuple.Create("Тип", (Control)_cmbServerType)
                },
                OnAddServer,
                OnSaveServer,
                OnDeleteServer);
            page.Controls.Add(layout);
            ConfigureServerGrid();
            _cmbServerAlias.DisplayMember = "Name";
            _cmbServerAlias.ValueMember = "Id";
            return page;
        }

        private TabPage CreateParametersTab()
        {
            var page = new TabPage("Параметры");
            var layout = CreateTabLayout(
                _parametersGrid,
                new[]
                {
                    Tuple.Create("Описание", (Control)_txtParameterDescription),
                    Tuple.Create("Объект", (Control)_txtParameterObject)
                },
                OnAddParameter,
                OnSaveParameter,
                OnDeleteParameter);
            page.Controls.Add(layout);
            ConfigureParameterGrid();
            return page;
        }

        private TabPage CreateGroupsTab()
        {
            var page = new TabPage("OPC-группы");
            var layout = CreateTabLayout(
                _groupsGrid,
                new[]
                {
                    Tuple.Create("Сервер", (Control)_cmbGroupServer),
                    Tuple.Create("Имя группы", (Control)_txtGroupName)
                },
                OnAddGroup,
                OnSaveGroup,
                OnDeleteGroup);
            page.Controls.Add(layout);
            ConfigureGroupGrid();
            _cmbGroupServer.DisplayMember = "ServerName";
            _cmbGroupServer.ValueMember = "Id";
            return page;
        }

        private static Control CreateTabLayout(
            DataGridView grid,
            Tuple<string, Control>[] fields,
            EventHandler onAdd,
            EventHandler onSave,
            EventHandler onDelete)
        {
            var split = new SplitContainer
            {
                Dock = DockStyle.Fill,
                Orientation = Orientation.Horizontal,
                SplitterDistance = 300
            };

            grid.Dock = DockStyle.Fill;
            split.Panel1.Controls.Add(grid);

            var editor = new TableLayoutPanel
            {
                Dock = DockStyle.Top,
                AutoSize = true,
                ColumnCount = 2,
                Padding = new Padding(8)
            };
            editor.ColumnStyles.Add(new ColumnStyle(SizeType.Absolute, 120));
            editor.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 100));

            for (var i = 0; i < fields.Length; i++)
            {
                editor.RowStyles.Add(new RowStyle(SizeType.AutoSize));
                editor.Controls.Add(new Label
                {
                    Text = fields[i].Item1,
                    AutoSize = true,
                    Anchor = AnchorStyles.Left,
                    Margin = new Padding(3, 8, 8, 3)
                }, 0, i);
                fields[i].Item2.Dock = DockStyle.Fill;
                fields[i].Item2.Margin = new Padding(3, 3, 3, 3);
                editor.Controls.Add(fields[i].Item2, 1, i);
            }

            var buttons = new FlowLayoutPanel
            {
                Dock = DockStyle.Top,
                AutoSize = true,
                Padding = new Padding(8, 0, 8, 8)
            };
            buttons.Controls.Add(CreateButton("Добавить", onAdd));
            buttons.Controls.Add(CreateButton("Сохранить", onSave));
            buttons.Controls.Add(CreateButton("Удалить", onDelete));

            split.Panel2.Controls.Add(buttons);
            split.Panel2.Controls.Add(editor);
            return split;
        }

        private static Button CreateButton(string text, EventHandler onClick)
        {
            var button = new Button { Text = text, AutoSize = true, Margin = new Padding(0, 0, 8, 0) };
            button.Click += onClick;
            return button;
        }

        private static DataGridView CreateGrid()
        {
            return new DataGridView
            {
                ReadOnly = true,
                AllowUserToAddRows = false,
                AllowUserToDeleteRows = false,
                SelectionMode = DataGridViewSelectionMode.FullRowSelect,
                MultiSelect = false,
                AutoGenerateColumns = false,
                Dock = DockStyle.Fill
            };
        }

        private void ConfigureAliasGrid()
        {
            _aliasesGrid.Columns.Add(new DataGridViewTextBoxColumn { DataPropertyName = "Name", HeaderText = "Alias", AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill });
            _aliasesGrid.SelectionChanged += (s, e) => LoadSelectedAlias();
        }

        private void ConfigureServerGrid()
        {
            _serversGrid.Columns.Add(new DataGridViewTextBoxColumn { DataPropertyName = "AliasName", HeaderText = "Alias", Width = 140 });
            _serversGrid.Columns.Add(new DataGridViewTextBoxColumn { DataPropertyName = "HostName", HeaderText = "HostName", Width = 160 });
            _serversGrid.Columns.Add(new DataGridViewTextBoxColumn { DataPropertyName = "ServerName", HeaderText = "ServerName", Width = 160 });
            _serversGrid.Columns.Add(new DataGridViewTextBoxColumn { DataPropertyName = "ServerType", HeaderText = "Тип", Width = 60 });
            _serversGrid.SelectionChanged += (s, e) => LoadSelectedServer();
        }

        private void ConfigureParameterGrid()
        {
            _parametersGrid.Columns.Add(new DataGridViewTextBoxColumn { DataPropertyName = "Description", HeaderText = "Описание", Width = 220 });
            _parametersGrid.Columns.Add(new DataGridViewTextBoxColumn { DataPropertyName = "ObjectDescription", HeaderText = "Объект", AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill });
            _parametersGrid.SelectionChanged += (s, e) => LoadSelectedParameter();
        }

        private void ConfigureGroupGrid()
        {
            _groupsGrid.Columns.Add(new DataGridViewTextBoxColumn { DataPropertyName = "ServerName", HeaderText = "Сервер", Width = 180 });
            _groupsGrid.Columns.Add(new DataGridViewTextBoxColumn { DataPropertyName = "Name", HeaderText = "Группа", AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill });
            _groupsGrid.SelectionChanged += (s, e) => LoadSelectedGroup();
        }

        private void ReloadAll()
        {
            _aliases = new BindingList<Alias>(_repository.GetAliases());
            _servers = new BindingList<Server>(_repository.GetServers());
            _parameters = new BindingList<Parameter>(_repository.GetParameters());
            _groups = new BindingList<OpcGroup>(_repository.GetOpcGroups());
            _aliasesGrid.DataSource = _aliases;
            _serversGrid.DataSource = _servers;
            _parametersGrid.DataSource = _parameters;
            _groupsGrid.DataSource = _groups;
            _cmbServerAlias.DataSource = new BindingList<Alias>(_repository.GetAliases());
            _cmbGroupServer.DataSource = new BindingList<Server>(_repository.GetServers());
        }

        private Alias GetSelectedAlias()
        {
            return _aliasesGrid.CurrentRow == null ? null : _aliasesGrid.CurrentRow.DataBoundItem as Alias;
        }

        private Server GetSelectedServer()
        {
            return _serversGrid.CurrentRow == null ? null : _serversGrid.CurrentRow.DataBoundItem as Server;
        }

        private Parameter GetSelectedParameter()
        {
            return _parametersGrid.CurrentRow == null ? null : _parametersGrid.CurrentRow.DataBoundItem as Parameter;
        }

        private OpcGroup GetSelectedGroup()
        {
            return _groupsGrid.CurrentRow == null ? null : _groupsGrid.CurrentRow.DataBoundItem as OpcGroup;
        }

        private void LoadSelectedAlias()
        {
            var alias = GetSelectedAlias();
            _txtAliasName.Text = alias == null ? string.Empty : alias.Name ?? string.Empty;
        }

        private void LoadSelectedServer()
        {
            var server = GetSelectedServer();
            if (server == null)
            {
                _cmbServerAlias.SelectedIndex = -1;
                _txtServerHost.Clear();
                _txtServerName.Clear();
                _cmbServerType.SelectedIndex = 0;
                return;
            }

            _cmbServerAlias.SelectedValue = server.AliasId;
            _txtServerHost.Text = server.HostName ?? string.Empty;
            _txtServerName.Text = server.ServerName ?? string.Empty;
            SelectServerType(server.ServerType);
        }

        private void LoadSelectedParameter()
        {
            var parameter = GetSelectedParameter();
            if (parameter == null)
            {
                _txtParameterDescription.Clear();
                _txtParameterObject.Clear();
                return;
            }

            _txtParameterDescription.Text = parameter.Description ?? string.Empty;
            _txtParameterObject.Text = parameter.ObjectDescription ?? string.Empty;
        }

        private void LoadSelectedGroup()
        {
            var group = GetSelectedGroup();
            if (group == null)
            {
                _cmbGroupServer.SelectedIndex = -1;
                _txtGroupName.Clear();
                return;
            }

            _cmbGroupServer.SelectedValue = group.ServerId;
            _txtGroupName.Text = group.Name ?? string.Empty;
        }

        private void OnAddAlias(object sender, EventArgs e)
        {
            _aliasesGrid.ClearSelection();
            _txtAliasName.Clear();
            _txtAliasName.Focus();
        }

        private void OnSaveAlias(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(_txtAliasName.Text))
            {
                ShowValidation("Укажите Alias.");
                return;
            }

            try
            {
                var alias = GetSelectedAlias() ?? new Alias();
                alias.Name = _txtAliasName.Text.Trim();

                if (alias.Id > 0)
                {
                    _repository.UpdateAlias(alias);
                }
                else
                {
                    alias.Id = _repository.InsertAlias(alias);
                }

                ReloadAll();
                SelectAliasRow(alias.Id);
            }
            catch (Exception ex)
            {
                ShowError(ex);
            }
        }

        private void OnDeleteAlias(object sender, EventArgs e)
        {
            var alias = GetSelectedAlias();
            if (alias == null)
            {
                return;
            }

            if (MessageBox.Show(
                "Удалить alias \"" + alias.Name + "\"?",
                Text,
                MessageBoxButtons.YesNo,
                MessageBoxIcon.Question) != DialogResult.Yes)
            {
                return;
            }

            try
            {
                _repository.DeleteAlias(alias.Id);
                ReloadAll();
            }
            catch (Exception ex)
            {
                ShowError(ex);
            }
        }

        private void OnAddServer(object sender, EventArgs e)
        {
            _serversGrid.ClearSelection();
            _cmbServerAlias.SelectedIndex = _cmbServerAlias.Items.Count > 0 ? 0 : -1;
            _txtServerHost.Clear();
            _txtServerName.Clear();
            SelectServerType(0);
            _txtServerName.Focus();
        }

        private void OnSaveServer(object sender, EventArgs e)
        {
            if (_cmbServerAlias.SelectedValue == null)
            {
                ShowValidation("Выберите Alias.");
                return;
            }

            if (string.IsNullOrWhiteSpace(_txtServerName.Text))
            {
                ShowValidation("Укажите ServerName.");
                return;
            }

            try
            {
                var server = GetSelectedServer() ?? new Server();
                server.AliasId = (int)_cmbServerAlias.SelectedValue;
                server.HostName = _txtServerHost.Text.Trim();
                server.ServerName = _txtServerName.Text.Trim();
                server.ServerType = GetSelectedServerType();

                if (server.Id > 0)
                {
                    _repository.UpdateServer(server);
                }
                else
                {
                    server.Id = _repository.InsertServer(server);
                }

                ReloadAll();
                SelectServerRow(server.Id);
            }
            catch (Exception ex)
            {
                ShowError(ex);
            }
        }

        private void OnDeleteServer(object sender, EventArgs e)
        {
            var server = GetSelectedServer();
            if (server == null)
            {
                return;
            }

            if (MessageBox.Show(
                "Удалить сервер \"" + server.ServerName + "\"?",
                Text,
                MessageBoxButtons.YesNo,
                MessageBoxIcon.Question) != DialogResult.Yes)
            {
                return;
            }

            try
            {
                _repository.DeleteServer(server.Id);
                ReloadAll();
            }
            catch (Exception ex)
            {
                ShowError(ex);
            }
        }

        private void OnAddParameter(object sender, EventArgs e)
        {
            _parametersGrid.ClearSelection();
            _txtParameterDescription.Clear();
            _txtParameterObject.Clear();
            _txtParameterDescription.Focus();
        }

        private void OnSaveParameter(object sender, EventArgs e)
        {
            try
            {
                var parameter = GetSelectedParameter() ?? new Parameter();
                parameter.Description = _txtParameterDescription.Text.Trim();
                parameter.ObjectDescription = _txtParameterObject.Text.Trim();

                if (parameter.Id > 0)
                {
                    _repository.UpdateParameter(parameter);
                }
                else
                {
                    parameter.Id = _repository.InsertParameter(parameter);
                }

                ReloadAll();
                SelectParameterRow(parameter.Id);
            }
            catch (Exception ex)
            {
                ShowError(ex);
            }
        }

        private void OnDeleteParameter(object sender, EventArgs e)
        {
            var parameter = GetSelectedParameter();
            if (parameter == null)
            {
                return;
            }

            if (MessageBox.Show(
                "Удалить параметр \"" + parameter.Description + "\"?",
                Text,
                MessageBoxButtons.YesNo,
                MessageBoxIcon.Question) != DialogResult.Yes)
            {
                return;
            }

            try
            {
                _repository.DeleteParameter(parameter.Id);
                ReloadAll();
            }
            catch (Exception ex)
            {
                ShowError(ex);
            }
        }

        private void OnAddGroup(object sender, EventArgs e)
        {
            _groupsGrid.ClearSelection();
            _cmbGroupServer.SelectedIndex = _cmbGroupServer.Items.Count > 0 ? 0 : -1;
            _txtGroupName.Clear();
            _txtGroupName.Focus();
        }

        private void OnSaveGroup(object sender, EventArgs e)
        {
            if (_cmbGroupServer.SelectedValue == null)
            {
                ShowValidation("Выберите сервер.");
                return;
            }

            if (string.IsNullOrWhiteSpace(_txtGroupName.Text))
            {
                ShowValidation("Укажите имя группы.");
                return;
            }

            try
            {
                var group = GetSelectedGroup() ?? new OpcGroup();
                group.ServerId = (int)_cmbGroupServer.SelectedValue;
                group.Name = _txtGroupName.Text.Trim();

                if (group.Id > 0)
                {
                    _repository.UpdateOpcGroup(group);
                }
                else
                {
                    group.Id = _repository.InsertOpcGroup(group);
                }

                ReloadAll();
                SelectGroupRow(group.Id);
            }
            catch (Exception ex)
            {
                ShowError(ex);
            }
        }

        private void OnDeleteGroup(object sender, EventArgs e)
        {
            var group = GetSelectedGroup();
            if (group == null)
            {
                return;
            }

            if (MessageBox.Show(
                "Удалить группу \"" + group.Name + "\"?",
                Text,
                MessageBoxButtons.YesNo,
                MessageBoxIcon.Question) != DialogResult.Yes)
            {
                return;
            }

            try
            {
                _repository.DeleteOpcGroup(group.Id);
                ReloadAll();
            }
            catch (Exception ex)
            {
                ShowError(ex);
            }
        }

        private byte GetSelectedServerType()
        {
            var item = _cmbServerType.SelectedItem as ServerTypeItem;
            return item == null ? (byte)0 : item.Value;
        }

        private void SelectServerType(byte serverType)
        {
            for (var i = 0; i < _cmbServerType.Items.Count; i++)
            {
                var item = _cmbServerType.Items[i] as ServerTypeItem;
                if (item != null && item.Value == serverType)
                {
                    _cmbServerType.SelectedIndex = i;
                    return;
                }
            }

            _cmbServerType.SelectedIndex = 0;
        }

        private void SelectServerRow(int id)
        {
            SelectGridRow(_serversGrid, id);
            LoadSelectedServer();
        }

        private void SelectAliasRow(int id)
        {
            SelectGridRow(_aliasesGrid, id);
            LoadSelectedAlias();
        }

        private void SelectParameterRow(int id)
        {
            SelectGridRow(_parametersGrid, id);
            LoadSelectedParameter();
        }

        private void SelectGroupRow(int id)
        {
            SelectGridRow(_groupsGrid, id);
            LoadSelectedGroup();
        }

        private static void SelectGridRow(DataGridView grid, int id)
        {
            foreach (DataGridViewRow row in grid.Rows)
            {
                var alias = row.DataBoundItem as Alias;
                if (alias != null && alias.Id == id)
                {
                    row.Selected = true;
                    grid.CurrentCell = row.Cells[0];
                    return;
                }

                var item = row.DataBoundItem as Server;
                if (item != null && item.Id == id)
                {
                    row.Selected = true;
                    grid.CurrentCell = row.Cells[0];
                    return;
                }

                var parameter = row.DataBoundItem as Parameter;
                if (parameter != null && parameter.Id == id)
                {
                    row.Selected = true;
                    grid.CurrentCell = row.Cells[0];
                    return;
                }

                var group = row.DataBoundItem as OpcGroup;
                if (group != null && group.Id == id)
                {
                    row.Selected = true;
                    grid.CurrentCell = row.Cells[0];
                }
            }
        }

        private void ShowValidation(string message)
        {
            MessageBox.Show(message, Text, MessageBoxButtons.OK, MessageBoxIcon.Warning);
        }

        private void ShowError(Exception ex)
        {
            MessageBox.Show(ex.Message, Text, MessageBoxButtons.OK, MessageBoxIcon.Error);
        }

        private sealed class ServerTypeItem
        {
            public ServerTypeItem(byte value, string text)
            {
                Value = value;
                Text = text;
            }

            public byte Value { get; private set; }
            public string Text { get; private set; }
        }
    }
}
