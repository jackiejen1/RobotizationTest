local IDumper = {}
IDumper.__index = IDumper

function IDumper:getRoot() 
    -- :rettype: support.poco.sdk.AbstractNode
end

function IDumper:dumpHierarchy(onlyVisibleNode) 
    -- :rettype: dict or NoneType
end

local AbstractDumper = {}
AbstractDumper.__index = AbstractDumper
setmetatable(AbstractDumper, IDumper)


function AbstractDumper:dumpHierarchy(onlyVisibleNode)
    if onlyVisibleNode == nil then
        onlyVisibleNode = true
    end
	local nameIndex = 0
	local bro_Name_list = {}
	local bronameIndex = 0
    local fatherName = ""
	local result,nameIndexOut,thisName,bronameIndexOutput = self:dumpHierarchyImpl(self:getRoot(), onlyVisibleNode,nameIndex,bro_Name_list,bronameIndex,fatherName)
    return result
end
local function isInArray(t, val)
	for _, v in pairs(t) do
		if v == val then
			return true
		end
	end
	return false
end

function AbstractDumper:dumpHierarchyImpl(node,onlyVisibleNode,nameIndex,bro_Name_list,bronameIndex,fatherName)
    local nameIndexOutput = nameIndex or 0
    local bro_Name_list = bro_Name_list or {}
	local bronameIndexOutput = bronameIndex or 0
    if node == nil then
        return nil
    end
    if onlyVisibleNode == nil then
        onlyVisibleNode = true
    end
    local payload = node:enumerateAttrs()
    local result = {}
    local children = {}
	local _chlid_Name_list = {}
	local _chlid_bro_nameIndex = 0
    local _nameIndex = 0
    local thisName = payload['name'] or node:getAttr('name')
    local oldName = thisName
    if thisName=="未命名" then
        thisName = thisName .. nameIndexOutput
        nameIndexOutput = nameIndexOutput + 1 --处理过的名字不放入表里，肯定是唯一的
    end
    if #bro_Name_list>0 and isInArray(bro_Name_list,thisName) then--名字在表里
        bronameIndexOutput = bronameIndexOutput + 1 
        thisName = thisName .. bronameIndexOutput --名字+编号
    else --名字不在表里
        if oldName ~= "未命名" then --未命名和其他不是一个体系，要走两套代号
            bronameIndexOutput = 0 --说明自己是第一个，代号归零
            table.insert(bro_Name_list,thisName) --表里没有，就把自己放进去，唯一添加的就是第一次遍历到的
        end
    end
    if fatherName ~= "" then --首次进来不加
        thisName = fatherName .. "/".. thisName --父节点名字拼接
    end
    for _, child in ipairs(node:getChildren()) do --开始遍历子节点
        if not onlyVisibleNode or child:getAttr('visible') then
            local _result,_nameIndexOut,_bro_Name_list,_bronameIndexOutput = self:dumpHierarchyImpl(child,onlyVisibleNode,_nameIndex,_chlid_Name_list,_chlid_bro_nameIndex,thisName)
            table.insert(children, _result)
            _chlid_Name_list = _bro_Name_list
            _chlid_bro_nameIndex = _bronameIndexOutput
            _nameIndex = _nameIndexOut
        end
    end
    if #children > 0 then
        result['children'] = children
    end
    result['name'] = thisName
    payload['name'] = thisName
    result['payload'] = payload

    return result,nameIndexOutput,bro_Name_list,bronameIndexOutput
end

return AbstractDumper