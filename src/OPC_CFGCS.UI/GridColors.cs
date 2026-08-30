using System.Drawing;

namespace OPC_CFGCS.UI
{
    /// <summary>Цвета подсветки строк в гридах при связи тега с объектом схемы.</summary>
    internal static class GridColors
    {
        /// <summary>Фон строки объекта/тега с существующей связью.</summary>
        internal static readonly Color BoundRowBackColor = Color.FromArgb(220, 255, 220);
        /// <summary>Фон выделенной строки с существующей связью.</summary>
        internal static readonly Color BoundRowSelectedBackColor = Color.FromArgb(180, 230, 180);
    }
}
