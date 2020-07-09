---@classdef record_daily_dungeon_info
local record_daily_dungeon_info = {}


record_daily_dungeon_info.id = 0--编号
record_daily_dungeon_info.name =  ""--副本名称
record_daily_dungeon_info.daily_dungeon_type = 0--副本类型
record_daily_dungeon_info.talk_1 =  ""--气泡1
record_daily_dungeon_info.talk_2 =  ""--气泡2
record_daily_dungeon_info.description =  ""--副本描述
record_daily_dungeon_info.cost_type = 0--消耗类型
record_daily_dungeon_info.cost_type_value = 0--消耗类型值
record_daily_dungeon_info.cost_num = 0--消耗数量
record_daily_dungeon_info.dungeon_num = 0--副本次数
record_daily_dungeon_info.time = 0--开启时间
record_daily_dungeon_info.monster_icon = 0--怪物图标
record_daily_dungeon_info.background = 0--副本背景图
record_daily_dungeon_info.label_icon = 0--标签图标
record_daily_dungeon_info.reward_type_1 = 0--掉落类型1
record_daily_dungeon_info.reward_type_value_1 = 0--掉落类型值1
record_daily_dungeon_info.reward_type_2 = 0--掉落类型2
record_daily_dungeon_info.reward_type_value_2 = 0--掉落类型值2
record_daily_dungeon_info.reward_type_3 = 0--掉落类型3
record_daily_dungeon_info.reward_type_value_3 = 0--掉落类型值3
record_daily_dungeon_info.reward_type_4 = 0--掉落类型4
record_daily_dungeon_info.reward_type_value_4 = 0--掉落类型值4
record_daily_dungeon_info.reward_type_5 = 0--掉落类型5
record_daily_dungeon_info.reward_type_value_5 = 0--掉落类型值5
record_daily_dungeon_info.reward_type_6 = 0--掉落类型6
record_daily_dungeon_info.reward_type_value_6 = 0--掉落类型值6
record_daily_dungeon_info.reward_description =  ""--掉落描述
record_daily_dungeon_info.monster_1 = 0--怪物形象1
record_daily_dungeon_info.monster_2 = 0--怪物形象2
record_daily_dungeon_info.monster_3 = 0--怪物形象3
record_daily_dungeon_info.privilege_guide_id = 0--特权引导

local daily_dungeon_info = {
   _data = {   
    [1] = {1,"武将经验",1,"有没有人想感受熊的力量~~","想打倒我们你还得有点本事！","考验综合伤害",0,0,0,6,1,300140,1,1,3,7,3,8,3,9,3,10,0,0,0,0,"（消耗怪物血量越多，获得奖励越多）",300140,300160,300140,1,},  
    [2] = {2,"银币副本",2,"群狼是最可怕的野兽。","还不快走？我们这里可没有银币给你。","考验武将输出",0,0,0,7,1,300130,1,1,1,3,0,0,0,0,0,0,0,0,0,0,"（击败怪物波次越多，获得奖励越多）",300130,300150,300130,2,},  
    [3] = {3,"合击精华",3,"木牛和流马谁更精妙？你来回答我！","是月英姑娘和孔明公子创造的我们！","考验合击伤害",0,0,0,8,2,300180,1,1,3,35,0,0,0,0,0,0,0,0,0,0,"（击败怪物波次越多，获得奖励越多）",300180,300200,300180,3,},  
    [4] = {4,"宝物经验",4,"于吉说…傀儡…没有灵魂。","咯吱…咯吱…我需要一些油滋润关节。","考验生存能力",0,0,0,9,3,300170,1,1,8,13010,8,13020,8,13030,0,0,0,0,0,0,"（坚持回合数越多，获得奖励越多）",300190,300170,300190,4,},  
    [5] = {5,"神兵副本",5,"我本是一条龙，被时空之力封印在此。","听见那炮火的轰鸣了吗，那是龙啸！","考验综合伤害",0,0,0,36,1,300210,1,1,3,56,3,56,3,56,3,56,3,56,3,56,"（消耗怪物血量越多，获得奖励越多）",0,0,300210,5,},
    }
}

local __index_id = {   
    [1] = 1,  
    [2] = 2,  
    [3] = 3,  
    [4] = 4,  
    [5] = 5,
}

local __key_map = { 
    id = 1,
    name = 2,
    daily_dungeon_type = 3,
    talk_1 = 4,
    talk_2 = 5,
    description = 6,
    cost_type = 7,
    cost_type_value = 8,
    cost_num = 9,
    dungeon_num = 10,
    time = 11,
    monster_icon = 12,
    background = 13,
    label_icon = 14,
    reward_type_1 = 15,
    reward_type_value_1 = 16,
    reward_type_2 = 17,
    reward_type_value_2 = 18,
    reward_type_3 = 19,
    reward_type_value_3 = 20,
    reward_type_4 = 21,
    reward_type_value_4 = 22,
    reward_type_5 = 23,
    reward_type_value_5 = 24,
    reward_type_6 = 25,
    reward_type_value_6 = 26,
    reward_description = 27,
    monster_1 = 28,
    monster_2 = 29,
    monster_3 = 30,
    privilege_guide_id = 31,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_daily_dungeon_info")

        return t._raw[__key_map[k]]
    end
}


function daily_dungeon_info.getLength()
    return #daily_dungeon_info._data
end



function daily_dungeon_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_daily_dungeon_info
function daily_dungeon_info.indexOf(index)
    if index == nil or not daily_dungeon_info._data[index] then
        return nil
    end
    return setmetatable({_raw = daily_dungeon_info._data[index]}, m)
end



---
--@return @class record_daily_dungeon_info
function daily_dungeon_info.get(id)
    
    return daily_dungeon_info.indexOf(__index_id[ id ])
     
end



function daily_dungeon_info.set(id, key, value)
    local record = daily_dungeon_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function daily_dungeon_info.get_index_data()
    return __index_id 
end

return  daily_dungeon_info 