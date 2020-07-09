---@classdef record_biography_boss_compose_info
local record_biography_boss_compose_info = {}


record_biography_boss_compose_info.id = 0--图鉴ID
record_biography_boss_compose_info.arrange = 0--排序
record_biography_boss_compose_info.name =  ""--名字
record_biography_boss_compose_info.res = 0--形象
record_biography_boss_compose_info.quality = 0--品质
record_biography_boss_compose_info.talk =  ""--气泡
record_biography_boss_compose_info.show_chapter =  ""--出现章节

local biography_boss_compose_info = {
   _data = {   
    [1] = {1,7,"吕布",300340,7,"特点：回怒，全体增伤","[18.典韦传]",},  
    [2] = {2,8,"关羽",300310,7,"特点：眩晕，清除增益","[18.典韦传]",},  
    [3] = {3,5,"典韦",510020,6,"特点：眩晕，无视防御","[8.孙尚香传]",},  
    [4] = {4,6,"陆逊",510050,6,"特点：灼烧，提高伤害减免","[8.孙尚香传]",},  
    [5] = {5,1,"张辽",500020,5,"特点：减怒，削减伤害减免","[1.刘备传]",},  
    [6] = {6,2,"于吉",500210,5,"特点：中毒，削减抗暴","[1.刘备传]",},  
    [7] = {7,3,"赵云",510040,5,"特点：自身回怒，增加伤害","[1.刘备传]",},  
    [8] = {8,4,"太史慈",500170,5,"特点：后排输出，额外暴击","[1.刘备传]",},
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
}

local __key_map = { 
    id = 1,
    arrange = 2,
    name = 3,
    res = 4,
    quality = 5,
    talk = 6,
    show_chapter = 7,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_biography_boss_compose_info")

        return t._raw[__key_map[k]]
    end
}


function biography_boss_compose_info.getLength()
    return #biography_boss_compose_info._data
end



function biography_boss_compose_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_biography_boss_compose_info
function biography_boss_compose_info.indexOf(index)
    if index == nil or not biography_boss_compose_info._data[index] then
        return nil
    end
    return setmetatable({_raw = biography_boss_compose_info._data[index]}, m)
end



---
--@return @class record_biography_boss_compose_info
function biography_boss_compose_info.get(id)
    
    return biography_boss_compose_info.indexOf(__index_id[ id ])
     
end



function biography_boss_compose_info.set(id, key, value)
    local record = biography_boss_compose_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function biography_boss_compose_info.get_index_data()
    return __index_id 
end

return  biography_boss_compose_info 