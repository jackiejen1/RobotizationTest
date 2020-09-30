---@classdef record_elite_dungeon_achievement_info
local record_elite_dungeon_achievement_info = {}


record_elite_dungeon_achievement_info.id = 0--id
record_elite_dungeon_achievement_info.next_id = 0--下一阶段id
record_elite_dungeon_achievement_info.des =  ""--描述信息
record_elite_dungeon_achievement_info.star = 0--星数条件
record_elite_dungeon_achievement_info.type_1 = 0--奖励类型1
record_elite_dungeon_achievement_info.value_1 = 0--奖励类型值1
record_elite_dungeon_achievement_info.size_1 = 0--奖励数量1
record_elite_dungeon_achievement_info.type_2 = 0--奖励类型2
record_elite_dungeon_achievement_info.value_2 = 0--奖励类型值2
record_elite_dungeon_achievement_info.size_2 = 0--奖励数量2
record_elite_dungeon_achievement_info.type_3 = 0--奖励类型3
record_elite_dungeon_achievement_info.value_3 = 0--奖励类型值3
record_elite_dungeon_achievement_info.size_3 = 0--奖励数量3
record_elite_dungeon_achievement_info.type_4 = 0--奖励类型4
record_elite_dungeon_achievement_info.value_4 = 0--奖励类型值4
record_elite_dungeon_achievement_info.size_4 = 0--奖励数量4
record_elite_dungeon_achievement_info.type_5 = 0--奖励类型5
record_elite_dungeon_achievement_info.value_5 = 0--奖励类型值5
record_elite_dungeon_achievement_info.size_5 = 0--奖励数量5

local elite_dungeon_achievement_info = {
   _data = {   
    [1] = {1,2,"总星数达到30",30,3,203,2,999,0,2888,3,205,5,0,0,0,0,0,0,},  
    [2] = {2,3,"总星数达到60",60,3,203,2,999,0,2888,3,205,5,0,0,0,0,0,0,},  
    [3] = {3,4,"总星数达到90",90,3,203,2,999,0,2888,3,205,5,0,0,0,0,0,0,},  
    [4] = {4,5,"总星数达到120",120,3,203,2,999,0,2888,3,205,5,0,0,0,0,0,0,},  
    [5] = {5,6,"总星数达到150",150,3,203,2,999,0,2888,3,205,5,0,0,0,0,0,0,},  
    [6] = {6,7,"总星数达到180",180,3,203,2,999,0,2888,3,205,5,0,0,0,0,0,0,},  
    [7] = {7,8,"总星数达到210",210,3,203,2,999,0,2888,3,205,5,0,0,0,0,0,0,},  
    [8] = {8,9,"总星数达到240",240,3,203,2,999,0,2888,3,205,5,0,0,0,0,0,0,},  
    [9] = {9,10,"总星数达到270",270,3,203,2,999,0,2888,3,205,5,0,0,0,0,0,0,},  
    [10] = {10,11,"总星数达到300",300,3,203,2,999,0,2888,3,205,5,0,0,0,0,0,0,},  
    [11] = {11,12,"总星数达到330",330,3,203,2,999,0,2888,3,205,5,0,0,0,0,0,0,},  
    [12] = {12,13,"总星数达到360",360,3,203,2,999,0,2888,3,205,5,0,0,0,0,0,0,},  
    [13] = {13,14,"总星数达到390",390,3,203,2,999,0,2888,3,205,5,0,0,0,0,0,0,},  
    [14] = {14,15,"总星数达到420",420,3,203,2,999,0,2888,3,205,5,0,0,0,0,0,0,},  
    [15] = {15,0,"总星数达到450",450,3,203,2,999,0,2888,3,205,5,0,0,0,0,0,0,},
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
}

local __key_map = { 
    id = 1,
    next_id = 2,
    des = 3,
    star = 4,
    type_1 = 5,
    value_1 = 6,
    size_1 = 7,
    type_2 = 8,
    value_2 = 9,
    size_2 = 10,
    type_3 = 11,
    value_3 = 12,
    size_3 = 13,
    type_4 = 14,
    value_4 = 15,
    size_4 = 16,
    type_5 = 17,
    value_5 = 18,
    size_5 = 19,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_elite_dungeon_achievement_info")

        return t._raw[__key_map[k]]
    end
}


function elite_dungeon_achievement_info.getLength()
    return #elite_dungeon_achievement_info._data
end



function elite_dungeon_achievement_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_elite_dungeon_achievement_info
function elite_dungeon_achievement_info.indexOf(index)
    if index == nil or not elite_dungeon_achievement_info._data[index] then
        return nil
    end
    return setmetatable({_raw = elite_dungeon_achievement_info._data[index]}, m)
end



---
--@return @class record_elite_dungeon_achievement_info
function elite_dungeon_achievement_info.get(id)
    
    return elite_dungeon_achievement_info.indexOf(__index_id[ id ])
     
end



function elite_dungeon_achievement_info.set(id, key, value)
    local record = elite_dungeon_achievement_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function elite_dungeon_achievement_info.get_index_data()
    return __index_id 
end

return  elite_dungeon_achievement_info 