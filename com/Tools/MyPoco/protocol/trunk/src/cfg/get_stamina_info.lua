---@classdef record_get_stamina_info
local record_get_stamina_info = {}


record_get_stamina_info.id = 0--ID
record_get_stamina_info.stamina = 0--体力值
record_get_stamina_info.drop_id = 0--掉落关联
record_get_stamina_info.supplement_cost = 0--补领消耗元宝
record_get_stamina_info.food_icon =  ""--菜肴图标
record_get_stamina_info.saying_about_meal =  ""--NPC食物介绍
record_get_stamina_info.saying_random =  ""--NPC元宝酬谢

local get_stamina_info = {
   _data = {   
    [1] = {1,100,142011,50,"5","12点、18点、20点准时开餐，还有概率获得元宝将魂等奖励哟！","12点、18点、20点准时开餐，将军不要忘记哟！",},  
    [2] = {2,100,142012,50,"2","12点、18点、20点准时开餐，还有概率获得元宝将魂等奖励哟！","12点、18点、20点准时开餐，将军不要忘记哟！",},  
    [3] = {3,100,142013,50,"3","12点、18点、20点准时开餐，还有概率获得元宝将魂等奖励哟！","12点、18点、20点准时开餐，将军不要忘记哟！",},
    }
}

local __index_id = {   
    [1] = 1,  
    [2] = 2,  
    [3] = 3,
}

local __key_map = { 
    id = 1,
    stamina = 2,
    drop_id = 3,
    supplement_cost = 4,
    food_icon = 5,
    saying_about_meal = 6,
    saying_random = 7,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_get_stamina_info")

        return t._raw[__key_map[k]]
    end
}


function get_stamina_info.getLength()
    return #get_stamina_info._data
end



function get_stamina_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_get_stamina_info
function get_stamina_info.indexOf(index)
    if index == nil or not get_stamina_info._data[index] then
        return nil
    end
    return setmetatable({_raw = get_stamina_info._data[index]}, m)
end



---
--@return @class record_get_stamina_info
function get_stamina_info.get(id)
    
    return get_stamina_info.indexOf(__index_id[ id ])
     
end



function get_stamina_info.set(id, key, value)
    local record = get_stamina_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function get_stamina_info.get_index_data()
    return __index_id 
end

return  get_stamina_info 