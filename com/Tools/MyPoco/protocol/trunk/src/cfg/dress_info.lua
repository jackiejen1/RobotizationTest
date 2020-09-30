---@classdef record_dress_info
local record_dress_info = {}


record_dress_info.id = 0--时装ID
record_dress_info.name =  ""--时装名称
record_dress_info.put = 0--是否投放
record_dress_info.man_res_id = 0--男性资源id
record_dress_info.woman_res_id = 0--女性资源id
record_dress_info.dress_icon = 0--icon资源id
record_dress_info.feature =  ""--特点
record_dress_info.quality = 0-- 品质
record_dress_info.rare = 0--稀有
record_dress_info.potential = 0--资质
record_dress_info.advance_code = 0--升星码
record_dress_info.enhance_id = 0--强化码
record_dress_info.basic_type_1 = 0--基本属性类型1
record_dress_info.basic_value_1 = 0--基本属性类型值1
record_dress_info.basic_type_2 = 0--基本属性类型2
record_dress_info.basic_value_2 = 0--基本属性类型值2
record_dress_info.basic_type_3 = 0--基本属性类型3
record_dress_info.basic_value_3 = 0--基本属性类型值3
record_dress_info.basic_type_4 = 0--基本属性类型4
record_dress_info.basic_value_4 = 0--基本属性类型值4
record_dress_info.male_common_id = 0--男普攻
record_dress_info.female_common_id = 0--女普攻
record_dress_info.common_id = 0--普攻
record_dress_info.male_active_skill_id_1 = 0--男技能1
record_dress_info.female_active_skill_id_1 = 0--女技能1
record_dress_info.enhance_level_1 = 0--技能1强化等级
record_dress_info.male_active_skill_id_2 = 0--男技能2
record_dress_info.female_active_skill_id_2 = 0--女技能2
record_dress_info.enhance_level_2 = 0--技能2强化等级
record_dress_info.male_active_skill_id_3 = 0--男技能3
record_dress_info.female_active_skill_id_3 = 0--女技能3
record_dress_info.enhance_level_3 = 0--技能3强化等级
record_dress_info.male_active_skill_id_4 = 0--男技能4
record_dress_info.female_active_skill_id_4 = 0--女技能4
record_dress_info.enhance_level_4 = 0--技能4强化等级
record_dress_info.convert_type =  ""--转换道具类型
record_dress_info.convert_value =  ""--转换道具值
record_dress_info.convert_size =  ""--转换道具数量
record_dress_info.compose_id = 0--图鉴id
record_dress_info.description =  ""--描述
record_dress_info.gm = 0--是否GM后台发送
record_dress_info.male_personality_talk_1 =  ""--男个性语句1
record_dress_info.male_personality_talk_2 =  ""--男个性语句2
record_dress_info.male_personality_talk_3 =  ""--男个性语句3
record_dress_info.male_personality_talk_4 =  ""--男个性语句4
record_dress_info.female_personality_talk_1 =  ""--女个性语句1
record_dress_info.female_personality_talk_2 =  ""--女个性语句2
record_dress_info.female_personality_talk_3 =  ""--女个性语句3
record_dress_info.female_personality_talk_4 =  ""--女个性语句4
record_dress_info.remind_size = 0--GM后台数量提示
record_dress_info.game_type = 0--显示包体
record_dress_info.wing_hide = 0--立绘界面是否屏蔽翅膀

local dress_info = {
   _data = {   
    [1] = {100,"剑客",1,210005,200005,1,"前排控制",5,0,18,100,1,2,2190,103,30,0,0,0,0,1001,1005,1001,1002,1006,0,1003,1007,120,1004,1008,240,1004,1008,300,3,26,1000,2,"剑是侠客们最爱的兵器，古代剑又被称之为百兵之王，君子之器。武者使剑从人类有文字记载开始便已盛行，长剑在手，不管是面对敌人还是困难，他们都敢勇往直前，无所畏惧。",1,"大丈夫当带三尺之剑，立不世之功！","0","0","0","醉里挑灯看剑，梦回吹角连营！","0","0","0",2,0,0,},  
    [2] = {200,"狂斧",1,210006,200006,2,"一列肉盾",5,0,18,200,2,5,540,105,30,0,0,0,0,2001,2005,2001,2002,2006,0,2003,2007,120,2004,2008,240,2004,2008,300,3,26,1000,1,"擅长使斧者，一般都是沙场厮杀之辈，因为斧大开大合，极利群战，越是人多威力越大。然而斧虽利却也不是一般人能够驾驭得住，不但要体魄强健，更要擅用巧劲，如此方能挥斧如风。",1,"血染征袍透甲红，当阳谁敢与争锋！","0","0","0","攻无不克，战无不胜！","0","0","0",2,0,0,},  
    [3] = {300,"银枪",1,210003,200003,3,"单体输出",5,0,18,300,3,1,41660,102,30,0,0,0,0,3001,3005,3001,3002,3006,0,3003,3007,120,3004,3008,240,3004,3008,300,3,26,1000,1,"自人类有相互厮杀的历史开始，长枪便一直是战场上使用最广泛的兵器，它造价便宜上手简单，同时枪杆能扫、枪尖能刺，招式刁钻爆发力强。虽然如此，长枪却是易学难精的兵器，历来用枪者无数，能用好的却屈指可数。这些人无一不是历史上赫赫有名之辈。",1,"我的长枪在渴望鲜血！","0","0","0","人枪合一，所向披靡！","0","0","0",2,0,0,},  
    [4] = {400,"夜叉",1,210004,200004,4,"范围减怒",6,0,19,400,4,2,7890,103,50,0,0,0,0,4001,4005,4001,4002,4006,0,4003,4007,120,4004,4008,240,4004,4008,300,3,26,3000,4,"夜叉是地狱恶鬼，它穷凶极恶，常以其它鬼怪为食。以夜叉为名者，同样擅长杀戮同类，他们是夺取敌人生命的刺客，是黑暗之中的宠儿，是双剑挥舞得如同双臂一般灵活的剑道大师，他们的每招每式，都能从最不可思议的角度刺入敌人要害。直至将对方送入永恒的黑暗！",1,"夜叉幻影，双剑夺魂！","0","0","0","夜叉幻影，双剑夺魂！","0","0","0",2,0,0,},  
    [5] = {500,"神射",1,210007,200007,5,"后排灼烧",6,0,19,500,5,1,150000,102,50,0,0,0,0,5001,5005,5001,5002,5006,0,5003,5007,120,5004,5008,240,5004,5008,300,3,26,3000,3,"弓箭作为远程攻击的武器，自古以来使用者不知凡几。但真正能掌握箭术精髓的人却凤毛麟角。这些人无一不被尊以“神射”称号，被记载与史书与传说中，神射手对弓箭的掌握如同呼吸一般自然，弓箭在他们的手中如同拥有生命，每一支箭都能按他们的意志，瞬间夺取敌人的生命。",1,"射人先射马 擒贼先擒王！","0","0","0","没人能躲过我的弓箭！","0","0","0",2,0,0,},  
    [6] = {600,"猛将",1,210008,200008,6,"一列输出",6,0,19,600,6,5,1970,105,50,0,0,0,0,6001,6005,6001,6002,6006,0,6003,6007,120,6004,6008,240,6004,6008,300,3,26,3000,3,"战场上，率先撕破敌人阵仗的先锋战士往往是死亡的同义词，这其中能活下来的人无一不是体魄强壮，武艺高强之辈，而历经百战而不亡者，便会被尊称为“猛将”，他们代表着力量与勇气，每逢战斗，他们都热血沸腾，愈战愈勇，哪怕自身鲜血淋漓也毫不退缩，为赢取胜利不惜牺牲一切。",1,"除了死亡，谁也别想让我停下！","0","0","0","痛苦，是保持清醒的最好方式！","0","0","0",2,0,0,},  
    [7] = {700,"天师",1,210009,200009,7,"全体沉默",7,0,20,700,7,2,21050,103,80,0,0,0,0,7001,7005,7001,7002,7006,0,7003,7007,120,7004,7008,240,7004,7008,300,3,26,6000,5,"上古时期，人类蒙昧未开智时，对风雨雷电等自然现象倍感畏惧，但一些聪慧之辈却对这些变化产生好奇，他们以天地为师，经过不知多少年学习和积累，终于掌握御使天地之力的方法，这些人被称之为“天师”，天师能凭借一柄法剑施展出种种神奇道法，做出种种凡人无法做到的事情。在外人看来，他们便如同神灵一般。",1,"大音希声,大道无形！","0","0","0","道可道，非常道；名可名，非常名。","0","0","0",2,0,0,},  
    [8] = {800,"真龙",1,210010,200010,8,"灼烧减怒",7,0,20,800,8,1,400000,101,80,0,0,0,0,8001,8005,8001,8002,8006,0,8003,8007,120,8004,8008,240,8004,8008,300,3,26,6000,6,"龙是古代传说中的神兽，有腾云驾雾，吞吐天地之能。而龙中至尊，周身金鳞，迸发出耀眼之光；背负双翼，可扶摇直上九天，上古典籍之中称之为真龙。真龙罕有降世之迹，不过传说中尘世间有天命之子出现，会有真龙附体。金色法袍加身，真龙法杖在握，有改变天下气运的能力。",1,"气运加身，真龙护体，乃天命所归！","0","0","0","云从真龙，啸于天地！","0","0","0",2,0,0,},  
    [9] = {900,"盖世",1,210011,200011,9,"前排眩晕",7,0,20,900,9,5,5260,105,80,0,0,0,0,9001,9005,9001,9002,9006,0,9003,9007,120,9004,9008,240,9004,9008,300,3,26,6000,7,"古有盖世英雄，身若高山，声似钟鸣，力可摇山撼岳。英雄身披重甲，手握巨锤，有万钧之力。古时传说，天地初开之际，群山连绵，四处不通人烟，盖世英雄手持巨锤，开山破地，生生砸出了阡陌纵横。而今岁月中，古英雄虽不在，但巨锤偶有现世，有英雄得之，盖世而立。",1,"力拔山兮气盖世！","0","0","0","力撼五岳，气冲斗牛！","0","0","0",2,0,0,},  
    [10] = {1000,"曹焱兵",1,210012,210012,10,"前排灼烧",6,0,19,1000,10,1,150000,101,50,0,0,0,0,10001,10001,10001,10002,10002,0,10003,10003,120,10004,10004,240,10004,10004,300,3,26,3000,8,"曹焱兵乃罗刹街镇魂将，魏武帝曹操之后人，其麾下守护灵均是三国时期的曹魏猛将。由于自身和守护灵的力量均为火属性，因此也被人称作“烈火将军”。本次来到少年三国世界，曹焱兵目睹了祖辈的英雄风采，同时，他也会向所有人证明：曹焱兵绝不辜负曹氏后人之名！",1,"吾乃镇魂街镇魂将，罗刹街的曹焱兵是也！","0","0","0","吾乃镇魂街镇魂将，罗刹街的曹焱兵是也！","0","0","0",2,1,0,},  
    [11] = {1100,"申公豹",1,200015,200015,11,"前排眩晕",7,0,20,1100,11,5,5260,106,80,0,0,0,0,11001,11001,11001,11002,11002,0,11003,11003,120,11004,11004,240,11004,11004,300,3,26,6000,9,"申公豹原是豹子修炼成精，后拜在元始天尊门下，成为姜子牙的师弟。姜子牙的出现，让申公豹有了对手，也有了仰慕的对象。二人亦成为相杀相爱的命运伙伴。这次申公豹跟随姜子牙来到三国世界，见到了被乱世折磨的无辜百姓。他决心拯救黎民苍生，成为一个和姜子牙一样的英雄！",1,"人人都能成神，为何我就不能！","0","0","0","人人都能成神，为何我就不能！","0","0","0",2,1,1,},
    }
}

local __index_id = {   
    [100] = 1,  
    [200] = 2,  
    [300] = 3,  
    [400] = 4,  
    [500] = 5,  
    [600] = 6,  
    [700] = 7,  
    [800] = 8,  
    [900] = 9,  
    [1000] = 10,  
    [1100] = 11,
}

local __key_map = { 
    id = 1,
    name = 2,
    put = 3,
    man_res_id = 4,
    woman_res_id = 5,
    dress_icon = 6,
    feature = 7,
    quality = 8,
    rare = 9,
    potential = 10,
    advance_code = 11,
    enhance_id = 12,
    basic_type_1 = 13,
    basic_value_1 = 14,
    basic_type_2 = 15,
    basic_value_2 = 16,
    basic_type_3 = 17,
    basic_value_3 = 18,
    basic_type_4 = 19,
    basic_value_4 = 20,
    male_common_id = 21,
    female_common_id = 22,
    common_id = 23,
    male_active_skill_id_1 = 24,
    female_active_skill_id_1 = 25,
    enhance_level_1 = 26,
    male_active_skill_id_2 = 27,
    female_active_skill_id_2 = 28,
    enhance_level_2 = 29,
    male_active_skill_id_3 = 30,
    female_active_skill_id_3 = 31,
    enhance_level_3 = 32,
    male_active_skill_id_4 = 33,
    female_active_skill_id_4 = 34,
    enhance_level_4 = 35,
    convert_type = 36,
    convert_value = 37,
    convert_size = 38,
    compose_id = 39,
    description = 40,
    gm = 41,
    male_personality_talk_1 = 42,
    male_personality_talk_2 = 43,
    male_personality_talk_3 = 44,
    male_personality_talk_4 = 45,
    female_personality_talk_1 = 46,
    female_personality_talk_2 = 47,
    female_personality_talk_3 = 48,
    female_personality_talk_4 = 49,
    remind_size = 50,
    game_type = 51,
    wing_hide = 52,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_dress_info")

        return t._raw[__key_map[k]]
    end
}


function dress_info.getLength()
    return #dress_info._data
end



function dress_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_dress_info
function dress_info.indexOf(index)
    if index == nil or not dress_info._data[index] then
        return nil
    end
    return setmetatable({_raw = dress_info._data[index]}, m)
end



---
--@return @class record_dress_info
function dress_info.get(id)
    
    return dress_info.indexOf(__index_id[ id ])
     
end



function dress_info.set(id, key, value)
    local record = dress_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function dress_info.get_index_data()
    return __index_id 
end

return  dress_info 