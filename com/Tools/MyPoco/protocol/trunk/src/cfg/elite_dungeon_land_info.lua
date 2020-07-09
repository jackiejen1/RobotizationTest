---@classdef record_elite_dungeon_land_info
local record_elite_dungeon_land_info = {}


record_elite_dungeon_land_info.id = 0--id
record_elite_dungeon_land_info.next_id = 0--下个章节
record_elite_dungeon_land_info.number =  ""--版块序号
record_elite_dungeon_land_info.name =  ""--版块名称
record_elite_dungeon_land_info.stage_map = 0--板块地图文件
record_elite_dungeon_land_info.ctrl_id = 0--章节配置文件
record_elite_dungeon_land_info.chapter_1 = 0--章节1
record_elite_dungeon_land_info.chapter_2 = 0--章节2
record_elite_dungeon_land_info.chapter_3 = 0--章节3
record_elite_dungeon_land_info.chapter_4 = 0--章节4
record_elite_dungeon_land_info.chapter_5 = 0--章节5
record_elite_dungeon_land_info.chapter_6 = 0--章节6
record_elite_dungeon_land_info.chapter_7 = 0--章节7
record_elite_dungeon_land_info.chapter_8 = 0--章节8
record_elite_dungeon_land_info.chapter_9 = 0--章节9
record_elite_dungeon_land_info.chapter_10 = 0--章节10

local elite_dungeon_land_info = {
   _data = {   
    [1] = {1,2,"一","初入试炼",4,402,1,2,3,4,5,0,0,0,0,0,},  
    [2] = {2,0,"二","过关斩将",3,301,6,7,8,9,10,0,0,0,0,0,},
    }
}

local __index_id = {   
    [1] = 1,  
    [2] = 2,
}

local __key_map = { 
    id = 1,
    next_id = 2,
    number = 3,
    name = 4,
    stage_map = 5,
    ctrl_id = 6,
    chapter_1 = 7,
    chapter_2 = 8,
    chapter_3 = 9,
    chapter_4 = 10,
    chapter_5 = 11,
    chapter_6 = 12,
    chapter_7 = 13,
    chapter_8 = 14,
    chapter_9 = 15,
    chapter_10 = 16,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_elite_dungeon_land_info")

        return t._raw[__key_map[k]]
    end
}


function elite_dungeon_land_info.getLength()
    return #elite_dungeon_land_info._data
end



function elite_dungeon_land_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_elite_dungeon_land_info
function elite_dungeon_land_info.indexOf(index)
    if index == nil or not elite_dungeon_land_info._data[index] then
        return nil
    end
    return setmetatable({_raw = elite_dungeon_land_info._data[index]}, m)
end



---
--@return @class record_elite_dungeon_land_info
function elite_dungeon_land_info.get(id)
    
    return elite_dungeon_land_info.indexOf(__index_id[ id ])
     
end



function elite_dungeon_land_info.set(id, key, value)
    local record = elite_dungeon_land_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function elite_dungeon_land_info.get_index_data()
    return __index_id 
end

return  elite_dungeon_land_info 