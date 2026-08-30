using System;
using System.Configuration;
using System.Data.SqlClient;

namespace OPC_CFGCS.Data
{
    /// <summary>Глобальные строки подключения к OPC_Config и GES (static, на процесс).</summary>
    public static class DatabaseConnection
    {
        private static string _connectionString;
        private static string _gesConnectionString;

        public static string ConnectionString
        {
            get
            {
                if (!string.IsNullOrWhiteSpace(_connectionString))
                {
                    return _connectionString;
                }

                var configValue = ConfigurationManager.ConnectionStrings["OpcConfig"];
                return configValue == null ? string.Empty : configValue.ConnectionString;
            }
            set
            {
                _connectionString = value;
            }
        }

        public static string GesConnectionString
        {
            get
            {
                if (!string.IsNullOrWhiteSpace(_gesConnectionString))
                {
                    return _gesConnectionString;
                }

                var configValue = ConfigurationManager.ConnectionStrings["Ges"];
                return configValue == null ? string.Empty : configValue.ConnectionString;
            }
            set
            {
                _gesConnectionString = value;
            }
        }

        /// <summary>Открывает соединение с OPC_Config.</summary>
        public static SqlConnection CreateConnection()
        {
            return new SqlConnection(ConnectionString);
        }

        /// <summary>Открывает соединение с GES.</summary>
        public static SqlConnection CreateGesConnection()
        {
            return new SqlConnection(GesConnectionString);
        }

        /// <summary>Проверяет подключение к OPC_Config.</summary>
        public static bool TestConnection(out string errorMessage)
        {
            return TestConnection(ConnectionString, out errorMessage);
        }

        /// <summary>Проверяет подключение к GES.</summary>
        public static bool TestGesConnection(out string errorMessage)
        {
            return TestConnection(GesConnectionString, out errorMessage);
        }

        /// <summary>Проверяет указанную строку подключения.</summary>
        public static bool TestConnection(string connectionString, out string errorMessage)
        {
            if (string.IsNullOrWhiteSpace(connectionString))
            {
                errorMessage = "Строка подключения не задана.";
                return false;
            }

            try
            {
                using (var connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                }

                errorMessage = null;
                return true;
            }
            catch (Exception ex)
            {
                errorMessage = ex.Message;
                return false;
            }
        }
    }
}
