using OPC_CFGCS.Data;
using OPC_CFGCS.UI;

namespace OPC_CFGCS.UI
{
    /// <summary>Определяет строки подключения с fallback на историю и App.config.</summary>
    public static class OpcCfgcsConnectionResolver
    {
        /// <summary>Явная строка → история → App.config (OpcConfig).</summary>
        public static string ResolveOpcConnectionString(string explicitValue)
        {
            if (!string.IsNullOrWhiteSpace(explicitValue))
            {
                return explicitValue.Trim();
            }

            var recent = RecentConnectionsStore.Load();
            if (recent.Count > 0 && !string.IsNullOrWhiteSpace(recent[0].OpcConfig))
            {
                return recent[0].OpcConfig;
            }

            return DatabaseConnection.ConnectionString;
        }

        /// <summary>Явная строка → история → App.config (Ges).</summary>
        public static string ResolveGesConnectionString(string explicitValue)
        {
            if (!string.IsNullOrWhiteSpace(explicitValue))
            {
                return explicitValue.Trim();
            }

            var recent = RecentConnectionsStore.Load();
            if (recent.Count > 0 && !string.IsNullOrWhiteSpace(recent[0].Ges))
            {
                return recent[0].Ges;
            }

            return DatabaseConnection.GesConnectionString;
        }
    }
}
