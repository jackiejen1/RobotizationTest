---@classdef record_advertisement_info
local record_advertisement_info = {}


record_advertisement_info.id = 0--ID
record_advertisement_info.route_id =  ""--跳转id
record_advertisement_info.adv_type = 0--广告类型
record_advertisement_info.function_id = 0--功能id
record_advertisement_info.view_type = 0--预览类型
record_advertisement_info.view_value = 0--预览类型值
record_advertisement_info.time_type = 0--时间类型
record_advertisement_info.start_time =  ""--开启时间
record_advertisement_info.end_time =  ""--结束时间
record_advertisement_info.if_time = 0--时间显示
record_advertisement_info.open_day = 0--开服时间
record_advertisement_info.image = 0--对应图片
record_advertisement_info.effect =  ""--对应特效
record_advertisement_info.order = 0--排序
record_advertisement_info.tips =  ""--提示

local advertisement_info = {
   _data = {   
    [1] = {1,"200067",1,20053,0,0,1,"1","4",1,1,26,"0",1,"30级开启，将军快去提升等级吧！",},  
    [2] = {2,"109",1,20029,0,0,1,"4","8",1,1,27,"0",1,"15级开启，将军快去提升等级吧！",},  
    [3] = {5,"162",1,10033,0,0,3,"60000","62200",1,1,6,"0",1,"48级开启，将军快去提升等级吧！",},  
    [4] = {6,"162",2,10033,0,0,3,"62200","10000",1,1,7,"0",1,"48级开启，将军快去提升等级吧！",},  
    [5] = {7,"177",1,20070,0,0,1,"5","6",0,1,10,"0",1,"开服第五天中午12点开启，敬请期待！",},  
    [6] = {8,"177",1,20070,0,0,3,"50000","60000",0,13,15,"0",1,"中午12点开启新赛季，敬请期待！",},  
    [7] = {9,"200068",1,20056,0,0,1,"4","7",1,1,22,"0",1,"20级开启，将军快去提升等级吧！",},  
    [8] = {10,"200068",1,20056,0,0,1,"7","10",1,1,3,"0",1,"20级开启，将军快去提升等级吧！",},  
    [9] = {11,"200077",1,20069,0,0,1,"10","12",1,1,9,"0",1,"20级开启，将军快去提升等级吧！",},  
    [10] = {12,"200069",1,20054,14,3020,1,"12","14",1,1,8,"0",1,"15级开启，将军快去提升等级吧！",},  
    [11] = {13,"184",1,2001,0,0,1,"16","18",1,1,17,"0",1,"20级开启，将军快去提升等级吧！",},  
    [12] = {14,"200069",1,20054,14,3060,1,"18","20",1,1,19,"0",1,"15级开启，将军快去提升等级吧！",},  
    [13] = {15,"200069",1,20054,17,4010,1,"20","22",1,1,18,"0",1,"15级开启，将军快去提升等级吧！",},  
    [14] = {16,"200069",1,20054,17,4030,1,"30","31",1,1,24,"0",1,"15级开启，将军快去提升等级吧！",},
    }
}

local __index_id = {   
    [1] = 1,  
    [2] = 2,  
    [5] = 3,  
    [6] = 4,  
    [7] = 5,  
    [8] = 6,  
    [9] = 7,  
    [10] = 8,  
    [11] = 9,  
    [12] = 10,  
    [13] = 11,  
    [14] = 12,  
    [15] = 13,  
    [16] = 14,
}

local __key_map = { 
    id = 1,
    route_id = 2,
    adv_type = 3,
    function_id = 4,
    view_type = 5,
    view_value = 6,
    time_type = 7,
    start_time = 8,
    end_time = 9,
    if_time = 10,
    open_day = 11,
    image = 12,
    effect = 13,
    order = 14,
    tips = 15,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_advertisement_info")

        return t._raw[__key_map[k]]
    end
}


function advertisement_info.getLength()
    return #advertisement_info._data
end



function advertisement_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_advertisement_info
function advertisement_info.indexOf(index)
    if index == nil or not advertisement_info._data[index] then
        return nil
    end
    return setmetatable({_raw = advertisement_info._data[index]}, m)
end



---
--@return @class record_advertisement_info
function advertisement_info.get(id)
    
    return advertisement_info.indexOf(__index_id[ id ])
     
end



function advertisement_info.set(id, key, value)
    local record = advertisement_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function advertisement_info.get_index_data()
    return __index_id 
end

return  advertisement_info 