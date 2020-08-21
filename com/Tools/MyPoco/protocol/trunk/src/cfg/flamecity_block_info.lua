---@classdef record_flamecity_block_info
local record_flamecity_block_info = {}


record_flamecity_block_info.id = 0--id
record_flamecity_block_info.map_id = 0--地图id
record_flamecity_block_info.build_id = 0--摆件id
record_flamecity_block_info.name =  ""--名称
record_flamecity_block_info.type = 0--类型
record_flamecity_block_info.value = 0--类型值
record_flamecity_block_info.if_infinite_hp = 0--是否无限耐久
record_flamecity_block_info.hp_max = 0--耐久值上限
record_flamecity_block_info.if_unlock = 0--初始解锁状态
record_flamecity_block_info.image =  ""--图片
record_flamecity_block_info.icon =  ""--弹窗小图标
record_flamecity_block_info.minimap_icon =  ""--小地图图标
record_flamecity_block_info.target_off_icon =  ""--进攻目标未选中
record_flamecity_block_info.target_on_icon =  ""--进攻目标选中
record_flamecity_block_info.fight_icon =  ""--战斗小图标
record_flamecity_block_info.event_passive_1 =  ""--被动事件1
record_flamecity_block_info.event_passive_2 =  ""--被动事件2

local flamecity_block_info = {
   _data = {   
    [1] = {12,101,12,"大宝箱",5,101,0,0,1,"baoxianggaoji","108","","","","","0","0",},  
    [2] = {8,101,8,"小县城",3,210006,0,100,0,"1","106","","","","","攻破箭塔后，城池防御降低30%","攻破兵营后，城池耐久降低30%",},  
    [3] = {9,101,8,"小县城",3,210006,0,100,0,"2","106","","","","","攻破箭塔后，城池防御降低30%","攻破兵营后，城池耐久降低30%",},  
    [4] = {10,101,8,"小县城",3,210006,0,100,0,"3","106","","","","","攻破箭塔后，城池防御降低30%","攻破兵营后，城池耐久降低30%",},  
    [5] = {11,101,8,"小县城",3,210006,0,100,0,"4","106","","","","","攻破箭塔后，城池防御降低30%","攻破兵营后，城池耐久降低30%",},  
    [6] = {29,101,29,"小宝箱",4,800091,0,0,1,"baoxiangdiji","107","","","","","0","0",},  
    [7] = {25,101,25,"伐木场",1,210002,0,100,0,"caodi_2","102","","","","","0","0",},  
    [8] = {24,101,24,"农田",1,210001,0,100,0,"caodi_2","101","","","","","0","0",},  
    [9] = {13,101,13,"箭塔",2,210004,0,100,1,"dijiyingdi_1","104","","","","","攻破兵营后可解锁","0",},  
    [10] = {28,101,28,"大宝箱",5,102,0,0,1,"baoxiangdiji","108","","","","","0","0",},  
    [11] = {14,101,14,"兵营",2,210005,0,100,0,"gaojiyingdi_1","105","","","","","0","0",},  
    [12] = {23,101,23,"矿场",1,210003,0,100,0,"caodi_2","103","","","","","0","0",},  
    [13] = {22,101,22,"农田",1,210007,0,100,0,"caodi_2","101","","","","","0","0",},  
    [14] = {30,101,30,"农田",1,210008,0,100,0,"caodi_2","101","","","","","0","0",},  
    [15] = {21,101,21,"农田",1,210009,0,100,0,"caodi_2","101","","","","","0","0",},  
    [16] = {20,101,20,"矿场",1,210010,0,100,0,"caodi_2","103","","","","","0","0",},  
    [17] = {19,101,19,"矿场",1,210011,0,100,0,"caodi_2","103","","","","","0","0",},  
    [18] = {18,101,18,"矿场",1,210012,0,100,0,"caodi_2","103","","","","","0","0",},  
    [19] = {17,101,17,"伐木场",1,210013,0,100,0,"caodi_2","102","","","","","0","0",},  
    [20] = {16,101,16,"伐木场",1,210014,0,100,0,"caodi_2","102","","","","","0","0",},  
    [21] = {15,101,15,"伐木场",1,210015,0,100,0,"caodi_2","102","","","","","0","0",},
    }
}

local __index_id_map_id = {   
    ["12_101"] = 1,  
    ["8_101"] = 2,  
    ["9_101"] = 3,  
    ["10_101"] = 4,  
    ["11_101"] = 5,  
    ["29_101"] = 6,  
    ["25_101"] = 7,  
    ["24_101"] = 8,  
    ["13_101"] = 9,  
    ["28_101"] = 10,  
    ["14_101"] = 11,  
    ["23_101"] = 12,  
    ["22_101"] = 13,  
    ["30_101"] = 14,  
    ["21_101"] = 15,  
    ["20_101"] = 16,  
    ["19_101"] = 17,  
    ["18_101"] = 18,  
    ["17_101"] = 19,  
    ["16_101"] = 20,  
    ["15_101"] = 21,
}

local __key_map = { 
    id = 1,
    map_id = 2,
    build_id = 3,
    name = 4,
    type = 5,
    value = 6,
    if_infinite_hp = 7,
    hp_max = 8,
    if_unlock = 9,
    image = 10,
    icon = 11,
    minimap_icon = 12,
    target_off_icon = 13,
    target_on_icon = 14,
    fight_icon = 15,
    event_passive_1 = 16,
    event_passive_2 = 17,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_flamecity_block_info")

        return t._raw[__key_map[k]]
    end
}


function flamecity_block_info.getLength()
    return #flamecity_block_info._data
end



function flamecity_block_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_flamecity_block_info
function flamecity_block_info.indexOf(index)
    if index == nil or not flamecity_block_info._data[index] then
        return nil
    end
    return setmetatable({_raw = flamecity_block_info._data[index]}, m)
end



---
--@return @class record_flamecity_block_info
function flamecity_block_info.get(id,map_id)
    
    local k = id .. '_' .. map_id
    return flamecity_block_info.indexOf(__index_id_map_id[k])
     
end



function flamecity_block_info.set(id,map_id, key, value)
    local record = flamecity_block_info.get(id,map_id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function flamecity_block_info.get_index_data()
    return __index_id_map_id 
end

return  flamecity_block_info 