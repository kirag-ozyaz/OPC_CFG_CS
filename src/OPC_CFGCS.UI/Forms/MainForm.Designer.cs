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
        private SplitContainer rootSplitContainer;
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
            this.connectionPanel = new System.Windows.Forms.Panel();
            this.connectionLayout = new System.Windows.Forms.TableLayoutPanel();
            this.lblConnectionString = new System.Windows.Forms.Label();
            this.txtConnectionString = new System.Windows.Forms.TextBox();
            this.btnConnect = new System.Windows.Forms.Button();
            this.lblConnectionStatus = new System.Windows.Forms.Label();
            this.rootSplitContainer = new System.Windows.Forms.SplitContainer();
            this.mainWorkPanel = new System.Windows.Forms.Panel();
            this.gridsLayout = new System.Windows.Forms.TableLayoutPanel();
            this.schemaPanel = new System.Windows.Forms.Panel();
            this.schemaTabs = new System.Windows.Forms.TabControl();
            this.tabPs = new System.Windows.Forms.TabPage();
            this.tabBus = new System.Windows.Forms.TabPage();
            this.tabSwitch = new System.Windows.Forms.TabPage();
            this.psPanel = new OPC_CFGCS.UI.Controls.SchemaObjectPanel();
            this.busPanel = new OPC_CFGCS.UI.Controls.SchemaObjectPanel();
            this.switchPanel = new OPC_CFGCS.UI.Controls.SchemaObjectPanel();
            this.bindButtonPanel = new System.Windows.Forms.Panel();
            this.btnBind = new System.Windows.Forms.Button();
            this.tagsPanel = new OPC_CFGCS.UI.Controls.TagsPanel();
            this.bindHeaderLabel = new System.Windows.Forms.Label();
            this.bindPanel = new OPC_CFGCS.UI.Controls.BindPanel();
            this.connectionPanel.SuspendLayout();
            this.connectionLayout.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.rootSplitContainer)).BeginInit();
            this.rootSplitContainer.Panel1.SuspendLayout();
            this.rootSplitContainer.Panel2.SuspendLayout();
            this.rootSplitContainer.SuspendLayout();
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
            this.connectionPanel.Dock = System.Windows.Forms.DockStyle.Top;
            this.connectionPanel.Location = new System.Drawing.Point(0, 0);
            this.connectionPanel.Name = "connectionPanel";
            this.connectionPanel.Size = new System.Drawing.Size(1280, 44);
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
            this.connectionLayout.Controls.Add(this.txtConnectionString, 1, 0);
            this.connectionLayout.Controls.Add(this.btnConnect, 2, 0);
            this.connectionLayout.Controls.Add(this.lblConnectionStatus, 3, 0);
            this.connectionLayout.Dock = System.Windows.Forms.DockStyle.Fill;
            this.connectionLayout.Location = new System.Drawing.Point(0, 0);
            this.connectionLayout.Name = "connectionLayout";
            this.connectionLayout.Padding = new System.Windows.Forms.Padding(8, 8, 8, 4);
            this.connectionLayout.RowCount = 1;
            this.connectionLayout.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.connectionLayout.Size = new System.Drawing.Size(1280, 44);
            this.connectionLayout.TabIndex = 0;
            // 
            // lblConnectionString
            // 
            this.lblConnectionString.Anchor = System.Windows.Forms.AnchorStyles.Left;
            this.lblConnectionString.AutoSize = true;
            this.lblConnectionString.Location = new System.Drawing.Point(11, 20);
            this.lblConnectionString.Margin = new System.Windows.Forms.Padding(3, 5, 8, 0);
            this.lblConnectionString.Name = "lblConnectionString";
            this.lblConnectionString.Size = new System.Drawing.Size(116, 13);
            this.lblConnectionString.TabIndex = 0;
            this.lblConnectionString.Text = "Строка подключения:";
            // 
            // txtConnectionString
            // 
            this.txtConnectionString.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtConnectionString.Location = new System.Drawing.Point(138, 11);
            this.txtConnectionString.Margin = new System.Windows.Forms.Padding(3, 3, 8, 3);
            this.txtConnectionString.Name = "txtConnectionString";
            this.txtConnectionString.Size = new System.Drawing.Size(929, 20);
            this.txtConnectionString.TabIndex = 1;
            // 
            // btnConnect
            // 
            this.btnConnect.AutoSize = true;
            this.btnConnect.Location = new System.Drawing.Point(1078, 8);
            this.btnConnect.Margin = new System.Windows.Forms.Padding(3, 0, 8, 0);
            this.btnConnect.Name = "btnConnect";
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
            this.lblConnectionStatus.Location = new System.Drawing.Point(1184, 20);
            this.lblConnectionStatus.Margin = new System.Windows.Forms.Padding(3, 5, 3, 0);
            this.lblConnectionStatus.Name = "lblConnectionStatus";
            this.lblConnectionStatus.Size = new System.Drawing.Size(85, 13);
            this.lblConnectionStatus.TabIndex = 3;
            this.lblConnectionStatus.Text = "Не подключено";
            // 
            // rootSplitContainer
            // 
            this.rootSplitContainer.Dock = System.Windows.Forms.DockStyle.Fill;
            this.rootSplitContainer.Location = new System.Drawing.Point(0, 44);
            this.rootSplitContainer.Name = "rootSplitContainer";
            this.rootSplitContainer.Orientation = System.Windows.Forms.Orientation.Horizontal;
            // 
            // rootSplitContainer.Panel1
            // 
            this.rootSplitContainer.Panel1.Controls.Add(this.mainWorkPanel);
            // 
            // rootSplitContainer.Panel2
            // 
            this.rootSplitContainer.Panel2.Controls.Add(this.bindPanel);
            this.rootSplitContainer.Size = new System.Drawing.Size(1280, 554);
            this.rootSplitContainer.SplitterDistance = 290;
            this.rootSplitContainer.TabIndex = 0;
            // 
            // mainWorkPanel
            // 
            this.mainWorkPanel.Controls.Add(this.gridsLayout);
            this.mainWorkPanel.Controls.Add(this.bindHeaderLabel);
            this.mainWorkPanel.Dock = System.Windows.Forms.DockStyle.Fill;
            this.mainWorkPanel.Location = new System.Drawing.Point(0, 0);
            this.mainWorkPanel.Name = "mainWorkPanel";
            this.mainWorkPanel.Padding = new System.Windows.Forms.Padding(8);
            this.mainWorkPanel.Size = new System.Drawing.Size(1280, 290);
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
            this.gridsLayout.Controls.Add(this.tagsPanel, 2, 0);
            this.gridsLayout.Dock = System.Windows.Forms.DockStyle.Fill;
            this.gridsLayout.Location = new System.Drawing.Point(8, 32);
            this.gridsLayout.Name = "gridsLayout";
            this.gridsLayout.RowCount = 1;
            this.gridsLayout.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.gridsLayout.Size = new System.Drawing.Size(1264, 250);
            this.gridsLayout.TabIndex = 1;
            // 
            // schemaPanel
            // 
            this.schemaPanel.Controls.Add(this.schemaTabs);
            this.schemaPanel.Dock = System.Windows.Forms.DockStyle.Fill;
            this.schemaPanel.Location = new System.Drawing.Point(3, 3);
            this.schemaPanel.Name = "schemaPanel";
            this.schemaPanel.Size = new System.Drawing.Size(598, 244);
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
            this.schemaTabs.Size = new System.Drawing.Size(598, 244);
            this.schemaTabs.TabIndex = 0;
            this.schemaTabs.SelectedIndexChanged += new System.EventHandler(this.OnSchemaTabChanged);
            // 
            // tabPs
            // 
            this.tabPs.Controls.Add(this.psPanel);
            this.tabPs.Location = new System.Drawing.Point(4, 22);
            this.tabPs.Name = "tabPs";
            this.tabPs.Padding = new System.Windows.Forms.Padding(3);
            this.tabPs.Size = new System.Drawing.Size(590, 218);
            this.tabPs.TabIndex = 0;
            this.tabPs.Text = "ПС";
            this.tabPs.UseVisualStyleBackColor = true;
            // 
            // psPanel
            // 
            this.psPanel.Dock = System.Windows.Forms.DockStyle.Fill;
            this.psPanel.Location = new System.Drawing.Point(3, 3);
            this.psPanel.Name = "psPanel";
            this.psPanel.ObjectType = SchemaObjectType.PowerStation;
            this.psPanel.Size = new System.Drawing.Size(584, 212);
            this.psPanel.TabIndex = 0;
            this.psPanel.CurrentObjectChanged += new System.EventHandler(this.OnSchemaObjectChanged);
            // 
            // tabBus
            // 
            this.tabBus.Controls.Add(this.busPanel);
            this.tabBus.Location = new System.Drawing.Point(4, 22);
            this.tabBus.Name = "tabBus";
            this.tabBus.Padding = new System.Windows.Forms.Padding(3);
            this.tabBus.Size = new System.Drawing.Size(590, 348);
            this.tabBus.TabIndex = 1;
            this.tabBus.Text = "Шина";
            this.tabBus.UseVisualStyleBackColor = true;
            // 
            // busPanel
            // 
            this.busPanel.Dock = System.Windows.Forms.DockStyle.Fill;
            this.busPanel.Location = new System.Drawing.Point(3, 3);
            this.busPanel.Name = "busPanel";
            this.busPanel.ObjectType = SchemaObjectType.CellBus;
            this.busPanel.Size = new System.Drawing.Size(584, 342);
            this.busPanel.TabIndex = 0;
            this.busPanel.CurrentObjectChanged += new System.EventHandler(this.OnSchemaObjectChanged);
            // 
            // tabSwitch
            // 
            this.tabSwitch.Controls.Add(this.switchPanel);
            this.tabSwitch.Location = new System.Drawing.Point(4, 22);
            this.tabSwitch.Name = "tabSwitch";
            this.tabSwitch.Padding = new System.Windows.Forms.Padding(3);
            this.tabSwitch.Size = new System.Drawing.Size(590, 348);
            this.tabSwitch.TabIndex = 2;
            this.tabSwitch.Text = "Выключатель";
            this.tabSwitch.UseVisualStyleBackColor = true;
            // 
            // switchPanel
            // 
            this.switchPanel.Dock = System.Windows.Forms.DockStyle.Fill;
            this.switchPanel.Location = new System.Drawing.Point(3, 3);
            this.switchPanel.Name = "switchPanel";
            this.switchPanel.ObjectType = SchemaObjectType.CellSwitch;
            this.switchPanel.Size = new System.Drawing.Size(584, 342);
            this.switchPanel.TabIndex = 0;
            this.switchPanel.CurrentObjectChanged += new System.EventHandler(this.OnSchemaObjectChanged);
            // 
            // bindButtonPanel
            // 
            this.bindButtonPanel.Controls.Add(this.btnBind);
            this.bindButtonPanel.Dock = System.Windows.Forms.DockStyle.Fill;
            this.bindButtonPanel.Location = new System.Drawing.Point(607, 3);
            this.bindButtonPanel.Name = "bindButtonPanel";
            this.bindButtonPanel.Size = new System.Drawing.Size(50, 244);
            this.bindButtonPanel.TabIndex = 1;
            // 
            // btnBind
            // 
            this.btnBind.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.btnBind.Location = new System.Drawing.Point(7, 108);
            this.btnBind.Name = "btnBind";
            this.btnBind.Size = new System.Drawing.Size(36, 28);
            this.btnBind.TabIndex = 0;
            this.btnBind.Text = "<=>";
            this.btnBind.UseVisualStyleBackColor = true;
            this.btnBind.Click += new System.EventHandler(this.OnBindClick);
            // 
            // tagsPanel
            // 
            this.tagsPanel.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tagsPanel.Location = new System.Drawing.Point(663, 3);
            this.tagsPanel.Name = "tagsPanel";
            this.tagsPanel.Size = new System.Drawing.Size(598, 244);
            this.tagsPanel.TabIndex = 2;
            this.tagsPanel.TagChanged += new System.EventHandler(this.OnTagChanged);
            // 
            // bindHeaderLabel
            // 
            this.bindHeaderLabel.Dock = System.Windows.Forms.DockStyle.Top;
            this.bindHeaderLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold);
            this.bindHeaderLabel.Location = new System.Drawing.Point(8, 8);
            this.bindHeaderLabel.Name = "bindHeaderLabel";
            this.bindHeaderLabel.Size = new System.Drawing.Size(1264, 24);
            this.bindHeaderLabel.TabIndex = 0;
            this.bindHeaderLabel.Text = "Связь OPC тэгов с объектами схемы";
            // 
            // bindPanel
            // 
            this.bindPanel.Dock = System.Windows.Forms.DockStyle.Fill;
            this.bindPanel.Location = new System.Drawing.Point(0, 0);
            this.bindPanel.Name = "bindPanel";
            this.bindPanel.Size = new System.Drawing.Size(1280, 260);
            this.bindPanel.TabIndex = 0;
            // 
            // MainForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1280, 598);
            this.Controls.Add(this.rootSplitContainer);
            this.Controls.Add(this.connectionPanel);
            this.Name = "MainForm";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Конфигурация OPC";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.OnFormClosing);
            this.connectionPanel.ResumeLayout(false);
            this.connectionLayout.ResumeLayout(false);
            this.connectionLayout.PerformLayout();
            this.rootSplitContainer.Panel1.ResumeLayout(false);
            this.rootSplitContainer.Panel2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.rootSplitContainer)).EndInit();
            this.rootSplitContainer.ResumeLayout(false);
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
