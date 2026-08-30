using System;
using System.Collections.Generic;
using System.IO;
using System.Xml;

namespace OPC_CFGCS.UI
{
    /// <summary>Пара строк подключения OPC_Config и GES из истории.</summary>
    public sealed class RecentConnectionEntry
    {
        public string OpcConfig { get; set; }
        public string Ges { get; set; }
    }

    /// <summary>
    /// Сохранение и загрузка истории подключений к базам OPC_Config и GES (XML в %AppData%\OPC_CFGCS).
    /// </summary>
    public static class RecentConnectionsStore
    {
        private const int MaxEntries = 12;
        private const string AppFolderName = "OPC_CFGCS";
        private const string FileName = "recent-connections.xml";

        public static string SettingsFilePath
        {
            get
            {
                return Path.Combine(
                    Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData),
                    AppFolderName,
                    FileName);
            }
        }

        /// <summary>Читает историю из XML; при ошибке — пустой список.</summary>
        public static IList<RecentConnectionEntry> Load()
        {
            var path = SettingsFilePath;
            if (!File.Exists(path))
            {
                return new List<RecentConnectionEntry>();
            }

            try
            {
                var result = new List<RecentConnectionEntry>();
                var document = new XmlDocument();
                document.Load(path);

                var nodes = document.SelectNodes("/RecentConnections/Connection");
                if (nodes == null)
                {
                    return result;
                }

                foreach (XmlNode node in nodes)
                {
                    var opcConfig = node.Attributes?["OpcConfig"]?.Value;
                    var ges = node.Attributes?["Ges"]?.Value;
                    if (string.IsNullOrWhiteSpace(opcConfig) && string.IsNullOrWhiteSpace(ges))
                    {
                        continue;
                    }

                    result.Add(new RecentConnectionEntry
                    {
                        OpcConfig = opcConfig ?? string.Empty,
                        Ges = ges ?? string.Empty
                    });
                }

                return result;
            }
            catch
            {
                return new List<RecentConnectionEntry>();
            }
        }

        /// <summary>Добавляет пару строк в начало истории (до 12 записей).</summary>
        public static void SaveRecent(string opcConfig, string ges)
        {
            opcConfig = opcConfig?.Trim() ?? string.Empty;
            ges = ges?.Trim() ?? string.Empty;

            if (opcConfig.Length == 0 && ges.Length == 0)
            {
                return;
            }

            var entries = new List<RecentConnectionEntry>(Load());
            entries.RemoveAll(entry =>
                string.Equals(entry.OpcConfig, opcConfig, StringComparison.OrdinalIgnoreCase) &&
                string.Equals(entry.Ges, ges, StringComparison.OrdinalIgnoreCase));

            entries.Insert(0, new RecentConnectionEntry
            {
                OpcConfig = opcConfig,
                Ges = ges
            });

            if (entries.Count > MaxEntries)
            {
                entries.RemoveRange(MaxEntries, entries.Count - MaxEntries);
            }

            Write(entries);
        }

        private static void Write(IList<RecentConnectionEntry> entries)
        {
            var path = SettingsFilePath;
            var directory = Path.GetDirectoryName(path);
            if (!string.IsNullOrEmpty(directory))
            {
                Directory.CreateDirectory(directory);
            }

            var document = new XmlDocument();
            var declaration = document.CreateXmlDeclaration("1.0", "utf-8", null);
            document.AppendChild(declaration);

            var root = document.CreateElement("RecentConnections");
            document.AppendChild(root);

            foreach (var entry in entries)
            {
                var node = document.CreateElement("Connection");
                node.SetAttribute("OpcConfig", entry.OpcConfig ?? string.Empty);
                node.SetAttribute("Ges", entry.Ges ?? string.Empty);
                root.AppendChild(node);
            }

            document.Save(path);
        }
    }
}
