using System.Drawing;
using System.Windows.Forms;
using OPC_CFGCS.Core;
using OPC_CFGCS.UI.Controls;

namespace OPC_CFGCS.UI.Forms
{
    public sealed partial class MainForm
    {
        private System.ComponentModel.IContainer components = null;
        private SplitContainer rootSplitContainer;
        private SplitContainer topSplitContainer;
        private Panel schemaPanel;
        private Label bindHeaderLabel;
        private Panel bindToolbarPanel;
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
            this.components = new System.ComponentModel.Container();
            this.rootSplitContainer = new SplitContainer();
            this.topSplitContainer = new SplitContainer();
            this.schemaPanel = new Panel();
            this.schemaTabs = new TabControl();
            this.tabPs = new TabPage();
            this.tabBus = new TabPage();
            this.tabSwitch = new TabPage();
            this.psPanel = new SchemaObjectPanel(SchemaObjectType.PowerStation);
            this.busPanel = new SchemaObjectPanel(SchemaObjectType.CellBus);
            this.switchPanel = new SchemaObjectPanel(SchemaObjectType.CellSwitch);
            this.bindToolbarPanel = new Panel();
            this.btnBind = new Button();
            this.bindHeaderLabel = new Label();
            this.tagsPanel = new TagsPanel();
            this.bindPanel = new BindPanel();
            ((System.ComponentModel.ISupportInitialize)(this.rootSplitContainer)).BeginInit();
            this.rootSplitContainer.Panel1.SuspendLayout();
            this.rootSplitContainer.Panel2.SuspendLayout();
            this.rootSplitContainer.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.topSplitContainer)).BeginInit();
            this.topSplitContainer.Panel1.SuspendLayout();
            this.topSplitContainer.Panel2.SuspendLayout();
            this.topSplitContainer.SuspendLayout();
            this.schemaPanel.SuspendLayout();
            this.schemaTabs.SuspendLayout();
            this.tabPs.SuspendLayout();
            this.tabBus.SuspendLayout();
            this.tabSwitch.SuspendLayout();
            this.bindToolbarPanel.SuspendLayout();
            this.SuspendLayout();
            //
            // rootSplitContainer
            //
            this.rootSplitContainer.Dock = DockStyle.Fill;
            this.rootSplitContainer.Location = new Point(0, 0);
            this.rootSplitContainer.Name = "rootSplitContainer";
            this.rootSplitContainer.Orientation = Orientation.Horizontal;
            this.rootSplitContainer.Size = new Size(1280, 800);
            this.rootSplitContainer.SplitterDistance = 420;
            this.rootSplitContainer.TabIndex = 0;
            //
            // topSplitContainer
            //
            this.topSplitContainer.Dock = DockStyle.Fill;
            this.topSplitContainer.Location = new Point(0, 0);
            this.topSplitContainer.Name = "topSplitContainer";
            this.topSplitContainer.Size = new Size(1280, 420);
            this.topSplitContainer.SplitterDistance = 760;
            this.topSplitContainer.TabIndex = 0;
            //
            // schemaPanel
            //
            this.schemaPanel.Controls.Add(this.schemaTabs);
            this.schemaPanel.Controls.Add(this.bindToolbarPanel);
            this.schemaPanel.Controls.Add(this.bindHeaderLabel);
            this.schemaPanel.Dock = DockStyle.Fill;
            this.schemaPanel.Location = new Point(0, 0);
            this.schemaPanel.Name = "schemaPanel";
            this.schemaPanel.Padding = new Padding(8);
            this.schemaPanel.Size = new Size(760, 420);
            this.schemaPanel.TabIndex = 0;
            //
            // schemaTabs
            //
            this.schemaTabs.Controls.Add(this.tabPs);
            this.schemaTabs.Controls.Add(this.tabBus);
            this.schemaTabs.Controls.Add(this.tabSwitch);
            this.schemaTabs.Dock = DockStyle.Fill;
            this.schemaTabs.Location = new Point(8, 68);
            this.schemaTabs.Name = "schemaTabs";
            this.schemaTabs.SelectedIndex = 0;
            this.schemaTabs.Size = new Size(744, 344);
            this.schemaTabs.TabIndex = 2;
            this.schemaTabs.SelectedIndexChanged += new System.EventHandler(this.OnSchemaTabChanged);
            //
            // tabPs
            //
            this.tabPs.Controls.Add(this.psPanel);
            this.tabPs.Location = new Point(4, 22);
            this.tabPs.Name = "tabPs";
            this.tabPs.Padding = new Padding(3);
            this.tabPs.Size = new Size(736, 318);
            this.tabPs.TabIndex = 0;
            this.tabPs.Text = "ПС";
            this.tabPs.UseVisualStyleBackColor = true;
            //
            // tabBus
            //
            this.tabBus.Controls.Add(this.busPanel);
            this.tabBus.Location = new Point(4, 22);
            this.tabBus.Name = "tabBus";
            this.tabBus.Padding = new Padding(3);
            this.tabBus.Size = new Size(736, 318);
            this.tabBus.TabIndex = 1;
            this.tabBus.Text = "Шина";
            this.tabBus.UseVisualStyleBackColor = true;
            //
            // tabSwitch
            //
            this.tabSwitch.Controls.Add(this.switchPanel);
            this.tabSwitch.Location = new Point(4, 22);
            this.tabSwitch.Name = "tabSwitch";
            this.tabSwitch.Padding = new Padding(3);
            this.tabSwitch.Size = new Size(736, 318);
            this.tabSwitch.TabIndex = 2;
            this.tabSwitch.Text = "Выключатель";
            this.tabSwitch.UseVisualStyleBackColor = true;
            //
            // psPanel
            //
            this.psPanel.Dock = DockStyle.Fill;
            this.psPanel.Location = new Point(3, 3);
            this.psPanel.Name = "psPanel";
            this.psPanel.Size = new Size(730, 312);
            this.psPanel.TabIndex = 0;
            this.psPanel.CurrentObjectChanged += new System.EventHandler(this.OnSchemaObjectChanged);
            //
            // busPanel
            //
            this.busPanel.Dock = DockStyle.Fill;
            this.busPanel.Location = new Point(3, 3);
            this.busPanel.Name = "busPanel";
            this.busPanel.Size = new Size(730, 312);
            this.busPanel.TabIndex = 0;
            this.busPanel.CurrentObjectChanged += new System.EventHandler(this.OnSchemaObjectChanged);
            //
            // switchPanel
            //
            this.switchPanel.Dock = DockStyle.Fill;
            this.switchPanel.Location = new Point(3, 3);
            this.switchPanel.Name = "switchPanel";
            this.switchPanel.Size = new Size(730, 312);
            this.switchPanel.TabIndex = 0;
            this.switchPanel.CurrentObjectChanged += new System.EventHandler(this.OnSchemaObjectChanged);
            //
            // bindToolbarPanel
            //
            this.bindToolbarPanel.Controls.Add(this.btnBind);
            this.bindToolbarPanel.Dock = DockStyle.Top;
            this.bindToolbarPanel.Location = new Point(8, 32);
            this.bindToolbarPanel.Name = "bindToolbarPanel";
            this.bindToolbarPanel.Size = new Size(744, 36);
            this.bindToolbarPanel.TabIndex = 1;
            //
            // btnBind
            //
            this.btnBind.Location = new Point(8, 4);
            this.btnBind.Name = "btnBind";
            this.btnBind.Size = new Size(60, 28);
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
            this.bindHeaderLabel.Size = new Size(744, 24);
            this.bindHeaderLabel.TabIndex = 0;
            this.bindHeaderLabel.Text = "Связь OPC тэгов с объектами схемы";
            //
            // tagsPanel
            //
            this.tagsPanel.Dock = DockStyle.Fill;
            this.tagsPanel.Location = new Point(0, 0);
            this.tagsPanel.Name = "tagsPanel";
            this.tagsPanel.Size = new Size(516, 420);
            this.tagsPanel.TabIndex = 0;
            this.tagsPanel.TagChanged += new System.EventHandler(this.OnTagChanged);
            //
            // bindPanel
            //
            this.bindPanel.Dock = DockStyle.Fill;
            this.bindPanel.Location = new Point(0, 0);
            this.bindPanel.Name = "bindPanel";
            this.bindPanel.Size = new Size(1280, 376);
            this.bindPanel.TabIndex = 0;
            //
            // topSplitContainer.Panel1
            //
            this.topSplitContainer.Panel1.Controls.Add(this.schemaPanel);
            //
            // topSplitContainer.Panel2
            //
            this.topSplitContainer.Panel2.Controls.Add(this.tagsPanel);
            //
            // rootSplitContainer.Panel1
            //
            this.rootSplitContainer.Panel1.Controls.Add(this.topSplitContainer);
            //
            // rootSplitContainer.Panel2
            //
            this.rootSplitContainer.Panel2.Controls.Add(this.bindPanel);
            //
            // MainForm
            //
            this.AutoScaleDimensions = new SizeF(6F, 13F);
            this.AutoScaleMode = AutoScaleMode.Font;
            this.ClientSize = new Size(1280, 800);
            this.Controls.Add(this.rootSplitContainer);
            this.Name = "MainForm";
            this.StartPosition = FormStartPosition.CenterScreen;
            this.Text = "Конфигурация OPC";
            this.FormClosing += new FormClosingEventHandler(this.OnFormClosing);
            this.rootSplitContainer.Panel1.ResumeLayout(false);
            this.rootSplitContainer.Panel2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.rootSplitContainer)).EndInit();
            this.rootSplitContainer.ResumeLayout(false);
            this.topSplitContainer.Panel1.ResumeLayout(false);
            this.topSplitContainer.Panel2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.topSplitContainer)).EndInit();
            this.topSplitContainer.ResumeLayout(false);
            this.schemaPanel.ResumeLayout(false);
            this.schemaTabs.ResumeLayout(false);
            this.tabPs.ResumeLayout(false);
            this.tabBus.ResumeLayout(false);
            this.tabSwitch.ResumeLayout(false);
            this.bindToolbarPanel.ResumeLayout(false);
            this.ResumeLayout(false);
        }
    }
}
