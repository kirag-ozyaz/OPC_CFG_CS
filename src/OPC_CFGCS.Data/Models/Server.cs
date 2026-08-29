namespace OPC_CFGCS.Data.Models
{
    public sealed class Server
    {
        public int Id { get; set; }
        public int AliasId { get; set; }
        public string AliasName { get; set; }
        public string HostName { get; set; }
        public string ServerName { get; set; }
        public byte ServerType { get; set; }
    }
}
