---@classdef record_guide_task_info
local record_guide_task_info = {}


record_guide_task_info.id = 0--ID
record_guide_task_info.function_id = 0--功能id
record_guide_task_info.show_level_type = 0--显示等级类型
record_guide_task_info.show_level = 0--显示等级
record_guide_task_info.guide_remind_level = 0--提醒开启等级
record_guide_task_info.group = 0--页签
record_guide_task_info.group_name =  ""--页签名称
record_guide_task_info.icon =  ""--功能icon
record_guide_task_info.name =  ""--功能名称
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
record_guide_task_info.help_text = 0--说明文字
record_guide_task_info.open_if_show = 0--开启条件是否显示

local guide_task_info = {
   _data = {   
    [1] = {1001,1201,2,3,0,1,"养成","icon/function/icon_zhuangbei_shouye.png","装备","pic_jjsj_zhanshi_01_zhuangbei",58,63,40,"1件装备强化至40级",64,4,"1件装备精炼至4阶",124,40,"装备强化大师达到4级",0,0,"0",1,3,66666,3,14,10,999,0,50,19,1,},  
    [2] = {1002,1002,1,6,0,1,"养成","icon/function/icon_wjiang1.png","武将升星","pic_jjsj_zhanshi_02_shengxing",200020,126,5,"5名武将升至1星",127,1,"1名武将升至3星",0,0,"0",0,0,"0",3,21,30,3,2036,15,999,0,50,16,1,},  
    [3] = {1003,1500,2,3,0,1,"养成","icon/function/icon_sanguozhi.png","三国志","pic_jjsj_zhanshi_03_sanguozhi",45,139,15,"已激活三国志15个",0,0,"0",0,0,"0",0,0,"0",3,2,100,1,16,2000,999,0,50,24,1,},  
    [4] = {1004,1800,1,15,0,1,"养成","icon/function/icon_bianzhuang.png","变装","pic_jjsj_zhanshi_04_bianzhuang",200082,119,1,"拥有1件变装",0,0,"0",0,0,"0",0,0,"0",3,59,3,0,0,0,999,0,50,58,1,},  
    [5] = {1005,1700,1,20,0,1,"养成","icon/function/icon_shizhuang_shouye.png","时装","pic_jjsj_zhanshi_05_shizhuang",41,15,1,"拥有1件时装",1085,10,"强化10次时装",0,0,"0",0,0,"0",3,26,300,1,11,2000,999,0,50,21,1,},  
    [6] = {1006,1006,1,27,29,1,"养成","icon/function/icon_wujiangtujian.png","武将图鉴","pic_jjsj_zhanshi_06_wujiangtujian",62,140,10,"已激活武将图鉴10个",8,500,"图鉴值达到500",0,0,"0",0,0,"0",3,37,50,3,21,30,999,0,50,23,1,},  
    [7] = {1007,1401,1,40,42,1,"养成","icon/function/icon_baowu_shouye.png","宝物","pic_jjsj_zhanshi_07_baowu",60,65,5,"1件宝物强化至5级",66,3,"1件宝物精炼至3阶",125,15,"宝物强化大师达到3级",0,0,"0",8,13020,5,3,17,100,999,0,50,35,1,},  
    [8] = {1008,2100,1,47,49,1,"养成","icon/function/icon_shenyi.png","神翼","pic_jjsj_zhanshi_08_shenyi",201,133,1,"神翼达到1阶",0,0,"0",0,0,"0",0,0,"0",1,37,150,0,0,0,999,0,50,63,1,},  
    [9] = {1009,1900,1,50,52,1,"养成","icon/function/icon_hd_sq1.png","神兵","pic_jjsj_zhanshi_09_shenqi",166,85,1,"拥有1个神兵",88,20,"1件神兵强化到20级",89,2,"1件神兵升星至2星",0,0,"0",3,56,50,1,28,2000,999,0,50,46,1,},  
    [10] = {1010,2000,1,53,55,1,"养成","icon/function/icon_huashen.png","化身","pic_jjsj_zhanshi_10_huashen",211,132,1,"拥有1件化身",110,1,"激活1个化身图鉴",0,0,"0",0,0,"0",3,59,3,0,0,0,999,0,50,56,1,},  
    [11] = {1011,2200,1,57,59,1,"养成","icon/function/icon_shenshou.png","神兽","pic_jjsj_zhanshi_11_shenshou",210,100,10,"1个神兽升至10级",101,1,"1个神兽升至1星",106,1,"拥有1个橙色及以上神兽",0,0,"0",3,133,5,1,42,3000,999,0,50,67,1,},  
    [12] = {1012,1406,1,62,64,1,"养成","icon/function/icon_baowu_shouye.png","宝物升金","pic_jjsj_zhanshi_12_baowushenjin",60,128,2,"2件宝物激活四象之力",0,0,"0",0,0,"0",0,0,"0",3,2310,5,3,157,1,999,0,200,35,1,},  
    [13] = {1013,2300,1,67,69,1,"养成","icon/function/icon_shenshouzhuangbeibeibao.png","神兽装备","pic_jjsj_zhanshi_13_shenshouzhuangbei",213,136,10,"1件神兽装备达到10级",134,1,"拥有1件2阶以上神兽装备",0,0,"0",0,0,"0",18,9002,5,18,9003,3,999,0,200,75,1,},  
    [14] = {1014,1105,1,72,74,1,"养成","icon/function/icon_heji1.png","兵符刻印","pic_jjsj_zhanshi_14_bingfukeyin",54,129,4,"点亮4个兵符的1个刻印",0,0,"0",0,0,"0",0,0,"0",3,204,50,3,32,30,999,0,200,18,1,},  
    [15] = {1015,2400,1,77,79,1,"养成","icon/function/icon_jiangling.png","命星","pic_jjsj_zhanshi_15_mingxing",200081,120,3,"激活3个命星图鉴",130,2,"达成命星成就：地藏",0,0,"0",0,0,"0",3,187,3,3,2346,2,999,0,200,85,1,},  
    [16] = {1016,2402,1,97,99,1,"养成","icon/function/icon_jiangling.png","命星升星","pic_jjsj_zhanshi_16_mingxingshengxing",200081,130,11,"达成命星成就：天剑",137,10,"已拥有2星及以上命星图鉴10个",0,0,"0",0,0,"0",3,187,5,3,2365,1,999,0,200,85,1,},  
    [17] = {1017,1013,1,117,119,1,"养成","icon/function/icon_wjiang1.png","武将觉醒","pic_jjsj_zhanshi_17_wujiangjuexing",35,135,1,"1名武将完成觉醒",0,0,"0",0,0,"0",0,0,"0",3,173,50,0,0,0,999,0,200,16,1,},  
    [18] = {2001,10001,1,1,0,2,"玩法","icon/function/icon_mingjiangzhuan.png","名将传","pic_jjsj_zhanshi_18_mingjiangzhuan",11,49,10,"名将传主线通关第10章",0,0,"0",0,0,"0",0,0,"0",3,9,20,3,2,100,999,0,50,0,1,},  
    [19] = {2002,20001,1,1,0,2,"玩法","icon/function/icon_zhaojiangtai.png","招将台","pic_jjsj_zhanshi_19_zhaojiangtai",3,1040,30,"普通招募30次",1041,10,"高级招募10次",0,0,"0",0,0,"0",1,16,2000,3,6,3,999,0,50,6,1,},  
    [20] = {2003,10003,2,4,0,2,"玩法","icon/function/icon_jingjichang.png","竞技场","pic_jjsj_zhanshi_20_jingjichang",10,1001,10,"竞技场挑战10次",1002,5,"竞技场胜利5次",3,3000,"竞技场历史排名达到3000名",0,0,"0",3,2,100,1,8,1500,999,0,50,2,1,},  
    [21] = {2004,10025,1,20,0,2,"玩法","icon/function/icon_juntuan.png","军团","pic_jjsj_zhanshi_21_juntuan",61,1077,3,"军团赠礼3次",1079,5,"军团铸像铸造5次",1012,10,"攻打军团副本10次",0,0,"0",1,11,2000,3,11,250,999,0,50,8,1,},  
    [22] = {2005,10009,1,23,0,2,"玩法","icon/function/icon_wushuangshilian.png","无双试炼","pic_jjsj_zhanshi_22_wushuangshilian",17,1027,3,"无双试炼挑战3次",33,7,"无双试炼通过第7层",4,30,"无双试炼最高达到30星",0,0,"0",1,6,1500,3,14,10,999,0,50,3,1,},  
    [23] = {2006,10023,2,5,6,2,"玩法","icon/function/icon_fengdi.png","封地巡逻","pic_jjsj_zhanshi_23_fengdixunluo",18,1029,4,"封地巡逻4小时",1003,3,"平定动乱3次",0,0,"0",0,0,"0",3,1,5,1,3,88888,999,0,50,31,1,},  
    [24] = {2007,10030,1,25,25,2,"玩法","icon/function/icon_richangfuben.png","日常副本","pic_jjsj_zhanshi_24_richangfuben",13,1025,5,"日常副本挑战5次",0,0,"0",0,0,"0",0,0,"0",3,10,8,3,35,1500,999,0,50,30,1,},  
    [25] = {2008,10024,1,32,34,2,"玩法","icon/function/icon_taofajushou.png","讨伐巨兽","pic_jjsj_zhanshi_26_taofajushou",48,1056,1,"击败巨兽1次",5,20,"击败巨象和熊车最高等级之和达到20",1031,2,"讨伐巨兽分享2次",0,0,"0",1,13,1000,3,10,8,999,0,50,5,1,},  
    [26] = {2009,10032,7,5,6,2,"玩法","icon/function/icon_zhanyi.png","名将传战役","pic_jjsj_zhanshi_27_mingjiangzhuanzhanyi",12,1024,5,"名将传战役挑战5次",35,1002,"名将传战役通过英杰平叛",0,0,"0",0,0,"0",3,32,20,3,27,10,999,0,50,29,1,},  
    [27] = {2010,10011,1,40,42,2,"玩法","icon/function/icon_xunlongduobao.png","秘境寻宝","pic_jjsj_zhanshi_28_mijingxunbao",19,1005,3,"秘境寻宝抢夺3次",1006,3,"合成任意宝物3次",0,0,"0",0,0,"0",3,2008,6,3,2009,3,999,0,50,4,1,},  
    [28] = {2011,10055,1,42,44,2,"玩法","icon/function/icon_luanshi.png","乱世英杰","pic_jjsj_zhanshi_25_luanshiyingjie",237,1135,3,"乱世英杰挑战3次",0,0,"",0,0,"",0,0,"0",3,15,10,3,2,200,999,0,200,94,1,},  
    [29] = {2012,10033,1,45,47,2,"玩法","icon/function/icon_zhanyichengjiu.png","过关斩将","pic_jjsj_zhanshi_29_guoguanzhanjiang",162,1093,10,"过关斩将中战斗10次",1092,5,"城池挑战5次",0,0,"0",0,0,"0",3,47,20,3,49,10,999,0,200,43,1,},  
    [30] = {2013,10038,1,52,54,2,"玩法","icon/function/icon_wangzhejingji.png","王者竞技","pic_jjsj_zhanshi_30_wangzhejingji",225,1110,10,"王者竞技挑战10次",1111,10,"王者竞技获胜10次",0,0,"0",0,0,"0",3,2,300,3,53,5,999,0,200,80,1,},  
    [31] = {2014,20080,1,53,55,2,"玩法","icon/function/icon_hd_xinyuan1.png","心愿商店","pic_jjsj_zhanshi_31_xingyuanshangdian",190,1129,1,"领取每日心愿1次",1130,3,"完成心愿任务3次",1133,12,"心愿商店购买1次",0,0,"0",1,37,200,0,0,0,999,0,200,60,1,},  
    [32] = {2015,20070,8,3,4,2,"玩法","icon/function/icon_mingrentang.png","攻城略地","pic_jjsj_zhanshi_32_gongchenglvedi",177,1099,10,"攻城略地挑战10次",0,0,"0",0,0,"0",0,0,"0",3,15,10,3,56,150,999,0,200,83,1,},  
    [33] = {2016,10037,1,62,64,2,"玩法","icon/function/icon_juezhandingjunshan.png","决战定军山","pic_jjsj_zhanshi_33_juezhandingjunshan",223,1108,5,"决战定军山挑战5次（只计算奖励次数）",0,0,"0",0,0,"0",0,0,"0",3,2310,5,3,157,1,999,0,200,79,1,},  
    [34] = {2017,10036,1,67,69,2,"玩法","icon/function/icon_shenshoutiaozhan.png","讨伐神兽","pic_jjsj_zhanshi_34_taofashenshou",207,138,1,"神兽秘境达到第2章",1131,2,"参与本服神兽2次",1132,1,"参与1次跨服神兽挑战",0,0,"0",18,9003,5,18,9004,3,999,0,200,74,1,},  
    [35] = {2018,10050,1,72,74,2,"玩法","icon/function/icon_mojiang.png","讨伐魔将","pic_jjsj_zhanshi_35_taofamojiang",233,1118,5,"挑战魔化貂蝉5次",1119,5,"挑战魔化吕布5次",0,0,"0",0,0,"0",3,204,100,0,0,0,999,0,200,91,1,},  
    [36] = {2019,10047,1,77,79,2,"玩法","icon/function/icon_binglinchengxia.png","兵临城下","pic_jjsj_zhanshi_36_binglingchengxia",229,1114,3,"兵临城下一天内挑战3次",0,0,"0",0,0,"0",0,0,"0",3,186,5,3,187,2,999,0,200,87,1,},  
    [37] = {2020,10052,1,82,84,2,"玩法","icon/function/icon_jingyinfubeng.png","试炼副本","pic_jjsj_zhanshi_37_shilianfuben",235,114,3,"试炼副本通关关卡3难度一",0,0,"0",0,0,"0",0,0,"0",3,202,1200,3,205,2,999,0,200,0,1,},  
    [38] = {2021,10053,1,87,89,2,"玩法","icon/function/icon_shenwuge.png","神武阁","pic_jjsj_zhanshi_38_shenwuge",241,1120,10,"神武阁中前进10层",123,2,"神武阁达到第2区域",0,0,"0",0,0,"0",3,222,100,3,15,20,999,0,200,98,1,},  
    [39] = {2022,10039,2,110,115,2,"玩法","icon/function/icon_shikongwaizhuan.png","时空外传","pic_jjsj_zhanshi_39_shikongwaizhuan",226,112,2,"通关时空外传·奇门遁甲",0,0,"0",0,0,"0",0,0,"0",3,15,20,3,133,6,999,0,200,81,1,},  
    [40] = {3001,20056,1,40,0,3,"活动","icon/function/icon_hd_xswj1.png","限时神将","pic_jjsj_zhanshi_40_xianshishenjiang",175,1122,10,"限时神将累计抽取10次",0,0,"0",0,0,"0",0,0,"0",3,57,5,0,0,0,999,0,50,101,0,},  
    [41] = {3002,20089,1,40,0,3,"活动","icon/function/icon_hd_hltx1.png","号令天下","pic_jjsj_zhanshi_41_haolingtianxia",197,1134,10,"号令天下捐赠10次",1136,1,"号令商店兑换1次",0,0,"0",0,0,"0",3,107,10,3,106,20,999,0,50,66,0,},  
    [42] = {3003,20096,1,40,0,3,"活动","icon/function/icon_hd_fjtx.png","富甲天下","pic_jjsj_zhanshi_42_fujiatianxia",219,1125,10,"富甲天下累计抽取10次",1133,18,"富甲商店兑换1次",0,0,"0",0,0,"0",3,163,5,0,0,0,999,0,50,78,0,},  
    [43] = {3004,20069,1,40,0,3,"活动","icon/function/icon_hd_hsqj1.png","横扫千军","pic_jjsj_zhanshi_43_hengsaoqianjun",173,1123,10,"横扫千军累计抽取10次",1133,9,"横扫商店兑换1次",0,0,"0",0,0,"0",3,53,5,0,0,0,999,0,50,52,0,},  
    [44] = {3005,20082,1,40,0,3,"活动","icon/function/icon_huashen.png","身外化身","pic_jjsj_zhanshi_44_shenwaihuashen",184,1124,10,"身外化身累计抽取10次",1133,11,"化身商店兑换1次",0,0,"0",0,0,"0",3,59,5,0,0,0,999,0,50,57,0,},
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
    [2001] = 18,  
    [2002] = 19,  
    [2003] = 20,  
    [2004] = 21,  
    [2005] = 22,  
    [2006] = 23,  
    [2007] = 24,  
    [2008] = 25,  
    [2009] = 26,  
    [2010] = 27,  
    [2011] = 28,  
    [2012] = 29,  
    [2013] = 30,  
    [2014] = 31,  
    [2015] = 32,  
    [2016] = 33,  
    [2017] = 34,  
    [2018] = 35,  
    [2019] = 36,  
    [2020] = 37,  
    [2021] = 38,  
    [2022] = 39,  
    [3001] = 40,  
    [3002] = 41,  
    [3003] = 42,  
    [3004] = 43,  
    [3005] = 44,
}

local __key_map = { 
    id = 1,
    function_id = 2,
    show_level_type = 3,
    show_level = 4,
    guide_remind_level = 5,
    group = 6,
    group_name = 7,
    icon = 8,
    name = 9,
    pic = 10,
    route = 11,
    mission_type_1 = 12,
    mission_value_1 = 13,
    mission_des_1 = 14,
    mission_type_2 = 15,
    mission_value_2 = 16,
    mission_des_2 = 17,
    mission_type_3 = 18,
    mission_value_3 = 19,
    mission_des_3 = 20,
    mission_type_4 = 21,
    mission_value_4 = 22,
    mission_des_4 = 23,
    reward_type_1 = 24,
    reward_value_1 = 25,
    reward_size_1 = 26,
    reward_type_2 = 27,
    reward_value_2 = 28,
    reward_size_2 = 29,
    reward_type_3 = 30,
    reward_value_3 = 31,
    reward_size_3 = 32,
    help_text = 33,
    open_if_show = 34,
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