---@classdef record_ksoul_book_chapter_info
local record_ksoul_book_chapter_info = {}


record_ksoul_book_chapter_info.id = 0--ID
record_ksoul_book_chapter_info.name =  ""--名称
record_ksoul_book_chapter_info.image = 0--图片
record_ksoul_book_chapter_info.level = 0--开启等级
record_ksoul_book_chapter_info.unlock_type = 0--解锁条件
record_ksoul_book_chapter_info.unlock_value = 0--解锁条件值
record_ksoul_book_chapter_info.star_honor = 0--升星需求

local ksoul_book_chapter_info = {
   _data = {   
    [1] = {1,"忠肝义胆",1,80,1,0,6900,},  
    [2] = {2,"万里扬名",2,80,2,3,8500,},  
    [3] = {3,"天下名将",3,80,2,6,10100,},  
    [4] = {4,"人杰地灵",4,80,2,9,11700,},
    }
}

local __index_id = {   
    [1] = 1,  
    [2] = 2,  
    [3] = 3,  
    [4] = 4,
}

local __key_map = { 
    id = 1,
    name = 2,
    image = 3,
    level = 4,
    unlock_type = 5,
    unlock_value = 6,
    star_honor = 7,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_ksoul_book_chapter_info")

        return t._raw[__key_map[k]]
    end
}


function ksoul_book_chapter_info.getLength()
    return #ksoul_book_chapter_info._data
end



function ksoul_book_chapter_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_ksoul_book_chapter_info
function ksoul_book_chapter_info.indexOf(index)
    if index == nil or not ksoul_book_chapter_info._data[index] then
        return nil
    end
    return setmetatable({_raw = ksoul_book_chapter_info._data[index]}, m)
end



---
--@return @class record_ksoul_book_chapter_info
function ksoul_book_chapter_info.get(id)
    
    return ksoul_book_chapter_info.indexOf(__index_id[ id ])
     
end



function ksoul_book_chapter_info.set(id, key, value)
    local record = ksoul_book_chapter_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function ksoul_book_chapter_info.get_index_data()
    return __index_id 
end

return  ksoul_book_chapter_info 