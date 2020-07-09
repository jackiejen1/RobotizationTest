---@classdef record_wrest_output_info
local record_wrest_output_info = {}


record_wrest_output_info.group = 0--产量组
record_wrest_output_info.number1 = 0--安全人数
record_wrest_output_info.output1 = 0--基础产量
record_wrest_output_info.number2 = 0--产量2人数
record_wrest_output_info.output2 = 0--产量2
record_wrest_output_info.number3 = 0--产量3人数
record_wrest_output_info.output3 = 0--产量3
record_wrest_output_info.number4 = 0--产量4人数
record_wrest_output_info.output4 = 0--产量4

local wrest_output_info = {
   _data = {   
    [1] = {1,50,400,60,320,70,200,80,0,},  
    [2] = {2,50,600,60,480,70,300,80,0,},  
    [3] = {3,50,800,60,640,70,400,80,0,},  
    [4] = {4,50,1500,60,1200,70,750,80,0,},  
    [5] = {5,80,1800,90,1440,100,900,120,0,},  
    [6] = {6,999999,300,999999,300,999999,300,999999,300,},
    }
}

local __index_group = {   
    [1] = 1,  
    [2] = 2,  
    [3] = 3,  
    [4] = 4,  
    [5] = 5,  
    [6] = 6,
}

local __key_map = { 
    group = 1,
    number1 = 2,
    output1 = 3,
    number2 = 4,
    output2 = 5,
    number3 = 6,
    output3 = 7,
    number4 = 8,
    output4 = 9,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_wrest_output_info")

        return t._raw[__key_map[k]]
    end
}


function wrest_output_info.getLength()
    return #wrest_output_info._data
end



function wrest_output_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_wrest_output_info
function wrest_output_info.indexOf(index)
    if index == nil or not wrest_output_info._data[index] then
        return nil
    end
    return setmetatable({_raw = wrest_output_info._data[index]}, m)
end



---
--@return @class record_wrest_output_info
function wrest_output_info.get(group)
    
    return wrest_output_info.indexOf(__index_group[ group ])
     
end



function wrest_output_info.set(group, key, value)
    local record = wrest_output_info.get(group)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function wrest_output_info.get_index_data()
    return __index_group 
end

return  wrest_output_info 