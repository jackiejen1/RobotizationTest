---@classdef record_unite_compose_info
local record_unite_compose_info = {}


record_unite_compose_info.id = 0--合击武将组合ID
record_unite_compose_info.name =  ""--组合名称
record_unite_compose_info.knight_1 = 0--关联武将1
record_unite_compose_info.knight_2 = 0--关联武将2
record_unite_compose_info.knight_3 = 0--关联武将3
record_unite_compose_info.is_role = 0--是否主角

local unite_compose_info = {
   _data = {   
    [1] = {40000,"刘备+关羽+张飞",510030,300310,500080,0,},  
    [2] = {40004,"关羽+男主",300310,210000,0,0,},  
    [3] = {40005,"关羽+女主",300310,200000,0,0,},  
    [4] = {40010,"步练师+祝融",400070,400050,0,0,},  
    [5] = {40020,"孙尚香+步练师",400130,400050,0,0,},  
    [6] = {40030,"祝融+孟获",400070,400060,0,0,},  
    [7] = {40040,"颜良+文丑",400140,400150,0,0,},  
    [8] = {40050,"黄盖+程普",400090,400110,0,0,},  
    [9] = {40060,"于禁+庞德",400040,400010,0,0,},  
    [10] = {40070,"乐进+徐盛",400030,400120,0,0,},  
    [11] = {40080,"董卓+曹丕",500230,400020,0,0,},  
    [12] = {40090,"华雄+陈宫",500220,400160,0,0,},  
    [13] = {40100,"姜维+法正",500120,400080,0,0,},  
    [14] = {40110,"太史慈+周泰",500170,400100,0,0,},  
    [15] = {50010,"夏侯惇+夏侯渊",500040,500050,0,0,},  
    [16] = {50020,"袁绍+公孙瓒",500200,500240,0,0,},  
    [17] = {50030,"黄忠+魏延",500090,500100,0,0,},  
    [18] = {50040,"孙权+孙坚",500140,500150,0,0,},  
    [19] = {50050,"华佗+鲁肃",500190,500180,0,0,},  
    [20] = {50060,"张辽+张郃",500060,500020,0,0,},  
    [21] = {50070,"刘备+张飞",500080,510030,0,0,},  
    [22] = {50080,"赵云+马超",510040,500110,0,0,},  
    [23] = {50090,"貂蝉+甄姬",510080,500010,0,0,},  
    [24] = {50100,"贾诩+于吉",500210,510070,0,0,},  
    [25] = {50110,"陆逊+吕蒙",510050,500160,0,0,},  
    [26] = {50120,"小乔+大乔",510060,500130,0,0,},  
    [27] = {50130,"典韦+许褚",500030,510020,0,0,},  
    [28] = {50140,"郭嘉+庞统",500070,510010,0,0,},  
    [29] = {50150,"刘备+陆逊",510030,510050,0,0,},  
    [30] = {50160,"貂蝉+小乔",510080,510060,0,0,},  
    [31] = {50170,"郭嘉+贾诩",510010,510070,0,0,},  
    [32] = {50180,"马超+典韦",500110,510020,0,0,},  
    [33] = {50190,"荀彧+司马懿",600110,600020,0,0,},  
    [34] = {50200,"黄月英+诸葛亮",600090,600030,0,0,},  
    [35] = {50210,"甘宁+孙策",600100,600050,0,0,},  
    [36] = {50220,"左慈+张角",600120,600080,0,0,},  
    [37] = {50230,"曹操+关羽",600010,600040,0,0,},  
    [38] = {50240,"周瑜+吕布",600060,600070,0,0,},  
    [39] = {60010,"曹节+诸葛果",700010,700020,0,0,},  
    [40] = {60020,"孙鲁班+吕玲绮",700030,700040,0,0,},  
    [41] = {60030,"战神张辽+幼麟姜维",700060,700050,0,0,},  
    [42] = {60040,"赤炎太史慈+天威袁绍",700080,700070,0,0,},
    }
}

local __index_id = {   
    [40000] = 1,  
    [40004] = 2,  
    [40005] = 3,  
    [40010] = 4,  
    [40020] = 5,  
    [40030] = 6,  
    [40040] = 7,  
    [40050] = 8,  
    [40060] = 9,  
    [40070] = 10,  
    [40080] = 11,  
    [40090] = 12,  
    [40100] = 13,  
    [40110] = 14,  
    [50010] = 15,  
    [50020] = 16,  
    [50030] = 17,  
    [50040] = 18,  
    [50050] = 19,  
    [50060] = 20,  
    [50070] = 21,  
    [50080] = 22,  
    [50090] = 23,  
    [50100] = 24,  
    [50110] = 25,  
    [50120] = 26,  
    [50130] = 27,  
    [50140] = 28,  
    [50150] = 29,  
    [50160] = 30,  
    [50170] = 31,  
    [50180] = 32,  
    [50190] = 33,  
    [50200] = 34,  
    [50210] = 35,  
    [50220] = 36,  
    [50230] = 37,  
    [50240] = 38,  
    [60010] = 39,  
    [60020] = 40,  
    [60030] = 41,  
    [60040] = 42,
}

local __key_map = { 
    id = 1,
    name = 2,
    knight_1 = 3,
    knight_2 = 4,
    knight_3 = 5,
    is_role = 6,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_unite_compose_info")

        return t._raw[__key_map[k]]
    end
}


function unite_compose_info.getLength()
    return #unite_compose_info._data
end



function unite_compose_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_unite_compose_info
function unite_compose_info.indexOf(index)
    if index == nil or not unite_compose_info._data[index] then
        return nil
    end
    return setmetatable({_raw = unite_compose_info._data[index]}, m)
end



---
--@return @class record_unite_compose_info
function unite_compose_info.get(id)
    
    return unite_compose_info.indexOf(__index_id[ id ])
     
end



function unite_compose_info.set(id, key, value)
    local record = unite_compose_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function unite_compose_info.get_index_data()
    return __index_id 
end

return  unite_compose_info 