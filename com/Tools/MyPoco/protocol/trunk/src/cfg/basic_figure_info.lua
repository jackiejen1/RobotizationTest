---@classdef record_basic_figure_info
local record_basic_figure_info = {}


record_basic_figure_info.id = 0--数值ID
record_basic_figure_info.name =  ""--数值名称
record_basic_figure_info.type = 0--资源通用类型
record_basic_figure_info.value = 0--资源通用类型值
record_basic_figure_info.initial_num = 0--数值初始值
record_basic_figure_info.time_limit = 0--时间恢复上限
record_basic_figure_info.max_limit = 0--最大上限
record_basic_figure_info.unit_recover = 0--数值单元恢复量
record_basic_figure_info.unit_time = 0--数值单元时间量

local basic_figure_info = {
   _data = {   
    [1] = {1,"体力",1,4,100,100,1000,1,360,},  
    [2] = {2,"寻宝次数",1,9,30,30,150,1,2400,},  
    [3] = {3,"追击异族次数",1,12,10,10,100,1,3600,},  
    [4] = {4,"神秘商店免费手刷次数",1,18,10,10,10,1,7200,},  
    [5] = {5,"军团副本攻打次数",1,15,10,10,100,1,10800,},  
    [6] = {6,"疲劳值",1,24,10,10,20,1,10800,},  
    [7] = {7,"神器商店免费手刷次数",1,30,3,3,3,1,28800,},  
    [8] = {8,"列传次数",1,33,10,10,25,1,10800,},  
    [9] = {9,"粮草",1,34,300,300,1000,1,360,},  
    [10] = {10,"军令",1,35,40,40,500,1,1440,},  
    [11] = {11,"神兽商店免费手刷次数",1,43,2,2,2,1,43200,},  
    [12] = {12,"讨伐魔将次数",1,45,8,8,18,1,7200,},  
    [13] = {13,"烽火连城次数",1,47,10,10,15,1,14400,},
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
    [11] = 11,  
    [12] = 12,  
    [13] = 13,
}

local __key_map = { 
    id = 1,
    name = 2,
    type = 3,
    value = 4,
    initial_num = 5,
    time_limit = 6,
    max_limit = 7,
    unit_recover = 8,
    unit_time = 9,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_basic_figure_info")

        return t._raw[__key_map[k]]
    end
}


function basic_figure_info.getLength()
    return #basic_figure_info._data
end



function basic_figure_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_basic_figure_info
function basic_figure_info.indexOf(index)
    if index == nil or not basic_figure_info._data[index] then
        return nil
    end
    return setmetatable({_raw = basic_figure_info._data[index]}, m)
end



---
--@return @class record_basic_figure_info
function basic_figure_info.get(id)
    
    return basic_figure_info.indexOf(__index_id[ id ])
     
end



function basic_figure_info.set(id, key, value)
    local record = basic_figure_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function basic_figure_info.get_index_data()
    return __index_id 
end

return  basic_figure_info 