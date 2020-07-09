---@classdef record_scroll_set_pic_info
local record_scroll_set_pic_info = {}


record_scroll_set_pic_info.id = 0--ID
record_scroll_set_pic_info.outer_pic_1 =  ""--集合入口图片1
record_scroll_set_pic_info.outer_pic_2 =  ""--集合入口图片2
record_scroll_set_pic_info.outer_pic_3 =  ""--集合入口图片3
record_scroll_set_pic_info.outer_pic_4 =  ""--集合入口图片4
record_scroll_set_pic_info.outer_pic_5 =  ""--集合入口图片5
record_scroll_set_pic_info.outer_pic_6 =  ""--集合入口图片6
record_scroll_set_pic_info.inter_pic =  ""--集合内部图片
record_scroll_set_pic_info.knight_id =  ""--武将立绘

local scroll_set_pic_info = {
   _data = {   
    [1] = {1,"a101.png","a102.png","a103.png","a104.png","","","","",},  
    [2] = {2,"b101.png","b102.png","","","","","","",},  
    [3] = {3,"a201.png","a202.png","","","","","","",},
    }
}

local __index_id = {   
    [1] = 1,  
    [2] = 2,  
    [3] = 3,
}

local __key_map = { 
    id = 1,
    outer_pic_1 = 2,
    outer_pic_2 = 3,
    outer_pic_3 = 4,
    outer_pic_4 = 5,
    outer_pic_5 = 6,
    outer_pic_6 = 7,
    inter_pic = 8,
    knight_id = 9,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_scroll_set_pic_info")

        return t._raw[__key_map[k]]
    end
}


function scroll_set_pic_info.getLength()
    return #scroll_set_pic_info._data
end



function scroll_set_pic_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_scroll_set_pic_info
function scroll_set_pic_info.indexOf(index)
    if index == nil or not scroll_set_pic_info._data[index] then
        return nil
    end
    return setmetatable({_raw = scroll_set_pic_info._data[index]}, m)
end



---
--@return @class record_scroll_set_pic_info
function scroll_set_pic_info.get(id)
    
    return scroll_set_pic_info.indexOf(__index_id[ id ])
     
end



function scroll_set_pic_info.set(id, key, value)
    local record = scroll_set_pic_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function scroll_set_pic_info.get_index_data()
    return __index_id 
end

return  scroll_set_pic_info 