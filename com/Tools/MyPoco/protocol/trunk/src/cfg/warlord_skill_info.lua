---@classdef record_warlord_skill_info
local record_warlord_skill_info = {}


record_warlord_skill_info.id = 0--id
record_warlord_skill_info.affect_type = 0--技能效果类
record_warlord_skill_info.affect_subtype = 0--技能效果子类
record_warlord_skill_info.CD = 0--技能cd
record_warlord_skill_info.skill_repeat = 0--技能重复
record_warlord_skill_info.warn_time = 0--技能预警时间
record_warlord_skill_info.range_type = 0--技能范围类型
record_warlord_skill_info.range_value1 = 0--技能范围值1
record_warlord_skill_info.range_value2 = 0--技能范围值2
record_warlord_skill_info.range_value3 = 0--技能范围值3
record_warlord_skill_info.range_value4 = 0--技能范围值4
record_warlord_skill_info.affect_value1 = 0--技能效果值1
record_warlord_skill_info.affect_value2 = 0--技能效果值2
record_warlord_skill_info.damage_high_limit = 0--伤害上限
record_warlord_skill_info.damage_low_limit = 0--伤害下限
record_warlord_skill_info.skill_name =  ""--技能名字
record_warlord_skill_info.skill_des =  ""--技能描述
record_warlord_skill_info.attack_effect =  ""--打击特效
record_warlord_skill_info.news =  ""--跑马灯信息
record_warlord_skill_info.icon = 0--技能图标
record_warlord_skill_info.attack_action =  ""--技能动作
record_warlord_skill_info.attack_hit =  ""--技能受击
record_warlord_skill_info.skill_range =  ""--技能范围

local warlord_skill_info = {
   _data = {   
    [1] = {1001,1,1,2500,1,2000,1,0,0,0,0,0,0,100,50,"天公降雷","张角锁定玩家所在位置，数秒之后对该位置释放一道落雷。","effect_spacetime_leiji","天公唤雷，穷追不舍，顷刻即至！",1039,"show","attack_hit_1","追踪",},  
    [2] = {1002,1,1,2500,1,2000,1,0,0,0,0,0,0,100,50,"天公降雷","张角锁定玩家所在位置，数秒之后对该位置释放一道落雷。","effect_spacetime_leiji","天公唤雷，穷追不舍，顷刻即至！",1039,"show","attack_hit_1","追踪",},  
    [3] = {1003,1,1,2500,1,2000,4,1,1,0,0,0,0,150,50,"天公降雷","张角锁定玩家所在的区域，数秒后对该区域释放一系列落雷。","effect_spacetime_leiji","雷暴八方，千里焦土！",1039,"attack","attack_hit_1","追踪",},  
    [4] = {1004,2,3,3000,0,2000,2,3,5,5,7,3,4,0,0,"天公护卫","张角召唤他的最得力的护法——“苍天”和“已死”来进行助战。","0","鬼兵现世，苍天已死！",1023,"show","attack_hit_1","召唤",},  
    [5] = {1005,1,1,3500,1,2000,8,4,0,0,0,0,0,100,50,"驭雷术","张角传授给护卫的简单的驭雷术","effect_spacetime_leiji","苍天已死，驭雷八荒，轰鸣而下！",1039,"attack","attack_hit_1","长条",},  
    [6] = {1006,1,1,3500,1,2000,3,10,0,0,0,0,0,100,50,"驭雷术","张角传授给护卫的简单的驭雷术","effect_spacetime_leiji","苍天已死，驭雷八荒，轰鸣而下！",1039,"show","attack_hit_1","随机点",},  
    [7] = {1007,1,1,3500,1,2000,8,4,0,0,0,0,0,100,50,"驭雷术","张角传授给护卫的简单的驭雷术","effect_spacetime_leiji","苍天已死，驭雷八荒，轰鸣而下！",1039,"attack","attack_hit_1","长条",},  
    [8] = {1008,1,1,3500,1,2000,3,10,0,0,0,0,0,100,50,"驭雷术","张角传授给护卫的简单的驭雷术","effect_spacetime_leiji","苍天已死，驭雷八荒，轰鸣而下！",1039,"show","attack_hit_1","随机点",},  
    [9] = {1009,1,1,2500,1,2000,8,4,0,0,0,0,0,150,100,"天公降雷","张角锁定面前的区域，数秒后对该区域释放一系列落雷。","effect_spacetime_leiji","雷暴八方，千里焦土！",1039,"attack","attack_hit_1","长条",},  
    [10] = {1010,1,1,2500,1,2000,3,15,0,0,0,0,0,100,50,"天雷乱杀","张角呼唤天雷的力量，对整个战场内随机位置进行雷电打击。","effect_spacetime_leifu","落雷倾盆，点点必杀！",1040,"show","attack_hit_1","随机点",},  
    [11] = {1011,2,3,3000,0,2000,2,4,6,5,8,6,7,0,0,"天公护卫","张角召唤他的最得力的护法——“黄天”和“当立”来进行助战。","0","鬼兵现世，黄天当立！",1023,"show","attack_hit_1","召唤",},  
    [12] = {1012,1,1,2000,1,1500,1,0,0,0,0,0,0,100,50,"驭雷术","张角传授给护卫的简单的驭雷术","effect_spacetime_leiji","黄天当立，驭雷八荒，轰鸣而下！",1039,"show","attack_hit_1","追踪",},  
    [13] = {1013,1,1,2000,1,1500,7,5,0,0,0,0,0,100,50,"驭雷术","张角传授给护卫的简单的驭雷术","effect_spacetime_leiji","黄天当立，驭雷八荒，轰鸣而下！",1039,"attack","attack_hit_1","扇形",},  
    [14] = {1014,1,1,2000,1,1500,1,0,0,0,0,0,0,100,50,"驭雷术","张角传授给护卫的简单的驭雷术","effect_spacetime_leiji","黄天当立，驭雷八荒，轰鸣而下！",1039,"show","attack_hit_1","追踪",},  
    [15] = {1015,1,1,2000,1,1500,7,5,0,0,0,0,0,100,50,"驭雷术","张角传授给护卫的简单的驭雷术","effect_spacetime_leiji","黄天当立，驭雷八荒，轰鸣而下！",1039,"attack","attack_hit_1","扇形",},  
    [16] = {1016,1,1,2000,1,1500,3,10,0,0,0,0,0,100,50,"驭雷术","张角传授给护卫的简单的驭雷术","effect_spacetime_leiji","黄天当立，驭雷八荒，轰鸣而下！",1039,"show","attack_hit_1","随机点",},  
    [17] = {1017,1,1,1500,1,1500,7,5,0,0,0,0,0,200,150,"天崩地灭","张角彻底释放体内的雷电，对面前的扇形区域造成毁灭性打击。","effect_spacetime_leiji","天公余威，天崩地灭！",1025,"attack","attack_hit_1","扇形",},  
    [18] = {1018,1,1,1500,1,1500,3,20,0,0,0,0,0,200,100,"天雷乱杀","张角呼唤天雷的力量，对整个战场内随机位置进行雷电打击。","effect_spacetime_leifu","天公余威，天雷乱杀！",1040,"show","attack_hit_1","随机点",},  
    [19] = {1019,1,1,1500,1,1500,4,1,1,0,0,0,0,200,150,"天公降雷","张角锁定玩家所在的区域，数秒后对该区域释放一系列落雷。","effect_spacetime_leiji","天公余威，苍生寂灭！",1039,"attack","attack_hit_1","追踪",},  
    [20] = {1020,1,1,2000,1,2000,4,1,2,0,0,0,0,100,50,"烈焰追魂","董卓锁定玩家所在的区域，数秒后对该区域释放一系列火柱。","effect_spacetime_huozhu","暴君怒火，烈焰追魂！",40100,"show","attack_hit_1","追踪",},  
    [21] = {1021,1,1,2000,1,2000,4,2,1,0,0,0,0,100,50,"烈焰追魂","董卓锁定玩家所在的区域，数秒后对该区域释放一系列火柱。","effect_spacetime_huozhu","暴君怒火，烈焰追魂！",40100,"show","attack_hit_1","追踪",},  
    [22] = {1022,1,1,2000,1,2000,4,2,2,0,0,0,0,100,50,"烈焰追魂","董卓锁定玩家所在的区域，数秒后对该区域释放一系列火柱。","effect_spacetime_huozhu","暴君怒火，烈焰追魂！",40100,"show","attack_hit_1","追踪",},  
    [23] = {1023,1,1,2000,1,2000,3,10,0,0,0,0,0,100,50,"烈焰冲击","董卓释放体内的火焰之力，对战场内随机位置释放火柱","effect_spacetime_huozhu","暴君怒火，烈焰追魂！",40100,"show","attack_hit_1","追踪",},  
    [24] = {1024,1,1,2000,1,2000,1,0,0,0,0,0,0,100,50,"烈焰追魂","董卓锁定玩家所在位置，数秒之后对该位置释放一道火柱。","effect_spacetime_huozhu","暴君怒火，烈焰追魂！",40100,"show","attack_hit_1","追踪",},  
    [25] = {1025,2,2,2000,0,2000,2,5,5,5,8,11,13,0,0,"吾儿奉先","董卓召唤吕布与貂蝉来进行助战。","0","奉献吾儿，速来助我！",50240,"attack","attack_hit_1","召唤",},  
    [26] = {1026,1,1,2000,1,2000,4,1,2,0,0,0,0,120,50,"怒火中烧","为救义父，吕布锁定玩家所在的区域，数秒后对该区域释放打击","effect_spacetime_rongyan","怒火中烧，鬼神一击！",300011,"show","attack_hit_1","矩形",},  
    [27] = {1027,1,1,2000,1,2000,4,2,1,0,0,0,0,120,50,"怒火中烧","为救义父，吕布锁定玩家所在的区域，数秒后对该区域释放打击","effect_spacetime_rongyan","怒火中烧，鬼神一击！",300011,"show","attack_hit_1","矩形",},  
    [28] = {1028,1,1,2000,1,2000,3,15,0,0,0,0,0,120,50,"怒火中烧","为救义父，吕布对整个战场内随机位置进行打击","effect_spacetime_rongyan","怒火中烧，乱战八方！",300011,"attack","attack_hit_1","随机点",},  
    [29] = {1029,1,1,750,1,1200,4,1,2,0,0,0,0,150,100,"怒焰战神","貂蝉陨落后，吕布锁定玩家所在的区域，数秒后对该区域的敌人造成高额伤害","effect_spacetime_rongyan","烈焰战神，仇灭四方！",300011,"attack","attack_hit_1","追踪",},  
    [30] = {1030,1,1,750,1,1200,4,2,1,0,0,0,0,150,100,"怒焰战神","貂蝉陨落后，吕布锁定玩家所在的区域，数秒后对该区域的敌人造成高额伤害","effect_spacetime_rongyan","烈焰战神，仇灭四方！",300011,"attack","attack_hit_1","追踪",},  
    [31] = {1031,1,1,750,1,1200,4,2,2,0,0,0,0,150,100,"怒焰战神","貂蝉陨落后，吕布锁定玩家所在的区域，数秒后对该区域的敌人造成高额伤害","effect_spacetime_rongyan","烈焰战神，仇灭四方！",300011,"attack","attack_hit_1","追踪",},  
    [32] = {1032,1,1,750,1,1200,3,20,0,0,0,0,0,150,100,"怒焰战神","貂蝉陨落后，吕布对整个战场内随机位置进行打击","effect_spacetime_rongyan","烈焰战神，仇灭四方！",300011,"attack","attack_hit_1","随机点",},  
    [33] = {1033,1,1,8000,1,1200,6,0,0,0,0,0,0,350,250,"怒焰无双","吕布释放心中无边的怒火，对全场范围的敌人造成高额伤害","effect_spacetime_huozhu","鬼神无双，怒火世界！",300011,"attack","attack_hit_1","全屏",},  
    [34] = {1034,1,2,1500,1,2000,1,0,0,0,0,3000,0,0,0,"魅惑","貂蝉展示妩媚身段，锁定玩家当前位置，一段时间后魅惑该位置的敌人","effect_spacetime_xiaoxinxin","红颜绚烂，魅惑众生！",17,"attack","attack_hit_1","眩晕",},  
    [35] = {1035,1,1,1500,1,2000,5,3,0,0,0,0,0,150,100,"地狱打击","董卓以自身为中心向周身区域释放熔岩，越远的区域打击面积越大。","effect_spacetime_rongyan","暴君怒火，烈焰追魂！",300001,"attack","attack_hit_1","辐射型",},  
    [36] = {1036,1,1,1500,1,1000,4,1,2,0,0,0,0,200,150,"炼狱冲击","董卓锁定玩家所在的区域，数秒后对该区域释放一系列火柱。","effect_spacetime_rongyan","暴君怒火，烈焰追魂！",300001,"attack","attack_hit_1","追踪",},  
    [37] = {1037,1,1,1500,1,1000,4,2,1,0,0,0,0,200,150,"炼狱冲击","董卓锁定玩家所在的区域，数秒后对该区域释放一系列火柱。","effect_spacetime_rongyan","暴君怒火，烈焰追魂！",300001,"attack","attack_hit_1","追踪",},  
    [38] = {1038,1,1,1500,1,1000,3,30,0,0,0,0,0,200,150,"炼狱冲击","董卓释放体内的火焰之力，对战场内随机位置释放火柱","effect_spacetime_rongyan","暴君怒火，烈焰追魂！",300001,"attack","attack_hit_1","随机点",},  
    [39] = {1039,1,1,1500,1,1000,1,0,0,0,0,0,0,200,150,"炼狱冲击","董卓锁定玩家所在位置，数秒之后对该位置释放一道火柱。","effect_spacetime_rongyan","暴君怒火，烈焰追魂！",300001,"attack","attack_hit_1","追踪",},  
    [40] = {1040,1,1,1500,1,1000,5,6,0,0,0,0,0,200,150,"炼狱降临","董卓以自身为中心向周身区域释放熔岩，越远的区域打击面积越大。","effect_spacetime_huozhu","暴君怒火，烈焰追魂！",1234,"attack","attack_hit_1","辐射型",},  
    [41] = {1041,1,1,2000,1,1500,1,0,0,0,0,0,0,100,50,"天剑制裁","袁绍锁定玩家所在位置，数秒之后对该位置释放落剑打击。","effect_spacetime_luojian","世家之剑，斩尽宵小！",1191,"show","attack_hit_1","追踪",},  
    [42] = {1042,1,1,2000,1,1500,3,15,0,0,0,0,0,100,50,"御剑归一","袁绍释放体力剑气，数秒之后对战场随机位置释放飞剑打击。","effect_spacetime_luojian","世家之剑，斩尽宵小！",1192,"show","attack_hit_1","随机点",},  
    [43] = {1043,1,1,2000,1,1500,5,6,0,0,0,0,0,100,50,"万剑纵横","袁绍以自身为中心向周围区域释放落剑，越远的区域打击面积越大。","effect_spacetime_luojian","世家之剑，斩尽宵小！",1067,"attack","attack_hit_1","辐射型",},  
    [44] = {1044,2,2,2000,0,1500,2,4,5,6,7,15,16,0,0,"河北双雄","袁绍召唤帐中大将颜良和文丑来进行助战。","0","颜良文丑，河北庭柱！",1190,"attack","attack_hit_1","召唤",},  
    [45] = {1045,1,1,2000,1,2000,4,1,1,0,0,0,0,100,100,"怒焰打击","颜良倾泻怒火，锁定玩家所在区域，数秒后对该区域的敌人造成伤害","effect_spacetime_rongyan","河北上将，唯我颜良！",1191,"attack","attack_hit_1","追踪",},  
    [46] = {1046,1,2,2000,1,2000,8,4,0,0,0,2000,0,0,0,"鬼火迷睛","文丑释放鬼神之力，对面前区域的敌人造成眩晕","effect_spacetime_guizhua","河北上将，唯我文丑！",1191,"show","attack_hit_1","眩晕",},  
    [47] = {1047,1,1,2000,1,2000,8,4,0,0,0,0,0,100,100,"鬼火打击","文丑释放鬼神之力，对面前区域的敌人造成伤害","effect_spacetime_guizhua","河北上将，唯我文丑！",1191,"show","attack_hit_1","直线",},  
    [48] = {1048,1,2,2000,1,1500,4,2,2,0,0,3000,0,0,0,"鬼焰熏心","目睹颜良之死，文丑彻底释放鬼神之力，对面前区域的敌人造成眩晕","effect_spacetime_guizhua","文丑之怒，何人能挡！",1191,"show","attack_hit_1","追踪",},  
    [49] = {1049,1,1,2000,1,1500,4,2,2,0,0,0,0,150,150,"鬼焰冲击","目睹颜良之死，文丑彻底释放鬼神之力，对面前区域的敌人造成高额伤害","effect_spacetime_guizhua","文丑之怒，何人能挡！",1191,"show","attack_hit_1","追踪",},  
    [50] = {1050,2,1,3000,0,2000,2,5,5,5,8,20,21,0,0,"炮震八荒","袁绍召唤威力巨大的龙炮车和投石车来进行助战。","0","攻城利器，毁天灭地！",1215,"attack","attack_hit_1","召唤",},  
    [51] = {1051,1,1,800,1,1200,5,6,0,0,0,0,0,150,100,"万剑纵横","袁绍以自身为中心向周围区域释放落剑，越远的区域打击面积越大。","effect_spacetime_luojian","世家之剑，斩尽宵小！",1067,"attack","attack_hit_1","辐射型",},  
    [52] = {1052,1,1,1200,1,1500,4,1,2,0,0,0,0,250,150,"火炮","龙炮车锁定玩家所在的区域，数秒后对该区域释放毁灭打击。","effect_spacetime_huozhu","攻城利器，毁天灭地！",1067,"attack","attack_hit_1","追踪",},  
    [53] = {1053,1,1,1200,1,1500,4,2,1,0,0,0,0,250,150,"投石","投石车锁定玩家所在的区域，数秒后对该区域释放毁灭打击。","effect_spacetime_rongyan","攻城利器，毁天灭地！",1067,"attack","attack_hit_1","追踪",},
    }
}

local __index_id = {   
    [1001] = 1,  
    [1002] = 2,  
    [1003] = 3,  
    [1004] = 4,  
    [1005] = 5,  
    [1006] = 6,  
    [1007] = 7,  
    [1008] = 8,  
    [1009] = 9,  
    [1010] = 10,  
    [1011] = 11,  
    [1012] = 12,  
    [1013] = 13,  
    [1014] = 14,  
    [1015] = 15,  
    [1016] = 16,  
    [1017] = 17,  
    [1018] = 18,  
    [1019] = 19,  
    [1020] = 20,  
    [1021] = 21,  
    [1022] = 22,  
    [1023] = 23,  
    [1024] = 24,  
    [1025] = 25,  
    [1026] = 26,  
    [1027] = 27,  
    [1028] = 28,  
    [1029] = 29,  
    [1030] = 30,  
    [1031] = 31,  
    [1032] = 32,  
    [1033] = 33,  
    [1034] = 34,  
    [1035] = 35,  
    [1036] = 36,  
    [1037] = 37,  
    [1038] = 38,  
    [1039] = 39,  
    [1040] = 40,  
    [1041] = 41,  
    [1042] = 42,  
    [1043] = 43,  
    [1044] = 44,  
    [1045] = 45,  
    [1046] = 46,  
    [1047] = 47,  
    [1048] = 48,  
    [1049] = 49,  
    [1050] = 50,  
    [1051] = 51,  
    [1052] = 52,  
    [1053] = 53,
}

local __key_map = { 
    id = 1,
    affect_type = 2,
    affect_subtype = 3,
    CD = 4,
    skill_repeat = 5,
    warn_time = 6,
    range_type = 7,
    range_value1 = 8,
    range_value2 = 9,
    range_value3 = 10,
    range_value4 = 11,
    affect_value1 = 12,
    affect_value2 = 13,
    damage_high_limit = 14,
    damage_low_limit = 15,
    skill_name = 16,
    skill_des = 17,
    attack_effect = 18,
    news = 19,
    icon = 20,
    attack_action = 21,
    attack_hit = 22,
    skill_range = 23,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_warlord_skill_info")

        return t._raw[__key_map[k]]
    end
}


function warlord_skill_info.getLength()
    return #warlord_skill_info._data
end



function warlord_skill_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_warlord_skill_info
function warlord_skill_info.indexOf(index)
    if index == nil or not warlord_skill_info._data[index] then
        return nil
    end
    return setmetatable({_raw = warlord_skill_info._data[index]}, m)
end



---
--@return @class record_warlord_skill_info
function warlord_skill_info.get(id)
    
    return warlord_skill_info.indexOf(__index_id[ id ])
     
end



function warlord_skill_info.set(id, key, value)
    local record = warlord_skill_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function warlord_skill_info.get_index_data()
    return __index_id 
end

return  warlord_skill_info 