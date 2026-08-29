using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using OPC_CFGCS.Data.Models;

namespace OPC_CFGCS.Data
{
    public sealed class SqlRepository
    {
        public IList<Tag> GetTags()
        {
            const string sql = @"
SELECT t.Id, t.ServerId, t.Tag, t.ObjectId, t.ParameterId, t.Multiplier, t.Offset,
       t.BitMask, t.DeadBand, t.ItemName, t.Source, t.Area, t.ZeroNormalState, t.NormalState,
       s.ServerName, s.HostName
FROM dbo.Tags t
LEFT JOIN dbo.Servers s ON s.Id = t.ServerId
ORDER BY t.Area, t.Source, t.ServerId";

            return QueryTags(sql);
        }

        public IList<Tag2Group> GetTag2Groups()
        {
            const string sql = "SELECT Id, GroupId, TagId FROM dbo.Tag2Group ORDER BY TagId";
            var result = new List<Tag2Group>();

            using (var connection = DatabaseConnection.CreateConnection())
            using (var command = new SqlCommand(sql, connection))
            {
                connection.Open();
                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        result.Add(new Tag2Group
                        {
                            Id = reader.GetInt32(0),
                            GroupId = reader.GetInt32(1),
                            TagId = reader.GetInt32(2)
                        });
                    }
                }
            }

            return result;
        }

        public IList<OpcGroup> GetOpcGroups(int? serverId = null)
        {
            var sql = serverId.HasValue
                ? "SELECT Id, ServerId, Name FROM dbo.OpcGroups WHERE Deleted = 0 AND ServerId = @serverId ORDER BY Name"
                : "SELECT Id, ServerId, Name FROM dbo.OpcGroups WHERE Deleted = 0 ORDER BY Name";

            var result = new List<OpcGroup>();

            using (var connection = DatabaseConnection.CreateConnection())
            using (var command = new SqlCommand(sql, connection))
            {
                if (serverId.HasValue)
                {
                    command.Parameters.Add("@serverId", SqlDbType.Int).Value = serverId.Value;
                }

                connection.Open();
                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        result.Add(new OpcGroup
                        {
                            Id = reader.GetInt32(0),
                            ServerId = reader.GetInt32(1),
                            Name = reader.IsDBNull(2) ? null : reader.GetString(2)
                        });
                    }
                }
            }

            return result;
        }

        public IList<Server> GetServers()
        {
            const string sql = "SELECT Id, HostName, ServerName FROM dbo.Servers ORDER BY ServerName";
            var result = new List<Server>();

            using (var connection = DatabaseConnection.CreateConnection())
            using (var command = new SqlCommand(sql, connection))
            {
                connection.Open();
                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        result.Add(new Server
                        {
                            Id = reader.GetInt32(0),
                            HostName = reader.IsDBNull(1) ? null : reader.GetString(1),
                            ServerName = reader.IsDBNull(2) ? null : reader.GetString(2)
                        });
                    }
                }
            }

            return result;
        }

        public IList<Parameter> GetParameters()
        {
            const string sql = @"
SELECT Id, Description, ObjectDescription
FROM dbo.Parameters
ORDER BY Description, ObjectDescription";

            var result = new List<Parameter>();

            using (var connection = DatabaseConnection.CreateConnection())
            using (var command = new SqlCommand(sql, connection))
            {
                connection.Open();
                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        result.Add(new Parameter
                        {
                            Id = reader.GetInt32(0),
                            Description = reader.IsDBNull(1) ? null : reader.GetString(1),
                            ObjectDescription = reader.IsDBNull(2) ? null : reader.GetString(2)
                        });
                    }
                }
            }

            return result;
        }

        public IList<SchemaObject> GetPowerStations()
        {
            const string sql = @"
SELECT Id, ParentTypeName, ParentName,
       ParentTypeName + ParentName AS ParentObj, NULL AS Type, ParentName AS Name,
       NULL AS SwitchName, NULL AS SwitchTypeName
FROM (
    SELECT viewOpc_Ps.*, ParentTypeName + ParentName AS ParentObj
    FROM dbo.viewOpc_Ps
) ps
ORDER BY ParentTypeName, ParentName";

            return QuerySchemaObjects(sql);
        }

        public IList<SchemaObject> GetCellBuses()
        {
            const string sql = @"
SELECT Id, ParentTypeName, ParentName, ParentObj, Type, Name, NULL AS SwitchName, NULL AS SwitchTypeName
FROM (
    SELECT viewOpc_Ps_Cell_Bus.*, ParentTypeName + ParentName AS ParentObj
    FROM dbo.viewOpc_Ps_Cell_Bus
) bus
ORDER BY ParentTypeName, ParentName, Type, Name";

            return QuerySchemaObjects(sql);
        }

        public IList<SchemaObject> GetCellSwitches()
        {
            const string sql = @"
SELECT Id, ParentTypeName, ParentName, ParentObj, Type, Name, SwitchName, SwitchTypeName
FROM (
    SELECT ParentTypeName, ParentName, Type, Name, id AS Id, SwitchName, SwitchTypeName,
           ParentTypeName + ParentName AS ParentObj
    FROM dbo.viewOpc_Ps_Cell_Switch
) sw
ORDER BY ParentTypeName, ParentName, Type, Name";

            return QuerySchemaObjects(sql);
        }

        public IList<TagBinding> GetBindingsByObjectId(int objectId)
        {
            const string sql = "SELECT Area, Source FROM dbo.Tags WHERE ObjectId = @objectId ORDER BY Area, Source";
            var result = new List<TagBinding>();

            using (var connection = DatabaseConnection.CreateConnection())
            using (var command = new SqlCommand(sql, connection))
            {
                command.Parameters.Add("@objectId", SqlDbType.Int).Value = objectId;
                connection.Open();
                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        result.Add(new TagBinding
                        {
                            Area = reader.IsDBNull(0) ? null : reader.GetString(0),
                            Source = reader.IsDBNull(1) ? null : reader.GetString(1)
                        });
                    }
                }
            }

            return result;
        }

        public HashSet<int> GetBoundObjectIds()
        {
            const string sql = "SELECT DISTINCT ObjectId FROM dbo.Tags WHERE ObjectId IS NOT NULL";
            var result = new HashSet<int>();

            using (var connection = DatabaseConnection.CreateConnection())
            using (var command = new SqlCommand(sql, connection))
            {
                connection.Open();
                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        if (!reader.IsDBNull(0))
                        {
                            result.Add(reader.GetInt32(0));
                        }
                    }
                }
            }

            return result;
        }

        public void InsertTag2Group(int groupId, int tagId)
        {
            const string sql = "INSERT INTO dbo.Tag2Group (GroupId, TagId) VALUES (@groupId, @tagId)";

            using (var connection = DatabaseConnection.CreateConnection())
            using (var command = new SqlCommand(sql, connection))
            {
                command.Parameters.Add("@groupId", SqlDbType.Int).Value = groupId;
                command.Parameters.Add("@tagId", SqlDbType.Int).Value = tagId;
                connection.Open();
                command.ExecuteNonQuery();
            }
        }

        public void UpdateTag2Group(int groupId, int tagId)
        {
            const string sql = "UPDATE dbo.Tag2Group SET GroupId = @groupId WHERE TagId = @tagId";

            using (var connection = DatabaseConnection.CreateConnection())
            using (var command = new SqlCommand(sql, connection))
            {
                command.Parameters.Add("@groupId", SqlDbType.Int).Value = groupId;
                command.Parameters.Add("@tagId", SqlDbType.Int).Value = tagId;
                connection.Open();
                command.ExecuteNonQuery();
            }
        }

        public void UpdateTag(Tag tag)
        {
            const string sql = @"
UPDATE dbo.Tags
SET ServerId = @serverId,
    Tag = @tag,
    ObjectId = @objectId,
    ParameterId = @parameterId,
    Multiplier = @multiplier,
    Offset = @offset,
    BitMask = @bitMask,
    DeadBand = @deadBand,
    ItemName = @itemName,
    Source = @source,
    Area = @area,
    ZeroNormalState = @zeroNormalState,
    NormalState = @normalState
WHERE Id = @id";

            using (var connection = DatabaseConnection.CreateConnection())
            using (var command = new SqlCommand(sql, connection))
            {
                command.Parameters.Add("@id", SqlDbType.Int).Value = tag.Id;
                command.Parameters.Add("@serverId", SqlDbType.Int).Value = tag.ServerId;
                command.Parameters.Add("@tag", SqlDbType.NVarChar, 255).Value = (object)tag.TagName ?? DBNull.Value;
                command.Parameters.Add("@objectId", SqlDbType.Int).Value = (object)tag.ObjectId ?? DBNull.Value;
                command.Parameters.Add("@parameterId", SqlDbType.Int).Value = (object)tag.ParameterId ?? DBNull.Value;
                command.Parameters.Add("@multiplier", SqlDbType.Float).Value = (object)tag.Multiplier ?? DBNull.Value;
                command.Parameters.Add("@offset", SqlDbType.Float).Value = (object)tag.Offset ?? DBNull.Value;
                command.Parameters.Add("@bitMask", SqlDbType.Int).Value = (object)tag.BitMask ?? DBNull.Value;
                command.Parameters.Add("@deadBand", SqlDbType.Float).Value = (object)tag.DeadBand ?? DBNull.Value;
                command.Parameters.Add("@itemName", SqlDbType.NVarChar, 255).Value = (object)tag.ItemName ?? DBNull.Value;
                command.Parameters.Add("@source", SqlDbType.NVarChar, 255).Value = (object)tag.Source ?? DBNull.Value;
                command.Parameters.Add("@area", SqlDbType.NVarChar, 255).Value = (object)tag.Area ?? DBNull.Value;
                command.Parameters.Add("@zeroNormalState", SqlDbType.Bit).Value = (object)tag.ZeroNormalState ?? DBNull.Value;
                command.Parameters.Add("@normalState", SqlDbType.TinyInt).Value = (object)tag.NormalState ?? DBNull.Value;

                connection.Open();
                command.ExecuteNonQuery();
            }
        }

        public void UpdateTagObjectId(int tagId, int? objectId)
        {
            const string sql = "UPDATE dbo.Tags SET ObjectId = @objectId WHERE Id = @tagId";

            using (var connection = DatabaseConnection.CreateConnection())
            using (var command = new SqlCommand(sql, connection))
            {
                command.Parameters.Add("@tagId", SqlDbType.Int).Value = tagId;
                command.Parameters.Add("@objectId", SqlDbType.Int).Value = (object)objectId ?? DBNull.Value;
                connection.Open();
                command.ExecuteNonQuery();
            }
        }

        public bool TestConnection(out string errorMessage)
        {
            try
            {
                using (var connection = DatabaseConnection.CreateConnection())
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

        private static IList<Tag> QueryTags(string sql)
        {
            var result = new List<Tag>();

            using (var connection = DatabaseConnection.CreateConnection())
            using (var command = new SqlCommand(sql, connection))
            {
                connection.Open();
                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        result.Add(new Tag
                        {
                            Id = reader.GetInt32(0),
                            ServerId = reader.GetInt32(1),
                            TagName = reader.IsDBNull(2) ? null : reader.GetString(2),
                            ObjectId = reader.IsDBNull(3) ? (int?)null : reader.GetInt32(3),
                            ParameterId = reader.IsDBNull(4) ? (int?)null : reader.GetInt32(4),
                            Multiplier = reader.IsDBNull(5) ? (double?)null : reader.GetDouble(5),
                            Offset = reader.IsDBNull(6) ? (double?)null : reader.GetDouble(6),
                            BitMask = reader.IsDBNull(7) ? (int?)null : reader.GetInt32(7),
                            DeadBand = reader.IsDBNull(8) ? (double?)null : reader.GetDouble(8),
                            ItemName = reader.IsDBNull(9) ? null : reader.GetString(9),
                            Source = reader.IsDBNull(10) ? null : reader.GetString(10),
                            Area = reader.IsDBNull(11) ? null : reader.GetString(11),
                            ZeroNormalState = reader.IsDBNull(12) ? (bool?)null : reader.GetBoolean(12),
                            NormalState = reader.IsDBNull(13) ? (byte?)null : reader.GetByte(13),
                            ServerName = reader.IsDBNull(14) ? null : reader.GetString(14),
                            HostName = reader.IsDBNull(15) ? null : reader.GetString(15)
                        });
                    }
                }
            }

            return result;
        }

        private static IList<SchemaObject> QuerySchemaObjects(string sql)
        {
            var result = new List<SchemaObject>();

            using (var connection = DatabaseConnection.CreateConnection())
            using (var command = new SqlCommand(sql, connection))
            {
                connection.Open();
                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        result.Add(new SchemaObject
                        {
                            Id = reader.GetInt32(0),
                            ParentTypeName = reader.IsDBNull(1) ? null : reader.GetString(1),
                            ParentName = reader.IsDBNull(2) ? null : reader.GetString(2),
                            ParentObj = reader.IsDBNull(3) ? null : reader.GetString(3),
                            Type = reader.IsDBNull(4) ? null : reader.GetString(4),
                            Name = reader.IsDBNull(5) ? null : reader.GetString(5),
                            SwitchName = reader.IsDBNull(6) ? null : reader.GetString(6),
                            SwitchTypeName = reader.IsDBNull(7) ? null : reader.GetString(7)
                        });
                    }
                }
            }

            return result;
        }
    }
}
