using System.Collections.Generic;
using OPC_CFGCS.Data;
using OPC_CFGCS.Data.Models;

namespace OPC_CFGCS.Core
{
    public sealed class BindingService
    {
        private readonly SqlRepository _repository;

        public BindingService(SqlRepository repository)
        {
            _repository = repository;
        }

        public IList<TagBinding> GetBindings(SchemaObjectType objectType, int objectId)
        {
            return _repository.GetBindingsByObjectId(objectId);
        }

        public string GetParentObjForSchemaObject(SchemaObject schemaObject)
        {
            return schemaObject == null ? string.Empty : schemaObject.ParentObj ?? string.Empty;
        }
    }
}
