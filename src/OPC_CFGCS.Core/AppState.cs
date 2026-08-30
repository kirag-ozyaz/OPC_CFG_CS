namespace OPC_CFGCS.Core
{
    /// <summary>Глобальное состояние UI: текущая подстанция (Area родителя объекта схемы).</summary>
    public static class AppState
    {
        /// <summary>Код подстанции для фильтрации тегов (аналог gCurrArea в ADP).</summary>
        public static string CurrentArea { get; set; }
    }
}
