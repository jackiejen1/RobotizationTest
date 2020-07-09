---@classdef record_cat_help_info
local record_cat_help_info = {}


record_cat_help_info.id = 0--ID
record_cat_help_info.condition_type = 0--条件类型
record_cat_help_info.parameter1 = 0--参数1
record_cat_help_info.parameter2 = 0--参数2
record_cat_help_info.description =  ""--气泡内容
record_cat_help_info.priority =  ""--优先级

local cat_help_info = {
   _data = {   
    [1] = {1,2,1,1,"挑战竞技场拿元宝，十连抽得红将，喵~",1,},  
    [2] = {2,2,1,3,"上阵同阵营红将/金将可以触发阵营光环，喵~",2,},  
    [3] = {3,5,23,28,"无双试炼换取珍稀红装，喵~",7,},  
    [4] = {4,5,43,46,"争抢宝物碎片，合成珍惜宝物，喵~",8,},  
    [5] = {5,7,1200,1300,"巨兽讨伐和组队战役奖励正在翻倍，快去挑战，喵~",5,},  
    [6] = {6,7,1800,1900,"巨兽讨伐和组队战役奖励正在翻倍，快去挑战，喵~",6,},  
    [7] = {7,2,1,3,"挑战副本进阶武将，战力飞速提升，喵~",3,},  
    [8] = {8,2,1,7,"每日签到领取多重豪礼，喵~",4,},
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
}

local __key_map = { 
    id = 1,
    condition_type = 2,
    parameter1 = 3,
    parameter2 = 4,
    description = 5,
    priority = 6,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_cat_help_info")

        return t._raw[__key_map[k]]
    end
}


function cat_help_info.getLength()
    return #cat_help_info._data
end



function cat_help_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_cat_help_info
function cat_help_info.indexOf(index)
    if index == nil or not cat_help_info._data[index] then
        return nil
    end
    return setmetatable({_raw = cat_help_info._data[index]}, m)
end



---
--@return @class record_cat_help_info
function cat_help_info.get(id)
    
    return cat_help_info.indexOf(__index_id[ id ])
     
end



function cat_help_info.set(id, key, value)
    local record = cat_help_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function cat_help_info.get_index_data()
    return __index_id 
end

return  cat_help_info 