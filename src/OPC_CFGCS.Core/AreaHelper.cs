using System;

namespace OPC_CFGCS.Core
{
    public static class AreaHelper
    {
        public static string GetParentObj(string area)
        {
            if (string.IsNullOrWhiteSpace(area))
            {
                return string.Empty;
            }

            var ps = area.Length >= 2 ? area.Substring(0, 2) : area;
            var slashIndex = area.IndexOf('\\');
            string psNum;

            if (slashIndex < 0)
            {
                psNum = area.Length > 2 ? area.Substring(2).Trim() : string.Empty;
            }
            else if (slashIndex > 2)
            {
                psNum = area.Substring(2, slashIndex - 2).Trim();
            }
            else
            {
                psNum = string.Empty;
            }

            return ps + psNum;
        }
    }
}
