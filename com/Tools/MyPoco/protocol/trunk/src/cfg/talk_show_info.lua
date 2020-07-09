---@classdef record_talk_show_info
local record_talk_show_info = {}


record_talk_show_info.id = 0--id
record_talk_show_info.function_type = 0--对应功能
record_talk_show_info.group = 0--组
record_talk_show_info.name =  ""--名称
record_talk_show_info.type = 0--页签类型
record_talk_show_info.order = 0--排序值
record_talk_show_info.time_type = 0--时效类型
record_talk_show_info.time_num = 0--时效类型值
record_talk_show_info.open_type = 0--激活类型
record_talk_show_info.min_value = 0--激活最小值
record_talk_show_info.max_value = 0--激活最大值
record_talk_show_info.res =  ""--资源
record_talk_show_info.icon =  ""--图标
record_talk_show_info.description =  ""--描述
record_talk_show_info.bag = 0--表情包
record_talk_show_info.route = 0--跳转按钮
record_talk_show_info.op_game_id = 0--可见运营平台

local talk_show_info = {
   _data = {   
    [1] = {1,1,1,"三国经典",1,1,1,0,1,1,999,"101","101","少年经典聊天气泡",0,0,0,},  
    [2] = {2,1,2,"一方诸侯气泡",3,1,1,0,3,95,0,"102","102","城池争霸宏图霸主获取",0,1,0,},  
    [3] = {3,1,3,"四海霸王气泡",3,2,1,0,3,96,0,"103","103","城池争霸宏图霸主获取",0,1,0,},  
    [4] = {4,2,4,"开心",1,1,1,0,1,1,999,"emoji_1001","2","开心",1,0,0,},  
    [5] = {5,2,5,"加油",1,2,1,0,1,1,999,"emoji_1002","2","加油",1,0,0,},  
    [6] = {6,2,6,"搓手",1,3,1,0,1,1,999,"emoji_1003","2","搓手",1,0,0,},  
    [7] = {7,2,7,"惊讶",1,4,1,0,1,1,999,"emoji_1004","2","惊讶",1,0,0,},  
    [8] = {8,2,8,"疑惑",1,5,1,0,1,1,999,"emoji_1007","2","疑惑",1,0,0,},  
    [9] = {9,2,9,"超凶",1,6,1,0,1,1,999,"emoji_1009","2","超凶",1,0,0,},  
    [10] = {10,2,10,"吃瓜",1,7,1,0,1,1,999,"emoji_1014","2","吃瓜",1,0,0,},  
    [11] = {11,2,11,"晚安",1,8,1,0,1,1,999,"emoji_1015","2","晚安",1,0,0,},  
    [12] = {12,2,12,"大哭",1,9,1,0,1,1,999,"emoji_1016","2","大哭",1,0,0,},  
    [13] = {13,2,13,"爱心",1,1,1,0,1,30,999,"emoji_2001","3","30级解锁",2,0,0,},  
    [14] = {14,2,14,"看好你哦",1,2,1,0,1,30,999,"emoji_2002","3","30级解锁",2,0,0,},  
    [15] = {15,2,15,"奶茶",1,3,1,0,1,30,999,"emoji_2003","3","30级解锁",2,0,0,},  
    [16] = {16,2,16,"耶",1,4,1,0,1,30,999,"emoji_2004","3","30级解锁",2,0,0,},  
    [17] = {17,2,17,"黑板",1,5,1,0,1,30,999,"emoji_2005","3","30级解锁",2,0,0,},  
    [18] = {18,2,18,"脸红",1,6,1,0,1,30,999,"emoji_2006","3","30级解锁",2,0,0,},  
    [19] = {19,2,19,"摊手",1,7,1,0,1,30,999,"emoji_2007","3","30级解锁",2,0,0,},  
    [20] = {20,2,20,"欧气",1,8,1,0,1,30,999,"emoji_2008","3","30级解锁",2,0,0,},  
    [21] = {21,2,21,"比心",1,9,1,0,1,30,999,"emoji_2009","3","30级解锁",2,0,0,},  
    [22] = {22,2,22,"好的",1,10,1,0,1,30,999,"emoji_2010","3","30级解锁",2,0,0,},  
    [23] = {23,2,23,"嘿嘿",1,11,1,0,1,30,999,"emoji_2011","3","30级解锁",2,0,0,},  
    [24] = {24,2,24,"思考",1,12,1,0,1,30,999,"emoji_2012","3","30级解锁",2,0,0,},  
    [25] = {25,2,25,"冲鸭",1,13,1,0,1,30,999,"emoji_2013","3","30级解锁",2,0,0,},  
    [26] = {26,2,26,"加油",1,14,1,0,1,30,999,"emoji_2014","3","30级解锁",2,0,0,},  
    [27] = {27,2,27,"太难了",1,15,1,0,1,30,999,"emoji_2015","3","30级解锁",2,0,0,},  
    [28] = {28,2,28,"赞",1,16,1,0,1,30,999,"emoji_2016","3","30级解锁",2,0,0,},
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
    [22] = 22,  
    [23] = 23,  
    [24] = 24,  
    [25] = 25,  
    [26] = 26,  
    [27] = 27,  
    [28] = 28,
}

local __key_map = { 
    id = 1,
    function_type = 2,
    group = 3,
    name = 4,
    type = 5,
    order = 6,
    time_type = 7,
    time_num = 8,
    open_type = 9,
    min_value = 10,
    max_value = 11,
    res = 12,
    icon = 13,
    description = 14,
    bag = 15,
    route = 16,
    op_game_id = 17,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_talk_show_info")

        return t._raw[__key_map[k]]
    end
}


function talk_show_info.getLength()
    return #talk_show_info._data
end



function talk_show_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_talk_show_info
function talk_show_info.indexOf(index)
    if index == nil or not talk_show_info._data[index] then
        return nil
    end
    return setmetatable({_raw = talk_show_info._data[index]}, m)
end



---
--@return @class record_talk_show_info
function talk_show_info.get(id)
    
    return talk_show_info.indexOf(__index_id[ id ])
     
end



function talk_show_info.set(id, key, value)
    local record = talk_show_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function talk_show_info.get_index_data()
    return __index_id 
end

return  talk_show_info 