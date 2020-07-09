---@classdef record_guild_dungeon_chapter_info
local record_guild_dungeon_chapter_info = {}


record_guild_dungeon_chapter_info.id = 0--ID
record_guild_dungeon_chapter_info.name =  ""--章节名称
record_guild_dungeon_chapter_info.pic = 0--章节形象
record_guild_dungeon_chapter_info.x = 0--章节横坐标
record_guild_dungeon_chapter_info.y = 0--章节纵坐标
record_guild_dungeon_chapter_info.next_id = 0--下一章节
record_guild_dungeon_chapter_info.level = 0--开启军团等级
record_guild_dungeon_chapter_info.dungeon_1 = 0--关卡1
record_guild_dungeon_chapter_info.dungeon_2 = 0--关卡2
record_guild_dungeon_chapter_info.dungeon_3 = 0--关卡3
record_guild_dungeon_chapter_info.dungeon_4 = 0--关卡4
record_guild_dungeon_chapter_info.if_show = 0--是否显示奖励
record_guild_dungeon_chapter_info.first_clear_type_1 = 0--首通奖励1类型
record_guild_dungeon_chapter_info.first_clear_value_1 = 0--首通奖励1类型值
record_guild_dungeon_chapter_info.first_clear_size_1 = 0--首通奖励1数量
record_guild_dungeon_chapter_info.first_clear_type_2 = 0--首通奖励2类型
record_guild_dungeon_chapter_info.first_clear_value_2 = 0--首通奖励2类型值
record_guild_dungeon_chapter_info.first_clear_size_2 = 0--首通奖励2数量
record_guild_dungeon_chapter_info.first_clear_type_3 = 0--首通奖励3类型
record_guild_dungeon_chapter_info.first_clear_value_3 = 0--首通奖励3类型值
record_guild_dungeon_chapter_info.first_clear_size_3 = 0--首通奖励3数量

local guild_dungeon_chapter_info = {
   _data = {   
    [1] = {1,"桂阳",1,0,0,2,1,1,2,3,4,1,3,2,100,1,11,1000,1,3,50000,},  
    [2] = {2,"南郡",2,0,0,3,1,5,6,7,8,1,3,35,500,1,11,1500,1,3,100000,},  
    [3] = {3,"江夏",1,0,0,4,2,9,10,11,12,1,3,11,100,1,11,2000,1,3,150000,},  
    [4] = {4,"许昌",2,0,0,5,2,13,14,15,16,1,3,15,30,1,11,2500,1,3,200000,},  
    [5] = {5,"武昌",1,0,0,6,2,17,18,19,20,1,3,26,140,1,11,3000,1,3,250000,},  
    [6] = {6,"零陵",2,0,0,7,2,21,22,23,24,1,3,17,140,1,11,3500,1,3,300000,},  
    [7] = {7,"长沙",1,0,0,8,2,25,26,27,28,1,3,2,160,1,11,4000,1,3,350000,},  
    [8] = {8,"建业",2,0,0,9,2,29,30,31,32,1,3,35,800,1,11,4500,1,3,400000,},  
    [9] = {9,"永昌",1,0,0,10,2,33,34,35,36,1,3,11,180,1,11,5000,1,3,450000,},  
    [10] = {10,"武都",2,0,0,11,2,37,38,39,40,1,3,15,40,3,2010,2,1,3,500000,},  
    [11] = {11,"巴郡",1,0,0,12,2,41,42,43,44,1,3,26,200,1,11,6000,1,3,550000,},  
    [12] = {12,"阴平",2,0,0,13,2,45,46,47,48,1,3,17,200,1,11,6500,1,3,600000,},  
    [13] = {13,"广陵",1,0,0,14,2,49,50,51,52,1,3,2,220,1,11,7000,1,3,650000,},  
    [14] = {14,"白帝城",2,0,0,15,2,53,54,55,56,1,3,35,1100,1,11,7500,1,3,700000,},  
    [15] = {15,"濡须",1,0,0,16,2,57,58,59,60,1,3,11,240,1,11,8000,1,3,750000,},  
    [16] = {16,"成都",2,0,0,17,2,61,62,63,64,1,3,15,60,1,11,8500,1,3,800000,},  
    [17] = {17,"汉中",1,0,0,18,2,65,66,67,68,1,3,26,260,1,11,9000,1,3,850000,},  
    [18] = {18,"雁门",2,0,0,19,2,69,70,71,72,1,3,17,260,1,11,9500,1,3,900000,},  
    [19] = {19,"辽东",1,0,0,20,2,73,74,75,76,1,3,2,280,1,11,10000,1,3,950000,},  
    [20] = {20,"弘农",2,0,0,21,2,77,78,79,80,1,3,35,1400,3,2010,3,1,3,1000000,},  
    [21] = {21,"军团校场",1,0,0,0,2,81,82,83,84,0,0,0,0,0,0,0,0,0,0,},
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
}

local __key_map = { 
    id = 1,
    name = 2,
    pic = 3,
    x = 4,
    y = 5,
    next_id = 6,
    level = 7,
    dungeon_1 = 8,
    dungeon_2 = 9,
    dungeon_3 = 10,
    dungeon_4 = 11,
    if_show = 12,
    first_clear_type_1 = 13,
    first_clear_value_1 = 14,
    first_clear_size_1 = 15,
    first_clear_type_2 = 16,
    first_clear_value_2 = 17,
    first_clear_size_2 = 18,
    first_clear_type_3 = 19,
    first_clear_value_3 = 20,
    first_clear_size_3 = 21,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_guild_dungeon_chapter_info")

        return t._raw[__key_map[k]]
    end
}


function guild_dungeon_chapter_info.getLength()
    return #guild_dungeon_chapter_info._data
end



function guild_dungeon_chapter_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_guild_dungeon_chapter_info
function guild_dungeon_chapter_info.indexOf(index)
    if index == nil or not guild_dungeon_chapter_info._data[index] then
        return nil
    end
    return setmetatable({_raw = guild_dungeon_chapter_info._data[index]}, m)
end



---
--@return @class record_guild_dungeon_chapter_info
function guild_dungeon_chapter_info.get(id)
    
    return guild_dungeon_chapter_info.indexOf(__index_id[ id ])
     
end



function guild_dungeon_chapter_info.set(id, key, value)
    local record = guild_dungeon_chapter_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function guild_dungeon_chapter_info.get_index_data()
    return __index_id 
end

return  guild_dungeon_chapter_info 