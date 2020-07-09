---@classdef record_avatar_frame_info
local record_avatar_frame_info = {}


record_avatar_frame_info.id = 0--id
record_avatar_frame_info.name =  ""--名称
record_avatar_frame_info.type = 0--类型
record_avatar_frame_info.open_type = 0--开启类型
record_avatar_frame_info.open_value = 0--开启类型值
record_avatar_frame_info.time_type = 0--头像框时效类型
record_avatar_frame_info.time_value = 0--头像框时效
record_avatar_frame_info.res =  ""--资源
record_avatar_frame_info.resEffect =  ""--特效
record_avatar_frame_info.description =  ""--描述
record_avatar_frame_info.route_id = 0--跳转ID
record_avatar_frame_info.op_game_id = 0--可见运营平台

local avatar_frame_info = {
   _data = {   
    [1] = {1001,"贵族1头像框",1,2,1,1,0,"1001","0","贵族1级专属头像框。",65,0,},  
    [2] = {1002,"贵族3头像框",1,2,3,1,0,"1002","0","贵族3级专属头像框。",65,0,},  
    [3] = {1003,"贵族5头像框",1,2,5,1,0,"1003","0","贵族5级专属头像框。",65,0,},  
    [4] = {1004,"贵族8头像框",1,2,8,1,0,"1004","0","贵族8级专属头像框。",65,0,},  
    [5] = {1005,"贵族10头像框",1,2,10,1,0,"1005","0","贵族10级专属头像框。",65,0,},  
    [6] = {1006,"贵族12头像框",1,2,12,1,0,"1006","0","贵族12级专属头像框。",65,0,},  
    [7] = {1007,"富甲天下头像框",1,3,88,1,0,"1007","0","参与活动获得。",65,0,},  
    [8] = {2001,"霸服头像框",3,3,58,1,0,"2001","0","参与霸服活动获得。",1,1716,},  
    [9] = {2002,"荣耀头像框",3,3,60,1,0,"2002","0","参与活动获得。",1,0,},  
    [10] = {2003,"追梦少年头像框",3,3,65,1,0,"2003","0","参与公测返利获得。",1,0,},  
    [11] = {2004,"九州神游头像框",3,3,66,1,0,"2004","0","参与活动获得。",1,1718,},  
    [12] = {2005,"少年壮志头像框",3,3,67,1,0,"2005","0","参与活动获得。",1,1715,},  
    [13] = {2006,"文曲星头像框",3,3,68,1,0,"2006","0","参与活动获得。",1,1716,},  
    [14] = {2007,"三国之志头像框",3,3,69,1,0,"2007","0","参与活动获得。",1,0,},  
    [15] = {2008,"天籁之音头像框",3,3,70,1,0,"2008","0","参与活动获得。",1,1717,},  
    [16] = {2009,"追风逐浪头像框",3,3,71,1,0,"2009","0","参与活动获得。",1,1717,},  
    [17] = {2010,"闪耀登场头像框",3,3,72,1,0,"2010","0","参与活动获得。",1,1716,},  
    [18] = {2011,"砥砺前行头像框",3,3,102,1,0,"2011","0","感恩少年，砥砺前行！参与活动可获得。",1,0,},  
    [19] = {2012,"潮玩少年头像框",3,3,192,1,0,"2012","0","参与活动获得。",1,0,},  
    [20] = {2013,"唐人吃面头像框",3,3,193,1,0,"2013","0","参与活动获得。",1,0,},  
    [21] = {2014,"游恋头像框",3,3,199,1,0,"2014","0","参与活动获得。",1,1714,},  
    [22] = {2015,"游恋头像框",3,3,200,1,0,"2015","0","参与活动获得。",1,1715,},  
    [23] = {3101,"一方诸侯头像框",2,3,93,1,0,"3101","0","城池争霸宏图霸业获得。",191,0,},  
    [24] = {3102,"四海霸王头像框",2,3,94,1,0,"3102","0","城池争霸宏图霸业获得。",191,0,},  
    [25] = {4101,"佣兵天下头像框",3,3,116,2,1296000,"4101","0","号令天下本服排行奖励获得",1,0,},  
    [26] = {4102,"号令天下头像框",3,3,117,2,1296000,"4102","0","号令天下跨服排行奖励获得",1,0,},  
    [27] = {4103,"战火重燃头像框",3,3,156,1,0,"4103","0","少年归来，战火重燃！参与活动可获得。",1,0,},  
    [28] = {5001,"游刃有余头像框",2,3,174,2,1728000,"5001","0","王者竞技战区排名前50获得。",225,0,},  
    [29] = {5002,"大显身手头像框",2,3,175,2,1728000,"5002","0","王者竞技战区排名前30获得。",225,0,},  
    [30] = {5003,"卓尔不群头像框",2,3,176,2,1728000,"5003","0","王者竞技战区排名前10获得。",225,0,},  
    [31] = {5004,"叱咤风云头像框",2,3,177,2,1728000,"5004","effect_peakarena_frame_3","王者竞技战区排名前5获得。",225,0,},  
    [32] = {5005,"傲视群雄头像框",2,3,178,2,1728000,"5005","effect_peakarena_frame_2","王者竞技战区排名前3获得。",225,0,},  
    [33] = {5006,"最强王者头像框",2,3,179,2,1728000,"5006","effect_peakarena_frame_1","王者竞技战区第1名获得。",225,0,},  
    [34] = {5007,"势如破竹头像框",2,3,189,2,1209600,"5007","0","攻城掠地新赛季排行奖励获得。",1,0,},  
    [35] = {5008,"所向披靡头像框",2,3,190,2,1209600,"5008","0","攻城掠地新赛季排行奖励获得。",1,0,},  
    [36] = {5009,"百战百胜头像框",2,3,191,2,1209600,"5009","0","攻城掠地新赛季排行奖励获得。",1,0,},
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
    [2001] = 8,  
    [2002] = 9,  
    [2003] = 10,  
    [2004] = 11,  
    [2005] = 12,  
    [2006] = 13,  
    [2007] = 14,  
    [2008] = 15,  
    [2009] = 16,  
    [2010] = 17,  
    [2011] = 18,  
    [2012] = 19,  
    [2013] = 20,  
    [2014] = 21,  
    [2015] = 22,  
    [3101] = 23,  
    [3102] = 24,  
    [4101] = 25,  
    [4102] = 26,  
    [4103] = 27,  
    [5001] = 28,  
    [5002] = 29,  
    [5003] = 30,  
    [5004] = 31,  
    [5005] = 32,  
    [5006] = 33,  
    [5007] = 34,  
    [5008] = 35,  
    [5009] = 36,
}

local __key_map = { 
    id = 1,
    name = 2,
    type = 3,
    open_type = 4,
    open_value = 5,
    time_type = 6,
    time_value = 7,
    res = 8,
    resEffect = 9,
    description = 10,
    route_id = 11,
    op_game_id = 12,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_avatar_frame_info")

        return t._raw[__key_map[k]]
    end
}


function avatar_frame_info.getLength()
    return #avatar_frame_info._data
end



function avatar_frame_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_avatar_frame_info
function avatar_frame_info.indexOf(index)
    if index == nil or not avatar_frame_info._data[index] then
        return nil
    end
    return setmetatable({_raw = avatar_frame_info._data[index]}, m)
end



---
--@return @class record_avatar_frame_info
function avatar_frame_info.get(id)
    
    return avatar_frame_info.indexOf(__index_id[ id ])
     
end



function avatar_frame_info.set(id, key, value)
    local record = avatar_frame_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function avatar_frame_info.get_index_data()
    return __index_id 
end

return  avatar_frame_info 