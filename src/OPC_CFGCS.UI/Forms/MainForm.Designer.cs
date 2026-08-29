using System.Drawing;
using System.Windows.Forms;
using OPC_CFGCS.Core;
using OPC_CFGCS.UI.Controls;

namespace OPC_CFGCS.UI.Forms
{
    public sealed partial class MainForm
    {
        private System.ComponentModel.IContainer components = null;
        private Panel connectionPanel;
        private TableLayoutPanel connectionLayout;
        private Label lblConnectionString;
        private TextBox txtConnectionString;
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
        private TagsPanel tagsPanel;
        private BindPanel bindPanel;
        private SchemaObjectPanel psPanel;
        private SchemaObjectPanel busPanel;
        private SchemaObjectPanel switchPanel;
        private Button btnBind;

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
            this.connectionPanel = new Panel();
            this.connectionLayout = new TableLayoutPanel();
            this.lblConnectionString = new Label();
            this.txtConnectionString = new TextBox();
            this.btnConnect = new Button();
            this.lblConnectionStatus = new Label();
            this.mainWorkPanel = new Panel();
            this.gridsLayout = new TableLayoutPanel();
            this.schemaPanel = new Panel();
            this.schemaTabs = new TabControl();
            this.tabPs = new TabPage();
            this.tabBus = new TabPage();
            this.tabSwitch = new TabPage();
            this.psPanel = new SchemaObjectPanel(SchemaObjectType.PowerStation);
            this.busPanel = new SchemaObjectPanel(SchemaObjectType.CellBus);
            this.switchPanel = new SchemaObjectPanel(SchemaObjectType.CellSwitch);
            this.bindButtonPanel = new Panel();
            this.btnBind = new Button();
            this.bindHeaderLabel = new Label();
            this.tagsPanel = new TagsPanel();
            this.bindPanel = new BindPanel();
            this.connectionPanel.SuspendLayout();
            this.connectionLayout.SuspendLayout();
            this.mainWorkPanel.SuspendLayout();
            this.gridsLayout.SuspendLayout();
            this.schemaPanel.SuspendLayout();
            this.schemaTabs.SuspendLayout();
            this.tabPs.SuspendLayout();
            this.tabBus.SuspendLayout();
            this.tabSwitch.SuspendLayout();
            this.bindButtonPanel.SuspendLayout();
            this.SuspendLayout();
            //
            // connectionPanel
            //
            this.connectionPanel.Controls.Add(this.connectionLayout);
            this.connectionPanel.Dock = DockStyle.Top;
            this.connectionPanel.Location = new Point(0, 0);
            this.connectionPanel.Name = "connectionPanel";
            this.connectionPanel.Size = new Size(1280, 44);
            this.connectionPanel.TabIndex = 1;
            //
            // connectionLayout
            //
            this.connectionLayout.ColumnCount = 4;
            this.connectionLayout.ColumnStyles.Add(new ColumnStyle(SizeType.AutoSize));
            this.connectionLayout.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 100F));
            this.connectionLayout.ColumnStyles.Add(new ColumnStyle(SizeType.AutoSize));
            this.connectionLayout.ColumnStyles.Add(new ColumnStyle(SizeType.AutoSize));
            this.connectionLayout.Controls.Add(this.lblConnectionString, 0, 0);
            this.connectionLayout.Controls.Add(this.txtConnectionString, 1, 0);
            this.connectionLayout.Controls.Add(this.btnConnect, 2, 0);
            this.connectionLayout.Controls.Add(this.lblConnectionStatus, 3, 0);
            this.connectionLayout.Dock = DockStyle.Fill;
            this.connectionLayout.Location = new Point(0, 0);
            this.connectionLayout.Name = "connectionLayout";
            this.connectionLayout.Padding = new Padding(8, 8, 8, 4);
            this.connectionLayout.RowCount = 1;
            this.connectionLayout.RowStyles.Add(new RowStyle(SizeType.Percent, 100F));
            this.connectionLayout.Size = new Size(1280, 44);
            this.connectionLayout.TabIndex = 0;
            //
            // lblConnectionString
            //
            this.lblConnectionString.Anchor = AnchorStyles.Left;
            this.lblConnectionString.AutoSize = true;
            this.lblConnectionString.Location = new Point(11, 13);
            this.lblConnectionString.Margin = new Padding(3, 5, 8, 0);
            this.lblConnectionString.Name = "lblConnectionString";
            this.lblConnectionString.Size = new Size(118, 13);
            this.lblConnectionString.TabIndex = 0;
            this.lblConnectionString.Text = "Строка подключения:";
            //
            // txtConnectionString
            //
            this.txtConnectionString.Dock = DockStyle.Fill;
            this.txtConnectionString.Location = new Point(140, 11);
            this.txtConnectionString.Margin = new Padding(3, 3, 8, 3);
            this.txtConnectionString.Name = "txtConnectionString";
            this.txtConnectionString.Size = new Size(944, 20);
            this.txtConnectionString.TabIndex = 1;
            //
            // btnConnect
            //
            this.btnConnect.AutoSize = true;
            this.btnConnect.Location = new Point(1095, 8);
            this.btnConnect.Margin = new Padding(3, 0, 8, 0);
            this.btnConnect.Name = "btnConnect";
            this.btnConnect.Size = new Size(95, 23);
            this.btnConnect.TabIndex = 2;
            this.btnConnect.Text = "Подключиться";
            this.btnConnect.UseVisualStyleBackColor = true;
            this.btnConnect.Click += new System.EventHandler(this.OnConnectClick);
            //
            // lblConnectionStatus
            //
            this.lblConnectionStatus.Anchor = AnchorStyles.Left;
            this.lblConnectionStatus.AutoSize = true;
            this.lblConnectionStatus.ForeColor = Color.DarkRed;
            this.lblConnectionStatus.Location = new Point(1201, 13);
            this.lblConnectionStatus.Margin = new Padding(3, 5, 3, 0);
            this.lblConnectionStatus.Name = "lblConnectionStatus";
            this.lblConnectionStatus.Size = new Size(84, 13);
            this.lblConnectionStatus.TabIndex = 3;
            this.lblConnectionStatus.Text = "Не подключено";
            //
            // mainWorkPanel
            //
            this.mainWorkPanel.Controls.Add(this.gridsLayout);
            this.mainWorkPanel.Controls.Add(this.bindHeaderLabel);
            this.mainWorkPanel.Dock = DockStyle.Fill;
            this.mainWorkPanel.Location = new Point(0, 44);
            this.mainWorkPanel.Name = "mainWorkPanel";
            this.mainWorkPanel.Padding = new Padding(8);
            this.mainWorkPanel.Size = new Size(1280, 756);
            this.mainWorkPanel.TabIndex = 0;
            //
            // gridsLayout
            //
            this.gridsLayout.ColumnCount = 3;
            this.gridsLayout.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 50F));
            this.gridsLayout.ColumnStyles.Add(new ColumnStyle(SizeType.Absolute, 56F));
            this.gridsLayout.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 50F));
            this.gridsLayout.Controls.Add(this.schemaPanel, 0, 0);
            this.gridsLayout.Controls.Add(this.bindButtonPanel, 1, 0);
            this.gridsLayout.Controls.Add(this.tagsPanel, 2, 0);
            this.gridsLayout.Dock = DockStyle.Fill;
            this.gridsLayout.Location = new Point(8, 32);
            this.gridsLayout.Name = "gridsLayout";
            this.gridsLayout.RowCount = 1;
            this.gridsLayout.RowStyles.Add(new RowStyle(SizeType.Percent, 100F));
            this.gridsLayout.Size = new Size(1264, 716);
            this.gridsLayout.TabIndex = 1;
            //
            // schemaPanel
            //
            this.schemaPanel.Controls.Add(this.schemaTabs);
            this.schemaPanel.Controls.Add(this.bindPanel);
            this.schemaPanel.Dock = DockStyle.Fill;
            this.schemaPanel.Location = new Point(3, 3);
            this.schemaPanel.Name = "schemaPanel";
            this.schemaPanel.Size = new Size(598, 710);
            this.schemaPanel.TabIndex = 0;
            //
            // schemaTabs
            //
            this.schemaTabs.Controls.Add(this.tabPs);
            this.schemaTabs.Controls.Add(this.tabBus);
            this.schemaTabs.Controls.Add(this.tabSwitch);
            this.schemaTabs.Dock = DockStyle.Fill;
            this.schemaTabs.Location = new Point(0, 0);
            this.schemaTabs.Name = "schemaTabs";
            this.schemaTabs.SelectedIndex = 0;
            this.schemaTabs.Size = new Size(598, 590);
            this.schemaTabs.TabIndex = 0;
            this.schemaTabs.SelectedIndexChanged += new System.EventHandler(this.OnSchemaTabChanged);
            //
            // tabPs
            //
            this.tabPs.Controls.Add(this.psPanel);
            this.tabPs.Location = new Point(4, 22);
            this.tabPs.Name = "tabPs";
            this.tabPs.Padding = new Padding(3);
            this.tabPs.Size = new Size(590, 564);
            this.tabPs.TabIndex = 0;
            this.tabPs.Text = "ПС";
            this.tabPs.UseVisualStyleBackColor = true;
            //
            // psPanel
            //
            this.psPanel.Dock = DockStyle.Fill;
            this.psPanel.Location = new Point(3, 3);
            this.psPanel.Name = "psPanel";
            this.psPanel.Size = new Size(584, 558);
            this.psPanel.TabIndex = 0;
            this.psPanel.CurrentObjectChanged += new System.EventHandler(this.OnSchemaObjectChanged);
            //
            // tabBus
            //
            this.tabBus.Controls.Add(this.busPanel);
            this.tabBus.Location = new Point(4, 22);
            this.tabBus.Name = "tabBus";
            this.tabBus.Padding = new Padding(3);
            this.tabBus.Size = new Size(590, 564);
            this.tabBus.TabIndex = 1;
            this.tabBus.Text = "Шина";
            this.tabBus.UseVisualStyleBackColor = true;
            //
            // busPanel
            //
            this.busPanel.Dock = DockStyle.Fill;
            this.busPanel.Location = new Point(3, 3);
            this.busPanel.Name = "busPanel";
            this.busPanel.Size = new Size(584, 558);
            this.busPanel.TabIndex = 0;
            this.busPanel.CurrentObjectChanged += new System.EventHandler(this.OnSchemaObjectChanged);
            //
            // tabSwitch
            //
            this.tabSwitch.Controls.Add(this.switchPanel);
            this.tabSwitch.Location = new Point(4, 22);
            this.tabSwitch.Name = "tabSwitch";
            this.tabSwitch.Padding = new Padding(3);
            this.tabSwitch.Size = new Size(590, 564);
            this.tabSwitch.TabIndex = 2;
            this.tabSwitch.Text = "Выключатель";
            this.tabSwitch.UseVisualStyleBackColor = true;
            //
            // switchPanel
            //
            this.switchPanel.Dock = DockStyle.Fill;
            this.switchPanel.Location = new Point(3, 3);
            this.switchPanel.Name = "switchPanel";
            this.switchPanel.Size = new Size(584, 558);
            this.switchPanel.TabIndex = 0;
            this.switchPanel.CurrentObjectChanged += new System.EventHandler(this.OnSchemaObjectChanged);
            //
            // bindButtonPanel
            //
            this.bindButtonPanel.Controls.Add(this.btnBind);
            this.bindButtonPanel.Dock = DockStyle.Fill;
            this.bindButtonPanel.Location = new Point(607, 3);
            this.bindButtonPanel.Name = "bindButtonPanel";
            this.bindButtonPanel.Size = new Size(50, 710);
            this.bindButtonPanel.TabIndex = 1;
            //
            // btnBind
            //
            this.btnBind.Anchor = AnchorStyles.None;
            this.btnBind.Location = new Point(7, 341);
            this.btnBind.Name = "btnBind";
            this.btnBind.Size = new Size(36, 28);
            this.btnBind.TabIndex = 0;
            this.btnBind.Text = "<=>";
            this.btnBind.UseVisualStyleBackColor = true;
            this.btnBind.Click += new System.EventHandler(this.OnBindClick);
            //
            // bindHeaderLabel
            //
            this.bindHeaderLabel.Dock = DockStyle.Top;
            this.bindHeaderLabel.Font = new Font(this.Font, FontStyle.Bold);
            this.bindHeaderLabel.Location = new Point(8, 8);
            this.bindHeaderLabel.Name = "bindHeaderLabel";
            this.bindHeaderLabel.Size = new Size(1264, 24);
            this.bindHeaderLabel.TabIndex = 0;
            this.bindHeaderLabel.Text = "Связь OPC тэгов с объектами схемы";
            //
            // tagsPanel
            //
            this.tagsPanel.Dock = DockStyle.Fill;
            this.tagsPanel.Location = new Point(663, 3);
            this.tagsPanel.Name = "tagsPanel";
            this.tagsPanel.Size = new Size(598, 710);
            this.tagsPanel.TabIndex = 2;
            this.tagsPanel.TagChanged += new System.EventHandler(this.OnTagChanged);
            //
            // bindPanel
            //
            this.bindPanel.Dock = DockStyle.Bottom;
            this.bindPanel.Location = new Point(0, 590);
            this.bindPanel.Name = "bindPanel";
            this.bindPanel.Size = new Size(598, 120);
            this.bindPanel.TabIndex = 1;
            //
            // MainForm
            //
            this.AutoScaleDimensions = new SizeF(6F, 13F);
            this.AutoScaleMode = AutoScaleMode.Font;
            this.ClientSize = new Size(1280, 800);
            this.Controls.Add(this.mainWorkPanel);
            this.Controls.Add(this.connectionPanel);
            this.Name = "MainForm";
            this.StartPosition = FormStartPosition.CenterScreen;
            this.Text = "Конфигурация OPC";
            this.FormClosing += new FormClosingEventHandler(this.OnFormClosing);
            this.connectionPanel.ResumeLayout(false);
            this.connectionLayout.ResumeLayout(false);
            this.connectionLayout.PerformLayout();
            this.mainWorkPanel.ResumeLayout(false);
            this.gridsLayout.ResumeLayout(false);
            this.schemaPanel.ResumeLayout(false);
            this.schemaTabs.ResumeLayout(false);
            this.tabPs.ResumeLayout(false);
            this.tabBus.ResumeLayout(false);
            this.tabSwitch.ResumeLayout(false);
            this.bindButtonPanel.ResumeLayout(false);
            this.ResumeLayout(false);
        }
    }
}
