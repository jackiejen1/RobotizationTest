---@classdef record_skill_image_info
local record_skill_image_info = {}


record_skill_image_info.id = 0--id
record_skill_image_info.image_type = 0--镜像类型
record_skill_image_info.image_value = 0--镜像数量
record_skill_image_info.release_action =  ""--释放镜像动作
record_skill_image_info.image_action =  ""--镜像出现动作
record_skill_image_info.image_knight_id = 0--镜像对应武将表id
record_skill_image_info.hp_inherit_type = 0--生命继承类型
record_skill_image_info.hp_inherit_num = 0--生命继承百分比
record_skill_image_info.attack_inherit_num = 0--攻击继承百分比
record_skill_image_info.defence_inherit_num = 0--防御继承百分比
record_skill_image_info.other_attributes_inherit_num = 0--其他属性继承百分比
record_skill_image_info.affect_type_1 = 0--加成属性1
record_skill_image_info.affect_value_1 = 0--加成类型值1
record_skill_image_info.affect_type_2 = 0--加成属性2
record_skill_image_info.affect_value_2 = 0--加成类型值2
record_skill_image_info.affect_type_3 = 0--加成属性3
record_skill_image_info.affect_value_3 = 0--加成类型值3
record_skill_image_info.affect_type_4 = 0--加成属性4
record_skill_image_info.affect_value_4 = 0--加成类型值4
record_skill_image_info.sound_image =  ""--变身音效

local skill_image_info = {
   _data = {   
    [1] = {1,1,1,"11","11",400010,1,1000,1000,1000,1000,1,10000,2,10000,3,10000,4,10000,"knight_sound/dongwu_hou.mp3",},  
    [2] = {2,1,1,"action_300040_show","action_500110_show",500110,1,1100,1100,1100,1100,1,10000,2,10000,3,10000,4,10000,"knight_sound/dongwu_hou.mp3",},  
    [3] = {3,2,5,"11","11",510040,2,1200,1200,1200,1200,1,10000,2,10000,3,10000,4,10000,"knight_sound/dongwu_hou.mp3",},  
    [4] = {100,1,1,"action_500020_show","action_500090_show",500090,2,1000,1000,1000,1000,0,0,0,0,0,0,0,0,"knight_sound/dongwu_hou.mp3",},  
    [5] = {101,1,1,"11","11",300240,2,1000,1000,1000,1000,509,500,511,150,513,500,515,150,"knight_sound/dongwu_hou.mp3",},  
    [6] = {102,1,1,"11","11",300260,2,1000,1000,1000,1000,0,0,0,0,0,0,0,0,"knight_sound/dongwu_hou.mp3",},  
    [7] = {103,2,5,"11","11",300150,2,600,1000,1000,1000,0,0,0,0,0,0,0,0,"knight_sound/dongwu_hou.mp3",},  
    [8] = {104,1,1,"action_600070_show","action_300360_ready",300360,2,800,1400,1000,1000,518,10000,520,10000,401,4,0,0,"knight_sound/Vo_LvBu_Wizard_Show_01.mp3",},  
    [9] = {105,1,1,"action_500230_show","action_300460_ready",300460,2,3500,1400,3000,1000,518,10000,520,10000,0,0,0,0,"knight_sound/Vo_LvBu_Wizard_Show_01.mp3",},  
    [10] = {200,1,1,"action_700130_ultimate_start_1","0",700140,1,1000,1000,1000,1000,1,10000,2,10000,3,10000,4,10000,"knight_sound/dongwu_hou.mp3",},  
    [11] = {201,1,1,"action_700130_ultimate_start_1","0",700141,1,1000,1000,1000,1000,1,10000,2,10000,3,10000,4,10000,"knight_sound/dongwu_hou.mp3",},  
    [12] = {202,1,1,"action_700130_ultimate_start_1","0",700142,1,1000,1000,1000,1000,1,10000,2,10000,3,10000,4,10000,"knight_sound/dongwu_hou.mp3",},  
    [13] = {203,1,1,"action_700130_ultimate_start_1","0",700143,1,1000,1000,1000,1000,1,10000,2,10000,3,10000,4,10000,"knight_sound/dongwu_hou.mp3",},  
    [14] = {204,1,1,"action_700130_ultimate_start_1","0",700144,1,1000,1000,1000,1000,1,10000,2,10000,3,10000,4,10000,"knight_sound/dongwu_hou.mp3",},  
    [15] = {205,1,1,"action_700130_ultimate_start_1","0",700145,1,1000,1000,1000,1000,1,10000,2,10000,3,10000,4,10000,"knight_sound/dongwu_hou.mp3",},  
    [16] = {206,1,1,"action_700130_ultimate_start_1","0",700146,1,1000,1000,1000,1000,1,10000,2,10000,3,10000,4,10000,"knight_sound/dongwu_hou.mp3",},  
    [17] = {207,1,1,"action_700130_ultimate_start_1","0",700147,1,1000,1000,1000,1000,1,10000,2,10000,3,10000,4,10000,"knight_sound/dongwu_hou.mp3",},
    }
}

local __index_id = {   
    [1] = 1,  
    [2] = 2,  
    [3] = 3,  
    [100] = 4,  
    [101] = 5,  
    [102] = 6,  
    [103] = 7,  
    [104] = 8,  
    [105] = 9,  
    [200] = 10,  
    [201] = 11,  
    [202] = 12,  
    [203] = 13,  
    [204] = 14,  
    [205] = 15,  
    [206] = 16,  
    [207] = 17,
}

local __key_map = { 
    id = 1,
    image_type = 2,
    image_value = 3,
    release_action = 4,
    image_action = 5,
    image_knight_id = 6,
    hp_inherit_type = 7,
    hp_inherit_num = 8,
    attack_inherit_num = 9,
    defence_inherit_num = 10,
    other_attributes_inherit_num = 11,
    affect_type_1 = 12,
    affect_value_1 = 13,
    affect_type_2 = 14,
    affect_value_2 = 15,
    affect_type_3 = 16,
    affect_value_3 = 17,
    affect_type_4 = 18,
    affect_value_4 = 19,
    sound_image = 20,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_skill_image_info")

        return t._raw[__key_map[k]]
    end
}


function skill_image_info.getLength()
    return #skill_image_info._data
end



function skill_image_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_skill_image_info
function skill_image_info.indexOf(index)
    if index == nil or not skill_image_info._data[index] then
        return nil
    end
    return setmetatable({_raw = skill_image_info._data[index]}, m)
end



---
--@return @class record_skill_image_info
function skill_image_info.get(id)
    
    return skill_image_info.indexOf(__index_id[ id ])
     
end



function skill_image_info.set(id, key, value)
    local record = skill_image_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function skill_image_info.get_index_data()
    return __index_id 
end

return  skill_image_info 