using OPC_CFGCS.Core;

namespace OPC_CFGCS.Integration
{
    /// <summary>Фабрика сессий конфигуратора OPC для сторонних приложений.</summary>
    public static class OpcCfgcsHost
    {
        /// <summary>Создаёт новую сессию конфигуратора.</summary>
        public static OpcCfgcsSession CreateSession(OpcCfgcsSessionOptions options = null)
        {
            return new OpcCfgcsSession(options);
        }
    }
}
