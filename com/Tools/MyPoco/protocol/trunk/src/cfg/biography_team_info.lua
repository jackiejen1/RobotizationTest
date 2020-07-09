---@classdef record_biography_team_info
local record_biography_team_info = {}


record_biography_team_info.id = 0--id
record_biography_team_info.name =  ""--战役名称
record_biography_team_info.res = 0--战役资源
record_biography_team_info.fight_power = 0--推荐战力
record_biography_team_info.preset_chapter = 0--前置传记ID
record_biography_team_info.preset_team = 0--前置战役ID
record_biography_team_info.monster_team = 0--关卡怪物
record_biography_team_info.monster_wave = 0--怪物波数
record_biography_team_info.scene_stage = 0--组队场景
record_biography_team_info.battle_stage = 0--战斗地图
record_biography_team_info.attempts = 0--每日挑战次数
record_biography_team_info.cost = 0--消耗体力
record_biography_team_info.seen_type = 0--特色奖励类型
record_biography_team_info.seen_value = 0--特色奖励类型值
record_biography_team_info.reward_tael = 0--奖励-银两
record_biography_team_info.reward_material = 0--奖励-兵符精华
record_biography_team_info.reward_drop = 0--掉落奖励
record_biography_team_info.reward_card = 0--翻牌奖励
record_biography_team_info.reward_first = 0--首通奖励
record_biography_team_info.npc_id = 0--可邀请NPC
record_biography_team_info.description =  ""--战役描述
record_biography_team_info.remind_size = 0--GM后台数量提示

local biography_team_info = {
   _data = {   
    [1] = {1001,"黄巾起义",1,100000,3,0,100001,3,1,1,5,0,5,40070,10000,100,140001,141001,142001,10001,"王允将貂蝉同时赠与吕布和董卓，致使两人反目，爆发大战，彻底瓦解董卓军势力。",2,},  
    [2] = {1002,"英杰平叛",2,200000,7,0,100101,3,1,1,5,0,5,40040,15000,120,140002,141002,142002,10002,"东汉末年，董卓作乱，各路英杰起兵讨伐，揭开了乱世英杰的画卷。",2,},  
    [3] = {1003,"巾帼英雄",3,300000,12,1002,100201,3,1,1,5,0,5,40050,20000,150,140003,141003,142003,10003,"红颜在乱世绽放，一个又一个巾帼英雄的传说流传至今。",2,},  
    [4] = {1004,"逐鹿中原",4,400000,17,1003,100301,3,1,1,5,0,5,40060,25000,180,140004,141004,142004,10004,"群雄割据，逐鹿中原，到底是谁能渔翁得利，笑到最后。",2,},  
    [5] = {1005,"猛士守四方",5,500000,22,1004,100401,3,1,1,5,0,5,50020,30000,200,140005,141005,142005,10005,"大风起兮云飞扬，安得猛士兮守四方！乱世属于强者，属于那些战场上的万人敌。",2,},  
    [6] = {1006,"计定天下",6,600000,27,1005,100501,3,1,1,5,0,5,50030,35000,220,140006,141006,142006,10006,"运筹帷幄之中，决胜千里之外，乱世中的顶尖军师演绎了一出诡谲的权谋大戏。",2,},  
    [7] = {1007,"乱世风云",1,700000,32,1006,100601,3,1,1,5,0,5,50050,40000,250,140007,141007,142007,10007,"混乱的种子开出绽放着邪恶的花朵，这场乱世阴谋到底是谁主导，又是谁在推动。",2,},  
    [8] = {1008,"天下三分",2,800000,37,1007,100701,3,1,1,5,0,5,50040,45000,280,140008,141008,142008,10008,"赤壁之战后，三足鼎立态势已成，孙曹刘从群雄争霸中脱颖而出，而更大的野心家仍在蛰伏。",2,},  
    [9] = {1009,"各为其主",3,900000,42,1008,100801,3,1,1,5,0,5,50010,50000,300,140009,141009,142009,10009,"乱世中的英杰，各位其主，斗智斗勇，成为了一段一段传说。",2,},  
    [10] = {1010,"凡尘俗世",4,1000000,47,1009,100901,3,1,1,5,0,5,50060,55000,350,140010,141010,142010,10010,"本为闲云野鹤，何故沾染凡尘俗世，一入红尘，再难脱身。",2,},  
    [11] = {1011,"笑傲沙场",5,1000000,52,1010,101001,3,1,1,5,0,5,50090,60000,380,140011,141011,143001,10011,"一时名将，横刀立马，笑傲沙场，世间几人可敌？",2,},  
    [12] = {1012,"征战八方",6,1000000,57,1011,101101,3,1,1,5,0,5,50130,65000,400,140012,141012,143002,10012,"开疆扩土，纵横捭阖，在乱世的争霸中，谋臣用智，武将用勇，展开了激烈的交锋",2,},  
    [13] = {1013,"威震四方",1,2000000,62,1012,101201,3,1,1,5,0,5,50080,70000,420,140013,141013,143003,10013,"老骥伏枥，志在千里。英雄终有迟暮之时，但豪情壮志永不磨灭。",2,},  
    [14] = {1014,"风卷云倾",2,3000000,67,1013,101301,3,1,1,5,0,5,50120,75000,450,140014,141014,143004,10014,"烽烟三国，英雄辈出；异士奇人，旷古绝伦。谈笑间，风云翻覆，输赢论定。",2,},  
    [15] = {1015,"虎踞龙盘",3,4500000,72,1014,101401,3,1,1,5,0,5,50070,80000,480,140015,141015,143005,10015,"是谁力挽狂澜，又是谁谋定乾坤？波澜诡谲的水面之下，究竟掩藏着怎样的事实？",2,},
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
}

local __key_map = { 
    id = 1,
    name = 2,
    res = 3,
    fight_power = 4,
    preset_chapter = 5,
    preset_team = 6,
    monster_team = 7,
    monster_wave = 8,
    scene_stage = 9,
    battle_stage = 10,
    attempts = 11,
    cost = 12,
    seen_type = 13,
    seen_value = 14,
    reward_tael = 15,
    reward_material = 16,
    reward_drop = 17,
    reward_card = 18,
    reward_first = 19,
    npc_id = 20,
    description = 21,
    remind_size = 22,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_biography_team_info")

        return t._raw[__key_map[k]]
    end
}


function biography_team_info.getLength()
    return #biography_team_info._data
end



function biography_team_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_biography_team_info
function biography_team_info.indexOf(index)
    if index == nil or not biography_team_info._data[index] then
        return nil
    end
    return setmetatable({_raw = biography_team_info._data[index]}, m)
end



---
--@return @class record_biography_team_info
function biography_team_info.get(id)
    
    return biography_team_info.indexOf(__index_id[ id ])
     
end



function biography_team_info.set(id, key, value)
    local record = biography_team_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function biography_team_info.get_index_data()
    return __index_id 
end

return  biography_team_info 