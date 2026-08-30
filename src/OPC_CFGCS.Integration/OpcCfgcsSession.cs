using System.Windows.Forms;
using OPC_CFGCS.Core;
using OPC_CFGCS.UI;
using OPC_CFGCS.UI.Controls;
using OPC_CFGCS.UI.Forms;

namespace OPC_CFGCS.Integration
{
    /// <summary>
    /// Сессия конфигуратора: подключение к БД, рабочая область и диалоги тегов/справочников.
    /// </summary>
    public sealed class OpcCfgcsSession
    {
        private readonly OpcCfgcsSessionOptions _options;
        private OpcCfgcsWorkspace _workspace;

        /// <summary>Создаёт сессию с параметрами подключения (или значения по умолчанию).</summary>
        public OpcCfgcsSession(OpcCfgcsSessionOptions options = null)
        {
            _options = options ?? new OpcCfgcsSessionOptions();
        }

        /// <summary>Успешное подключение к OPC_Config и GES в этой сессии.</summary>
        public bool IsConnected { get; private set; }

        /// <summary>Создаёт (один раз) рабочую область конфигуратора для встраивания в панель хоста.</summary>
        public OpcCfgcsWorkspace CreateWorkspace()
        {
            if (_workspace == null)
            {
                _workspace = new OpcCfgcsWorkspace { Dock = DockStyle.Fill };

                if (_options.AutoConnect)
                {
                    var opc = OpcCfgcsConnectionResolver.ResolveOpcConnectionString(_options.OpcConnectionString);
                    var ges = OpcCfgcsConnectionResolver.ResolveGesConnectionString(_options.GesConnectionString);
                    var result = Connect(opc, ges, null, showDialogs: false);
                    IsConnected = result.Success;
                }
            }

            return _workspace;
        }

        /// <summary>Подключается к базам и загружает данные в рабочую область.</summary>
        public OpcCfgcsConnectResult Connect(
            string opcConnectionString,
            string gesConnectionString,
            IWin32Window messageOwner,
            bool showDialogs = true)
        {
            var workspace = CreateWorkspace();
            var result = OpcCfgcsConnectionService.Connect(
                workspace,
                opcConnectionString,
                gesConnectionString,
                messageOwner,
                showDialogs,
                saveRecent: true);

            IsConnected = result.Success;
            return result;
        }

        /// <summary>Проверяет подключение; при необходимости показывает сообщение.</summary>
        public bool EnsureConnected(IWin32Window owner)
        {
            if (IsConnected)
            {
                return true;
            }

            if (owner != null)
            {
                MessageBox.Show(
                    owner,
                    "Сначала подключитесь к базе данных.",
                    "OPC_CFGCS",
                    MessageBoxButtons.OK,
                    MessageBoxIcon.Information);
            }

            return false;
        }

        /// <summary>Диалог «Заполнение тегов».</summary>
        public void ShowTagsEditor(IWin32Window owner)
        {
            if (!EnsureConnected(owner))
            {
                return;
            }

            using (var form = new TagsEditForm())
            {
                form.ShowDialog(owner);
            }

            CreateWorkspace().ReloadTagsAndHighlights();
        }

        /// <summary>Диалог «Справочники».</summary>
        public void ShowReferenceData(IWin32Window owner)
        {
            if (!EnsureConnected(owner))
            {
                return;
            }

            using (var form = new ReferenceDataForm())
            {
                form.ShowDialog(owner);
            }

            CreateWorkspace().ReloadTagsAndHighlights();
        }
    }
}
