---@classdef record_bag_empty_info
local record_bag_empty_info = {}


record_bag_empty_info.id = 0--id
record_bag_empty_info.description =  ""--描述
record_bag_empty_info.source_id_1 = 0--获取途径1
record_bag_empty_info.source_id_2 = 0--获取途径2

local bag_empty_info = {
   _data = {   
    [1] = {1,"将军，当前没有武将，可以通过招将招募",3,0,},  
    [2] = {2,"将军，当前没有武将碎片，可以通过招将、主线副本获得",3,0,},  
    [3] = {3,"将军，当前没有合击兵符，挑战神将列传-战役可以获得",4,0,},  
    [4] = {4,"将军，当前没有合击兵符碎片，挑战神将列传-战役可以获得",4,0,},  
    [5] = {5,"将军，当前没有合击，拥有合击并觉醒可以获得",0,0,},  
    [6] = {6,"将军，当前没有道具，购买或参与各种玩法可以获得",2,4,},  
    [7] = {7,"将军，当前没有装备，挑战无双试炼可以获得",6,0,},  
    [8] = {8,"将军，当前没有装备碎片，挑战无双试炼可以获得",6,0,},  
    [9] = {9,"将军，当前没有邮件",0,0,},  
    [10] = {10,"将军，当前没有宝物，寻宝可以获得",5,0,},  
    [11] = {11,"将军，当前没有在线好友，可以添加好友",0,0,},  
    [12] = {12,"将军，当前没有在线军团成员",0,0,},  
    [13] = {13,"将军，当前没有队伍，您可以创建一个队伍",0,0,},  
    [14] = {14,"将军，当前没有好友，点击“添加好友”可以添加好友",0,0,},  
    [15] = {15,"将军，当前还没有玩家发红包哦",0,0,},  
    [16] = {16,"将军，您还没有获得红包，参与游戏各种玩法可以获得",2,4,},  
    [17] = {17,"将军，当前没有消耗品类型道具，购买或参与各种玩法可以获得",2,4,},  
    [18] = {18,"将军，当前没有材料类型道具，购买或参与各种玩法可以获得",2,4,},  
    [19] = {19,"将军，当前没有进阶材料类型道具，购买或参与各种玩法可以获得",2,4,},  
    [20] = {20,"将军，当前没有玩家在您的黑名单中",0,0,},  
    [21] = {21,"将军，当前没有收到好友申请",0,0,},  
    [22] = {22,"将军，当前没有可供领取的礼物",0,0,},  
    [23] = {23,"将军，当前没有奖励邮件",0,0,},  
    [24] = {24,"将军，当前没有系统邮件",0,0,},  
    [25] = {25,"将军，当前背包为空，完成七日活动任务或探索地图可以获得相关道具",0,0,},  
    [26] = {26,"将军，在探索地图中解锁该商店后可购买相关商品",66,0,},  
    [27] = {27,"将军，当前没有神兵，可以通过抽取获得",40,0,},  
    [28] = {28,"将军，当前没有神兵碎片，可以通过抽取和神兵商店获得",40,41,},  
    [29] = {29,"将军，当前没有可显示的货物",0,0,},  
    [30] = {30,"目前没有多余碎片，武将达到满星后碎片才能出售哦~",0,0,},  
    [31] = {31,"将军，还没人胆敢攻击你！",0,0,},  
    [32] = {32,"将军，现在暂时没有收到邀请哦~",0,0,},  
    [33] = {33,"将军，当前没有可找回的资源了",0,0,},  
    [34] = {34,"将军，当前没有神兽",0,0,},  
    [35] = {35,"将军，当前没有神兽碎片",0,0,},  
    [36] = {36,"将军，当前没有神兽装备",68,0,},  
    [37] = {37,"将军，当前没有精彩对决录像，请稍后再试",0,0,},  
    [38] = {38,"将军，当前没有个人战报",0,0,},  
    [39] = {39,"将军，当前没有合击技能，拥有并觉醒可以获得新合击",0,0,},  
    [40] = {40,"将军，当前没有合击，拥有合击并觉醒可以获得",0,0,},  
    [41] = {41,"将军，当前没有历代王者信息",0,0,},  
    [42] = {42,"将军，当前没有赛季排行信息",0,0,},  
    [43] = {43,"将军，当前没有可显示的命星，可以通过占星阁获得",78,0,},  
    [44] = {44,"暂时无人上榜，等待高人前来挑战",0,0,},
    }
}

local __index_id = {   
    [1] = 1,  
    [2] = 2,  
    [3] = 3,  
    [4] = 4,  
    [5] = 5,  
    [6] = 6,  
    [7] = 7,  
    [8] = 8,  
    [9] = 9,  
    [10] = 10,  
    [11] = 11,  
    [12] = 12,  
    [13] = 13,  
    [14] = 14,  
    [15] = 15,  
    [16] = 16,  
    [17] = 17,  
    [18] = 18,  
    [19] = 19,  
    [20] = 20,  
    [21] = 21,  
    [22] = 22,  
    [23] = 23,  
    [24] = 24,  
    [25] = 25,  
    [26] = 26,  
    [27] = 27,  
    [28] = 28,  
    [29] = 29,  
    [30] = 30,  
    [31] = 31,  
    [32] = 32,  
    [33] = 33,  
    [34] = 34,  
    [35] = 35,  
    [36] = 36,  
    [37] = 37,  
    [38] = 38,  
    [39] = 39,  
    [40] = 40,  
    [41] = 41,  
    [42] = 42,  
    [43] = 43,  
    [44] = 44,
}

local __key_map = { 
    id = 1,
    description = 2,
    source_id_1 = 3,
    source_id_2 = 4,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_bag_empty_info")

        return t._raw[__key_map[k]]
    end
}


function bag_empty_info.getLength()
    return #bag_empty_info._data
end



function bag_empty_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_bag_empty_info
function bag_empty_info.indexOf(index)
    if index == nil or not bag_empty_info._data[index] then
        return nil
    end
    return setmetatable({_raw = bag_empty_info._data[index]}, m)
end



---
--@return @class record_bag_empty_info
function bag_empty_info.get(id)
    
    return bag_empty_info.indexOf(__index_id[ id ])
     
end



function bag_empty_info.set(id, key, value)
    local record = bag_empty_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function bag_empty_info.get_index_data()
    return __index_id 
end

return  bag_empty_info 