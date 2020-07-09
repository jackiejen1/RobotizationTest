---@classdef record_biography_achievement_info
local record_biography_achievement_info = {}


record_biography_achievement_info.id = 0--id
record_biography_achievement_info.pic_type = 0--形象类型
record_biography_achievement_info.pic_value = 0--形象类型值
record_biography_achievement_info.des =  ""--描述信息
record_biography_achievement_info.title =  ""--标题
record_biography_achievement_info.chapter_id_1 = 0--通关条件1
record_biography_achievement_info.type_1 = 0--奖励类型1
record_biography_achievement_info.value_1 = 0--奖励类型值1
record_biography_achievement_info.size_1 = 0--奖励数量1
record_biography_achievement_info.chapter_id_2 = 0--通关条件2
record_biography_achievement_info.type_2 = 0--奖励类型2
record_biography_achievement_info.value_2 = 0--奖励类型值2
record_biography_achievement_info.size_2 = 0--奖励数量2
record_biography_achievement_info.chapter_id_3 = 0--通关条件3
record_biography_achievement_info.type_3 = 0--奖励类型3
record_biography_achievement_info.value_3 = 0--奖励类型值3
record_biography_achievement_info.size_3 = 0--奖励数量3
record_biography_achievement_info.chapter_id_4 = 0--通关条件4
record_biography_achievement_info.type_4 = 0--奖励类型4
record_biography_achievement_info.value_4 = 0--奖励类型值4
record_biography_achievement_info.size_4 = 0--奖励数量4
record_biography_achievement_info.chapter_id_5 = 0--通关条件5
record_biography_achievement_info.type_5 = 0--奖励类型5
record_biography_achievement_info.value_5 = 0--奖励类型值5
record_biography_achievement_info.size_5 = 0--奖励数量5

local biography_achievement_info = {
   _data = {   
    [1] = {1,1,400120,"主线副本星数突破，进度满可领取徐盛","zxcj_chengjiang.png",1,999,0,100,2,999,0,100,3,999,0,100,0,0,0,0,0,0,0,0,},  
    [2] = {2,2,400030,"主线副本星数突破，进度满可领取乐进","zxcj_chengjiang.png",4,999,0,100,5,999,0,100,6,999,0,100,7,999,0,100,8,999,0,100,},  
    [3] = {3,1,200000,"主线副本星数突破，进度满可领取大量元宝","zxcj_yuanbao.png",9,999,0,100,10,999,0,100,11,999,0,100,12,999,0,100,13,999,0,100,},
    }
}

local __index_id = {   
    [1] = 1,  
    [2] = 2,  
    [3] = 3,
}

local __key_map = { 
    id = 1,
    pic_type = 2,
    pic_value = 3,
    des = 4,
    title = 5,
    chapter_id_1 = 6,
    type_1 = 7,
    value_1 = 8,
    size_1 = 9,
    chapter_id_2 = 10,
    type_2 = 11,
    value_2 = 12,
    size_2 = 13,
    chapter_id_3 = 14,
    type_3 = 15,
    value_3 = 16,
    size_3 = 17,
    chapter_id_4 = 18,
    type_4 = 19,
    value_4 = 20,
    size_4 = 21,
    chapter_id_5 = 22,
    type_5 = 23,
    value_5 = 24,
    size_5 = 25,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_biography_achievement_info")

        return t._raw[__key_map[k]]
    end
}


function biography_achievement_info.getLength()
    return #biography_achievement_info._data
end



function biography_achievement_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_biography_achievement_info
function biography_achievement_info.indexOf(index)
    if index == nil or not biography_achievement_info._data[index] then
        return nil
    end
    return setmetatable({_raw = biography_achievement_info._data[index]}, m)
end



---
--@return @class record_biography_achievement_info
function biography_achievement_info.get(id)
    
    return biography_achievement_info.indexOf(__index_id[ id ])
     
end



function biography_achievement_info.set(id, key, value)
    local record = biography_achievement_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function biography_achievement_info.get_index_data()
    return __index_id 
end

return  biography_achievement_info 