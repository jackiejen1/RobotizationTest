---@classdef record_city_knight_info
local record_city_knight_info = {}


record_city_knight_info.id = 0--id
record_city_knight_info.type = 0--【#knight#】库类型
record_city_knight_info.order = 0--排序
record_city_knight_info.advance_id = 0--【#knight#】id
record_city_knight_info.reward_drop = 0--掉落奖励
record_city_knight_info.rate = 0--随机权重
record_city_knight_info.description =  ""--获得专属奖励描述

local city_knight_info = {
   _data = {   
    [1] = {1011,101,1,400050,122001,2000,"【#knight#】将木牛流马之术授于汉中百姓，得赠#reward#。",},  
    [2] = {1012,101,2,400060,122001,2000,"【#knight#】顺服蜀汉后，从此不再叛乱，得赐#reward#。",},  
    [3] = {1013,101,3,400130,122001,2000,"汉中有富商愿出#reward#，看【#knight#】表演剑舞。",},  
    [4] = {1014,101,4,400080,122001,2000,"【#knight#】向刘备献计夺取汉中，得赐#reward#。",},  
    [5] = {1015,101,5,400070,122001,2000,"【#knight#】随丈夫孟获归顺蜀汉，得赐#reward#。",},  
    [6] = {1016,101,6,500120,122001,2000,"【#knight#】加固汉中防御体系后北上屯田，得赐#reward#。",},  
    [7] = {1017,101,7,500080,122001,2000,"【#knight#】所绘美人图，被神秘人士以#reward#买去。",},  
    [8] = {1018,101,8,500070,122001,2000,"【#knight#】在市集测字来为人解难排纷，眨眼功夫获得#reward#。",},  
    [9] = {1019,101,9,500090,122001,2000,"近日汉中百姓喜听【#knight#】讲延年益寿之法，每次只需#reward#。",},  
    [10] = {1020,101,10,510030,122001,2000,"【#knight#】着家奴在汉中市集售青梅酒，每坛收#reward#。",},  
    [11] = {2011,201,1,400140,122001,2000,"少年【#knight#】初入军营，勇猛无双战功连连，获赐#reward#。",},  
    [12] = {2012,201,2,400150,122001,2000,"【#knight#】以一敌二，射倒张辽，打败徐晃，得赐#reward#。",},  
    [13] = {2013,201,3,400160,122001,2000,"【#knight#】献计接连取得对黄巾军战斗的胜利，获赐#reward#。",},  
    [14] = {2014,201,4,400030,122001,2000,"【#knight#】相貌平常然才能出众，此次又募集新兵千人，得赐#reward#。",},  
    [15] = {2015,201,5,500220,122001,2000,"更深夜寒冷，【#knight#】又为都督温了一壶酒，得赐#reward#。",},  
    [16] = {2016,201,6,500230,122001,2000,"少年【#knight#】在田间拾得一把刀，劚玉如泥，带去集市换得#reward#。",},  
    [17] = {2017,201,7,500240,122001,2000,"少年【#knight#】策马带队冲入鲜卑队伍，杀伤数十人，获赐#reward#。",},  
    [18] = {2018,201,8,500010,122001,2000,"长安近日盛行洛神图，只消#reward#可睹【#knight#】之绝伦姿貌。",},  
    [19] = {2019,201,9,500200,122001,2000,"【#knight#】大寿，在府前设台，凡路过拜寿者皆可获#reward#。",},  
    [20] = {2020,201,10,510080,122001,2000,"酒席筵间，【#knight#】献舞于相国，相国大悦赏#reward#。",},  
    [21] = {3011,301,1,400090,122001,2000,"【#knight#】与周瑜饮酒甚欢不觉自醉，赏随从#reward#。",},  
    [22] = {3012,301,2,400100,122001,2000,"【#knight#】不顾弓箭密集，舍身救主，得赐#reward#。",},  
    [23] = {3013,301,3,400120,122001,2000,"【#knight#】在城内设芦苇草人，计退曹丕大军，得赏#reward#。",},  
    [24] = {3014,301,4,500130,122001,2000,"为补军需，【#knight#】和妹妹设摊贩卖胭脂井水，赚得#reward#。",},  
    [25] = {3015,301,5,500150,122001,2000,"【#knight#】去钱塘途中遇海盗，一举剿灭，得赐#reward#。",},  
    [26] = {3016,301,6,500170,122001,2000,"午时，【#knight#】领兵马守约归来，得赏#reward#。",},  
    [27] = {3017,301,7,500180,122001,2000,"【#knight#】与孔明同乘于草船上，笑称每一支借来的箭可值#reward#。",},  
    [28] = {3018,301,8,500140,122001,2000,"是日，【#knight#】又猎得一只猛虎献于其兄，得赐#reward#。",},  
    [29] = {3019,301,9,510060,122001,2000,"为补军需，【#knight#】和姐姐设摊贩卖胭脂井水，赚得#reward#。",},  
    [30] = {4011,401,1,400010,122001,2000,"【#knight#】不徇私情献义兄首级与丞相，得赏#reward#。",},  
    [31] = {4012,401,2,400040,122001,2000,"【#knight#】骑白马奔杀，一箭射中关羽前额，得赐#reward#。",},  
    [32] = {4013,401,3,400020,122001,2000,"【#knight#】不舍其父远行而大哭，父感其孝心，得赐#reward#。",},  
    [33] = {4014,401,4,500020,122001,2000,"许昌城内凡有幼儿夜啼，提及【#knight#】之名即可止，可谓一名值#reward#。",},  
    [34] = {4015,401,5,500040,122001,2000,"【#knight#】拔矢啖睛，成功救援刘备，得赐#reward#。",},  
    [35] = {4016,401,6,500030,122001,2000,"【#knight#】身长八尺，活捉黄巾余党数百人，得赏#reward#。",},  
    [36] = {4017,401,7,500050,122001,2000,"【#knight#】横扫凉州，速度之快犹如闪电，得赏#reward#。",},  
    [37] = {4018,401,8,500060,122001,2000,"【#knight#】屈指一算，言中诸葛大军粮草不足，得赏#reward#。",},  
    [38] = {4019,401,9,510020,122001,2000,"【#knight#】为同乡抱怨，截杀地方官员，得豪士资助#reward#。",},  
    [39] = {4020,401,10,510010,122001,2000,"前方捷报，【#knight#】的水淹之计已生效，得赏#reward#。",},  
    [40] = {5011,501,1,400110,122001,2000,"【#knight#】奋勇当先请命苦肉计，被打得卧床不起，得赏#reward#。",},  
    [41] = {5012,501,2,500190,122001,2000,"【#knight#】行刮骨疗毒之术，医好了关羽，得赏#reward#。",},  
    [42] = {5013,501,3,500100,122001,2000,"【#knight#】坚守封地十年，固若金汤，得赏#reward#。",},  
    [43] = {5014,501,4,510040,122001,2000,"【#knight#】杀了个七进七出，终于救出阿斗，获赏#reward#。",},  
    [44] = {5015,501,5,500160,122001,2000,"士别多日，【#knight#】的才干和谋略增长神速，获赏#reward#。",},  
    [45] = {5016,501,6,500210,122001,2000,"【#knight#】在城郊立精舍，制作符水以治病，每日可获利#reward#。",},  
    [46] = {5017,501,7,510070,122001,2000,"【#knight#】献离间计，助力曹操一举平定关中，获赏#reward#。",},  
    [47] = {5018,501,8,500110,122001,2000,"【#knight#】镇守城关，敌人惧其威名不战而退，获赏#reward#。",},  
    [48] = {5019,501,9,510050,122001,2000,"【#knight#】火烧七百里连营，破蜀军四十余营，获赏#reward#。",},
    }
}

local __index_id = {   
    [1011] = 1,  
    [1012] = 2,  
    [1013] = 3,  
    [1014] = 4,  
    [1015] = 5,  
    [1016] = 6,  
    [1017] = 7,  
    [1018] = 8,  
    [1019] = 9,  
    [1020] = 10,  
    [2011] = 11,  
    [2012] = 12,  
    [2013] = 13,  
    [2014] = 14,  
    [2015] = 15,  
    [2016] = 16,  
    [2017] = 17,  
    [2018] = 18,  
    [2019] = 19,  
    [2020] = 20,  
    [3011] = 21,  
    [3012] = 22,  
    [3013] = 23,  
    [3014] = 24,  
    [3015] = 25,  
    [3016] = 26,  
    [3017] = 27,  
    [3018] = 28,  
    [3019] = 29,  
    [4011] = 30,  
    [4012] = 31,  
    [4013] = 32,  
    [4014] = 33,  
    [4015] = 34,  
    [4016] = 35,  
    [4017] = 36,  
    [4018] = 37,  
    [4019] = 38,  
    [4020] = 39,  
    [5011] = 40,  
    [5012] = 41,  
    [5013] = 42,  
    [5014] = 43,  
    [5015] = 44,  
    [5016] = 45,  
    [5017] = 46,  
    [5018] = 47,  
    [5019] = 48,
}

local __key_map = { 
    id = 1,
    type = 2,
    order = 3,
    advance_id = 4,
    reward_drop = 5,
    rate = 6,
    description = 7,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_city_knight_info")

        return t._raw[__key_map[k]]
    end
}


function city_knight_info.getLength()
    return #city_knight_info._data
end



function city_knight_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_city_knight_info
function city_knight_info.indexOf(index)
    if index == nil or not city_knight_info._data[index] then
        return nil
    end
    return setmetatable({_raw = city_knight_info._data[index]}, m)
end



---
--@return @class record_city_knight_info
function city_knight_info.get(id)
    
    return city_knight_info.indexOf(__index_id[ id ])
     
end



function city_knight_info.set(id, key, value)
    local record = city_knight_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function city_knight_info.get_index_data()
    return __index_id 
end

return  city_knight_info 