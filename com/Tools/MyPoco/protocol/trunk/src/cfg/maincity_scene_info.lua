---@classdef record_maincity_scene_info
local record_maincity_scene_info = {}


record_maincity_scene_info.id = 0--主场景id
record_maincity_scene_info.name =  ""--主场景名字
record_maincity_scene_info.pic =  ""--缩略图
record_maincity_scene_info.daybg_id = 0--白天场景
record_maincity_scene_info.nightbg_id = 0--夜晚场景
record_maincity_scene_info.limit_item_id = 0--关联限时类道具id
record_maincity_scene_info.forever_item_id = 0--关联永久类道具id
record_maincity_scene_info.get_way =  ""--获取途径

local maincity_scene_info = {
   _data = {   
    [1] = {1,"新春佳节","bg_xinchunjiajie",3,4,0,0,"春节期间福利赠送",},  
    [2] = {2,"三国古城","bg_sanguogucheng",1,2,0,0,"默认地图",},  
    [3] = {3,"高宇楼台","bg_gaoyuloutai",5,6,0,0,"公测期间福利赠送",},  
    [4] = {4,"滨海玉殿","bg_zhuchengchangjing_04",7,8,0,0,"少年节福利赠送",},
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
    pic = 3,
    daybg_id = 4,
    nightbg_id = 5,
    limit_item_id = 6,
    forever_item_id = 7,
    get_way = 8,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_maincity_scene_info")

        return t._raw[__key_map[k]]
    end
}


function maincity_scene_info.getLength()
    return #maincity_scene_info._data
end



function maincity_scene_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_maincity_scene_info
function maincity_scene_info.indexOf(index)
    if index == nil or not maincity_scene_info._data[index] then
        return nil
    end
    return setmetatable({_raw = maincity_scene_info._data[index]}, m)
end



---
--@return @class record_maincity_scene_info
function maincity_scene_info.get(id)
    
    return maincity_scene_info.indexOf(__index_id[ id ])
     
end



function maincity_scene_info.set(id, key, value)
    local record = maincity_scene_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function maincity_scene_info.get_index_data()
    return __index_id 
end

return  maincity_scene_info 