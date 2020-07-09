---@classdef record_order_world_bubble_info
local record_order_world_bubble_info = {}


record_order_world_bubble_info.id = 0--id
record_order_world_bubble_info.play_time = 0--播放条件
record_order_world_bubble_info.play_num = 0--条件目标值
record_order_world_bubble_info.play_pro = 0--播放权重
record_order_world_bubble_info.text =  ""--气泡文本
record_order_world_bubble_info.action =  ""--播放动作
record_order_world_bubble_info.emo =  ""--结束后表情

local order_world_bubble_info = {
   _data = {   
    [1] = {1,1,30,500,"我等谨遵将令，招兵买马以安天下！","show","7",},  
    [2] = {2,1,100,500,"精兵良将尽在此处，我等枕戈待旦！","show","8",},  
    [3] = {3,1,150,500,"兵锋所指，所向披靡，披坚执锐，号令天下！","show","9",},  
    [4] = {4,1,500,500,"招兵买马，将军功不可没！","show","10",},  
    [5] = {5,1,2000,500,"我等以将军马首是瞻！","show","11",},  
    [6] = {6,1,5000,500,"将军有命，莫敢不从，纵千万人亦往！","show","12",},  
    [7] = {7,3,0,500,"养兵千日，用兵一时！","show","13",},  
    [8] = {8,3,0,500,"枕戈待旦，以待战事！","show","14",},  
    [9] = {9,3,0,500,"兵强马壮，才可号令天下！","show","15",},
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
}

local __key_map = { 
    id = 1,
    play_time = 2,
    play_num = 3,
    play_pro = 4,
    text = 5,
    action = 6,
    emo = 7,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_order_world_bubble_info")

        return t._raw[__key_map[k]]
    end
}


function order_world_bubble_info.getLength()
    return #order_world_bubble_info._data
end



function order_world_bubble_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_order_world_bubble_info
function order_world_bubble_info.indexOf(index)
    if index == nil or not order_world_bubble_info._data[index] then
        return nil
    end
    return setmetatable({_raw = order_world_bubble_info._data[index]}, m)
end



---
--@return @class record_order_world_bubble_info
function order_world_bubble_info.get(id)
    
    return order_world_bubble_info.indexOf(__index_id[ id ])
     
end



function order_world_bubble_info.set(id, key, value)
    local record = order_world_bubble_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function order_world_bubble_info.get_index_data()
    return __index_id 
end

return  order_world_bubble_info 