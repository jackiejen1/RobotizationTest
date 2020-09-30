---@classdef record_fund_show_info
local record_fund_show_info = {}


record_fund_show_info.fund_type = 0--基金类型
record_fund_show_info.period = 0--阶段
record_fund_show_info.icon_1 = 0--普通基金图标
record_fund_show_info.icon_2 = 0--付费基金图标
record_fund_show_info.banner = 0--宣传图
record_fund_show_info.ratio = 0--返利比
record_fund_show_info.parameter = 0--参数数量

local fund_show_info = {
   _data = {   
    [1] = {1,1,101,111,1,20,12000,},  
    [2] = {1,2,102,112,1,26,16000,},  
    [3] = {1,3,103,113,1,26,16000,},  
    [4] = {2,1,201,211,2,25,0,},  
    [5] = {2,2,202,212,2,25,0,},  
    [6] = {2,3,203,213,2,25,0,},  
    [7] = {2,4,204,214,2,25,0,},  
    [8] = {3,1,301,311,3,33,0,},  
    [9] = {3,2,302,312,3,33,0,},  
    [10] = {3,3,303,313,3,30,0,},  
    [11] = {3,4,304,314,3,30,0,},
    }
}

local __index_fund_type_period = {   
    ["1_1"] = 1,  
    ["1_2"] = 2,  
    ["1_3"] = 3,  
    ["2_1"] = 4,  
    ["2_2"] = 5,  
    ["2_3"] = 6,  
    ["2_4"] = 7,  
    ["3_1"] = 8,  
    ["3_2"] = 9,  
    ["3_3"] = 10,  
    ["3_4"] = 11,
}

local __key_map = { 
    fund_type = 1,
    period = 2,
    icon_1 = 3,
    icon_2 = 4,
    banner = 5,
    ratio = 6,
    parameter = 7,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_fund_show_info")

        return t._raw[__key_map[k]]
    end
}


function fund_show_info.getLength()
    return #fund_show_info._data
end



function fund_show_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_fund_show_info
function fund_show_info.indexOf(index)
    if index == nil or not fund_show_info._data[index] then
        return nil
    end
    return setmetatable({_raw = fund_show_info._data[index]}, m)
end



---
--@return @class record_fund_show_info
function fund_show_info.get(fund_type,period)
    
    local k = fund_type .. '_' .. period
    return fund_show_info.indexOf(__index_fund_type_period[k])
     
end



function fund_show_info.set(fund_type,period, key, value)
    local record = fund_show_info.get(fund_type,period)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function fund_show_info.get_index_data()
    return __index_fund_type_period 
end

return  fund_show_info 