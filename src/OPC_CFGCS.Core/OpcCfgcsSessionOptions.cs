namespace OPC_CFGCS.Core
{
    /// <summary>Параметры сессии конфигуратора для standalone и встроенного режима.</summary>
    public sealed class OpcCfgcsSessionOptions
    {
        /// <summary>Строка OPC_Config; null или пусто — из истории или App.config.</summary>
        public string OpcConnectionString { get; set; }

        /// <summary>Строка GES; null или пусто — из истории или App.config.</summary>
        public string GesConnectionString { get; set; }

        /// <summary>Подключиться автоматически при создании рабочей области.</summary>
        public bool AutoConnect { get; set; } = true;
    }
}
