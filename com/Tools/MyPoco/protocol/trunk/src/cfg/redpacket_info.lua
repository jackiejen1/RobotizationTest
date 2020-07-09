---@classdef record_redpacket_info
local record_redpacket_info = {}


record_redpacket_info.id = 0--编号
record_redpacket_info.name =  ""--名称
record_redpacket_info.target = 0--种类
record_redpacket_info.icon = 0--图标
record_redpacket_info.quality = 0--品质
record_redpacket_info.get_limit = 0--领取类型
record_redpacket_info.type = 0--类型
record_redpacket_info.value = 0--类型值
record_redpacket_info.size = 0--面值
record_redpacket_info.limit_people = 0--可领人数
record_redpacket_info.point = 0--财神积分
record_redpacket_info.luckypoint = 0--幸运积分
record_redpacket_info.limit_time = 0--有效时间
record_redpacket_info.disappear_time = 0--消失时间
record_redpacket_info.description =  ""--描述
record_redpacket_info.K = 0--分配参数
record_redpacket_info.gm = 0--是否GM后台发送

local redpacket_info = {
   _data = {   
    [1] = {4,"银币红包(小)",2,11002,4,0,1,3,1440000,48,0,240,43200,3600,"0",5,0,},  
    [2] = {5,"银币红包(中)",2,11002,5,0,1,3,2880000,48,0,480,43200,3600,"0",5,0,},  
    [3] = {6,"银币红包(大)",2,11002,6,0,1,3,4800000,48,0,720,43200,3600,"0",5,0,},  
    [4] = {7,"军团贡献红包(小)",2,11002,4,0,1,11,14400,48,0,480,43200,3600,"0",5,0,},  
    [5] = {8,"军团贡献红包(中)",2,11002,5,0,1,11,24000,48,0,960,43200,3600,"0",5,0,},  
    [6] = {9,"军团贡献红包(大)",2,11002,6,0,1,11,33600,48,0,1440,43200,3600,"0",5,0,},  
    [7] = {10,"元宝红包(小)",2,11002,4,0,999,0,960,48,0,720,43200,3600,"0",5,0,},  
    [8] = {11,"元宝红包(中)",2,11002,5,0,999,0,1440,48,0,1440,43200,3600,"0",5,0,},  
    [9] = {12,"元宝红包(大)",2,11002,6,0,999,0,2400,48,0,2160,43200,3600,"0",5,0,},  
    [10] = {13,"银币红包（小）",1,11002,4,4006,1,3,300000,10,25,50,36000,3600,"银币红包（小）",5,1,},  
    [11] = {14,"军团贡献红包（小）",1,11002,4,4007,1,11,3000,10,50,100,36000,3600,"军团贡献红包（小）",5,1,},  
    [12] = {15,"无双红包（小）",1,11002,4,4005,999,0,200,10,300,150,36000,3600,"无双红包（小）",5,1,},  
    [13] = {16,"无双红包（中）",1,11002,5,4005,999,0,450,15,600,450,36000,3600,"无双红包（中）",5,1,},  
    [14] = {17,"无双红包（大）",1,11002,6,4005,999,0,1000,20,900,900,36000,3600,"无双红包（大）",5,1,},  
    [15] = {101,"贵族1级红包",1,11002,4,4005,999,0,250,5,250,250,36000,3600,"贵族1级红包",5,1,},  
    [16] = {102,"贵族2级红包",1,11002,4,4005,999,0,300,5,300,300,36000,3600,"贵族2级红包",5,1,},  
    [17] = {103,"贵族3级红包",1,11002,4,4005,999,0,350,5,350,350,36000,3600,"贵族3级红包",5,1,},  
    [18] = {104,"贵族4级红包",1,11002,5,4005,999,0,800,10,800,800,36000,3600,"贵族4级红包",5,1,},  
    [19] = {105,"贵族5级红包",1,11002,5,4005,999,0,1000,10,1000,1000,36000,3600,"贵族5级红包",5,1,},  
    [20] = {106,"贵族6级红包",1,11002,5,4005,999,0,1200,10,1200,1200,36000,3600,"贵族6级红包",5,1,},  
    [21] = {107,"贵族7级红包",1,11002,5,4005,999,0,1400,10,1400,1400,36000,3600,"贵族7级红包",5,1,},  
    [22] = {108,"贵族8级红包",1,11002,5,4005,999,0,2400,15,2400,2400,36000,3600,"贵族8级红包",5,1,},  
    [23] = {109,"贵族9级红包",1,11002,5,4005,999,0,2700,15,2700,2700,36000,3600,"贵族9级红包",5,1,},  
    [24] = {110,"贵族10级红包",1,11002,5,4005,999,0,3000,15,3000,3000,36000,3600,"贵族10级红包",5,1,},  
    [25] = {111,"贵族11级红包",1,11002,6,4005,999,0,3300,15,3300,3300,36000,3600,"贵族11级红包",5,1,},  
    [26] = {112,"贵族12级红包",1,11002,6,4005,999,0,4800,20,4800,4800,36000,3600,"贵族12级红包",5,1,},  
    [27] = {113,"贵族13级红包",1,11002,6,4005,999,0,5200,20,5200,5200,36000,3600,"贵族13级红包",5,1,},  
    [28] = {114,"贵族14级红包",1,11002,6,4005,999,0,5600,20,5600,5600,36000,3600,"贵族14级红包",5,1,},  
    [29] = {115,"贵族15级红包",1,11002,6,4005,999,0,9000,30,9000,9000,36000,3600,"贵族15级红包",5,1,},
    }
}

local __index_id = {   
    [4] = 1,  
    [5] = 2,  
    [6] = 3,  
    [7] = 4,  
    [8] = 5,  
    [9] = 6,  
    [10] = 7,  
    [11] = 8,  
    [12] = 9,  
    [13] = 10,  
    [14] = 11,  
    [15] = 12,  
    [16] = 13,  
    [17] = 14,  
    [101] = 15,  
    [102] = 16,  
    [103] = 17,  
    [104] = 18,  
    [105] = 19,  
    [106] = 20,  
    [107] = 21,  
    [108] = 22,  
    [109] = 23,  
    [110] = 24,  
    [111] = 25,  
    [112] = 26,  
    [113] = 27,  
    [114] = 28,  
    [115] = 29,
}

local __key_map = { 
    id = 1,
    name = 2,
    target = 3,
    icon = 4,
    quality = 5,
    get_limit = 6,
    type = 7,
    value = 8,
    size = 9,
    limit_people = 10,
    point = 11,
    luckypoint = 12,
    limit_time = 13,
    disappear_time = 14,
    description = 15,
    K = 16,
    gm = 17,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_redpacket_info")

        return t._raw[__key_map[k]]
    end
}


function redpacket_info.getLength()
    return #redpacket_info._data
end



function redpacket_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_redpacket_info
function redpacket_info.indexOf(index)
    if index == nil or not redpacket_info._data[index] then
        return nil
    end
    return setmetatable({_raw = redpacket_info._data[index]}, m)
end



---
--@return @class record_redpacket_info
function redpacket_info.get(id)
    
    return redpacket_info.indexOf(__index_id[ id ])
     
end



function redpacket_info.set(id, key, value)
    local record = redpacket_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function redpacket_info.get_index_data()
    return __index_id 
end

return  redpacket_info 