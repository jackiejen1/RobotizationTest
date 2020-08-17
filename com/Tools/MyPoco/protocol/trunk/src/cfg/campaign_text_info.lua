---@classdef record_campaign_text_info
local record_campaign_text_info = {}


record_campaign_text_info.id = 0--ID
record_campaign_text_info.function_id = 0--功能id
record_campaign_text_info.show_type = 0--显示类型
record_campaign_text_info.show_level = 0--显示等级
record_campaign_text_info.vanish_level = 0--消失等级
record_campaign_text_info.text =  ""--气泡文本

local campaign_text_info = {
   _data = {   
    [1] = {1,10003,1,10,23,"排名至&<5>#num#名&可解锁#name#×#num2#",},  
    [2] = {2,10009,1,23,35,"最高星数达到&<5>#num#星&可解锁#name#×#num2#",},  
    [3] = {3,10024,1,35,43,"击败巨兽等级之和达到&<5>#num#级&解锁#name#×#num2#",},  
    [4] = {4,10011,1,43,48,"再合成&<5>#num#次&红宝解锁#name#×#num2#",},  
    [5] = {5,10037,1,65,100,"本周荣誉达&<5>#num#&可解锁#name#×#num2#",},  
    [6] = {6,10053,1,90,160,"最高前进到第&<5>#num#&区域可解锁#name#×#num2#",},
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
    function_id = 2,
    show_type = 3,
    show_level = 4,
    vanish_level = 5,
    text = 6,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_campaign_text_info")

        return t._raw[__key_map[k]]
    end
}


function campaign_text_info.getLength()
    return #campaign_text_info._data
end



function campaign_text_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_campaign_text_info
function campaign_text_info.indexOf(index)
    if index == nil or not campaign_text_info._data[index] then
        return nil
    end
    return setmetatable({_raw = campaign_text_info._data[index]}, m)
end



---
--@return @class record_campaign_text_info
function campaign_text_info.get(id)
    
    return campaign_text_info.indexOf(__index_id[ id ])
     
end



function campaign_text_info.set(id, key, value)
    local record = campaign_text_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function campaign_text_info.get_index_data()
    return __index_id 
end

return  campaign_text_info 