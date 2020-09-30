---@classdef record_battle_scene_info
local record_battle_scene_info = {}


record_battle_scene_info.id = 0--ID
record_battle_scene_info.name =  ""--场景名称
record_battle_scene_info.position_x = 0--按屏幕中心偏移X
record_battle_scene_info.position_y = 0--按屏幕中心偏移Y
record_battle_scene_info.touch_effect_res =  ""--场景触发特效
record_battle_scene_info.effect_res =  ""--场景持续特效
record_battle_scene_info.order =  ""--场景层级
record_battle_scene_info.passive_skill_id_1 = 0--关联被动技能1
record_battle_scene_info.passive_skill_id_2 = 0--关联被动技能2
record_battle_scene_info.disappear_effect_res =  ""--场景消失特效
record_battle_scene_info.disappear_skill_id = 0--场景消失触发技能

local battle_scene_info = {
   _data = {   
    [1] = {1,"熔岩",314,24,"0","effect_battle_rongyandixing","0",0,0,"effect_battle_rongyandixingxiaoshi",500607,},  
    [2] = {2,"熔岩",314,24,"0","effect_battle_rongyandixing","0",0,0,"effect_battle_rongyandixingxiaoshi",500608,},  
    [3] = {3,"熔岩",314,24,"0","effect_battle_rongyandixing","0",0,0,"effect_battle_rongyandixingxiaoshi",500609,},  
    [4] = {4,"熔岩",314,24,"0","effect_battle_rongyandixing","0",0,0,"effect_battle_rongyandixingxiaoshi",500610,},  
    [5] = {5,"熔岩",314,24,"0","effect_battle_rongyandixing","0",0,0,"effect_battle_rongyandixingxiaoshi",500611,},  
    [6] = {6,"熔岩",314,24,"0","effect_battle_rongyandixing","0",0,0,"effect_battle_rongyandixingxiaoshi",500612,},
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
    position_x = 3,
    position_y = 4,
    touch_effect_res = 5,
    effect_res = 6,
    order = 7,
    passive_skill_id_1 = 8,
    passive_skill_id_2 = 9,
    disappear_effect_res = 10,
    disappear_skill_id = 11,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_battle_scene_info")

        return t._raw[__key_map[k]]
    end
}


function battle_scene_info.getLength()
    return #battle_scene_info._data
end



function battle_scene_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_battle_scene_info
function battle_scene_info.indexOf(index)
    if index == nil or not battle_scene_info._data[index] then
        return nil
    end
    return setmetatable({_raw = battle_scene_info._data[index]}, m)
end



---
--@return @class record_battle_scene_info
function battle_scene_info.get(id)
    
    return battle_scene_info.indexOf(__index_id[ id ])
     
end



function battle_scene_info.set(id, key, value)
    local record = battle_scene_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function battle_scene_info.get_index_data()
    return __index_id 
end

return  battle_scene_info 