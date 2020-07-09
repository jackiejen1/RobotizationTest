---@classdef record_battle_rating_info
local record_battle_rating_info = {}


record_battle_rating_info.id = 0--id
record_battle_rating_info.name =  ""--评价描述
record_battle_rating_info.rating_type = 0--评价类型
record_battle_rating_info.rating_value = 0--评价类型值

local battle_rating_info = {
   _data = {   
    [1] = {1,"多于1武将阵亡",1,0,},  
    [2] = {201,"无武将阵亡",2,1,},  
    [3] = {202,"1武将阵亡",2,2,},  
    [4] = {203,"2武将阵亡",2,3,},  
    [5] = {204,"3武将阵亡",2,4,},  
    [6] = {205,"4武将阵亡",2,5,},  
    [7] = {301,"回合数少于2回合",3,2,},  
    [8] = {302,"回合数少于3回合",3,3,},  
    [9] = {303,"回合数少于4回合",3,4,},  
    [10] = {304,"回合数少于5回合",3,5,},  
    [11] = {305,"回合数少于6回合",3,6,},  
    [12] = {1001,"消灭全部敌人",1,0,},  
    [13] = {1101,"在6回合内获得胜利",4,6,},  
    [14] = {1102,"在5回合内获得胜利",4,5,},  
    [15] = {1103,"在4回合内获得胜利",4,4,},  
    [16] = {1104,"在3回合内获得胜利",4,3,},  
    [17] = {1105,"在2回合内获得胜利",4,2,},  
    [18] = {1201,"我方死亡不超过2人",5,2,},  
    [19] = {1202,"我方死亡不超过1人",5,1,},  
    [20] = {1203,"我方全体存活",5,0,},  
    [21] = {1301,"我方总血量高于50%",6,50,},  
    [22] = {1302,"我方总血量高于60%",6,60,},  
    [23] = {1303,"我方总血量高于65%",6,65,},  
    [24] = {1304,"我方总血量高于70%",6,70,},  
    [25] = {1305,"我方总血量高于75%",6,75,},  
    [26] = {1306,"我方总血量高于80%",6,80,},  
    [27] = {1307,"我方总血量高于85%",6,85,},  
    [28] = {2001,"5回合内击败敌方",8,100,},  
    [29] = {2101,"击败所有波次怪物",9,0,},  
    [30] = {2201,"我方坚持4回合",7,4,},  
    [31] = {3001,"战斗最多5回合",10,5,},  
    [32] = {3002,"战斗最多5回合",10,5,},  
    [33] = {4001,"战斗最多5回合",10,5,},  
    [34] = {4002,"战斗最多2回合",10,2,},  
    [35] = {4101,"战斗最多5回合",10,5,},  
    [36] = {4102,"战斗最多5回合",10,5,},
    }
}

local __index_id = {   
    [1] = 1,  
    [201] = 2,  
    [202] = 3,  
    [203] = 4,  
    [204] = 5,  
    [205] = 6,  
    [301] = 7,  
    [302] = 8,  
    [303] = 9,  
    [304] = 10,  
    [305] = 11,  
    [1001] = 12,  
    [1101] = 13,  
    [1102] = 14,  
    [1103] = 15,  
    [1104] = 16,  
    [1105] = 17,  
    [1201] = 18,  
    [1202] = 19,  
    [1203] = 20,  
    [1301] = 21,  
    [1302] = 22,  
    [1303] = 23,  
    [1304] = 24,  
    [1305] = 25,  
    [1306] = 26,  
    [1307] = 27,  
    [2001] = 28,  
    [2101] = 29,  
    [2201] = 30,  
    [3001] = 31,  
    [3002] = 32,  
    [4001] = 33,  
    [4002] = 34,  
    [4101] = 35,  
    [4102] = 36,
}

local __key_map = { 
    id = 1,
    name = 2,
    rating_type = 3,
    rating_value = 4,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_battle_rating_info")

        return t._raw[__key_map[k]]
    end
}


function battle_rating_info.getLength()
    return #battle_rating_info._data
end



function battle_rating_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_battle_rating_info
function battle_rating_info.indexOf(index)
    if index == nil or not battle_rating_info._data[index] then
        return nil
    end
    return setmetatable({_raw = battle_rating_info._data[index]}, m)
end



---
--@return @class record_battle_rating_info
function battle_rating_info.get(id)
    
    return battle_rating_info.indexOf(__index_id[ id ])
     
end



function battle_rating_info.set(id, key, value)
    local record = battle_rating_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function battle_rating_info.get_index_data()
    return __index_id 
end

return  battle_rating_info 