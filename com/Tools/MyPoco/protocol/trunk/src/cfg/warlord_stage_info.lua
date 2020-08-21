---@classdef record_warlord_stage_info
local record_warlord_stage_info = {}


record_warlord_stage_info.id = 0--id
record_warlord_stage_info.activity_id = 0--活动轮次
record_warlord_stage_info.warlord_id = 0--BOSS_1阶段
record_warlord_stage_info.warlord_id_2 = 0--BOSS_2阶段
record_warlord_stage_info.warlord_id_3 = 0--BOSS_3阶段
record_warlord_stage_info.name =  ""--BOSS名称
record_warlord_stage_info.order = 0--开放顺序
record_warlord_stage_info.start_time = 0--开始时间
record_warlord_stage_info.finish_time = 0--结束时间
record_warlord_stage_info.map_id = 0--地图
record_warlord_stage_info.operator_id = 0--主角
record_warlord_stage_info.time_limit = 0--战斗限时
record_warlord_stage_info.reward_drop_id = 0--通关掉落
record_warlord_stage_info.rank_type = 0--排行榜
record_warlord_stage_info.stage_des =  ""--关卡名称
record_warlord_stage_info.pic = 0--关卡插画
record_warlord_stage_info.start_story = 0--起始剧情
record_warlord_stage_info.background =  ""--背景描述
record_warlord_stage_info.boss_image = 0--BOSS图片
record_warlord_stage_info.skill_1_id = 0--技能1
record_warlord_stage_info.skill_2_id = 0--技能2
record_warlord_stage_info.skill_3_id = 0--技能3
record_warlord_stage_info.skill_4_id = 0--技能4
record_warlord_stage_info.skill_5_id = 0--技能5
record_warlord_stage_info.skill_6_id = 0--技能6

local warlord_stage_info = {
   _data = {   
    [1] = {1,10001,1,2,5,"张角",1,0,172800,101,1,300,520002,25,"天公将军",101,10855,"张角BOSS描述文字",1,1001,1004,1010,1017,0,0,},  
    [2] = {2,10001,8,9,10,"董卓",2,172800,345600,102,2,300,520003,26,"西凉恶鬼",102,10856,"董卓BOSS描述文字",2,1020,1025,1036,1040,0,0,},  
    [3] = {3,10001,14,18,19,"袁绍",3,345600,604800,103,3,300,520004,27,"河北霸主",103,10857,"袁绍BOSS描述文字",3,1041,1042,1043,1044,1050,0,},
    }
}

local __index_id = {   
    [1] = 1,  
    [2] = 2,  
    [3] = 3,
}

local __key_map = { 
    id = 1,
    activity_id = 2,
    warlord_id = 3,
    warlord_id_2 = 4,
    warlord_id_3 = 5,
    name = 6,
    order = 7,
    start_time = 8,
    finish_time = 9,
    map_id = 10,
    operator_id = 11,
    time_limit = 12,
    reward_drop_id = 13,
    rank_type = 14,
    stage_des = 15,
    pic = 16,
    start_story = 17,
    background = 18,
    boss_image = 19,
    skill_1_id = 20,
    skill_2_id = 21,
    skill_3_id = 22,
    skill_4_id = 23,
    skill_5_id = 24,
    skill_6_id = 25,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_warlord_stage_info")

        return t._raw[__key_map[k]]
    end
}


function warlord_stage_info.getLength()
    return #warlord_stage_info._data
end



function warlord_stage_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_warlord_stage_info
function warlord_stage_info.indexOf(index)
    if index == nil or not warlord_stage_info._data[index] then
        return nil
    end
    return setmetatable({_raw = warlord_stage_info._data[index]}, m)
end



---
--@return @class record_warlord_stage_info
function warlord_stage_info.get(id)
    
    return warlord_stage_info.indexOf(__index_id[ id ])
     
end



function warlord_stage_info.set(id, key, value)
    local record = warlord_stage_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function warlord_stage_info.get_index_data()
    return __index_id 
end

return  warlord_stage_info 