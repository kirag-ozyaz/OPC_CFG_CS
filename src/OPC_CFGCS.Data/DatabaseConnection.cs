using System;
using System.Configuration;
using System.Data.SqlClient;

namespace OPC_CFGCS.Data
{
    public static class DatabaseConnection
    {
        private static string _connectionString;

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

        public static SqlConnection CreateConnection()
        {
            return new SqlConnection(ConnectionString);
        }

        public static bool TestConnection(out string errorMessage)
        {
            return TestConnection(ConnectionString, out errorMessage);
        }

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
