---@classdef record_notice_info
local record_notice_info = {}


record_notice_info.id = 0--ID
record_notice_info.content =  ""--走马灯内容
record_notice_info.show = 0--显示位置
record_notice_info.gm = 0--是否GM后台发送
record_notice_info.min_level = 0--播放等级
record_notice_info.group = 0--玩法类型

local notice_info = {
   _data = {   
    [1] = {1,"#name#奋勇向前，在[color=#f9d382]竞技场[/color]中，首次达到第[color=#df3f14]#num#[/color]名！",1,0,6,0,},  
    [2] = {2,"#name#吉星高照，成功在[color=#f9d382]招将[/color]中，招到武将#$item#，可喜可贺！",1,0,6,0,},  
    [3] = {3,"恭喜军团[color=#df3f14]#guild_name#[/color]成员戮力同心，在军团长#name#的带领下，成功将军团等级提升到[color=#df3f14]#level#[/color]级，真是众擎易举！",1,0,6,0,},  
    [4] = {4,"恭喜#name#人品爆发，打开萌新快乐桶获得了#$item#，真是令人羡慕！",1,0,6,0,},  
    [5] = {5,"#name#势不可挡，在[color=#f9d382]无双试炼[/color]中，首次突破[color=#df3f14]#num#[/color]星！",1,0,6,0,},  
    [6] = {6,"#name#横戈跃马，在[color=#f9d382]竞技场[/color]中，累计挑战[color=#df3f14]#num#[/color]次！",1,0,6,0,},  
    [7] = {7,"#name#勇冠三军，在[color=#f9d382]竞技场[/color]中，累计获得[color=#df3f15]#num#场[/color]胜利！",1,0,6,0,},  
    [8] = {8,"#name#仗义疏财，已累计发放红包[color=#df3f15]#num#[/color]次，壕气冲天！",1,0,6,0,},  
    [9] = {9,"#name#财运亨通，已累计领取红包[color=#df3f16]#num#[/color]次，令人羡慕！",1,0,6,0,},  
    [10] = {10,"恭喜#name#所向披靡，通关神将列传-传记关卡获得了#$item#，羡煞旁人！",1,0,6,0,},  
    [11] = {11,"#name#家里有矿，在军团里发放了[color=#df3f15]#$item#[/color]，大家快去领取吧！",1,0,6,0,},  
    [12] = {12,"#name#财大气粗，开启[color=#df3f16]贵族5超值礼包[/color]，获得了#$items#，可喜可贺！",1,0,6,0,},  
    [13] = {13,"#name#富可敌国，开启[color=#df3f16]贵族12超值礼包[/color]，获得了#$item#，礼乐齐鸣！",1,0,6,0,},  
    [14] = {14,"#name#富甲天下，开启[color=#df3f16]贵族15超值礼包[/color]，获得了#$item#，万国来朝！",1,0,6,0,},  
    [15] = {15,"#name#运气爆棚，在特级装备随机箱中获得#$item#，得意洋洋！",1,0,6,0,},  
    [16] = {16,"#name#鸿运当头，在[color=#f9d382]封地巡逻[/color]时获得#$item#，意外之喜！",1,0,6,0,},  
    [17] = {17,"#name#百战无前，战斗力排名升至名人堂[color=#df3f15]第#num#[/color]，战力暴涨，傲视群雄！",1,0,20,0,},  
    [18] = {18,"#name#百炼成钢，等级排名升至名人堂[color=#df3f15]第#num#[/color]，超凡入圣，举世无双！",1,0,20,0,},  
    [19] = {19,"#name#福至心灵，在[color=#f9d382]十连招将[/color]中，将[color=#df3f15]#num#名红将[/color]招入麾下，威名远扬，霸业必成！",1,0,6,0,},  
    [20] = {20,"战力榜[color=#df3f14]排名第#num#[/color]的#name#上线了，战意冲云，魑魅退散！",1,0,20,0,},  
    [21] = {21,"等级榜[color=#df3f14]排名第#num#[/color]的#name#上线了，盖世无双，众人膜拜！",1,0,20,0,},  
    [22] = {22,"#name#财大气粗，开启[color=#df3f16]贵族6超值礼包[/color]，获得了#$items#，可喜可贺！",1,0,6,0,},  
    [23] = {23,"#name#财大气粗，开启[color=#df3f16]贵族7超值礼包[/color]，获得了#$item#，可喜可贺！",1,0,6,0,},  
    [24] = {24,"#name#腰缠万贯，开启[color=#df3f16]贵族8超值礼包[/color]，获得了#$item#，可喜可贺！",1,0,6,0,},  
    [25] = {25,"#name#腰缠万贯，开启[color=#df3f16]贵族9超值礼包[/color]，获得了#$item#，羡煞旁人！",1,0,6,0,},  
    [26] = {26,"#name#挥金如土，开启[color=#df3f16]贵族10超值礼包[/color]，获得了#$item#，羡煞旁人！",1,0,6,0,},  
    [27] = {27,"#name#挥金如土，开启[color=#df3f16]贵族11超值礼包[/color]，获得了#$item#，羡煞旁人！",1,0,6,0,},  
    [28] = {28,"#name#富可敌国，开启[color=#df3f16]贵族13超值礼包[/color]，获得了#$item#，礼乐齐鸣！",1,0,6,0,},  
    [29] = {29,"#name#富可敌国，开启[color=#df3f16]贵族14超值礼包[/color]，获得了#$item#，礼乐齐鸣！",1,0,6,0,},  
    [30] = {30,"#name#所向披靡，在竞技场中达到[color=#df3f14]#num#[/color]名!",1,0,6,0,},  
    [31] = {31,"#name#愈战愈勇，在[color=#f9d382]竞技场[/color]中，首次达到第[color=#df3f14]#num#[/color]名！",1,0,6,0,},  
    [32] = {32,"#name#横扫千军，在[color=#f9d382]竞技场[/color]中，首次达到第[color=#df3f14]#num#[/color]名！",1,0,6,0,},  
    [33] = {33,"#name#势不可挡，在[color=#f9d382]竞技场[/color]中，首次达到第[color=#df3f14]#num#[/color]名，盖世无双，群雄拜服！",1,0,6,0,},  
    [34] = {34,"#name#拔地倚天，在[color=#f9d382]竞技场[/color]中，首次达到第[color=#df3f14]#num#[/color]名，霸绝海内，威震寰宇！",1,0,6,0,},  
    [35] = {35,"#name#势如奔雷，所向披靡，夺得[color=#f9d382]竞技场[/color]第[color=#df3f14]#num#[/color]名！",1,0,6,0,},  
    [36] = {36,"#name#福星高照，在[color=#f9d382]限时神将[/color]中获得魏国神将#$item#，欧神附体，非酋狂嚎！",1,0,6,0,},  
    [37] = {37,"#name#福星高照，在[color=#f9d382]限时神将[/color]中获得蜀国神将#$item#，欧神附体，非酋狂嚎！",1,0,6,0,},  
    [38] = {38,"#name#福星高照，在[color=#f9d382]限时神将[/color]中获得吴国神将#$item#，欧神附体，非酋狂嚎！",1,0,6,0,},  
    [39] = {39,"#name#福星高照，在[color=#f9d382]限时神将[/color]中获得群雄神将#$item#，欧神附体，非酋狂嚎！",1,0,6,0,},  
    [40] = {40,"#name#气运加身，在[color=#f9d382]神兵宝库[/color]中觅得#$item#，如虎添翼，更上层楼！",1,0,6,0,},  
    [41] = {41,"#name#一口价竞拍获得了#item#！",1,0,6,0,},  
    [42] = {42,"#name#连续充值五天，获得[color=#f9d382]天天充值[/color]终极大奖！",1,0,6,0,},  
    [43] = {43,"#name#购买了[color=#f9d382]月卡[/color]，获得250元宝，30天可获得4500元宝！",1,0,6,0,},  
    [44] = {44,"#name#购买了[color=#f9d382]至尊月卡[/color]，获得600元宝，30天可领取12000元宝！",1,0,6,0,},  
    [45] = {45,"#name#领取了[color=#f9d382]首充奖励[/color]，如虎添翼！",1,0,6,0,},  
    [46] = {46,"#name#购买了[color=#f9d382]成长基金[/color]，累计可返还12000元宝，20倍返利！",1,0,6,0,},  
    [47] = {47,"#name#武将图鉴值达到[color=#df3f14]#num#[/color]，获得大量属性加成！",1,0,6,0,},  
    [48] = {48,"#name#上阵了五个同阵营红（金）将，激活了所有阵营光环！",1,0,6,0,},  
    [49] = {49,"#name#将#num#升到4星，战力猛涨，群雄胆寒【前往升星】",1,0,6,0,},  
    [50] = {50,"#name#将#num#升到5星，战力猛涨，群雄胆寒【前往升星】",1,0,6,0,},  
    [51] = {51,"#name#将#num#升到7星，战力猛涨，群雄胆寒【前往升星】",1,0,6,0,},  
    [52] = {52,"#name#麾下的#num#达到3阶，初始怒气+2【我要进阶】",1,0,6,0,},  
    [53] = {53,"#name#麾下的#num#达到4阶，为同阵营武将增加大量属性【我要进阶】",1,0,6,0,},  
    [54] = {54,"#name#麾下的#num#达到6阶，为同阵营武将增加大量属性【我要进阶】",1,0,6,0,},  
    [55] = {55,"仙法无量，#name#在[color=#f9d382]身外化身[/color]中获得#$item#，自此超凡脱俗，缥缈登仙！",1,0,6,0,},  
    [56] = {56,"#name#得到仙人赐福，在[color=#f9d382]身外化身[/color]中获得6666元宝，尘世富贵，更似仙界！",1,0,6,0,},  
    [57] = {57,"#name#福星高照，在[color=#f9d382]横扫千军[/color]中获得金斧子，神装在手，天下难敌！",1,0,6,0,},  
    [58] = {58,"#name#福气满满，领取了2888元宝的[color=#f9d382]元宝福袋[/color]，喜气满堂，福星高照！",1,0,6,0,},  
    [59] = {59,"#name#鸿运当头，在[color=#f9d382]占星阁[/color]中获得金色命星#$item#，星耀祥瑞，前程似锦！",1,0,6,0,},  
    [60] = {1000,"#name#扫清六合，席卷八荒，在[color=#f9d382]竞技场[/color]中成功登顶，[color=#df3f16]君临天下，三国共主！[/color]",1,0,6,0,},  
    [61] = {1001,"#name#玩家在[color=#f9d382]战力竞赛[/color]中获得前三名，获得强力红将，强者愈强，无人可挡！",1,0,6,0,},  
    [62] = {1002,"#name#力压群雄，在[color=#f9d382]图鉴竞赛[/color]中达到前三名，获得红色兵符，群雄拜服！",1,0,6,0,},  
    [63] = {2001,"恭喜#name#成为今日[color=#f9d382]现金锦鲤[/color]，获得#$item#，鸿运当头，锦衣富贵!",1,0,6,0,},  
    [64] = {2002,"恭喜#name#成为今日[color=#f9d383]元宝锦鲤[/color]，获得#$item#，财源滚滚，鲤鱼跃龙门!",1,0,6,0,},  
    [65] = {2003,"恭喜#name#成为今日[color=#f9d384]招将锦鲤[/color]，获得#$item#，锦鲤赐福，三国还愿!",1,0,6,0,},  
    [66] = {2101,"军团[color=#f9d382]#guild#[/color]万众一心，占领了#mine#！",1,0,6,1,},  
    [67] = {2102,"军团[color=#f9d382]#guild#[/color]全军集结，剑指#mine#！",1,0,6,1,},  
    [68] = {2103,"[color=#df3f14]成都[/color]霸主#name#上线了，割据一方，威名赫赫！",1,0,6,2,},  
    [69] = {2104,"[color=#df3f14]长安[/color]霸主#name#上线了，名震中原，号令四方！",1,0,6,2,},  
    [70] = {2105,"[color=#df3f14]洛阳[/color]霸主#name#上线了，威伏海内，称霸天下！",1,0,6,2,},  
    [71] = {2106,"军团[color=#f9d382]#guild#[/color]万众一心，占领了#wrest#！",1,0,6,1,},  
    [72] = {2107,"联盟[color=#f9d382]#union#[/color]万众一心，占领了#wrest#！",1,0,6,1,},  
    [73] = {2108,"恭喜#name#成为今日[color=#f9d384]少年锦鲤[/color]，获得#$item#，锦鲤赐福，三国还愿!",1,0,6,0,},  
    [74] = {2109,"经过军团齐心协力，一起解锁宝箱，请前往领取宝箱奖励！",1,0,6,3,},  
    [75] = {2110,"经过军团齐心协力，占领了兵营，占领后城池降低耐久值30%",1,0,6,3,},  
    [76] = {2111,"经过军团齐心协力，占领了兵营，当前箭塔已解锁，可前往攻打！",1,0,6,3,},  
    [77] = {2112,"经过军团齐心协力，又通关一个支线任务，请再接再厉！",1,0,6,3,},  
    [78] = {2113,"经过军团齐心协力，成功攻破该章节主城池，请前往领取通关奖励！",1,0,6,3,},
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
    [22] = 22,  
    [23] = 23,  
    [24] = 24,  
    [25] = 25,  
    [26] = 26,  
    [27] = 27,  
    [28] = 28,  
    [29] = 29,  
    [30] = 30,  
    [31] = 31,  
    [32] = 32,  
    [33] = 33,  
    [34] = 34,  
    [35] = 35,  
    [36] = 36,  
    [37] = 37,  
    [38] = 38,  
    [39] = 39,  
    [40] = 40,  
    [41] = 41,  
    [42] = 42,  
    [43] = 43,  
    [44] = 44,  
    [45] = 45,  
    [46] = 46,  
    [47] = 47,  
    [48] = 48,  
    [49] = 49,  
    [50] = 50,  
    [51] = 51,  
    [52] = 52,  
    [53] = 53,  
    [54] = 54,  
    [55] = 55,  
    [56] = 56,  
    [57] = 57,  
    [58] = 58,  
    [59] = 59,  
    [1000] = 60,  
    [1001] = 61,  
    [1002] = 62,  
    [2001] = 63,  
    [2002] = 64,  
    [2003] = 65,  
    [2101] = 66,  
    [2102] = 67,  
    [2103] = 68,  
    [2104] = 69,  
    [2105] = 70,  
    [2106] = 71,  
    [2107] = 72,  
    [2108] = 73,  
    [2109] = 74,  
    [2110] = 75,  
    [2111] = 76,  
    [2112] = 77,  
    [2113] = 78,
}

local __key_map = { 
    id = 1,
    content = 2,
    show = 3,
    gm = 4,
    min_level = 5,
    group = 6,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_notice_info")

        return t._raw[__key_map[k]]
    end
}


function notice_info.getLength()
    return #notice_info._data
end



function notice_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_notice_info
function notice_info.indexOf(index)
    if index == nil or not notice_info._data[index] then
        return nil
    end
    return setmetatable({_raw = notice_info._data[index]}, m)
end



---
--@return @class record_notice_info
function notice_info.get(id)
    
    return notice_info.indexOf(__index_id[ id ])
     
end



function notice_info.set(id, key, value)
    local record = notice_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function notice_info.get_index_data()
    return __index_id 
end

return  notice_info 