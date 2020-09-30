---@classdef record_gvg_achievement_info
local record_gvg_achievement_info = {}


record_gvg_achievement_info.id = 0--编号
record_gvg_achievement_info.name =  ""--成就名称
record_gvg_achievement_info.description =  ""--成就描述
record_gvg_achievement_info.type = 0--成就类型
record_gvg_achievement_info.value = 0--目标数值
record_gvg_achievement_info.trophy_icon = 0--奖杯图片
record_gvg_achievement_info.order = 0--排序值
record_gvg_achievement_info.reward_type_1 = 0--奖励类型1
record_gvg_achievement_info.reward_value_1 = 0--奖励类型值1
record_gvg_achievement_info.reward_size_1 = 0--奖励数量1
record_gvg_achievement_info.reward_type_2 = 0--奖励类型2
record_gvg_achievement_info.reward_value_2 = 0--奖励类型值2
record_gvg_achievement_info.reward_size_2 = 0--奖励数量2
record_gvg_achievement_info.reward_type_3 = 0--奖励类型3
record_gvg_achievement_info.reward_value_3 = 0--奖励类型值3
record_gvg_achievement_info.reward_size_3 = 0--奖励数量3
record_gvg_achievement_info.reward_type_4 = 0--奖励类型4
record_gvg_achievement_info.reward_value_4 = 0--奖励类型值4
record_gvg_achievement_info.reward_size_4 = 0--奖励数量4

local gvg_achievement_info = {
   _data = {   
    [1] = {101,"击杀其他玩家1次","击杀其他玩家1次",1141,1,101,1,999,0,200,0,0,0,0,0,0,0,0,0,},  
    [2] = {102,"击杀其他玩家2次","击杀其他玩家2次",1141,2,101,2,999,0,200,0,0,0,0,0,0,0,0,0,},  
    [3] = {201,"获得MVP1次","获得MVP1次",1142,1,101,3,999,0,200,0,0,0,0,0,0,0,0,0,},  
    [4] = {202,"获得MVP2次","获得MVP2次",1142,2,101,4,999,0,200,0,0,0,0,0,0,0,0,0,},  
    [5] = {301,"获得战神1次","获得战神1次",1143,1,101,5,999,0,200,0,0,0,0,0,0,0,0,0,},  
    [6] = {302,"获得战神2次","获得战神2次",1143,2,101,6,999,0,200,0,0,0,0,0,0,0,0,0,},  
    [7] = {401,"获得积分100分","获得积分100分",1144,100,101,7,999,0,200,0,0,0,0,0,0,0,0,0,},  
    [8] = {402,"获得积分200分","获得积分200分",1144,200,101,8,999,0,200,0,0,0,0,0,0,0,0,0,},
    }
}

local __index_id = {   
    [101] = 1,  
    [102] = 2,  
    [201] = 3,  
    [202] = 4,  
    [301] = 5,  
    [302] = 6,  
    [401] = 7,  
    [402] = 8,
}

local __key_map = { 
    id = 1,
    name = 2,
    description = 3,
    type = 4,
    value = 5,
    trophy_icon = 6,
    order = 7,
    reward_type_1 = 8,
    reward_value_1 = 9,
    reward_size_1 = 10,
    reward_type_2 = 11,
    reward_value_2 = 12,
    reward_size_2 = 13,
    reward_type_3 = 14,
    reward_value_3 = 15,
    reward_size_3 = 16,
    reward_type_4 = 17,
    reward_value_4 = 18,
    reward_size_4 = 19,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_gvg_achievement_info")

        return t._raw[__key_map[k]]
    end
}


function gvg_achievement_info.getLength()
    return #gvg_achievement_info._data
end



function gvg_achievement_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_gvg_achievement_info
function gvg_achievement_info.indexOf(index)
    if index == nil or not gvg_achievement_info._data[index] then
        return nil
    end
    return setmetatable({_raw = gvg_achievement_info._data[index]}, m)
end



---
--@return @class record_gvg_achievement_info
function gvg_achievement_info.get(id)
    
    return gvg_achievement_info.indexOf(__index_id[ id ])
     
end



function gvg_achievement_info.set(id, key, value)
    local record = gvg_achievement_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function gvg_achievement_info.get_index_data()
    return __index_id 
end

return  gvg_achievement_info 