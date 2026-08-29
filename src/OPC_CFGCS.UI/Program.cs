using System;
using System.Windows.Forms;
using OPC_CFGCS.UI.Forms;

namespace OPC_CFGCS.UI
{
    internal static class Program
    {
        [STAThread]
        private static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new MainForm());
        }
    }
}
