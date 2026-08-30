using System;
using System.Drawing;
using System.IO;
using System.Windows.Forms;
using OPC_CFGCS.UI.Controls;

namespace OPC_CFGCS.UI.Forms
{
    /// <summary>Диалог полного редактирования OPC-тегов (меню «Данные → Заполнение тегов»).</summary>
    public sealed class TagsEditForm : Form
    {
        private readonly TagsPanel _tagsPanel = new TagsPanel();

        /// <summary>Форма с редактируемым <see cref="TagsPanel"/>.</summary>
        public TagsEditForm()
        {
            Text = "Заполнение тегов";
            StartPosition = FormStartPosition.CenterParent;
            Size = new Size(920, 640);
            MinimumSize = new Size(760, 520);

            _tagsPanel.Dock = DockStyle.Fill;
            Controls.Add(_tagsPanel);

            LoadFormIcon();
            Load += OnFormLoad;
        }

        /// <summary>Загружает теги при открытии формы.</summary>
        private void OnFormLoad(object sender, EventArgs e)
        {
            _tagsPanel.ReloadData();
        }

        private void LoadFormIcon()
        {
            try
            {
                var iconPath = Path.Combine(Application.StartupPath, "Assets", "Bind.ico");
                if (File.Exists(iconPath))
                {
                    Icon = new Icon(iconPath);
                }
            }
            catch
            {
                // Оставляем иконку по умолчанию, если файл недоступен.
            }
        }
    }
}
