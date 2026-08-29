namespace OPC_CFGCS.Data.Models
{
    public sealed class Tag
    {
        public int Id { get; set; }
        public int ServerId { get; set; }
        public string TagName { get; set; }
        public int? ObjectId { get; set; }
        public int? ParameterId { get; set; }
        public double? Multiplier { get; set; }
        public double? Offset { get; set; }
        public int? BitMask { get; set; }
        public double? DeadBand { get; set; }
        public string ItemName { get; set; }
        public string Source { get; set; }
        public string Area { get; set; }
        public bool? ZeroNormalState { get; set; }
        public byte? NormalState { get; set; }
        public string ServerName { get; set; }
        public string HostName { get; set; }
        public int? GroupId { get; set; }
    }
}
