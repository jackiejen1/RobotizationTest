---@classdef record_city_trouble_info
local record_city_trouble_info = {}


record_city_trouble_info.id = 0--ID
record_city_trouble_info.type = 0--类型
record_city_trouble_info.num = 0--子ID
record_city_trouble_info.rate = 0--随机权重
record_city_trouble_info.help_drop = 0--帮助好友奖励
record_city_trouble_info.end_drop = 0--被帮助奖励
record_city_trouble_info.trouble_begin_description =  ""--动乱开始描述
record_city_trouble_info.trouble_knight_saying =  ""--武将说话
record_city_trouble_info.trouble_npc_saying =  ""--NPC说话
record_city_trouble_info.emoji_pic_1 =  ""--表情
record_city_trouble_info.emoji_pic_2 =  ""--表情
record_city_trouble_info.trouble_end_description =  ""--平定动乱日志
record_city_trouble_info.trouble_help_description =  ""--平定奖励描述
record_city_trouble_info.trouble_effect =  ""--动乱特效
record_city_trouble_info.trouble_end_effect =  ""--解决动乱特效

local city_trouble_info = {
   _data = {   
    [1] = {1,101,1,200,123001,124001,"西凉军残部冲入城中烧杀劫掠，城中百姓哭号哀叫，四散奔跑，城池进入暴动状态！","汉中暴乱啦，快去找友军支援！","暴乱了！快来人呀！","1","2","好友率军击溃西凉军残部，安抚百姓，平息了暴动，你获得了#reward#。","感谢将军派出军队平定动乱","effect_city_trouble_1","effect_city_trouble_end_1",},  
    [2] = {2,201,1,200,123001,124001,"因欠薪三月，城中驻守士兵哗变，大肆屠杀抢劫，百姓多有死伤，城池进入暴动状态！","长安暴乱啦，快去找友军支援！","暴乱了！快来人呀！","1","2","好友率军镇压了士兵叛乱，安抚百姓，平息了暴动，你获得了#reward#。","感谢将军派出军队平定动乱","effect_city_trouble_1","effect_city_trouble_end_1",},  
    [3] = {3,301,1,200,123001,124001,"流寇施展太平妖术击破城门，冲入城中劫掠，百姓死伤无数，城池进入暴动状态！","成都暴乱啦，快去找友军支援！","暴乱了！快来人呀！","1","2","好友率军击溃流寇，安抚百姓，平息了暴动，你获得了#reward#。","感谢将军派出军队平定动乱","effect_city_trouble_1","effect_city_trouble_end_1",},  
    [4] = {4,401,1,200,123001,124001,"突发地震，大量民居倒塌，百姓多有死伤，城中混混趁机作乱抢劫，城池进入暴动状态！","许昌暴乱啦，快去找友军支援！","暴乱了！快来人呀！","1","2","好友率军逮捕作乱混混，救援百姓，平息了暴动，你获得了#reward#。","感谢将军派出军队平定动乱","effect_city_trouble_1","effect_city_trouble_end_1",},  
    [5] = {5,501,1,200,123001,124001,"连年干旱，颗粒无收，百姓饥不果腹，官员救灾不力，致流民作乱，城池进入暴动状态！","荆州暴乱啦，快去找友军支援！","暴乱了！快来人呀！","1","2","好友率军镇压流民作乱，开仓放粮，救济百姓，平息了暴动，你获得了#reward#。","感谢将军派出军队平定动乱","effect_city_trouble_1","effect_city_trouble_end_1",},
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
    type = 2,
    num = 3,
    rate = 4,
    help_drop = 5,
    end_drop = 6,
    trouble_begin_description = 7,
    trouble_knight_saying = 8,
    trouble_npc_saying = 9,
    emoji_pic_1 = 10,
    emoji_pic_2 = 11,
    trouble_end_description = 12,
    trouble_help_description = 13,
    trouble_effect = 14,
    trouble_end_effect = 15,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_city_trouble_info")

        return t._raw[__key_map[k]]
    end
}


function city_trouble_info.getLength()
    return #city_trouble_info._data
end



function city_trouble_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_city_trouble_info
function city_trouble_info.indexOf(index)
    if index == nil or not city_trouble_info._data[index] then
        return nil
    end
    return setmetatable({_raw = city_trouble_info._data[index]}, m)
end



---
--@return @class record_city_trouble_info
function city_trouble_info.get(id)
    
    return city_trouble_info.indexOf(__index_id[ id ])
     
end



function city_trouble_info.set(id, key, value)
    local record = city_trouble_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function city_trouble_info.get_index_data()
    return __index_id 
end

return  city_trouble_info 