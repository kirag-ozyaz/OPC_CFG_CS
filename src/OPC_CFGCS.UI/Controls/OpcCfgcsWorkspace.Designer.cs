using System.Drawing;
using System.Windows.Forms;
using OPC_CFGCS.UI.Controls;

namespace OPC_CFGCS.UI.Controls
{
    partial class OpcCfgcsWorkspace
    {
        private System.ComponentModel.IContainer components = null;
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
            this.gridsLayout.SuspendLayout();
            this.schemaPanel.SuspendLayout();
            this.schemaTabs.SuspendLayout();
            this.bindButtonPanel.SuspendLayout();
            this.SuspendLayout();
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
            this.lblPsPlaceholder.Name = "lblPsPlaceholder";
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
            this.lblBusPlaceholder.Name = "lblBusPlaceholder";
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
            this.lblSwitchPlaceholder.Name = "lblSwitchPlaceholder";
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
            this.lblTagsPlaceholder.Name = "lblTagsPlaceholder";
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
            // OpcCfgcsWorkspace
            // 
            this.Controls.Add(this.gridsLayout);
            this.Controls.Add(this.bindHeaderLabel);
            this.Name = "OpcCfgcsWorkspace";
            this.Padding = new System.Windows.Forms.Padding(8);
            this.Size = new System.Drawing.Size(1064, 634);
            this.gridsLayout.ResumeLayout(false);
            this.schemaPanel.ResumeLayout(false);
            this.schemaTabs.ResumeLayout(false);
            this.bindButtonPanel.ResumeLayout(false);
            this.ResumeLayout(false);
        }
    }
}
