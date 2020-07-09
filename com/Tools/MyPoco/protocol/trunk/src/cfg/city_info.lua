---@classdef record_city_info
local record_city_info = {}


record_city_info.level = 0--等地等级
record_city_info.advance_id = 0--封地类型
record_city_info.stage_id = 0--前置关卡
record_city_info.reward_drop_common = 0--普通奖励
record_city_info.reward_drop_surprised = 0--惊喜奖励
record_city_info.surprise_pro = 0--惊喜奖励触发率
record_city_info.city_knight = 0--推荐武将关联
record_city_info.knight_num = 0--推荐将个数
record_city_info.city_trouble = 0--动乱事件
record_city_info.trouble_pro = 0--动乱触发率
record_city_info.name =  ""--名称
record_city_info.sign =  ""--记号
record_city_info.icon =  ""--封地入口
record_city_info.res =  ""--封地内景
record_city_info.description =  ""--封地介绍
record_city_info.open_word =  ""--巡逻开场词
record_city_info.end_word =  ""--巡逻结束词
record_city_info.end_description =  ""--巡视结束描述
record_city_info.event_description =  ""--巡视事件描述

local city_info = {
   _data = {   
    [1] = {1,10,11040,120001,121001,1,101,2,101,5000,"汉中","1","1","1","汉中是由蜀地通往中原的门户，冬无严寒、夏无酷暑，不失为世外桃源。此处盛产经验书简与体力丹，更有机会结识姜维、张飞、庞统、黄忠等蜀国名将。","主公，待末将带回美酒佳酿和主公举杯畅饮。","末将巡逻完毕，汉中民康物阜，请主公收下百姓心意。","主公派遣的武将出色地完成了巡逻工作，获得了丰厚的奖励。","101",},  
    [2] = {1,20,13640,120002,121002,1,201,2,201,5000,"长安","2","2","2","长安自古乃军事要地，其政治、经济、文化发展水平颇高。此处盛产武将进阶材料与资源，更有机会结识华雄、董卓、公孙瓒、甄姬、袁绍等知名武将。","主公，不用担心武将进阶材料与资源不够用了。","末将巡逻完毕，长安民康物阜，请主公收下百姓心意。","主公派遣的武将出色地完成了巡逻工作，获得了丰厚的奖励。","201",},  
    [3] = {1,30,15640,120003,121003,1,301,2,301,5000,"成都","3","3","3","成都乃益州首府，刘备称帝后便以此为都，发展为西南第一名城。此处盛产装备随机箱和精炼石，还有机会结识大乔、孙坚、太史慈、鲁肃、孙权等知名武将。","主公，末将定会带回装备随机箱和精炼石。","末将巡逻完毕，成都民康物阜，请主公收下百姓心意。","主公派遣的武将出色地完成了巡逻工作，获得了丰厚的奖励。","301",},  
    [4] = {1,40,17640,120004,121004,1,401,2,401,5000,"许昌","4","4","4","许昌为中原重镇，因施行屯田制而经济繁荣。此处盛产宝物碎片随机宝箱、宝物精炼石、经验宝物，更有机会结识张辽、夏侯惇、许褚、夏侯渊、张郃等名将。","主公，末将不错过一丝一毫和宝物相关的线索。","末将巡逻完毕，许昌民康物阜，请主公收下百姓心意。","主公派遣的武将出色地完成了巡逻工作，获得了丰厚的奖励。","401",},  
    [5] = {1,50,20640,120005,121005,1,501,2,501,5000,"荆州","5","5","5","有云，得荆州者得天下，荆州历史厚重文化灿烂。此处盛产合击万能转换碎片、时装精华、兵符精华、兵符铸造石，还有机会结识华佗、魏延、赵云、吕蒙、于吉等名将。","末将这就去寻时装精华、兵符精华、万能碎片…","末将巡逻完毕，荆州民康物阜，请主公收下百姓心意。","主公派遣的武将出色地完成了巡逻工作，获得了丰厚的奖励。","501",},
    }
}

local __index_level_advance_id = {   
    ["1_10"] = 1,  
    ["1_20"] = 2,  
    ["1_30"] = 3,  
    ["1_40"] = 4,  
    ["1_50"] = 5,
}

local __key_map = { 
    level = 1,
    advance_id = 2,
    stage_id = 3,
    reward_drop_common = 4,
    reward_drop_surprised = 5,
    surprise_pro = 6,
    city_knight = 7,
    knight_num = 8,
    city_trouble = 9,
    trouble_pro = 10,
    name = 11,
    sign = 12,
    icon = 13,
    res = 14,
    description = 15,
    open_word = 16,
    end_word = 17,
    end_description = 18,
    event_description = 19,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_city_info")

        return t._raw[__key_map[k]]
    end
}


function city_info.getLength()
    return #city_info._data
end



function city_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_city_info
function city_info.indexOf(index)
    if index == nil or not city_info._data[index] then
        return nil
    end
    return setmetatable({_raw = city_info._data[index]}, m)
end



---
--@return @class record_city_info
function city_info.get(level,advance_id)
    
    local k = level .. '_' .. advance_id
    return city_info.indexOf(__index_level_advance_id[k])
     
end



function city_info.set(level,advance_id, key, value)
    local record = city_info.get(level,advance_id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function city_info.get_index_data()
    return __index_level_advance_id 
end

return  city_info 