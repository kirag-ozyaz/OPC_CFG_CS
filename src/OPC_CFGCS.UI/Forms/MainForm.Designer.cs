using System.Drawing;
using System.Windows.Forms;
using OPC_CFGCS.UI.Controls;

namespace OPC_CFGCS.UI.Forms
{
    /// <summary>Разметка и стандартные контролы главной формы (генерируется и редактируется дизайнером).</summary>
    public sealed partial class MainForm
    {
        private System.ComponentModel.IContainer components = null;
        private Panel connectionPanel;
        private TableLayoutPanel connectionLayout;
        private Label lblConnectionString;
        private ComboBox cmbConnectionString;
        private Label lblGesConnectionString;
        private ComboBox cmbGesConnectionString;
        private Button btnConnect;
        private Label lblConnectionStatus;
        private Panel mainWorkPanel;
        private TableLayoutPanel gridsLayout;
        private Panel schemaPanel;
        private Label bindHeaderLabel;
        private Panel bindButtonPanel;
        private TabControl schemaTabs;
        private TabPage tabPs;
        private TabPage tabBus;
        private TabPage tabSwitch;
        private BindPanel bindPanel;
        private Button btnBind;
        // Placeholder-Label: видны в дизайнере; при запуске заменяются в InitializeCustomControls().
        private Label lblPsPlaceholder;
        private Label lblBusPlaceholder;
        private Label lblSwitchPlaceholder;
        private Label lblTagsPlaceholder;

        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }

            base.Dispose(disposing);
        }

        private void InitializeComponent()
        {
            this.connectionPanel = new System.Windows.Forms.Panel();
            this.connectionLayout = new System.Windows.Forms.TableLayoutPanel();
            this.lblConnectionString = new System.Windows.Forms.Label();
            this.cmbConnectionString = new System.Windows.Forms.ComboBox();
            this.lblGesConnectionString = new System.Windows.Forms.Label();
            this.cmbGesConnectionString = new System.Windows.Forms.ComboBox();
            this.btnConnect = new System.Windows.Forms.Button();
            this.lblConnectionStatus = new System.Windows.Forms.Label();
            this.mainWorkPanel = new System.Windows.Forms.Panel();
            this.gridsLayout = new System.Windows.Forms.TableLayoutPanel();
            this.schemaPanel = new System.Windows.Forms.Panel();
            this.schemaTabs = new System.Windows.Forms.TabControl();
            this.tabPs = new System.Windows.Forms.TabPage();
            this.tabBus = new System.Windows.Forms.TabPage();
            this.tabSwitch = new System.Windows.Forms.TabPage();
            this.bindPanel = new OPC_CFGCS.UI.Controls.BindPanel();
            this.bindButtonPanel = new System.Windows.Forms.Panel();
            this.btnBind = new System.Windows.Forms.Button();
            this.bindHeaderLabel = new System.Windows.Forms.Label();
            this.lblPsPlaceholder = new System.Windows.Forms.Label();
            this.lblBusPlaceholder = new System.Windows.Forms.Label();
            this.lblSwitchPlaceholder = new System.Windows.Forms.Label();
            this.lblTagsPlaceholder = new System.Windows.Forms.Label();
            this.connectionPanel.SuspendLayout();
            this.connectionLayout.SuspendLayout();
            this.mainWorkPanel.SuspendLayout();
            this.gridsLayout.SuspendLayout();
            this.schemaPanel.SuspendLayout();
            this.schemaTabs.SuspendLayout();
            this.bindButtonPanel.SuspendLayout();
            this.SuspendLayout();
            // 
            // connectionPanel
            // 
            this.connectionPanel.Controls.Add(this.connectionLayout);
            this.connectionPanel.Dock = System.Windows.Forms.DockStyle.Top;
            this.connectionPanel.Location = new System.Drawing.Point(0, 0);
            this.connectionPanel.Name = "connectionPanel";
            this.connectionPanel.Size = new System.Drawing.Size(1064, 72);
            this.connectionPanel.TabIndex = 1;
            // 
            // connectionLayout
            // 
            this.connectionLayout.ColumnCount = 4;
            this.connectionLayout.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle());
            this.connectionLayout.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.connectionLayout.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle());
            this.connectionLayout.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle());
            this.connectionLayout.Controls.Add(this.lblConnectionString, 0, 0);
            this.connectionLayout.Controls.Add(this.cmbConnectionString, 1, 0);
            this.connectionLayout.Controls.Add(this.lblGesConnectionString, 0, 1);
            this.connectionLayout.Controls.Add(this.cmbGesConnectionString, 1, 1);
            this.connectionLayout.Controls.Add(this.btnConnect, 2, 0);
            this.connectionLayout.Controls.Add(this.lblConnectionStatus, 3, 0);
            this.connectionLayout.Dock = System.Windows.Forms.DockStyle.Fill;
            this.connectionLayout.Location = new System.Drawing.Point(0, 0);
            this.connectionLayout.Name = "connectionLayout";
            this.connectionLayout.Padding = new System.Windows.Forms.Padding(8, 8, 8, 4);
            this.connectionLayout.RowCount = 2;
            this.connectionLayout.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.connectionLayout.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.connectionLayout.Size = new System.Drawing.Size(1064, 72);
            this.connectionLayout.TabIndex = 0;
            // 
            // lblConnectionString
            // 
            this.lblConnectionString.Anchor = System.Windows.Forms.AnchorStyles.Left;
            this.lblConnectionString.AutoSize = true;
            this.lblConnectionString.Location = new System.Drawing.Point(11, 19);
            this.lblConnectionString.Margin = new System.Windows.Forms.Padding(3, 5, 8, 0);
            this.lblConnectionString.Name = "lblConnectionString";
            this.lblConnectionString.Size = new System.Drawing.Size(68, 13);
            this.lblConnectionString.TabIndex = 0;
            this.lblConnectionString.Text = "OPC_Config:";
            // 
            // cmbConnectionString
            // 
            this.cmbConnectionString.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.SuggestAppend;
            this.cmbConnectionString.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.ListItems;
            this.cmbConnectionString.Dock = System.Windows.Forms.DockStyle.Fill;
            this.cmbConnectionString.Location = new System.Drawing.Point(90, 11);
            this.cmbConnectionString.Margin = new System.Windows.Forms.Padding(3, 3, 8, 3);
            this.cmbConnectionString.Name = "cmbConnectionString";
            this.cmbConnectionString.Size = new System.Drawing.Size(761, 21);
            this.cmbConnectionString.TabIndex = 1;
            // 
            // lblGesConnectionString
            // 
            this.lblGesConnectionString.Anchor = System.Windows.Forms.AnchorStyles.Left;
            this.lblGesConnectionString.AutoSize = true;
            this.lblGesConnectionString.Location = new System.Drawing.Point(11, 49);
            this.lblGesConnectionString.Margin = new System.Windows.Forms.Padding(3, 5, 8, 0);
            this.lblGesConnectionString.Name = "lblGesConnectionString";
            this.lblGesConnectionString.Size = new System.Drawing.Size(32, 13);
            this.lblGesConnectionString.TabIndex = 4;
            this.lblGesConnectionString.Text = "GES:";
            // 
            // cmbGesConnectionString
            // 
            this.cmbGesConnectionString.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.SuggestAppend;
            this.cmbGesConnectionString.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.ListItems;
            this.cmbGesConnectionString.Dock = System.Windows.Forms.DockStyle.Fill;
            this.cmbGesConnectionString.Location = new System.Drawing.Point(90, 41);
            this.cmbGesConnectionString.Margin = new System.Windows.Forms.Padding(3, 3, 8, 3);
            this.cmbGesConnectionString.Name = "cmbGesConnectionString";
            this.cmbGesConnectionString.Size = new System.Drawing.Size(761, 21);
            this.cmbGesConnectionString.TabIndex = 5;
            // 
            // btnConnect
            // 
            this.btnConnect.AutoSize = true;
            this.btnConnect.Location = new System.Drawing.Point(862, 8);
            this.btnConnect.Margin = new System.Windows.Forms.Padding(3, 0, 8, 0);
            this.btnConnect.Name = "btnConnect";
            this.connectionLayout.SetRowSpan(this.btnConnect, 2);
            this.btnConnect.Size = new System.Drawing.Size(95, 23);
            this.btnConnect.TabIndex = 2;
            this.btnConnect.Text = "Подключиться";
            this.btnConnect.UseVisualStyleBackColor = true;
            this.btnConnect.Click += new System.EventHandler(this.OnConnectClick);
            // 
            // lblConnectionStatus
            // 
            this.lblConnectionStatus.Anchor = System.Windows.Forms.AnchorStyles.Left;
            this.lblConnectionStatus.AutoSize = true;
            this.lblConnectionStatus.ForeColor = System.Drawing.Color.DarkRed;
            this.lblConnectionStatus.Location = new System.Drawing.Point(968, 34);
            this.lblConnectionStatus.Margin = new System.Windows.Forms.Padding(3, 5, 3, 0);
            this.lblConnectionStatus.Name = "lblConnectionStatus";
            this.connectionLayout.SetRowSpan(this.lblConnectionStatus, 2);
            this.lblConnectionStatus.Size = new System.Drawing.Size(85, 13);
            this.lblConnectionStatus.TabIndex = 3;
            this.lblConnectionStatus.Text = "Не подключено";
            // 
            // mainWorkPanel
            // 
            this.mainWorkPanel.Controls.Add(this.gridsLayout);
            this.mainWorkPanel.Controls.Add(this.bindHeaderLabel);
            this.mainWorkPanel.Dock = System.Windows.Forms.DockStyle.Fill;
            this.mainWorkPanel.Location = new System.Drawing.Point(0, 72);
            this.mainWorkPanel.Name = "mainWorkPanel";
            this.mainWorkPanel.Padding = new System.Windows.Forms.Padding(8);
            this.mainWorkPanel.Size = new System.Drawing.Size(1064, 634);
            this.mainWorkPanel.TabIndex = 0;
            // 
            // gridsLayout
            // 
            this.gridsLayout.ColumnCount = 3;
            this.gridsLayout.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.gridsLayout.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 56F));
            this.gridsLayout.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.gridsLayout.Controls.Add(this.schemaPanel, 0, 0);
            this.gridsLayout.Controls.Add(this.bindButtonPanel, 1, 0);
            this.gridsLayout.Controls.Add(this.lblTagsPlaceholder, 2, 0);
            this.gridsLayout.Dock = System.Windows.Forms.DockStyle.Fill;
            this.gridsLayout.Location = new System.Drawing.Point(8, 32);
            this.gridsLayout.Name = "gridsLayout";
            this.gridsLayout.RowCount = 1;
            this.gridsLayout.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.gridsLayout.Size = new System.Drawing.Size(1048, 594);
            this.gridsLayout.TabIndex = 1;
            // 
            // schemaPanel
            // 
            this.schemaPanel.Controls.Add(this.schemaTabs);
            this.schemaPanel.Controls.Add(this.bindPanel);
            this.schemaPanel.Dock = System.Windows.Forms.DockStyle.Fill;
            this.schemaPanel.Location = new System.Drawing.Point(3, 3);
            this.schemaPanel.Name = "schemaPanel";
            this.schemaPanel.Size = new System.Drawing.Size(490, 588);
            this.schemaPanel.TabIndex = 0;
            // 
            // schemaTabs
            // 
            this.schemaTabs.Controls.Add(this.tabPs);
            this.schemaTabs.Controls.Add(this.tabBus);
            this.schemaTabs.Controls.Add(this.tabSwitch);
            this.schemaTabs.Dock = System.Windows.Forms.DockStyle.Fill;
            this.schemaTabs.Location = new System.Drawing.Point(0, 0);
            this.schemaTabs.Name = "schemaTabs";
            this.schemaTabs.SelectedIndex = 0;
            this.schemaTabs.Size = new System.Drawing.Size(490, 468);
            this.schemaTabs.TabIndex = 0;
            this.schemaTabs.SelectedIndexChanged += new System.EventHandler(this.OnSchemaTabChanged);
            // 
            // tabPs
            // 
            this.tabPs.Controls.Add(this.lblPsPlaceholder);
            this.tabPs.Location = new System.Drawing.Point(4, 22);
            this.tabPs.Name = "tabPs";
            this.tabPs.Padding = new System.Windows.Forms.Padding(3);
            this.tabPs.Size = new System.Drawing.Size(482, 442);
            this.tabPs.TabIndex = 0;
            this.tabPs.Text = "ПС";
            this.tabPs.UseVisualStyleBackColor = true;
            // 
            // lblPsPlaceholder
            // 
            this.lblPsPlaceholder.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lblPsPlaceholder.ForeColor = System.Drawing.Color.Gray;
            this.lblPsPlaceholder.Location = new System.Drawing.Point(3, 3);
            this.lblPsPlaceholder.Name = "lblPsPlaceholder";
            this.lblPsPlaceholder.Size = new System.Drawing.Size(476, 436);
            this.lblPsPlaceholder.TabIndex = 0;
            this.lblPsPlaceholder.Text = "Здесь будет список объектов схемы (ПС)";
            this.lblPsPlaceholder.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // tabBus
            // 
            this.tabBus.Controls.Add(this.lblBusPlaceholder);
            this.tabBus.Location = new System.Drawing.Point(4, 22);
            this.tabBus.Name = "tabBus";
            this.tabBus.Padding = new System.Windows.Forms.Padding(3);
            this.tabBus.Size = new System.Drawing.Size(482, 442);
            this.tabBus.TabIndex = 1;
            this.tabBus.Text = "Шина";
            this.tabBus.UseVisualStyleBackColor = true;
            // 
            // lblBusPlaceholder
            // 
            this.lblBusPlaceholder.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lblBusPlaceholder.ForeColor = System.Drawing.Color.Gray;
            this.lblBusPlaceholder.Location = new System.Drawing.Point(3, 3);
            this.lblBusPlaceholder.Name = "lblBusPlaceholder";
            this.lblBusPlaceholder.Size = new System.Drawing.Size(476, 436);
            this.lblBusPlaceholder.TabIndex = 0;
            this.lblBusPlaceholder.Text = "Здесь будет список объектов схемы (Шина)";
            this.lblBusPlaceholder.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // tabSwitch
            // 
            this.tabSwitch.Controls.Add(this.lblSwitchPlaceholder);
            this.tabSwitch.Location = new System.Drawing.Point(4, 22);
            this.tabSwitch.Name = "tabSwitch";
            this.tabSwitch.Padding = new System.Windows.Forms.Padding(3);
            this.tabSwitch.Size = new System.Drawing.Size(482, 442);
            this.tabSwitch.TabIndex = 2;
            this.tabSwitch.Text = "Выключатель";
            this.tabSwitch.UseVisualStyleBackColor = true;
            // 
            // lblSwitchPlaceholder
            // 
            this.lblSwitchPlaceholder.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lblSwitchPlaceholder.ForeColor = System.Drawing.Color.Gray;
            this.lblSwitchPlaceholder.Location = new System.Drawing.Point(3, 3);
            this.lblSwitchPlaceholder.Name = "lblSwitchPlaceholder";
            this.lblSwitchPlaceholder.Size = new System.Drawing.Size(476, 436);
            this.lblSwitchPlaceholder.TabIndex = 0;
            this.lblSwitchPlaceholder.Text = "Здесь будет список объектов схемы (Выключатель)";
            this.lblSwitchPlaceholder.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // bindPanel
            // 
            this.bindPanel.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.bindPanel.Location = new System.Drawing.Point(0, 468);
            this.bindPanel.Name = "bindPanel";
            this.bindPanel.Size = new System.Drawing.Size(490, 120);
            this.bindPanel.TabIndex = 1;
            // 
            // bindButtonPanel
            // 
            this.bindButtonPanel.Controls.Add(this.btnBind);
            this.bindButtonPanel.Dock = System.Windows.Forms.DockStyle.Fill;
            this.bindButtonPanel.Location = new System.Drawing.Point(499, 3);
            this.bindButtonPanel.Name = "bindButtonPanel";
            this.bindButtonPanel.Size = new System.Drawing.Size(50, 588);
            this.bindButtonPanel.TabIndex = 1;
            // 
            // btnBind
            // 
            this.btnBind.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.btnBind.Location = new System.Drawing.Point(7, 280);
            this.btnBind.Name = "btnBind";
            this.btnBind.Size = new System.Drawing.Size(36, 28);
            this.btnBind.TabIndex = 0;
            this.btnBind.Text = "<=>";
            this.btnBind.UseVisualStyleBackColor = true;
            this.btnBind.Click += new System.EventHandler(this.OnBindClick);
            // 
            // lblTagsPlaceholder
            // 
            this.lblTagsPlaceholder.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lblTagsPlaceholder.ForeColor = System.Drawing.Color.Gray;
            this.lblTagsPlaceholder.Location = new System.Drawing.Point(555, 3);
            this.lblTagsPlaceholder.Name = "lblTagsPlaceholder";
            this.lblTagsPlaceholder.Size = new System.Drawing.Size(490, 588);
            this.lblTagsPlaceholder.TabIndex = 2;
            this.lblTagsPlaceholder.Text = "Здесь будет панель тегов (TagsPanel)";
            this.lblTagsPlaceholder.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // bindHeaderLabel
            // 
            this.bindHeaderLabel.Dock = System.Windows.Forms.DockStyle.Top;
            this.bindHeaderLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold);
            this.bindHeaderLabel.Location = new System.Drawing.Point(8, 8);
            this.bindHeaderLabel.Name = "bindHeaderLabel";
            this.bindHeaderLabel.Size = new System.Drawing.Size(1048, 24);
            this.bindHeaderLabel.TabIndex = 0;
            this.bindHeaderLabel.Text = "Связь OPC тэгов с объектами схемы";
            // 
            // MainForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1064, 706);
            this.Controls.Add(this.mainWorkPanel);
            this.Controls.Add(this.connectionPanel);
            this.Name = "MainForm";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Конфигурация OPC";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.OnFormClosing);
            this.connectionPanel.ResumeLayout(false);
            this.connectionLayout.ResumeLayout(false);
            this.connectionLayout.PerformLayout();
            this.mainWorkPanel.ResumeLayout(false);
            this.gridsLayout.ResumeLayout(false);
            this.schemaPanel.ResumeLayout(false);
            this.schemaTabs.ResumeLayout(false);
            this.bindButtonPanel.ResumeLayout(false);
            this.ResumeLayout(false);

        }
    }
}
