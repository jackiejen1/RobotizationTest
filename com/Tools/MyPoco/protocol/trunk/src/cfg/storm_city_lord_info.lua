---@classdef record_storm_city_lord_info
local record_storm_city_lord_info = {}


record_storm_city_lord_info.id = 0--id
record_storm_city_lord_info.name =  ""--官职名称
record_storm_city_lord_info.quality = 0--官职品质
record_storm_city_lord_info.order = 0--官职列表排序
record_storm_city_lord_info.res = 0--官职资源图片
record_storm_city_lord_info.description =  ""--官职描述
record_storm_city_lord_info.reward_type1 = 0--每日奖励类型1
record_storm_city_lord_info.reward_value1 = 0--每日奖励类型值1
record_storm_city_lord_info.reward_size1 = 0--每日奖励数量1
record_storm_city_lord_info.reward_type2 = 0--每日奖励类型2
record_storm_city_lord_info.reward_value2 = 0--每日奖励类型值2
record_storm_city_lord_info.reward_size2 = 0--每日奖励数量2
record_storm_city_lord_info.reward_type3 = 0--每日奖励类型3
record_storm_city_lord_info.reward_value3 = 0--每日奖励类型值3
record_storm_city_lord_info.reward_size3 = 0--每日奖励数量3
record_storm_city_lord_info.reward_type4 = 0--每日奖励类型4
record_storm_city_lord_info.reward_value4 = 0--每日奖励类型值4
record_storm_city_lord_info.reward_size4 = 0--每日奖励数量4

local storm_city_lord_info = {
   _data = {   
    [1] = {101,"霸主",7,10,9,"排名第1名获得",1,25,2000,3,2,100,1,3,100000,0,0,0,},  
    [2] = {102,"都督",6,20,8,"排名第2~3名获得",1,25,1800,3,2,90,1,3,90000,0,0,0,},  
    [3] = {103,"将军",6,30,7,"排名第4~5名获得",1,25,1600,3,2,80,1,3,80000,0,0,0,},  
    [4] = {104,"郎将",5,40,6,"排名第6~10名获得",1,25,1400,3,2,70,1,3,70000,0,0,0,},  
    [5] = {105,"偏将",5,50,5,"排名第11~30名获得",1,25,1200,3,2,60,1,3,60000,0,0,0,},  
    [6] = {106,"校尉",5,60,4,"排名第31~100名获得",1,25,1000,3,2,50,1,3,50000,0,0,0,},  
    [7] = {107,"散骑",4,70,3,"排名第101~300名获得",1,25,800,3,2,40,1,3,40000,0,0,0,},  
    [8] = {108,"伯长",3,80,2,"排名第301~800名获得",1,25,600,3,2,30,1,3,30000,0,0,0,},  
    [9] = {109,"伍长",2,90,1,"排名第801~2000名获得",1,25,500,3,2,20,1,3,20000,0,0,0,},
    }
}

local __index_id = {   
    [101] = 1,  
    [102] = 2,  
    [103] = 3,  
    [104] = 4,  
    [105] = 5,  
    [106] = 6,  
    [107] = 7,  
    [108] = 8,  
    [109] = 9,
}

local __key_map = { 
    id = 1,
    name = 2,
    quality = 3,
    order = 4,
    res = 5,
    description = 6,
    reward_type1 = 7,
    reward_value1 = 8,
    reward_size1 = 9,
    reward_type2 = 10,
    reward_value2 = 11,
    reward_size2 = 12,
    reward_type3 = 13,
    reward_value3 = 14,
    reward_size3 = 15,
    reward_type4 = 16,
    reward_value4 = 17,
    reward_size4 = 18,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_storm_city_lord_info")

        return t._raw[__key_map[k]]
    end
}


function storm_city_lord_info.getLength()
    return #storm_city_lord_info._data
end



function storm_city_lord_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_storm_city_lord_info
function storm_city_lord_info.indexOf(index)
    if index == nil or not storm_city_lord_info._data[index] then
        return nil
    end
    return setmetatable({_raw = storm_city_lord_info._data[index]}, m)
end



---
--@return @class record_storm_city_lord_info
function storm_city_lord_info.get(id)
    
    return storm_city_lord_info.indexOf(__index_id[ id ])
     
end



function storm_city_lord_info.set(id, key, value)
    local record = storm_city_lord_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function storm_city_lord_info.get_index_data()
    return __index_id 
end

return  storm_city_lord_info 