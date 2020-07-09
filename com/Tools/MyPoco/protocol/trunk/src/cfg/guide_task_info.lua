---@classdef record_guide_task_info
local record_guide_task_info = {}


record_guide_task_info.id = 0--ID
record_guide_task_info.function_id = 0--功能id
record_guide_task_info.show_level_type = 0--显示等级类型
record_guide_task_info.show_level = 0--显示等级
record_guide_task_info.icon =  ""--功能icon
record_guide_task_info.name =  ""--功能名称
record_guide_task_info.txt =  ""--描述文字
record_guide_task_info.pic =  ""--功能美术图
record_guide_task_info.route = 0--跳转
record_guide_task_info.mission_type_1 = 0--任务1类型
record_guide_task_info.mission_value_1 = 0--任务1类型值
record_guide_task_info.mission_des_1 =  ""--任务1描述
record_guide_task_info.mission_type_2 = 0--任务2类型
record_guide_task_info.mission_value_2 = 0--任务2类型值
record_guide_task_info.mission_des_2 =  ""--任务2描述
record_guide_task_info.mission_type_3 = 0--任务3类型
record_guide_task_info.mission_value_3 = 0--任务3类型值
record_guide_task_info.mission_des_3 =  ""--任务3描述
record_guide_task_info.mission_type_4 = 0--任务4类型
record_guide_task_info.mission_value_4 = 0--任务4类型值
record_guide_task_info.mission_des_4 =  ""--任务4描述
record_guide_task_info.reward_type_1 = 0--任务奖励类型1
record_guide_task_info.reward_value_1 = 0--任务奖励类型值1
record_guide_task_info.reward_size_1 = 0--任务奖励类型数量1
record_guide_task_info.reward_type_2 = 0--任务奖励类型2
record_guide_task_info.reward_value_2 = 0--任务奖励类型值2
record_guide_task_info.reward_size_2 = 0--任务奖励类型数量2
record_guide_task_info.reward_type_3 = 0--任务奖励类型3
record_guide_task_info.reward_value_3 = 0--任务奖励类型值3
record_guide_task_info.reward_size_3 = 0--任务奖励类型数量3

local guide_task_info = {
   _data = {   
    [1] = {1,1003,1,4,"icon/function/icon_wujiang.png","武将进阶","消耗进阶材料和进阶丹大幅提升武将的基础属性，大阶段会额外获得进阶天赋。","pic_wj",55,1084,1,"武将进阶1次",10,1,"6名上阵武将都达到1阶",0,0,"0",0,0,"0",3,11,50,0,0,0,0,0,0,},  
    [2] = {2,1500,2,2,"icon/function/icon_sanguozhi.png","三国志","通关主线或武将传记可获得三国志残卷，消耗残卷激活三国志可提升主角星级和品质。","pic_sgz",45,1080,1,"三国志激活1次",0,0,"0",0,0,"0",0,0,"0",3,8,20,0,0,0,0,0,0,},  
    [3] = {3,1004,1,8,"icon/function/icon_wujiang.png","武将培养","消耗培养丹提升武将的基础属性，激活将星可获得基础百分比属性。","pic_wj",55,1034,1,"武将将星培养1次",46,1,"1名武将激活破军将星",0,0,"0",0,0,"0",3,2,50,0,0,0,0,0,0,},  
    [4] = {4,1600,1,8,"icon/function/icon_chenghao.png","称号系统","通过玩法成就或贵族等级获得称号，激活称号和佩戴称号均可获得全体属性。","pic_chxt",119,1050,1,"激活1个称号",0,0,"0",0,0,"0",0,0,"0",999,0,100,0,0,0,0,0,0,},  
    [5] = {5,10003,1,8,"icon/function/icon_jingjichang.png","竞技场","争夺排名，突破历史最高排名可获得大量元宝，每日排行发奖获得声望可兑换武将碎片、培养丹等奖励。","pic_jjc",10,1001,1,"竞技场挑战1次",3,3000,"竞技场排名达到3000名",0,0,"0",0,0,"0",1,8,1000,0,0,0,0,0,0,},  
    [6] = {6,1201,2,3,"icon/function/icon_zhuangbei.png","装备强化","消耗银两强化装备获得基础属性，装备的强化等级上限为主角等级的2倍。","pic_zbqh",57,1035,1,"装备强化1次",63,10,"1件装备强化至10级",0,0,"0",0,0,"0",1,3,100000,0,0,0,0,0,0,},  
    [7] = {7,10001,2,3,"icon/function/icon_mingjiangzhuan.png","神将列传","体验不同名将的传记，获得武将和兵符碎片以及大量将魂，将魂可在将魂商店中兑换武将或兵符等资源。","pic_mjz",11,49,1,"列传通关第1章",0,0,"0",0,0,"0",0,0,"0",1,16,300,0,0,0,0,0,0,},  
    [8] = {8,1700,1,15,"icon/function/icon_shizhuang.png","时装系统","穿戴时装可改变主角形象和技能，强化时装可获得全体属性，达阶段目标可提升时装技能效果。","pic_szxt",41,15,1,"拥有1件时装",1085,1,"强化1次时装",0,0,"0",0,0,"0",3,26,50,0,0,0,0,0,0,},  
    [9] = {9,10025,1,15,"icon/function/icon_juntuan.png","军团系统","共同建设军团，可参与军团副本、军团铸像等军团玩法，获得军团贡献兑换酷炫时装。","pic_jtxt",61,1026,1,"军团贡献1次",1078,1,"军团铸像铸造1次",0,0,"0",0,0,"0",1,11,1000,0,0,0,0,0,0,},  
    [10] = {10,10023,2,6,"icon/function/icon_fengdi.png","封地巡逻","消耗体力或元宝派遣武将挂机巡逻，可获得大量资源，派遣推荐武将巡逻可额外获得将魂。","pic_fdxl",18,1029,4,"封地巡逻4小时",1003,1,"平定动乱1次",0,0,"0",0,0,"0",999,0,100,0,0,0,0,0,0,},  
    [11] = {11,10009,1,20,"icon/function/icon_wushuangshilian.png","无双试炼","挑战试炼获得星数和威名，每周排行发奖，威名可兑换装备、装备精炼石。","pic_wssl",17,1027,1,"无双试炼挑战1次",33,3,"无双试炼通过第3层",0,0,"0",0,0,"0",1,6,1000,0,0,0,0,0,0,},  
    [12] = {12,10027,1,20,"icon/function/icon_juntuan.png","军团副本","与军团成员共同攻打军团副本，分享关卡宝藏的奖励，可获得元宝、军团贡献等资源。","pic_jtfb",16,1012,1,"攻打军团副本1次",67,1,"军团副本通关第一章",0,0,"0",0,0,"0",1,11,1000,0,0,0,0,0,0,},  
    [13] = {13,10030,1,20,"icon/function/icon_richangfuben.png","日常副本","挑战特性副本获得武将经验、合击精华、银币、宝物经验等资源。","pic_rcfb",13,1025,1,"日常副本挑战1次",0,0,"0",0,0,"0",0,0,"0",1,3,100000,0,0,0,0,0,0,},  
    [14] = {14,1006,1,25,"icon/function/icon_tujian.png","武将图鉴","拥有武将激活图鉴获得全体基础属性和图鉴值，图鉴值达到阶段目标可获得伤害加成和减免。","pic_wjtj",62,1087,1,"激活1次武将图鉴",1086,1,"升级1次武将图鉴",0,0,"0",0,0,"0",3,37,10,0,0,0,0,0,0,},  
    [15] = {15,1101,7,6,"icon/function/icon_hejibingfu.png","兵符升级","消耗兵符精华或铸造石提升全体基础属性，强化至阶段目标激活兵符天赋获得大量全体属性。","pic_bfsj",27,1033,1,"兵符升级1次",68,10,"1个兵符强化至10级",0,0,"0",0,0,"0",3,35,300,3,32,2,0,0,0,},  
    [16] = {16,1202,1,30,"icon/function/icon_zhuangbei.png","装备精炼","消耗装备精炼石，提升装备基础属性和基础属性百分比。","pic_zbjl",23,1037,1,"装备精炼1次",64,4,"1件装备精炼至4阶",0,0,"0",0,0,"0",3,14,10,0,0,0,0,0,0,},  
    [17] = {17,10024,1,30,"icon/function/icon_zhuijipanjun.png","讨伐巨兽","讨伐巨兽比拼伤害，每日排名发放奖励可获得战功，可兑换兵符碎片、兵符铸造石等资源","pic_tfjs",48,1056,1,"击败巨兽1次",5,10,"击败巨象和熊车最高等级之和达到10",0,0,"0",0,0,"0",1,13,1000,0,0,0,0,0,0,},  
    [18] = {18,1401,1,40,"icon/function/icon_baowu.png","宝物强化","消耗经验宝物和银两，提升宝物强化等级可获得基础属性和高级属性。","pic_bwjl",59,1036,1,"宝物强化1次",65,5,"1件宝物强化至5级",0,0,"0",0,0,"0",8,13010,8,0,0,0,0,0,0,},  
    [19] = {19,10011,1,40,"icon/function/icon_xunlongduobao.png","秘境寻宝","战胜其他玩家可获得宝物碎片和龙珏，可合成宝物，龙珏可兑换宝物和宝物精炼石等资源。","pic_xunbao",19,1005,1,"寻宝1次",1006,1,"合成1次宝物",0,0,"0",0,0,"0",1,10,1000,0,0,0,0,0,0,},  
    [20] = {20,1402,1,43,"icon/function/icon_baowu.png","宝物精炼","消耗宝物精炼石和同名宝物，提升宝物精炼等级可获得基础属性和高级属性。","pic_bwjl",25,1088,1,"宝物精炼1次",66,3,"1件宝物精炼至3阶",0,0,"0",0,0,"0",3,17,30,0,0,0,0,0,0,},
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
}

local __key_map = { 
    id = 1,
    function_id = 2,
    show_level_type = 3,
    show_level = 4,
    icon = 5,
    name = 6,
    txt = 7,
    pic = 8,
    route = 9,
    mission_type_1 = 10,
    mission_value_1 = 11,
    mission_des_1 = 12,
    mission_type_2 = 13,
    mission_value_2 = 14,
    mission_des_2 = 15,
    mission_type_3 = 16,
    mission_value_3 = 17,
    mission_des_3 = 18,
    mission_type_4 = 19,
    mission_value_4 = 20,
    mission_des_4 = 21,
    reward_type_1 = 22,
    reward_value_1 = 23,
    reward_size_1 = 24,
    reward_type_2 = 25,
    reward_value_2 = 26,
    reward_size_2 = 27,
    reward_type_3 = 28,
    reward_value_3 = 29,
    reward_size_3 = 30,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_guide_task_info")

        return t._raw[__key_map[k]]
    end
}


function guide_task_info.getLength()
    return #guide_task_info._data
end



function guide_task_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_guide_task_info
function guide_task_info.indexOf(index)
    if index == nil or not guide_task_info._data[index] then
        return nil
    end
    return setmetatable({_raw = guide_task_info._data[index]}, m)
end



---
--@return @class record_guide_task_info
function guide_task_info.get(id)
    
    return guide_task_info.indexOf(__index_id[ id ])
     
end



function guide_task_info.set(id, key, value)
    local record = guide_task_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function guide_task_info.get_index_data()
    return __index_id 
end

return  guide_task_info 