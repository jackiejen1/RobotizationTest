---@classdef record_display_knight_info
local record_display_knight_info = {}


record_display_knight_info.id = 0--ID
record_display_knight_info.game_type = 0--显示包体
record_display_knight_info.interface = 0--使用界面
record_display_knight_info.type = 0--资源类型
record_display_knight_info.res_id_0 = 0--初始资源id
record_display_knight_info.if_flip_0 = 0--初始资源是否翻转
record_display_knight_info.res_id_1 = 0--替换资源id
record_display_knight_info.if_flip_1 = 0--替换资源是否翻转

local display_knight_info = {
   _data = {   
    [1] = {1,1,1,1,400050,1,700080,1,},  
    [2] = {2,1,2,1,400050,0,700080,0,},  
    [3] = {3,1,3,1,600080,0,700080,0,},  
    [4] = {4,1,4,1,400050,1,700080,1,},  
    [5] = {5,1,5,1,400050,1,700080,1,},  
    [6] = {6,1,6,1,600080,0,700080,0,},  
    [7] = {7,1,7,2,400050,0,700090,0,},  
    [8] = {8,1,8,1,600070,0,700080,0,},  
    [9] = {9,1,9,1,600070,0,700080,0,},  
    [10] = {10,1,10,2,300420,0,700080,0,},  
    [11] = {11,1,11,2,300420,1,700080,1,},  
    [12] = {12,1,12,2,300420,1,700080,1,},  
    [13] = {13,2,1,1,400050,1,0,1,},  
    [14] = {14,2,2,1,400050,0,0,0,},  
    [15] = {15,2,3,1,600080,0,0,0,},  
    [16] = {16,2,4,1,400050,1,0,1,},  
    [17] = {17,2,5,1,400050,1,0,1,},  
    [18] = {18,2,6,1,600080,0,0,0,},  
    [19] = {19,2,7,2,400050,0,0,0,},  
    [20] = {20,2,8,1,600070,0,0,0,},  
    [21] = {21,2,9,1,600070,0,0,0,},  
    [22] = {22,2,10,2,300420,0,0,0,},  
    [23] = {23,2,11,2,300420,1,0,1,},  
    [24] = {24,2,12,2,300420,1,0,1,},
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
    [15] = 15,  
    [16] = 16,  
    [17] = 17,  
    [18] = 18,  
    [19] = 19,  
    [20] = 20,  
    [21] = 21,  
    [22] = 22,  
    [23] = 23,  
    [24] = 24,
}

local __key_map = { 
    id = 1,
    game_type = 2,
    interface = 3,
    type = 4,
    res_id_0 = 5,
    if_flip_0 = 6,
    res_id_1 = 7,
    if_flip_1 = 8,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_display_knight_info")

        return t._raw[__key_map[k]]
    end
}


function display_knight_info.getLength()
    return #display_knight_info._data
end



function display_knight_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_display_knight_info
function display_knight_info.indexOf(index)
    if index == nil or not display_knight_info._data[index] then
        return nil
    end
    return setmetatable({_raw = display_knight_info._data[index]}, m)
end



---
--@return @class record_display_knight_info
function display_knight_info.get(id)
    
    return display_knight_info.indexOf(__index_id[ id ])
     
end



function display_knight_info.set(id, key, value)
    local record = display_knight_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function display_knight_info.get_index_data()
    return __index_id 
end

return  display_knight_info 