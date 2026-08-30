using System.Drawing;
using System.Windows.Forms;

namespace OPC_CFGCS.UI.Forms
{
    /// <summary>Разметка главной формы: панель подключения и контейнер рабочей области.</summary>
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
        private Panel workspaceHost;

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
            this.workspaceHost = new System.Windows.Forms.Panel();
            this.connectionPanel.SuspendLayout();
            this.connectionLayout.SuspendLayout();
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
            // workspaceHost
            // 
            this.workspaceHost.Dock = System.Windows.Forms.DockStyle.Fill;
            this.workspaceHost.Location = new System.Drawing.Point(0, 72);
            this.workspaceHost.Name = "workspaceHost";
            this.workspaceHost.Size = new System.Drawing.Size(1064, 634);
            this.workspaceHost.TabIndex = 0;
            // 
            // MainForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1064, 706);
            this.Controls.Add(this.workspaceHost);
            this.Controls.Add(this.connectionPanel);
            this.Name = "MainForm";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Конфигурация OPC";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.OnFormClosing);
            this.connectionPanel.ResumeLayout(false);
            this.connectionLayout.ResumeLayout(false);
            this.connectionLayout.PerformLayout();
            this.ResumeLayout(false);

        }
    }
}
