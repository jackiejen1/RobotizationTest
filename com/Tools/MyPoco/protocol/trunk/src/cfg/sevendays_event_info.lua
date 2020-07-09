---@classdef record_sevendays_event_info
local record_sevendays_event_info = {}


record_sevendays_event_info.id = 0--编号
record_sevendays_event_info.event_type = 0--事件类型
record_sevendays_event_info.value = 0--事件类型值
record_sevendays_event_info.res = 0--关联资源
record_sevendays_event_info.name =  ""--事件名称
record_sevendays_event_info.des =  ""--事件说明
record_sevendays_event_info.cost_type = 0--消耗类型
record_sevendays_event_info.cost_value = 0--消耗类型值
record_sevendays_event_info.cost_size = 0--消耗数量
record_sevendays_event_info.route_id = 0--跳转
record_sevendays_event_info.finish_des =  ""--事件反馈

local sevendays_event_info = {
   _data = {   
    [1] = {1,0,0,1,"古老的藏宝图","传说周围埋藏着巨大的宝藏，复原这张残破的&<藏宝图&似乎就是解开这一谜题的线索（集齐七张藏宝图碎片即可）。",3,9001,7,67,"事件完成",},  
    [2] = {2,0,0,1,"祈雨","附近的村民准备举行祈雨仪式，需要一些&<5>香火&，希望你能帮他们找到。",3,9008,1,67,"事件完成",},  
    [3] = {3,0,0,1,"祭祀","附近的村民准备举行祭祀，需要一些&<6>木柴&，希望你能帮他们找到。",3,9009,1,67,"事件完成",},  
    [4] = {4,0,0,1,"祭祖","村民准备祭祖，需要一些&<7>供品&，希望你能帮他们找到。",3,9010,1,67,"事件完成",},  
    [5] = {5,0,0,1,"祭祖","附近的村民准备祭祖，但是遗失了&<7>族谱&，非常着急。",3,9011,1,67,"事件完成",},  
    [6] = {6,0,0,1,"祭祀","附近的村民准备举行祭祀，急需&<9>酒&，希望你能帮助他们。",3,9012,1,67,"事件完成",},  
    [7] = {7,0,0,1,"祭祖","附近的村民准备祭祖，存放相关物品仓库的&<10>石匙&丢失了，希望你能帮他们找到。",3,9013,1,67,"事件完成",},  
    [8] = {8,0,0,2,"倾盆大雨","附近的村民准备祭祖，存放相关物品仓库的&<10>七日活动道具&丢失了，希望你能帮他们找到。",3,9014,1,67,"事件完成",},  
    [9] = {9,2,1,2,"瓢泼大雨","刚到此处，居然下起了瓢泼大雨。",0,0,0,67,"事件完成",},  
    [10] = {10,3,1,2,"倾盆大雨","刚到此处，居然下起了倾盆大雨。",0,0,0,67,"事件完成",},
    }
}

local __index_id = {   
    [1] = 1,  
    [2] = 2,  
    [3] = 3,  
    [4] = 4,  
    [5] = 5,  
    [6] = 6,  
    [7] = 7,  
    [8] = 8,  
    [9] = 9,  
    [10] = 10,
}

local __key_map = { 
    id = 1,
    event_type = 2,
    value = 3,
    res = 4,
    name = 5,
    des = 6,
    cost_type = 7,
    cost_value = 8,
    cost_size = 9,
    route_id = 10,
    finish_des = 11,
}

local m = { 
    __index = function(t, k) 
        if k == "toObject" then
            return function()  
                local o = {}
                for key, v in pairs (__key_map) do 
                    o[key] = t._raw[v]
                end
                return o
            end 
        end
        
        assert(__key_map[k], "cannot find " .. k .. " in record_sevendays_event_info")

        return t._raw[__key_map[k]]
    end
}


function sevendays_event_info.getLength()
    return #sevendays_event_info._data
end



function sevendays_event_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_sevendays_event_info
function sevendays_event_info.indexOf(index)
    if index == nil or not sevendays_event_info._data[index] then
        return nil
    end
    return setmetatable({_raw = sevendays_event_info._data[index]}, m)
end



---
--@return @class record_sevendays_event_info
function sevendays_event_info.get(id)
    
    return sevendays_event_info.indexOf(__index_id[ id ])
     
end



function sevendays_event_info.set(id, key, value)
    local record = sevendays_event_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function sevendays_event_info.get_index_data()
    return __index_id 
end

return  sevendays_event_info 