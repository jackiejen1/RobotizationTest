---@classdef record_knight_display_info
local record_knight_display_info = {}


record_knight_display_info.id = 0--ID
record_knight_display_info.interface = 0--使用界面
record_knight_display_info.type_0 = 0--初始资源类型
record_knight_display_info.res_id = 0--初始资源id
record_knight_display_info.if_flip_0 = 0--初始资源是否翻转
record_knight_display_info.scale_0 = 0--初始资源缩放比例
record_knight_display_info.type_1 = 0--替换资源类型
record_knight_display_info.res_id_1 = 0--替换资源id
record_knight_display_info.if_flip_1 = 0--替换资源是否翻转
record_knight_display_info.scale_1 = 0--替代资源缩放比例
record_knight_display_info.type_0_other = 0--马甲包初始资源类型
record_knight_display_info.res_id_other = 0--马甲包初始资源
record_knight_display_info.if_flip_0_other = 0--马甲包初始资源是否翻转
record_knight_display_info.scale_0_other = 0--马甲包初始资源缩放比例
record_knight_display_info.type_1_other = 0--马甲包替换资源类型
record_knight_display_info.res_id_1_other = 0--马甲包替换资源
record_knight_display_info.if_flip_1_other = 0--马甲包替代资源是否翻转
record_knight_display_info.scale_1_other = 0--马甲包替代资源缩放比例
record_knight_display_info.change1 =  ""--马甲包初始资源读取字段
record_knight_display_info.change2 =  ""--马甲包替换资源读取字段
record_knight_display_info.change3 =  ""--马甲包初始资源缩放比例
record_knight_display_info.change4 =  ""--马甲包替换资源缩放比例
record_knight_display_info.change5 =  ""--马甲包初始资源是否翻转
record_knight_display_info.change6 =  ""--马甲包替代资源是否翻转
record_knight_display_info.change7 =  ""--马甲包初始资源类型
record_knight_display_info.change8 =  ""--马甲包替换资源类型
record_knight_display_info.count = 0--程序变量计数

local knight_display_info = {
   _data = {   
    [1] = {1,1,1,400050,1,1000,1,200015,0,800,1,400050,1,1000,1,0,0,0,"res_id","res_id_1","scale_0","scale_1","if_flip_0","if_flip_1","type_0","type_1",8,},  
    [2] = {2,2,1,400050,0,1000,1,700130,0,750,1,400050,0,1000,1,0,0,0,"res_id","res_id_1","scale_0","scale_1","if_flip_0","if_flip_1","type_0","type_1",8,},  
    [3] = {3,3,1,600080,1,650,1,0,0,0,1,600080,0,1000,1,0,0,0,"res_id","res_id_1","scale_0","scale_1","if_flip_0","if_flip_1","type_0","type_1",8,},  
    [4] = {4,4,1,400050,1,1000,1,700130,1,800,1,400050,1,1000,1,0,0,0,"res_id","res_id_1","scale_0","scale_1","if_flip_0","if_flip_1","type_0","type_1",8,},  
    [5] = {5,5,1,400050,1,1000,1,700130,1,800,1,400050,1,1000,1,0,0,0,"res_id","res_id_1","scale_0","scale_1","if_flip_0","if_flip_1","type_0","type_1",8,},  
    [6] = {6,6,1,600080,0,1000,1,700130,1,800,1,600080,0,1000,1,0,0,0,"res_id","res_id_1","scale_0","scale_1","if_flip_0","if_flip_1","type_0","type_1",8,},  
    [7] = {7,7,2,400050,0,1000,2,700090,0,600,2,400050,0,1000,2,0,0,0,"res_id","res_id_1","scale_0","scale_1","if_flip_0","if_flip_1","type_0","type_1",8,},  
    [8] = {8,8,3,300420,0,1000,3,300590,1,700,3,300420,0,1000,3,0,0,0,"res_id","res_id_1","scale_0","scale_1","if_flip_0","if_flip_1","type_0","type_1",8,},  
    [9] = {9,9,3,300420,0,1000,3,300590,1,800,3,300420,0,1000,3,0,0,0,"res_id","res_id_1","scale_0","scale_1","if_flip_0","if_flip_1","type_0","type_1",8,},  
    [10] = {10,10,2,300420,0,1000,3,300590,1,800,2,300420,0,1000,2,0,0,0,"res_id","res_id_1","scale_0","scale_1","if_flip_0","if_flip_1","type_0","type_1",8,},  
    [11] = {11,11,2,300420,1,1000,3,300590,0,800,2,300420,1,1000,2,0,0,0,"res_id","res_id_1","scale_0","scale_1","if_flip_0","if_flip_1","type_0","type_1",8,},  
    [12] = {12,12,2,300420,1,1000,2,0,0,0,2,300420,1,1000,2,0,0,0,"res_id","res_id_1","scale_0","scale_1","if_flip_0","if_flip_1","type_0","type_1",8,},  
    [13] = {13,13,3,300420,1,1000,3,300590,1,800,3,300420,1,1000,3,0,0,0,"res_id","res_id_1","scale_0","scale_1","if_flip_0","if_flip_1","type_0","type_1",8,},  
    [14] = {14,14,1,400050,0,1000,1,700130,0,520,1,400050,0,1000,1,0,0,0,"res_id","res_id_1","scale_0","scale_1","if_flip_0","if_flip_1","type_0","type_1",8,},
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
    [14] = 14,
}

local __key_map = { 
    id = 1,
    interface = 2,
    type_0 = 3,
    res_id = 4,
    if_flip_0 = 5,
    scale_0 = 6,
    type_1 = 7,
    res_id_1 = 8,
    if_flip_1 = 9,
    scale_1 = 10,
    type_0_other = 11,
    res_id_other = 12,
    if_flip_0_other = 13,
    scale_0_other = 14,
    type_1_other = 15,
    res_id_1_other = 16,
    if_flip_1_other = 17,
    scale_1_other = 18,
    change1 = 19,
    change2 = 20,
    change3 = 21,
    change4 = 22,
    change5 = 23,
    change6 = 24,
    change7 = 25,
    change8 = 26,
    count = 27,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_knight_display_info")

        return t._raw[__key_map[k]]
    end
}


function knight_display_info.getLength()
    return #knight_display_info._data
end



function knight_display_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_knight_display_info
function knight_display_info.indexOf(index)
    if index == nil or not knight_display_info._data[index] then
        return nil
    end
    return setmetatable({_raw = knight_display_info._data[index]}, m)
end



---
--@return @class record_knight_display_info
function knight_display_info.get(id)
    
    return knight_display_info.indexOf(__index_id[ id ])
     
end



function knight_display_info.set(id, key, value)
    local record = knight_display_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function knight_display_info.get_index_data()
    return __index_id 
end

return  knight_display_info 