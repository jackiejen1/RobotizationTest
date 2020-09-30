---@classdef record_warlord_achievement_info
local record_warlord_achievement_info = {}


record_warlord_achievement_info.id = 0--编号
record_warlord_achievement_info.name =  ""--成就名称
record_warlord_achievement_info.description =  ""--成就描述
record_warlord_achievement_info.type = 0--成就类型
record_warlord_achievement_info.warlord_id = 0--关联BOSS
record_warlord_achievement_info.value = 0--条件数值
record_warlord_achievement_info.monster_1 = 0--怪物1
record_warlord_achievement_info.monster_2 = 0--怪物2
record_warlord_achievement_info.monster_3 = 0--怪物3
record_warlord_achievement_info.level = 0--成就等级
record_warlord_achievement_info.trophy_icon = 0--奖杯图片
record_warlord_achievement_info.order = 0--排序值
record_warlord_achievement_info.reward_type_1 = 0--奖励类型1
record_warlord_achievement_info.reward_value_1 = 0--奖励类型值1
record_warlord_achievement_info.reward_size_1 = 0--奖励数量1
record_warlord_achievement_info.reward_type_2 = 0--奖励类型2
record_warlord_achievement_info.reward_value_2 = 0--奖励类型值2
record_warlord_achievement_info.reward_size_2 = 0--奖励数量2
record_warlord_achievement_info.reward_type_3 = 0--奖励类型3
record_warlord_achievement_info.reward_value_3 = 0--奖励类型值3
record_warlord_achievement_info.reward_size_3 = 0--奖励数量3
record_warlord_achievement_info.reward_type_4 = 0--奖励类型4
record_warlord_achievement_info.reward_value_4 = 0--奖励类型值4
record_warlord_achievement_info.reward_size_4 = 0--奖励数量4

local warlord_achievement_info = {
   _data = {   
    [1] = {1,"幸运宠儿","获得稀有奖励",1,0,1,0,0,0,1,101,1,999,0,300,3,133,100,0,0,0,0,0,0,},  
    [2] = {2,"速战速决","1分20秒内通关吕布关卡",3,27,80,0,0,0,2,102,2,999,0,200,3,2,1000,0,0,0,0,0,0,},  
    [3] = {3,"完美胜利","无伤通关于吉关卡",2,33,1000,0,0,0,2,102,3,999,0,200,3,15,500,0,0,0,0,0,0,},  
    [4] = {4,"怒焰战姬","在吕玲绮存活状态下击败貂蝉",4,27,0,29,30,0,3,103,5,999,0,100,3,132,100,0,0,0,0,0,0,},  
    [5] = {5,"计破诡道","通关于吉关卡",3,33,999,0,0,0,3,103,6,999,0,100,3,2,500,0,0,0,0,0,0,},  
    [6] = {6,"力退枭雄","通关曹操关卡",3,22,999,0,0,0,3,103,4,999,0,100,3,15,250,0,0,0,0,0,0,},
    }
}

local __index_id = {   
    [1] = 1,  
    [2] = 2,  
    [3] = 3,  
    [4] = 4,  
    [5] = 5,  
    [6] = 6,
}

local __key_map = { 
    id = 1,
    name = 2,
    description = 3,
    type = 4,
    warlord_id = 5,
    value = 6,
    monster_1 = 7,
    monster_2 = 8,
    monster_3 = 9,
    level = 10,
    trophy_icon = 11,
    order = 12,
    reward_type_1 = 13,
    reward_value_1 = 14,
    reward_size_1 = 15,
    reward_type_2 = 16,
    reward_value_2 = 17,
    reward_size_2 = 18,
    reward_type_3 = 19,
    reward_value_3 = 20,
    reward_size_3 = 21,
    reward_type_4 = 22,
    reward_value_4 = 23,
    reward_size_4 = 24,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_warlord_achievement_info")

        return t._raw[__key_map[k]]
    end
}


function warlord_achievement_info.getLength()
    return #warlord_achievement_info._data
end



function warlord_achievement_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_warlord_achievement_info
function warlord_achievement_info.indexOf(index)
    if index == nil or not warlord_achievement_info._data[index] then
        return nil
    end
    return setmetatable({_raw = warlord_achievement_info._data[index]}, m)
end



---
--@return @class record_warlord_achievement_info
function warlord_achievement_info.get(id)
    
    return warlord_achievement_info.indexOf(__index_id[ id ])
     
end



function warlord_achievement_info.set(id, key, value)
    local record = warlord_achievement_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function warlord_achievement_info.get_index_data()
    return __index_id 
end

return  warlord_achievement_info 