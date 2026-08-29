using System;
using System.Threading;
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
            Application.ThreadException += OnThreadException;
            AppDomain.CurrentDomain.UnhandledException += OnUnhandledException;
            Application.Run(new MainForm());
        }

        private static void OnThreadException(object sender, ThreadExceptionEventArgs e)
        {
            ShowFatalError(e.Exception);
        }

        private static void OnUnhandledException(object sender, UnhandledExceptionEventArgs e)
        {
            ShowFatalError(e.ExceptionObject as Exception);
        }

        private static void ShowFatalError(Exception exception)
        {
            var message = exception == null
                ? "Неизвестная ошибка приложения."
                : exception.Message;

            MessageBox.Show(
                message,
                "OPC_CFGCS",
                MessageBoxButtons.OK,
                MessageBoxIcon.Error);
        }
    }
}
