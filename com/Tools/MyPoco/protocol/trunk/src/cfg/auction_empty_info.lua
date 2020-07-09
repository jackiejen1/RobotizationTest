---@classdef record_auction_empty_info
local record_auction_empty_info = {}


record_auction_empty_info.id = 0--ID
record_auction_empty_info.title1 =  ""--图片标题1
record_auction_empty_info.res1 =  ""--图片资源1
record_auction_empty_info.desc1 =  ""--描述1
record_auction_empty_info.title2 =  ""--图片标题2
record_auction_empty_info.res2 =  ""--图片资源2
record_auction_empty_info.desc2 =  ""--描述2
record_auction_empty_info.title3 =  ""--图片标题3
record_auction_empty_info.res3 =  ""--图片资源3
record_auction_empty_info.desc3 =  ""--描述3
record_auction_empty_info.title4 =  ""--图片标题4
record_auction_empty_info.res4 =  ""--图片资源4
record_auction_empty_info.desc4 =  ""--描述4

local auction_empty_info = {
   _data = {   
    [1] = {1,"参与城池争霸","pic_pmlc_06","周日&<12>0点-22点&参加&<12>城池争霸&","拍卖行开启","pic_pmlc_05","&<12>周日22点&开启战区拍卖","拍卖分红","pic_pmlc_03","&<12>周一12点&拍卖结束，发放拍卖分红","0","0","0",},  
    [2] = {2,"参与本服神将","pic_pmlc_04","&<12>0点-14点&参加本服&<12>激斗神将&","拍卖行开启","pic_pmlc_05","&<12>14点&开启军团拍卖","拍卖分红","pic_pmlc_03","&<12>20点&拍卖结束，发放拍卖分红","0","0","0",},  
    [3] = {3,"参与跨服神将","pic_pmlc_04","&<12>周三0点-14点&参加跨服&<12>激斗神将&","拍卖行开启","pic_pmlc_05","&<12>周三14点&开启军团拍卖","拍卖分红","pic_pmlc_03","&<12>周三20点&拍卖结束，发放拍卖分红","0","0","0",},  
    [4] = {4,"货物流拍","pic_pmlc_01","&<12>军团拍卖&结束后，未卖出的货物流拍到&<12>本服拍卖&","本服拍卖开启","pic_pmlc_02","&<12>20点&开始流拍物品进行本服拍卖","拍卖分红","pic_pmlc_03","&<12>22点&货物拍卖结束，发放分红","0","0","0",},
    }
}

local __index_id = {   
    [1] = 1,  
    [2] = 2,  
    [3] = 3,  
    [4] = 4,
}

local __key_map = { 
    id = 1,
    title1 = 2,
    res1 = 3,
    desc1 = 4,
    title2 = 5,
    res2 = 6,
    desc2 = 7,
    title3 = 8,
    res3 = 9,
    desc3 = 10,
    title4 = 11,
    res4 = 12,
    desc4 = 13,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_auction_empty_info")

        return t._raw[__key_map[k]]
    end
}


function auction_empty_info.getLength()
    return #auction_empty_info._data
end



function auction_empty_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_auction_empty_info
function auction_empty_info.indexOf(index)
    if index == nil or not auction_empty_info._data[index] then
        return nil
    end
    return setmetatable({_raw = auction_empty_info._data[index]}, m)
end



---
--@return @class record_auction_empty_info
function auction_empty_info.get(id)
    
    return auction_empty_info.indexOf(__index_id[ id ])
     
end



function auction_empty_info.set(id, key, value)
    local record = auction_empty_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function auction_empty_info.get_index_data()
    return __index_id 
end

return  auction_empty_info 