---@classdef record_warlord_info
local record_warlord_info = {}


record_warlord_info.id = 0--id
record_warlord_info.monster_team = 0--怪物阵容
record_warlord_info.skill_rule = 0--技能释放规则
record_warlord_info.change_type = 0--二阶段变身条件类型
record_warlord_info.change_value1 = 0--二阶段变身条件值1
record_warlord_info.change_value2 = 0--二阶段变身条件值2
record_warlord_info.change_id = 0--二阶段怪物bossid
record_warlord_info.change_knight = 0--变身形象
record_warlord_info.change_story = 0--变身剧情
record_warlord_info.start_story = 0--起始剧情（作废）
record_warlord_info.warlord_name =  ""--怪物名
record_warlord_info.warlord_id = 0--怪物所属id

local warlord_info = {
   _data = {   
    [1] = {1,190001,1,1,1,600,2,600080,0,0,"张角",1,},  
    [2] = {2,190001,2,1,2,300,5,600080,2492,0,"张角",1,},  
    [3] = {3,190002,3,0,0,0,0,300120,0,0,"鬼兵·苍天",3,},  
    [4] = {4,190002,4,0,0,0,0,300120,0,0,"鬼兵·已死",4,},  
    [5] = {5,190001,5,0,0,0,0,600080,2493,0,"天公将军",1,},  
    [6] = {6,190002,6,0,0,0,0,300120,0,0,"鬼兵·黄天",6,},  
    [7] = {7,190002,7,0,0,0,0,300120,0,0,"鬼兵·当立",7,},  
    [8] = {8,190001,8,1,8,700,9,500230,0,0,"董卓",8,},  
    [9] = {9,190001,9,1,9,500,10,500230,2494,0,"董卓",8,},  
    [10] = {10,190001,10,0,0,0,0,500230,2497,0,"西凉恶鬼",8,},  
    [11] = {11,190002,11,1,13,0,12,600070,0,0,"吕布",11,},  
    [12] = {12,190002,12,0,0,0,0,600070,2496,0,"鬼神吕布",11,},  
    [13] = {13,190002,13,0,0,0,0,510085,0,0,"貂蝉",13,},  
    [14] = {14,190001,14,1,14,900,18,500200,0,0,"袁绍",14,},  
    [15] = {15,190002,15,0,0,0,0,400140,0,0,"颜良",15,},  
    [16] = {16,190002,16,1,15,0,17,400150,0,0,"文丑",16,},  
    [17] = {17,190002,17,0,0,0,0,400150,2498,0,"文丑",16,},  
    [18] = {18,190001,18,1,18,500,19,500200,0,0,"袁绍",14,},  
    [19] = {19,190001,19,0,0,0,0,500200,2495,0,"河北霸主",14,},  
    [20] = {20,190002,20,0,0,0,0,300210,0,0,"龙炮车",20,},  
    [21] = {21,190002,21,0,0,0,0,300230,0,0,"投石车",21,},
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
    monster_team = 2,
    skill_rule = 3,
    change_type = 4,
    change_value1 = 5,
    change_value2 = 6,
    change_id = 7,
    change_knight = 8,
    change_story = 9,
    start_story = 10,
    warlord_name = 11,
    warlord_id = 12,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_warlord_info")

        return t._raw[__key_map[k]]
    end
}


function warlord_info.getLength()
    return #warlord_info._data
end



function warlord_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_warlord_info
function warlord_info.indexOf(index)
    if index == nil or not warlord_info._data[index] then
        return nil
    end
    return setmetatable({_raw = warlord_info._data[index]}, m)
end



---
--@return @class record_warlord_info
function warlord_info.get(id)
    
    return warlord_info.indexOf(__index_id[ id ])
     
end



function warlord_info.set(id, key, value)
    local record = warlord_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function warlord_info.get_index_data()
    return __index_id 
end

return  warlord_info 