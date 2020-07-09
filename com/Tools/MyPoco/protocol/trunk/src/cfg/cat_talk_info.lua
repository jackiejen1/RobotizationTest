---@classdef record_cat_talk_info
local record_cat_talk_info = {}


record_cat_talk_info.id = 0--id
record_cat_talk_info.type = 0--类型
record_cat_talk_info.value =  ""--参数
record_cat_talk_info.proportion = 0--权重

local cat_talk_info = {
   _data = {   
    [1] = {1,1,"1",1000,},  
    [2] = {2,1,"2",1000,},  
    [3] = {3,1,"19",1000,},  
    [4] = {4,1,"7",1000,},  
    [5] = {5,1,"27",1000,},  
    [6] = {6,1,"52",1000,},  
    [7] = {7,1,"39",1000,},  
    [8] = {8,1,"53",1000,},  
    [9] = {9,2,"吼吼！！是谁打扰我睡觉！",1000,},  
    [10] = {10,2,"没带鱼来，不准跟我讲话喵！",1000,},  
    [11] = {11,2,"唔，好久没吃到新鲜的鱼了喵！",1000,},  
    [12] = {12,2,"没有鱼吃的日子好无聊喵……",1000,},  
    [13] = {13,2,"鱼……闻到鱼的香味了……",1000,},  
    [14] = {14,2,"啦啦啦，又是有鱼吃的一天喵~",1000,},  
    [15] = {15,2,"熟悉的气味…喵呜…想不起来喵……",1000,},  
    [16] = {16,2,"喵呜，什么时候才能再见到貂蝉小姐姐呢？",1000,},  
    [17] = {17,2,"喵喵喵，貂蝉小姐姐好温柔喵~",1000,},  
    [18] = {18,2,"你！你身上怎么有貂蝉小姐姐的气味喵！",1000,},
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
}

local __key_map = { 
    id = 1,
    type = 2,
    value = 3,
    proportion = 4,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_cat_talk_info")

        return t._raw[__key_map[k]]
    end
}


function cat_talk_info.getLength()
    return #cat_talk_info._data
end



function cat_talk_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_cat_talk_info
function cat_talk_info.indexOf(index)
    if index == nil or not cat_talk_info._data[index] then
        return nil
    end
    return setmetatable({_raw = cat_talk_info._data[index]}, m)
end



---
--@return @class record_cat_talk_info
function cat_talk_info.get(id)
    
    return cat_talk_info.indexOf(__index_id[ id ])
     
end



function cat_talk_info.set(id, key, value)
    local record = cat_talk_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function cat_talk_info.get_index_data()
    return __index_id 
end

return  cat_talk_info 