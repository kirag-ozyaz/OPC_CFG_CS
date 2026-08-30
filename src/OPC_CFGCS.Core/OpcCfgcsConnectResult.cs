using System.Collections.Generic;

namespace OPC_CFGCS.Core
{
    /// <summary>Результат попытки подключения к базам OPC_Config и GES.</summary>
    public sealed class OpcCfgcsConnectResult
    {
        public bool Success { get; set; }

        /// <summary>Краткий статус для UI: «Подключено», «Ошибка OPC_Config» и т.д.</summary>
        public string StatusText { get; set; }

        /// <summary>Текст ошибки подключения или предупреждения о частичной загрузке данных.</summary>
        public string Message { get; set; }

        /// <summary>Ошибки загрузки секций после успешного подключения.</summary>
        public IList<string> LoadErrors { get; set; }
    }
}
