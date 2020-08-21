---@classdef record_flamecity_chapter_info
local record_flamecity_chapter_info = {}


record_flamecity_chapter_info.id = 0--id
record_flamecity_chapter_info.name =  ""--章节名称
record_flamecity_chapter_info.next_id = 0--下一章节
record_flamecity_chapter_info.map_id = 0--地图
record_flamecity_chapter_info.image = 0--图片
record_flamecity_chapter_info.order = 0--序号
record_flamecity_chapter_info.main_reward_type_1 = 0--主线奖励1类型
record_flamecity_chapter_info.main_reward_value_1 = 0--主线奖励1类型值
record_flamecity_chapter_info.main_reward_size_1 = 0--主线奖励1数量
record_flamecity_chapter_info.main_reward_type_2 = 0--主线奖励2类型
record_flamecity_chapter_info.main_reward_value_2 = 0--主线奖励2类型值
record_flamecity_chapter_info.main_reward_size_2 = 0--主线奖励2数量
record_flamecity_chapter_info.main_reward_type_3 = 0--主线奖励3类型
record_flamecity_chapter_info.main_reward_value_3 = 0--主线奖励3类型值
record_flamecity_chapter_info.main_reward_size_3 = 0--主线奖励3数量
record_flamecity_chapter_info.perfect_reward_type_1 = 0--完美奖励1类型
record_flamecity_chapter_info.perfect_reward_value_1 = 0--完美奖励1类型值
record_flamecity_chapter_info.perfect_reward_size_1 = 0--完美奖励1数量
record_flamecity_chapter_info.perfect_reward_type_2 = 0--完美奖励2类型
record_flamecity_chapter_info.perfect_reward_value_2 = 0--完美奖励2类型值
record_flamecity_chapter_info.perfect_reward_size_2 = 0--完美奖励2数量
record_flamecity_chapter_info.perfect_reward_type_3 = 0--完美奖励3类型
record_flamecity_chapter_info.perfect_reward_value_3 = 0--完美奖励3类型值
record_flamecity_chapter_info.perfect_reward_size_3 = 0--完美奖励3数量

local flamecity_chapter_info = {
   _data = {   
    [1] = {1,"攻打汜水关",2,101,101,1,999,0,100,1,3,999999,0,0,0,999,0,200,1,3,1999999,0,0,0,},  
    [2] = {2,"攻打虎牢关",3,102,102,2,999,0,100,1,3,999999,0,0,0,999,0,200,1,3,1999999,0,0,0,},  
    [3] = {3,"攻打洛阳",4,103,103,3,999,0,100,1,3,999999,0,0,0,999,0,200,1,3,1999999,0,0,0,},  
    [4] = {4,"攻打长安",0,104,104,4,999,0,100,1,3,999999,0,0,0,999,0,200,1,3,1999999,0,0,0,},
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
    next_id = 3,
    map_id = 4,
    image = 5,
    order = 6,
    main_reward_type_1 = 7,
    main_reward_value_1 = 8,
    main_reward_size_1 = 9,
    main_reward_type_2 = 10,
    main_reward_value_2 = 11,
    main_reward_size_2 = 12,
    main_reward_type_3 = 13,
    main_reward_value_3 = 14,
    main_reward_size_3 = 15,
    perfect_reward_type_1 = 16,
    perfect_reward_value_1 = 17,
    perfect_reward_size_1 = 18,
    perfect_reward_type_2 = 19,
    perfect_reward_value_2 = 20,
    perfect_reward_size_2 = 21,
    perfect_reward_type_3 = 22,
    perfect_reward_value_3 = 23,
    perfect_reward_size_3 = 24,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_flamecity_chapter_info")

        return t._raw[__key_map[k]]
    end
}


function flamecity_chapter_info.getLength()
    return #flamecity_chapter_info._data
end



function flamecity_chapter_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_flamecity_chapter_info
function flamecity_chapter_info.indexOf(index)
    if index == nil or not flamecity_chapter_info._data[index] then
        return nil
    end
    return setmetatable({_raw = flamecity_chapter_info._data[index]}, m)
end



---
--@return @class record_flamecity_chapter_info
function flamecity_chapter_info.get(id)
    
    return flamecity_chapter_info.indexOf(__index_id[ id ])
     
end



function flamecity_chapter_info.set(id, key, value)
    local record = flamecity_chapter_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function flamecity_chapter_info.get_index_data()
    return __index_id 
end

return  flamecity_chapter_info 