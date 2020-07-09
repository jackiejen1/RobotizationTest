local descriptorHelper = {}

function descriptorHelper.descriptorFunc(descriptor, value)
    descriptor.name = value[1]
    descriptor.full_name = value[2]
    descriptor.nested_types = value[3]
    descriptor.enum_types = value[4]
    descriptor.fields = value[5]
    descriptor.is_extendable =value[6]
    descriptor.extensions = value[7]
    descriptor.containing_type = value[8]
end

function descriptorHelper.fieldDescriptorFunc(descriptor, value)
    descriptor.name = value[1]
    descriptor.full_name = value[2]
    descriptor.number = value[3]
    descriptor.index = value[4]
    descriptor.label = value[5]
    descriptor.has_default_value = value[6]
    descriptor.default_value = value[7]
    descriptor.message_type = value[8]
    descriptor.enum_type = value[9]
    descriptor.type = value[10]
    descriptor.cpp_type = value[11]
end

function descriptorHelper.enumValueDescriptorFunc(descriptor, value)
    descriptor.name = value[1]
    descriptor.index = value[2]
    descriptor.number = value[3]
end

function descriptorHelper.enumDescriptorFunc(descriptor, value)
    descriptor.name = value[1]
    descriptor.full_name = value[2]
    descriptor.values = value[3]
end

return descriptorHelper