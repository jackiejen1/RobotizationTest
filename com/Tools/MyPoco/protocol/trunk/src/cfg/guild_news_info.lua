---@classdef record_guild_news_info
local record_guild_news_info = {}


record_guild_news_info.id = 0--ID
record_guild_news_info.type = 0--类型
record_guild_news_info.news =  ""--描述

local guild_news_info = {
   _data = {   
    [1] = {1,1,"[#time#] &<11>#name#&进行了&<12>军团贡献&，为军团增加了&<11>#num#&军团经验",},  
    [2] = {2,1,"[#time#] &<11>#name#&退出了军团。",},  
    [3] = {3,1,"[#time#] &<11>#name#&被踢出了军团。",},  
    [4] = {4,3,"[#time#] &<11>#name#&加入了军团。",},  
    [5] = {5,1,"[#time#] 重大决定！军团长任命&<11>#name#&为&<12>副军团长&。",},  
    [6] = {6,1,"[#time#] &<11>#name#&发起弹劾，将成为新任&<12>军团长&。",},  
    [7] = {7,1,"[#time#] &<11>#name#&有大将之风，&<12>军团长职位&转交给了 &<11>#leader#&。",},  
    [8] = {8,1,"[#time#] &<11>#name#&因心怀至诚触发&<12>暴击&，为军团增加&<11>#num#&军团经验",},  
    [9] = {9,3,"[#time#] 众团员齐心协力，击败#dungeon_name#为军团增加了&<11>#num#&军团经验",},  
    [10] = {10,1,"[#time#] 重大决定！军团长撤销了&<11>#name#&&<12>副军团长&的职务",},  
    [11] = {11,1,"[#time#] 百尺竿头更进一步，军团&<12>更名&为&<11>#guild#&",},  
    [12] = {12,3,"[#time#] 福星高照，&<11>#name#&在军团副本#stage#副本宝藏中获得了#num##award#",},  
    [13] = {13,3,"[#time#] #position#&<11>#name#&上线了",},  
    [14] = {14,3,"[#time#] &<11>#name#&在无双试炼中排名突破至了第&<12>#num#&名，为军团争光",},  
    [15] = {15,3,"[#time#] &<11>#name#&在讨伐巨兽中单次伤害排名突破至了第&<12>#num#&名，为军团争光",},  
    [16] = {16,3,"[#time#] &<11>#name#&在竞技场中排名突破至了第&<12>#num#&名，为军团争光",},  
    [17] = {17,3,"[#time#] &<11>#name#&豪气冲天，发放了&<12>#redpacket#&，快前往领取吧",},  
    [18] = {18,3,"[#time#]福星高照， &<11>#name#&在铸像显灵中获得了&<12>#num##award#&",},  
    [19] = {19,2,"[#time#]&<11>#my_name#&在&<8>#city_id|mine_map_info|name#&与&<12>#enemy_name#&大战一场，不幸落败。",},  
    [20] = {20,2,"[#time#]&<11>#my_name#&在&<8>#city_id|mine_map_info|name#&击败了&<12>#enemy_name#&，扬我军威。",},  
    [21] = {21,3,"[#time#]大事不好，城池&<8>#city_id|mine_map_info|name#&被军团&<12>#guild#&占领，请速速反击。",},  
    [22] = {22,3,"[#time#]军团长（副军团长）&<11>#name#&发布集结，剑指&<8>#city_id|mine_map_info|name#&，攻城略地，扬我军威！",},  
    [23] = {23,2,"[#time#]&<11>#my_name#&在&<8>#id|wrest_city_info|name#&与&<12>#enemy_name#&大战一场，不幸落败。",},  
    [24] = {24,2,"[#time#]&<11>#my_name#&在&<8>#id|wrest_city_info|name#&击败了&<12>#enemy_name#&，扬我军威。",},  
    [25] = {25,3,"[#time#]大事不好，城池&<8>#id|wrest_city_info|name#&被军团&<12>#guild#&占领，请速速反击。",},  
    [26] = {26,3,"[#time#]军团长（副军团长）&<11>#name#&发布集结，剑指&<8>#id|wrest_city_info|name#&，攻城略地，扬我军威！",},  
    [27] = {27,4,"&<11>#name1#&势不可挡，在和&<11>#name2#&的战斗中获得了胜利，为军团获得&<11>#score#&积分！",},  
    [28] = {28,4,"&<11>#name1#&向&<11>#name2#&发起挑战，一番激战过后，为军团赢取了&<11>#score#&积分！",},
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
}

local __key_map = { 
    id = 1,
    type = 2,
    news = 3,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_guild_news_info")

        return t._raw[__key_map[k]]
    end
}


function guild_news_info.getLength()
    return #guild_news_info._data
end



function guild_news_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_guild_news_info
function guild_news_info.indexOf(index)
    if index == nil or not guild_news_info._data[index] then
        return nil
    end
    return setmetatable({_raw = guild_news_info._data[index]}, m)
end



---
--@return @class record_guild_news_info
function guild_news_info.get(id)
    
    return guild_news_info.indexOf(__index_id[ id ])
     
end



function guild_news_info.set(id, key, value)
    local record = guild_news_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function guild_news_info.get_index_data()
    return __index_id 
end

return  guild_news_info 