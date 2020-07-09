---@classdef record_daily_dungeon_stage_info
local record_daily_dungeon_stage_info = {}


record_daily_dungeon_stage_info.id = 0--编号
record_daily_dungeon_stage_info.daily_dungeon_type = 0--类型
record_daily_dungeon_stage_info.name =  ""--难度
record_daily_dungeon_stage_info.difficulty =  ""--难度
record_daily_dungeon_stage_info.stage_level = 0--关卡开启等级
record_daily_dungeon_stage_info.premise_id = 0--前置关卡
record_daily_dungeon_stage_info.fight_power =  ""--推荐战力
record_daily_dungeon_stage_info.description =  ""--解锁描述
record_daily_dungeon_stage_info.monster_name =  ""--怪物名称
record_daily_dungeon_stage_info.monster_team = 0--关卡怪物
record_daily_dungeon_stage_info.pass_type = 0--通关条件类型
record_daily_dungeon_stage_info.sweep_level = 0--扫荡开启等级
record_daily_dungeon_stage_info.reward_preview = 0--通关进度与奖励预览

local daily_dungeon_stage_info = {
   _data = {   
    [1] = {101,1,"武将经验-简单","nandu_1",30,0,"20000","0","野猪",301,2001,0,101,},  
    [2] = {102,1,"武将经验-普通","nandu_2",40,101,"120000","达到40级且通关简单难度后开启","野猪",302,2001,0,102,},  
    [3] = {103,1,"武将经验-精英","nandu_3",56,102,"5450000","达到56级且通关普通难度后开启","野猪",303,2001,0,103,},  
    [4] = {104,1,"武将经验-英雄","nandu_4",68,103,"45840000","达到68级且通关精英难度后开启","野猪",304,2001,0,104,},  
    [5] = {105,1,"武将经验-史诗","nandu_5",80,104,"113850000","达到80级且通关英雄难度后开启","野猪",305,2001,0,105,},  
    [6] = {106,1,"武将经验-传奇","nandu_6",87,105,"209600000","达到87级且通关史诗难度后开启","野猪",306,2001,0,106,},  
    [7] = {201,2,"银币-简单","nandu_1",26,0,"10000","0","狼",401,2101,0,201,},  
    [8] = {202,2,"银币-普通","nandu_2",45,201,"490000","达到45级且通关简单难度后开启","狼",402,2101,0,202,},  
    [9] = {203,2,"银币-精英","nandu_3",62,202,"21760000","达到62级且通关普通难度后开启","狼",403,2101,0,203,},  
    [10] = {204,2,"银币-英雄","nandu_4",74,203,"74870000","达到72级且通关精英难度后开启","狼",404,2101,0,204,},  
    [11] = {205,2,"银币-史诗","nandu_5",84,204,"155060000","达到84级且通关英雄难度后开启","狼",405,2101,0,205,},  
    [12] = {206,2,"银币-传奇","nandu_6",89,205,"262460000","达到89级且通关史诗难度后开启","狼",406,2101,0,206,},  
    [13] = {301,3,"兵符精华-简单","nandu_1",43,0,"170000","0","木牛",601,2101,0,301,},  
    [14] = {302,3,"兵符精华-普通","nandu_2",50,301,"1000000","达到50级且通关简单难度后开启","木牛",602,2101,0,302,},  
    [15] = {303,3,"兵符精华-精英","nandu_3",59,302,"12700000","达到59级且通关普通难度后开启","木牛",603,2101,0,303,},  
    [16] = {304,3,"兵符精华-英雄","nandu_4",71,303,"59030000","达到71级且通关精英难度后开启","木牛",604,2101,0,304,},  
    [17] = {305,3,"兵符精华-史诗","nandu_5",82,304,"132510000","达到82级且通关英雄难度后开启","木牛",605,2101,0,305,},  
    [18] = {306,3,"兵符精华-传奇","nandu_6",88,305,"233040000","达到88级且通关史诗难度后开启","木牛",606,2101,0,306,},  
    [19] = {401,4,"宝物经验-简单","nandu_1",45,0,"490000","0","傀儡连驽手",801,2201,0,401,},  
    [20] = {402,4,"宝物经验-普通","nandu_2",53,401,"3650000","达到53级且通关简单难度后开启","傀儡连驽手",802,2201,0,402,},  
    [21] = {403,4,"宝物经验-精英","nandu_3",65,402,"59640000","达到65级且通关普通难度后开启","傀儡连驽手",803,2201,0,403,},  
    [22] = {404,4,"宝物经验-英雄","nandu_4",77,403,"169780000","达到77级且通关精英难度后开启","傀儡连驽手",804,2201,0,404,},  
    [23] = {405,4,"宝物经验-史诗","nandu_5",86,404,"329540000","达到86级且通关英雄难度后开启","傀儡连驽手",805,2201,0,405,},  
    [24] = {406,4,"宝物经验-传奇","nandu_6",90,405,"539030000","达到90级且通关史诗难度后开启","傀儡连驽手",806,2201,0,406,},  
    [25] = {501,5,"神兵副本-简单","nandu_1",53,0,"7315008","0","龙炮",901,2001,0,501,},  
    [26] = {502,5,"神兵副本-普通","nandu_2",64,501,"44416836","达到64级且通关简单难度后开启","龙炮",902,2001,0,502,},  
    [27] = {503,5,"神兵副本-精英","nandu_3",73,502,"152816212","达到73级且通关普通难度后开启","龙炮",903,2001,0,503,},  
    [28] = {504,5,"神兵副本-英雄","nandu_4",81,503,"270430268","达到81级且通关精英难度后开启","龙炮",904,2001,0,504,},  
    [29] = {505,5,"神兵副本-史诗","nandu_5",85,504,"445706312","达到85级且通关英雄难度后开启","龙炮",905,2001,0,505,},  
    [30] = {506,5,"神兵副本-传奇","nandu_6",91,505,"603224188","达到91级且通关史诗难度后开启","龙炮",906,2001,0,506,},
    }
}

local __index_id = {   
    [101] = 1,  
    [102] = 2,  
    [103] = 3,  
    [104] = 4,  
    [105] = 5,  
    [106] = 6,  
    [201] = 7,  
    [202] = 8,  
    [203] = 9,  
    [204] = 10,  
    [205] = 11,  
    [206] = 12,  
    [301] = 13,  
    [302] = 14,  
    [303] = 15,  
    [304] = 16,  
    [305] = 17,  
    [306] = 18,  
    [401] = 19,  
    [402] = 20,  
    [403] = 21,  
    [404] = 22,  
    [405] = 23,  
    [406] = 24,  
    [501] = 25,  
    [502] = 26,  
    [503] = 27,  
    [504] = 28,  
    [505] = 29,  
    [506] = 30,
}

local __key_map = { 
    id = 1,
    daily_dungeon_type = 2,
    name = 3,
    difficulty = 4,
    stage_level = 5,
    premise_id = 6,
    fight_power = 7,
    description = 8,
    monster_name = 9,
    monster_team = 10,
    pass_type = 11,
    sweep_level = 12,
    reward_preview = 13,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_daily_dungeon_stage_info")

        return t._raw[__key_map[k]]
    end
}


function daily_dungeon_stage_info.getLength()
    return #daily_dungeon_stage_info._data
end



function daily_dungeon_stage_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_daily_dungeon_stage_info
function daily_dungeon_stage_info.indexOf(index)
    if index == nil or not daily_dungeon_stage_info._data[index] then
        return nil
    end
    return setmetatable({_raw = daily_dungeon_stage_info._data[index]}, m)
end



---
--@return @class record_daily_dungeon_stage_info
function daily_dungeon_stage_info.get(id)
    
    return daily_dungeon_stage_info.indexOf(__index_id[ id ])
     
end



function daily_dungeon_stage_info.set(id, key, value)
    local record = daily_dungeon_stage_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function daily_dungeon_stage_info.get_index_data()
    return __index_id 
end

return  daily_dungeon_stage_info 