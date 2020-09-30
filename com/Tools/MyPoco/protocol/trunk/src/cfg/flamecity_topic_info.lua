---@classdef record_flamecity_topic_info
local record_flamecity_topic_info = {}


record_flamecity_topic_info.id = 0--id
record_flamecity_topic_info.name =  ""--主题名称
record_flamecity_topic_info.if_open = 0--是否开启
record_flamecity_topic_info.chapter_1 = 0--章节1
record_flamecity_topic_info.chapter_2 = 0--章节2
record_flamecity_topic_info.chapter_3 = 0--章节3
record_flamecity_topic_info.chapter_4 = 0--章节4
record_flamecity_topic_info.chapter_5 = 0--章节5
record_flamecity_topic_info.chapter_6 = 0--章节6
record_flamecity_topic_info.chapter_7 = 0--章节7
record_flamecity_topic_info.chapter_8 = 0--章节8
record_flamecity_topic_info.chapter_9 = 0--章节9
record_flamecity_topic_info.chapter_10 = 0--章节10

local flamecity_topic_info = {
   _data = {   
    [1] = {101,"诸侯伐董",1,1,2,3,4,5,6,7,8,0,0,},
    }
}

local __index_id = {   
    [101] = 1,
}

local __key_map = { 
    id = 1,
    name = 2,
    if_open = 3,
    chapter_1 = 4,
    chapter_2 = 5,
    chapter_3 = 6,
    chapter_4 = 7,
    chapter_5 = 8,
    chapter_6 = 9,
    chapter_7 = 10,
    chapter_8 = 11,
    chapter_9 = 12,
    chapter_10 = 13,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_flamecity_topic_info")

        return t._raw[__key_map[k]]
    end
}


function flamecity_topic_info.getLength()
    return #flamecity_topic_info._data
end



function flamecity_topic_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_flamecity_topic_info
function flamecity_topic_info.indexOf(index)
    if index == nil or not flamecity_topic_info._data[index] then
        return nil
    end
    return setmetatable({_raw = flamecity_topic_info._data[index]}, m)
end



---
--@return @class record_flamecity_topic_info
function flamecity_topic_info.get(id)
    
    return flamecity_topic_info.indexOf(__index_id[ id ])
     
end



function flamecity_topic_info.set(id, key, value)
    local record = flamecity_topic_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function flamecity_topic_info.get_index_data()
    return __index_id 
end

return  flamecity_topic_info 