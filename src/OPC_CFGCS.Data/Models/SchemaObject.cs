namespace OPC_CFGCS.Data.Models
{
    public sealed class SchemaObject
    {
        public int Id { get; set; }
        public string ParentTypeName { get; set; }
        public string ParentName { get; set; }
        public string ParentObj { get; set; }
        public string Type { get; set; }
        public string Name { get; set; }
        public string SwitchName { get; set; }
        public string SwitchTypeName { get; set; }
    }
}
