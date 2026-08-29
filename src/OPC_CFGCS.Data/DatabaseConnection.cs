using System.Configuration;
using System.Data.SqlClient;

namespace OPC_CFGCS.Data
{
    public static class DatabaseConnection
    {
        public static string ConnectionString =>
            ConfigurationManager.ConnectionStrings["OpcConfig"].ConnectionString;

        public static SqlConnection CreateConnection()
        {
            return new SqlConnection(ConnectionString);
        }
    }
}
