---@classdef record_share_res_info
local record_share_res_info = {}


record_share_res_info.id = 0--id
record_share_res_info.game_type = 0--所属运营平台
record_share_res_info.text_weibo =  ""--分享文本_微博
record_share_res_info.text_wechat =  ""--分享文本_微信
record_share_res_info.text_qq =  ""--分享文本_qq
record_share_res_info.code =  ""--二维码资源
record_share_res_info.logo =  ""--logo

local share_res_info = {
   _data = {   
    [1] = {1,1,"#少年三国志2#这立绘帅爆，忍不住分享一下！","0","0","shaosan2_code","logo_1",},  
    [2] = {2,1,"#少年三国志2#今天也是欧气十足的一天！","0","0","shaosan2_code","logo_1",},  
    [3] = {3,1,"#少年三国志2#酒已温好，我有故事，你来听吗？","0","0","shaosan2_code","logo_1",},  
    [4] = {4,1,"#少年三国志2#三国如雪，江山如画，多少青史名，一时少年意。","0","0","shaosan2_code","logo_1",},  
    [5] = {5,1,"#少年三国志2#展一幅英雄画卷，品一部少年三国！","0","0","shaosan2_code","logo_1",},  
    [6] = {6,1,"#少年三国志2#这立绘帅爆，忍不住分享一下！","0","0","shaosan2_code","logo_1",},  
    [7] = {7,1,"#少年三国志2#这立绘帅爆，忍不住分享一下！","0","0","shaosan2_code","logo_1",},  
    [8] = {8,1,"#少年三国志2#少年庆典送福袋！","0","0","shaosan2_code","logo_1",},  
    [9] = {9,1,"#少年三国志2#陈赫送红包，助你成三国锦鲤","0","0","shaosan2_code","logo_1",},  
    [10] = {1,2,"这立绘帅爆，忍不住分享一下！","0","0","0","logo_2",},  
    [11] = {2,2,"今天也是欧气十足的一天！","0","0","0","logo_2",},  
    [12] = {3,2,"酒已温好，我有故事，你来听吗？","0","0","0","logo_2",},  
    [13] = {4,2,"三国如雪，江山如画，多少青史名，一时少年意。","0","0","0","logo_2",},  
    [14] = {5,2,"展一幅英雄画卷，品一部少年三国！","0","0","0","logo_2",},  
    [15] = {6,2,"这立绘帅爆，忍不住分享一下！","0","0","0","logo_2",},  
    [16] = {7,2,"这立绘帅爆，忍不住分享一下！","0","0","0","logo_2",},  
    [17] = {8,2,"#少年三国志2#少年庆典送福袋！","0","0","0","logo_2",},  
    [18] = {9,2,"#少年三国志2#大乔送红包，助你成三国锦鲤","0","0","0","logo_2",},  
    [19] = {1,3,"这立绘帅爆，忍不住分享一下！","0","0","0","logo_3",},  
    [20] = {2,3,"今天也是欧气十足的一天！","0","0","0","logo_3",},  
    [21] = {3,3,"酒已温好，我有故事，你来听吗？","0","0","0","logo_3",},  
    [22] = {4,3,"三国如雪，江山如画，多少青史名，一时少年意。","0","0","0","logo_3",},  
    [23] = {5,3,"展一幅英雄画卷，品一部少年三国！","0","0","0","logo_3",},  
    [24] = {6,3,"这立绘帅爆，忍不住分享一下！","0","0","0","logo_3",},  
    [25] = {7,3,"这立绘帅爆，忍不住分享一下！","0","0","0","logo_3",},  
    [26] = {8,3,"#少年三国志2#少年庆典送福袋！","0","0","0","logo_3",},  
    [27] = {9,3,"#少年三国志2#大乔送红包，助你成三国锦鲤","0","0","0","logo_3",},
    }
}

local __index_id_game_type = {   
    ["1_1"] = 1,  
    ["2_1"] = 2,  
    ["3_1"] = 3,  
    ["4_1"] = 4,  
    ["5_1"] = 5,  
    ["6_1"] = 6,  
    ["7_1"] = 7,  
    ["8_1"] = 8,  
    ["9_1"] = 9,  
    ["1_2"] = 10,  
    ["2_2"] = 11,  
    ["3_2"] = 12,  
    ["4_2"] = 13,  
    ["5_2"] = 14,  
    ["6_2"] = 15,  
    ["7_2"] = 16,  
    ["8_2"] = 17,  
    ["9_2"] = 18,  
    ["1_3"] = 19,  
    ["2_3"] = 20,  
    ["3_3"] = 21,  
    ["4_3"] = 22,  
    ["5_3"] = 23,  
    ["6_3"] = 24,  
    ["7_3"] = 25,  
    ["8_3"] = 26,  
    ["9_3"] = 27,
}

local __key_map = { 
    id = 1,
    game_type = 2,
    text_weibo = 3,
    text_wechat = 4,
    text_qq = 5,
    code = 6,
    logo = 7,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_share_res_info")

        return t._raw[__key_map[k]]
    end
}


function share_res_info.getLength()
    return #share_res_info._data
end



function share_res_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_share_res_info
function share_res_info.indexOf(index)
    if index == nil or not share_res_info._data[index] then
        return nil
    end
    return setmetatable({_raw = share_res_info._data[index]}, m)
end



---
--@return @class record_share_res_info
function share_res_info.get(id,game_type)
    
    local k = id .. '_' .. game_type
    return share_res_info.indexOf(__index_id_game_type[k])
     
end



function share_res_info.set(id,game_type, key, value)
    local record = share_res_info.get(id,game_type)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function share_res_info.get_index_data()
    return __index_id_game_type 
end

return  share_res_info 