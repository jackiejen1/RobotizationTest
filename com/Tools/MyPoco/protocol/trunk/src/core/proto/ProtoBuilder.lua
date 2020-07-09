--[=====================[

    协议数据的构建类
    用来针对proto-gen-lua生成的协议的封包和解包数据

]=====================]

local tos = tostring

local string = string
local sformat = string.format
local proto = load "core.proto.pb_bs"

local function trans_proto( data,isInt64 )
    local res = {}
    if data._fields then
        for key , value in pairs(data._fields) do
            local toInt64 = false
            if type(key) == "table" then
                if key.type == 4 or key.type == 3 then
                    toInt64 = true
                end
                key = key.name
            end
            if type(value) == "table" then
                value = trans_proto(value,toInt64)
            elseif type(value) == "string" and toInt64 then
                value = tonumber(value)
            end
            res[key] = value
        end
    else
        for i , value in ipairs(data) do
            if type(value) == "table" then
                value = trans_proto(value)
            elseif type(value) == "string" and isInt64 then
                value = tonumber(value)
            end
            res[i] = value
        end
    end
    return res
end

local ProtoBuilder = {}

--[=================[

    协议打包

    @param msgId int 协议id，通常指的是定义在协议里枚举ID的值，id会被映射成协议的名字
    @param content table 要发送的数据，注意这里数据格式及名字要和协议message中定义的一致
    例如
    message Phone
    {
        required uint32 phone_number = 1;
    }
    message Person
    {
        required string name = 1;
        required uint32 age = 2;
        repeated Phone phones = 3;
    }
    则content在传递时需要定义成如下规则
    local content = {
        name = "张三",
        age = 25,
        phones = {
            {phone_number = 110},
            {phone_number = 120}
        }
    }

    @return string 返回proto编码后的数据

]=================]

function ProtoBuilder:encode(msgId, content)

    local protoInfo = proto.list[tos(msgId)]
    assert(protoInfo, "Invalid msg id: "..tos(msgId))
    
    local msgName = protoInfo[1]
    msgName = sformat("C2%s_%s", protoInfo[2], msgName)

    return ProtoBuilder.encodeByMsgName(self, msgName, content)
    
end

--[=================[

    协议打包（通过协议名字）

    @param msgName string 协议名字，通常指的是定义在cs.proto里枚举ID的值，id会被映射成协议的名字
    @param content table 要发送的数据，注意这里数据格式及名字要和协议message中定义的一致，同encode

    @return string 返回proto编码后的数据

]=================]

function ProtoBuilder:encodeByMsgName(msgName, content)

    assert(msgName, "Invalid magName: "..tos(msgName))
    assert(type(content) == "table", "Invalid content: "..tostring(content))
    
    local msg = proto[msgName]()
    self:_encodeMessage(msg, content)
    
    local content = msg:SerializeToString()
    
    return content
    
end

--[=================[

    协议解包

    @param msgId int 协议id，同上
    @param msg string 消息体，protobuf数据
    @param len int 消息长度

    @return string 返回解析好的数据

]=================]

function ProtoBuilder:decode(msgId, msg, len)
    
    local protoInfo = proto.list[tos(msgId)]
    assert(protoInfo, "Invalid msg id: "..tos(msgId))
    
    local msgName = protoInfo[1]
    msgName = sformat("%s2C_%s", protoInfo[2], msgName)

    return ProtoBuilder.decodeByMsgName(self, msgName, msg)

end

--[=================[

    协议解包

    @param msgName string 协议名字，同上
    @param msg string 消息体，protobuf数据

    @return string 返回解析好数据，可以正常访问使用，但内部结构还是有protobuf解析的结构在

]=================]

function ProtoBuilder:decodeByMsgName(msgName, msg)

    assert(msgName, "Invalid magName: "..tos(msgName))
    assert(type(msg) == "string", "Invalid msg: "..tostring(msg))
    local content = proto[msgName]()
    content:ParseFromString(msg)
    local result = trans_proto(content)
    return result
    
end

-- 编码message数据
-- @param msg table 这个message数据对应的对象
-- @param content table 需要往msg里写的数据

function ProtoBuilder:_encodeMessage(msg, content)

    for key, value in pairs(content) do
        -- 这个判断不能加，因为bool值是没有默认值的，其他的可以，使用msg[key]访问bool类型的值时会触发报错
        -- assert(msg[key], "Unknown message field name: "..tostring(key))
        if type(value) == "table" then
            if value[1] then
                self:_encodeRepeated(msg[key], value)
            else
                self:_encodeMessage(msg[key], value)
            end
        else
            msg[key] = value
        end
    end

end

-- 编码repeated数据
-- @param msg table 这个repeated数据对应的对象，可能repeated修饰的是message，也可能是基础数据类型
-- @param content table 需要往msg里写的数据

function ProtoBuilder:_encodeRepeated(msg, content)
    
    local value = content
    for i, v in ipairs(value) do
        if type(v) == "table" then
            self:_encodeMessage(msg:add(), v)
        else
            msg:append(v)
        end
    end

end

return ProtoBuilder