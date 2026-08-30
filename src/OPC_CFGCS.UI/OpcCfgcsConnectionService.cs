using System.Collections.Generic;
using System.Windows.Forms;
using OPC_CFGCS.Core;
using OPC_CFGCS.Data;
using OPC_CFGCS.UI.Controls;

namespace OPC_CFGCS.UI
{
    /// <summary>Подключение к базам и загрузка данных в рабочую область.</summary>
    public static class OpcCfgcsConnectionService
    {
        /// <summary>
        /// Проверяет подключение к OPC_Config и GES, при успехе загружает данные в workspace.
        /// </summary>
        /// <param name="workspace">Рабочая область для активации и загрузки.</param>
        /// <param name="opcConnectionString">Строка OPC_Config.</param>
        /// <param name="gesConnectionString">Строка GES.</param>
        /// <param name="messageOwner">Окно для MessageBox (может быть null).</param>
        /// <param name="showDialogs">Показывать диалоги при ошибках.</param>
        /// <param name="saveRecent">Сохранить пару строк в историю подключений.</param>
        public static OpcCfgcsConnectResult Connect(
            OpcCfgcsWorkspace workspace,
            string opcConnectionString,
            string gesConnectionString,
            IWin32Window messageOwner,
            bool showDialogs,
            bool saveRecent)
        {
            var result = new OpcCfgcsConnectResult { LoadErrors = new List<string>() };

            opcConnectionString = opcConnectionString?.Trim() ?? string.Empty;
            gesConnectionString = gesConnectionString?.Trim() ?? string.Empty;

            DatabaseConnection.ConnectionString = opcConnectionString;
            DatabaseConnection.GesConnectionString = gesConnectionString;

            if (!DatabaseConnection.TestConnection(out var error))
            {
                workspace.SetConnected(false);
                result.Success = false;
                result.StatusText = "Ошибка OPC_Config";
                result.Message = "Не удалось подключиться к базе OPC_Config.\r\n\r\n" + error;
                if (showDialogs && messageOwner != null)
                {
                    MessageBox.Show(messageOwner, result.Message, "OPC_CFGCS", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }

                return result;
            }

            if (!DatabaseConnection.TestGesConnection(out var gesError))
            {
                workspace.SetConnected(false);
                result.Success = false;
                result.StatusText = "Ошибка GES";
                result.Message = "Не удалось подключиться к базе GES.\r\n\r\n" + gesError;
                if (showDialogs && messageOwner != null)
                {
                    MessageBox.Show(messageOwner, result.Message, "OPC_CFGCS", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }

                return result;
            }

            workspace.SetConnected(true);
            if (saveRecent)
            {
                RecentConnectionsStore.SaveRecent(opcConnectionString, gesConnectionString);
            }

            var loadErrors = workspace.ReloadAllData();
            foreach (var loadError in loadErrors)
            {
                result.LoadErrors.Add(loadError);
            }

            result.Success = true;
            result.StatusText = "Подключено";

            if (loadErrors.Count > 0)
            {
                result.Message = "Подключение установлено, но часть данных не загружена:\r\n\r\n" +
                    string.Join("\r\n", loadErrors);
                if (showDialogs && messageOwner != null)
                {
                    MessageBox.Show(messageOwner, result.Message, "OPC_CFGCS", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
            }

            return result;
        }
    }
}
