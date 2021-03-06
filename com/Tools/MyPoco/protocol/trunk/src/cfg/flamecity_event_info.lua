---@classdef record_flamecity_event_info
local record_flamecity_event_info = {}


record_flamecity_event_info.id = 0--id
record_flamecity_event_info.block_id = 0--格子
record_flamecity_event_info.map_id = 0--地图
record_flamecity_event_info.type = 0--事件类型
record_flamecity_event_info.value = 0--事件类型值
record_flamecity_event_info.description =  ""--事件描述
record_flamecity_event_info.bigmap_des =  ""--大地图事件描述
record_flamecity_event_info.win_des =  ""--攻占描述
record_flamecity_event_info.notice_id = 0--走马灯信息

local flamecity_event_info = {
   _data = {   
    [1] = {1001,219,101,4,0,"攻占后章节通关。","攻占主城池后章节通关。","恭喜将军，您的军团已通关县城起兵章节！",2109,},  
    [2] = {1002,219,101,1,223,"攻占后获得烽火宝藏奖励。","攻占后获得烽火宝藏奖励。","发现烽火宝藏！",2111,},  
    [3] = {1003,175,102,4,0,"攻占后章节通关。","攻占主城池后章节通关。","恭喜将军，您的军团已通关首战告捷章节！",2109,},  
    [4] = {1004,175,102,1,229,"攻占后获得烽火宝藏奖励。","攻占后获得烽火宝藏奖励。","发现烽火宝藏！",2111,},  
    [5] = {1005,175,102,2,242,"攻占后解锁箭塔。","攻占后解锁箭塔。","成功解锁箭塔！",2114,},  
    [6] = {1006,242,102,5,0,"0","0","恭喜将军，您的军团已攻占箭塔！",2110,},  
    [7] = {1007,242,102,1,244,"攻占后获得宝箱奖励。","攻占箭塔后获得宝箱奖励。","发现宝箱！",2112,},  
    [8] = {1008,105,103,4,0,"攻占后章节通关。","攻占主城池后章节通关。","恭喜将军，您的军团已通关屯兵河内章节！",2109,},  
    [9] = {1009,105,103,1,196,"攻占后获得烽火宝藏奖励。","攻占后获得烽火宝藏奖励。","发现烽火宝藏！",2111,},  
    [10] = {1010,179,103,5,0,"0","0","恭喜将军，您的军团已攻占箭塔！",2110,},  
    [11] = {1011,179,103,1,14,"攻占后获得宝箱奖励。","攻占箭塔后获得宝箱奖励。","发现宝箱！",2112,},  
    [12] = {1012,179,103,3,1001,"攻占后军团所有成员本章中攻击力提升10%。","攻占后军团所有成员本章中攻击力提升10%。","由于攻占了箭塔，军团所有成员在本章中攻击力提升10%！",2115,},  
    [13] = {1013,90,103,5,0,"0","0","恭喜将军，您的军团已攻占兵营！",2110,},  
    [14] = {1014,90,103,1,100,"攻占后获得烽火宝藏奖励。","攻占兵营后获得烽火宝藏奖励。","发现烽火宝藏！",2111,},  
    [15] = {1015,90,103,3,1002,"攻占后主城池耐久降低10%。","攻占后主城池耐久降低10%。","由于攻占了兵营，章节主城池耐久降低10%！",2113,},  
    [16] = {1016,140,104,4,0,"攻占后章节通关。","攻占主城池后章节通关。","恭喜将军，您的军团已通关挺进颍川章节！",2109,},  
    [17] = {1017,140,104,1,144,"攻占后获得烽火宝藏奖励。","攻占后获得烽火宝藏奖励。","发现烽火宝藏！",2111,},  
    [18] = {1018,152,104,5,0,"0","0","恭喜将军，您的军团已攻占箭塔！",2110,},  
    [19] = {1019,152,104,1,153,"攻占后获得烽火宝藏奖励。","攻占箭塔后获得烽火宝藏奖励。","发现烽火宝藏！",2111,},  
    [20] = {1020,136,104,5,0,"0","0","恭喜将军，您的军团已攻占兵营！",2110,},  
    [21] = {1021,136,104,1,74,"攻占后获得烽火宝藏奖励。","攻占兵营后获得烽火宝藏奖励。","发现烽火宝藏！",2111,},  
    [22] = {1022,32,105,4,0,"攻占后章节通关。","攻占主城池后章节通关。","恭喜将军，您的军团已通关鲁阳会兵章节！",2109,},  
    [23] = {1023,32,105,1,109,"攻占后获得烽火宝藏奖励。","攻占后获得烽火宝藏奖励。","发现烽火宝藏！",2111,},  
    [24] = {1024,84,105,5,0,"0","0","恭喜将军，您的军团已攻占箭塔！",2110,},  
    [25] = {1025,84,105,1,85,"攻占后获得宝箱奖励。","攻占箭塔后获得宝箱奖励。","发现宝箱！",2112,},  
    [26] = {1026,84,105,3,1003,"攻占后主城池耐久降低15%。","攻占后主城池耐久降低15%。","由于攻占了兵营，章节主城池耐久降低15%！",2116,},  
    [27] = {1027,10,105,5,0,"0","0","恭喜将军，您的军团已攻占兵营！",2110,},  
    [28] = {1028,10,105,1,107,"攻占后获得烽火宝藏奖励。","攻占兵营后获得烽火宝藏奖励。","发现烽火宝藏！",2111,},  
    [29] = {1029,26,106,4,0,"攻占后章节通关。","攻占主城池后章节通关。","恭喜将军，您的军团已通关进军酸枣章节！",2109,},  
    [30] = {1030,26,106,1,107,"攻占后获得烽火宝藏奖励。","攻占后获得烽火宝藏奖励。","发现烽火宝藏！",2111,},  
    [31] = {1031,31,106,5,0,"0","0","恭喜将军，您的军团已攻占箭塔！",2110,},  
    [32] = {1032,31,106,1,99,"攻占后获得宝箱奖励。","攻占箭塔后获得宝箱奖励。","发现宝箱！",2112,},  
    [33] = {1034,21,106,5,0,"0","0","恭喜将军，您的军团已攻占兵营！",2110,},  
    [34] = {1035,21,106,1,32,"攻占后获得烽火宝藏奖励。","攻占兵营后获得烽火宝藏奖励。","发现烽火宝藏！",2111,},  
    [35] = {1036,33,106,5,0,"0","0","恭喜将军，您的军团已攻占兵营！",2110,},  
    [36] = {1037,33,106,1,34,"攻占后获得烽火宝藏奖励。","攻占兵营后获得烽火宝藏奖励。","发现烽火宝藏！",2111,},  
    [37] = {1033,33,106,3,1004,"攻占后箭塔耐久降低20%。","攻占后箭塔耐久降低20%。","由于攻占了兵营，箭塔耐久降低20%！",2118,},  
    [38] = {1038,92,107,4,0,"攻占后章节通关。","攻占主城池后章节通关。","恭喜将军，您的军团已通关恶战虎牢章节！",2109,},  
    [39] = {1039,92,107,1,112,"攻占后获得烽火宝藏奖励。","攻占后获得烽火宝藏奖励。","发现烽火宝藏！",2111,},  
    [40] = {1040,25,107,5,0,"0","0","恭喜将军，您的军团已攻占兵营！",2110,},  
    [41] = {1041,25,107,1,85,"攻占后获得烽火宝藏奖励。","攻占后获得烽火宝藏奖励。","发现烽火宝藏！",2111,},  
    [42] = {1042,28,107,5,0,"0","0","恭喜将军，您的军团已攻占箭塔！",2110,},  
    [43] = {1043,28,107,1,33,"攻占后获得宝箱奖励。","攻占箭塔后获得宝箱奖励。","发现宝箱！",2112,},  
    [44] = {1044,28,107,3,1005,"攻占后军团所有成员本章中攻击力提升15%。","攻占后军团所有成员本章中攻击力提升15%。","由于攻占了箭塔，军团所有成员在本章中攻击力提升15%！",2119,},  
    [45] = {1045,29,107,5,0,"0","0","恭喜将军，您的军团已攻占兵营！",2110,},  
    [46] = {1046,29,107,1,45,"攻占后获得烽火宝藏奖励。","攻占兵营后获得烽火宝藏奖励。","发现烽火宝藏！",2111,},  
    [47] = {1047,3,108,4,0,"攻占后章节通关。","攻占主城池后章节通关。","恭喜将军，您的军团已通关洛阳之战章节！",2109,},  
    [48] = {1048,3,108,1,52,"攻占后获得烽火宝藏奖励。","攻占后获得烽火宝藏奖励。","发现烽火宝藏！",2111,},  
    [49] = {1049,3,108,2,162,"0","0","0",0,},  
    [50] = {1050,12,108,5,0,"0","0","恭喜将军，您的军团已攻占箭塔！",2110,},  
    [51] = {1051,12,108,1,15,"攻占后获得宝箱奖励。","攻占箭塔后获得宝箱奖励。","发现宝箱！",2112,},  
    [52] = {1052,12,108,3,1006,"攻占后主城池耐久降低20%。","攻占后主城池耐久降低20%。","由于攻占了箭塔，章节主城池耐久降低20%！",2120,},  
    [53] = {1053,1,108,5,0,"0","0","恭喜将军，您的军团已攻占兵营！",2110,},  
    [54] = {1054,1,108,1,2,"攻占后获得烽火宝藏奖励。","攻占后获得烽火宝藏奖励。","发现烽火宝藏！",2111,},  
    [55] = {1055,13,108,5,0,"0","0","恭喜将军，您的军团已攻占兵营！",2110,},  
    [56] = {1056,13,108,1,14,"攻占后获得烽火宝藏奖励。","攻占兵营后获得烽火宝藏奖励。","发现烽火宝藏！",2111,},
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
    [1016] = 16,  
    [1017] = 17,  
    [1018] = 18,  
    [1019] = 19,  
    [1020] = 20,  
    [1021] = 21,  
    [1022] = 22,  
    [1023] = 23,  
    [1024] = 24,  
    [1025] = 25,  
    [1026] = 26,  
    [1027] = 27,  
    [1028] = 28,  
    [1029] = 29,  
    [1030] = 30,  
    [1031] = 31,  
    [1032] = 32,  
    [1033] = 37,  
    [1034] = 33,  
    [1035] = 34,  
    [1036] = 35,  
    [1037] = 36,  
    [1038] = 38,  
    [1039] = 39,  
    [1040] = 40,  
    [1041] = 41,  
    [1042] = 42,  
    [1043] = 43,  
    [1044] = 44,  
    [1045] = 45,  
    [1046] = 46,  
    [1047] = 47,  
    [1048] = 48,  
    [1049] = 49,  
    [1050] = 50,  
    [1051] = 51,  
    [1052] = 52,  
    [1053] = 53,  
    [1054] = 54,  
    [1055] = 55,  
    [1056] = 56,
}

local __key_map = { 
    id = 1,
    block_id = 2,
    map_id = 3,
    type = 4,
    value = 5,
    description = 6,
    bigmap_des = 7,
    win_des = 8,
    notice_id = 9,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_flamecity_event_info")

        return t._raw[__key_map[k]]
    end
}


function flamecity_event_info.getLength()
    return #flamecity_event_info._data
end



function flamecity_event_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_flamecity_event_info
function flamecity_event_info.indexOf(index)
    if index == nil or not flamecity_event_info._data[index] then
        return nil
    end
    return setmetatable({_raw = flamecity_event_info._data[index]}, m)
end



---
--@return @class record_flamecity_event_info
function flamecity_event_info.get(id)
    
    return flamecity_event_info.indexOf(__index_id[ id ])
     
end



function flamecity_event_info.set(id, key, value)
    local record = flamecity_event_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function flamecity_event_info.get_index_data()
    return __index_id 
end

return  flamecity_event_info 