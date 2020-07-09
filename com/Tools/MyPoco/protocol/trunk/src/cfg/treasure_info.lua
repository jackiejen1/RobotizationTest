---@classdef record_treasure_info
local record_treasure_info = {}


record_treasure_info.id = 0--宝物ID
record_treasure_info.name =  ""--宝物名称
record_treasure_info.advance_id = 0--升阶码
record_treasure_info.type = 0--宝物类型
record_treasure_info.quality = 0--品质
record_treasure_info.rare = 0--稀有
record_treasure_info.potential = 0--资质
record_treasure_info.put = 0--是否投放
record_treasure_info.res_id = 0--资源ID
record_treasure_info.mini_icon = 0--小icon
record_treasure_info.contend_type = 0--抢夺类型
record_treasure_info.basic_type_1 = 0--基础属性类型1
record_treasure_info.basic_value_1 = 0--基础属性类型值1
record_treasure_info.basic_growth_1 = 0--属性1成长值
record_treasure_info.basic_type_2 = 0--基础属性类型2
record_treasure_info.basic_value_2 = 0--基础属性类型值2
record_treasure_info.basic_growth_2 = 0--属性2成长值
record_treasure_info.strength_limit = 0--强化等级上限
record_treasure_info.strength_parameter_1 = 0--升级经验参数1
record_treasure_info.strength_parameter_2 = 0--升级经验参数2
record_treasure_info.refine_limit = 0--精炼等级上限
record_treasure_info.refine_type_1 = 0--精练属性类型1
record_treasure_info.refine_growth_1 = 0--成长值1
record_treasure_info.refine_type_2 = 0--精练属性类型2
record_treasure_info.refine_growth_2 = 0--成长值2
record_treasure_info.refine_cost = 0--精炼关联消耗
record_treasure_info.is_sell = 0--是否可以出售
record_treasure_info.price_type = 0--出售类型
record_treasure_info.price_value = 0--出售类型值
record_treasure_info.price_size = 0--出售货币数量
record_treasure_info.treasure_exp = 0--提供经验值
record_treasure_info.description =  ""--宝物描述
record_treasure_info.seen_bag = 0--是否在碎片背包显示
record_treasure_info.fragment_1 = 0--碎片1
record_treasure_info.fragment_2 = 0--碎片2
record_treasure_info.fragment_3 = 0--碎片3
record_treasure_info.fragment_4 = 0--碎片4
record_treasure_info.fragment_5 = 0--碎片5
record_treasure_info.fragment_6 = 0--碎片6
record_treasure_info.fragment_7 = 0--碎片7
record_treasure_info.fragment_8 = 0--碎片8
record_treasure_info.talent_skill_1 = 0--宝物天赋1
record_treasure_info.talent_skill_2 = 0--宝物天赋2
record_treasure_info.talent_skill_3 = 0--宝物天赋3
record_treasure_info.talent_skill_4 = 0--宝物天赋4
record_treasure_info.talent_skill_5 = 0--宝物天赋5
record_treasure_info.talent_skill_6 = 0--宝物天赋6
record_treasure_info.talent_skill_7 = 0--宝物天赋7
record_treasure_info.talent_skill_8 = 0--宝物天赋8
record_treasure_info.talent_skill_9 = 0--宝物天赋9
record_treasure_info.talent_skill_10 = 0--宝物天赋10
record_treasure_info.treasure_glyph = 0--雕纹
record_treasure_info.gm = 0--GM后台是否可发
record_treasure_info.remind_size = 0--GM后台数量提示

local treasure_info = {
   _data = {   
    [1] = {11010,"三略",11010,1,4,0,13,1,11010,13010,2,2,240,36,106,10,2,25,120,0,5,2,210,103,10,1,1,1,3,10000,4000,"汉初道家隐士黄石公所作，糅合了诸子各家思想中专论战略的兵书。",1,11011,11012,11013,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,101,1,10,},  
    [2] = {11020,"司马法",11020,1,4,0,13,1,11020,13010,2,2,240,36,103,10,2,25,120,0,5,2,210,106,10,1,1,1,3,10000,4000,"齐国司马穰苴整理成文，是现存中国最古老的兵法书。",1,11021,11022,11023,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,101,1,10,},  
    [3] = {11110,"孙子兵法",11110,1,5,0,18,1,11110,13010,1,2,480,72,106,20,4,50,200,0,10,2,420,103,20,2,1,1,3,20000,28000,"春秋时期孙武所著，博大精深，被誉为“兵学圣典”。",1,11111,11112,11113,11114,0,0,0,0,0,0,0,0,0,0,0,0,0,0,103,1,10,},  
    [4] = {11120,"鬼谷子",11120,1,5,0,18,1,11120,13010,1,2,480,72,103,20,4,50,200,0,10,2,420,106,20,2,1,1,3,20000,28000,"鬼谷子为纵横家之鼻祖，学识惊人，著有《鬼谷子》兵书十四篇传世。",1,11121,11122,11123,11124,0,0,0,0,0,0,0,0,0,0,0,0,0,0,103,1,10,},  
    [5] = {11210,"太平要术",11210,1,6,0,20,1,11210,13010,1,2,1920,288,106,30,6,150,300,0,25,2,1710,103,30,3,1,1,3,50000,56000,"于吉曾于汉顺帝时入山采药，忽视有书浮于水。取而观之，名太平要术。",1,11211,11212,11213,11214,11215,0,0,0,50001,50002,50003,50004,50009,50010,50011,0,0,0,105,1,10,},  
    [6] = {11320,"孟德新书",11320,1,6,0,20,1,11320,13010,1,2,1920,288,103,30,6,150,300,0,25,2,1710,106,30,3,1,1,3,50000,56000,"曹操半生戎马，在前人的基础上总结并创新，成就了这本孟德新书。",1,11321,11322,11323,11324,11325,0,0,0,50001,50002,50003,50004,50009,50010,50011,0,0,0,105,1,10,},  
    [7] = {11410,"天·太平要术",11210,1,7,0,24,1,11410,13010,0,2,3840,576,106,60,6,200,300,0,30,2,3420,103,40,4,1,1,3,50000,0,"东汉年间，于吉入山采药，忽视有书浮于水。取而观之，内含博大，涉及天地、阴阳、五行等，于吉遵照此书勤加修炼，终窥天道之奥秘。后于吉下山济世救民，并将此书取名太平要术。",0,0,0,0,0,0,0,0,0,51001,51002,51003,51004,51005,51006,51007,51008,51009,0,105,1,10,},  
    [8] = {11420,"天·孟德新书",11320,1,7,0,24,1,11420,13010,0,2,3840,576,103,60,6,200,300,0,30,2,3420,106,40,4,1,1,3,50000,0,"兵者国之大事，死生之地，存亡之道，不可不察。曹操半生戎马，在前人的基础上将自己毕生所学、所历总结并创新，成就了这本孟德新书。",0,0,0,0,0,0,0,0,0,51001,51002,51003,51004,51005,51006,51007,51008,51009,0,105,1,10,},  
    [9] = {12010,"县令印",12010,2,4,0,13,1,12010,13010,2,1,4560,684,105,10,2,25,120,0,5,1,4050,104,10,1,1,1,3,10000,4000,"以青铜锻造的官印，由吏部颁发，为县吏的身份凭物。",1,12011,12012,12013,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,102,1,10,},  
    [10] = {12020,"主簿印",12020,2,4,0,13,1,12020,13010,2,1,4560,684,104,10,2,25,120,0,5,1,4050,105,10,1,1,1,3,10000,4000,"以青铜锻造的官印，由吏部颁发，为功曹的身份凭物。",1,12021,12022,12023,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,102,1,10,},  
    [11] = {12110,"太尉印",12110,2,5,0,18,1,12110,13010,1,1,9120,1368,105,20,4,50,200,0,10,1,8100,104,20,2,1,1,3,20000,28000,"由朝廷颁发，以白银锻造的官印，是太尉官职的身份象征。",1,12111,12112,12113,12114,0,0,0,0,0,0,0,0,0,0,0,0,0,0,104,1,10,},  
    [12] = {12120,"御史印",12120,2,5,0,18,1,12120,13010,1,1,9120,1368,104,20,4,50,200,0,10,1,8100,105,20,2,1,1,3,20000,28000,"由朝廷颁发，以白银锻造的官印，是御史官职的身份凭物。",1,12121,12122,12123,12124,0,0,0,0,0,0,0,0,0,0,0,0,0,0,104,1,10,},  
    [13] = {12210,"将军印",12210,2,6,0,20,1,12210,13010,1,1,36480,5472,105,30,6,150,300,0,25,1,32700,104,30,3,1,1,3,50000,56000,"由名匠使用黄金精工雕琢而成，由皇帝下旨颁发，为大将军身份象征。",1,12211,12212,12213,12214,12215,0,0,0,50005,50006,50007,50008,50012,50013,50014,0,0,0,106,1,10,},  
    [14] = {12320,"丞相印",12320,2,6,0,20,1,12320,13010,1,1,36480,5472,104,30,6,150,300,0,25,1,32700,105,30,3,1,1,3,50000,56000,"由皇帝下旨制造并颁发，名匠用黄金白银加工而成，为丞相的身份象征。",1,12321,12322,12323,12324,12325,0,0,0,50005,50006,50007,50008,50012,50013,50014,0,0,0,106,1,10,},  
    [15] = {12410,"地·将军印",12210,2,7,0,24,1,12410,13010,0,1,72960,10944,105,60,6,200,300,0,30,1,65400,104,40,4,1,1,3,50000,0,"由皇帝下旨制造并颁发，名匠使用黄金精工雕琢而成，大印庄重浑厚、朴茂苍雄，是大将军身份的象征。",0,0,0,0,0,0,0,0,0,51101,51102,51103,51104,51105,51106,51107,51108,51109,0,106,1,10,},  
    [16] = {12420,"地·丞相印",12320,2,7,0,24,1,12420,13010,0,1,72960,10944,104,60,6,200,300,0,30,1,65400,105,40,4,1,1,3,50000,0,"由皇帝下旨制造并颁发，名匠用玉石、黄金及白银加工而成，雕工精细圆润，篆刻流畅有力，为丞相的身份象征。",0,0,0,0,0,0,0,0,0,51101,51102,51103,51104,51105,51106,51107,51108,51109,0,106,1,10,},  
    [17] = {13010,"经验鱼符",13010,3,4,0,6,1,13010,13010,2,1,0,0,104,0,0,1,120,0,0,0,0,0,0,1,1,1,3,10000,2000,"工匠以石头为材，雕琢为鱼形的宝符，可用于宝物强化，提供2000点经验",1,13011,13012,13013,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,50,},  
    [18] = {13020,"经验雀符",13020,3,5,0,8,1,13020,13020,1,1,0,0,104,0,0,1,200,0,0,0,0,0,0,1,1,1,3,20000,5000,"道士以石头为材，雕琢为鸟形的宝符，可用于宝物强化，提供5000点经验",1,13021,13022,13023,13024,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,50,},  
    [19] = {13030,"经验虎符",13030,3,6,0,10,1,13030,13030,1,1,0,0,104,0,0,1,300,0,0,0,0,0,0,1,1,1,3,50000,10000,"名匠以玉为材，雕琢为虎形的宝符，可用于宝物强化，提供10000点经验",1,13031,13032,13033,13034,13035,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,50,},  
    [20] = {14010,"墨麟符",14010,4,7,0,12,1,14010,13030,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,"沉甸甸的墨麒麟，是将红色攻击宝物铸炼成金色的必备之物。",1,14011,14012,14013,14014,14015,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,50,},  
    [21] = {14020,"白麟符",14020,4,7,0,12,1,14020,13030,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,"沉甸甸的白麒麟，是将红色防御宝物铸炼成金色的必备之物。",1,14021,14022,14023,14024,14025,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,50,},
    }
}

local __index_id = {   
    [11010] = 1,  
    [11020] = 2,  
    [11110] = 3,  
    [11120] = 4,  
    [11210] = 5,  
    [11320] = 6,  
    [11410] = 7,  
    [11420] = 8,  
    [12010] = 9,  
    [12020] = 10,  
    [12110] = 11,  
    [12120] = 12,  
    [12210] = 13,  
    [12320] = 14,  
    [12410] = 15,  
    [12420] = 16,  
    [13010] = 17,  
    [13020] = 18,  
    [13030] = 19,  
    [14010] = 20,  
    [14020] = 21,
}

local __key_map = { 
    id = 1,
    name = 2,
    advance_id = 3,
    type = 4,
    quality = 5,
    rare = 6,
    potential = 7,
    put = 8,
    res_id = 9,
    mini_icon = 10,
    contend_type = 11,
    basic_type_1 = 12,
    basic_value_1 = 13,
    basic_growth_1 = 14,
    basic_type_2 = 15,
    basic_value_2 = 16,
    basic_growth_2 = 17,
    strength_limit = 18,
    strength_parameter_1 = 19,
    strength_parameter_2 = 20,
    refine_limit = 21,
    refine_type_1 = 22,
    refine_growth_1 = 23,
    refine_type_2 = 24,
    refine_growth_2 = 25,
    refine_cost = 26,
    is_sell = 27,
    price_type = 28,
    price_value = 29,
    price_size = 30,
    treasure_exp = 31,
    description = 32,
    seen_bag = 33,
    fragment_1 = 34,
    fragment_2 = 35,
    fragment_3 = 36,
    fragment_4 = 37,
    fragment_5 = 38,
    fragment_6 = 39,
    fragment_7 = 40,
    fragment_8 = 41,
    talent_skill_1 = 42,
    talent_skill_2 = 43,
    talent_skill_3 = 44,
    talent_skill_4 = 45,
    talent_skill_5 = 46,
    talent_skill_6 = 47,
    talent_skill_7 = 48,
    talent_skill_8 = 49,
    talent_skill_9 = 50,
    talent_skill_10 = 51,
    treasure_glyph = 52,
    gm = 53,
    remind_size = 54,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_treasure_info")

        return t._raw[__key_map[k]]
    end
}


function treasure_info.getLength()
    return #treasure_info._data
end



function treasure_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_treasure_info
function treasure_info.indexOf(index)
    if index == nil or not treasure_info._data[index] then
        return nil
    end
    return setmetatable({_raw = treasure_info._data[index]}, m)
end



---
--@return @class record_treasure_info
function treasure_info.get(id)
    
    return treasure_info.indexOf(__index_id[ id ])
     
end



function treasure_info.set(id, key, value)
    local record = treasure_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function treasure_info.get_index_data()
    return __index_id 
end

return  treasure_info 