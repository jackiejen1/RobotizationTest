---@classdef record_spirit_guild_info
local record_spirit_guild_info = {}


record_spirit_guild_info.opgame_id = 0--Opgame_id
record_spirit_guild_info.opid = 0--Opid
record_spirit_guild_info.name =  ""--渠道名称
record_spirit_guild_info.type = 0--引导方式
record_spirit_guild_info.url =  ""--下载链接

local spirit_guild_info = {
   _data = {   
    [1] = {1715,2444,"应用宝分包2",1,"https://v3m.youzu.com/m.php?q=5f339772aaf3a997392242",},  
    [2] = {1715,2446,"应用宝分包4",1,"https://v3m.youzu.com/m.php?q=5f3397c571243883077797",},  
    [3] = {1715,2984,"游族-微信",1,"https://v3m.youzu.com/m.php?q=5f33987997752141802202",},  
    [4] = {1715,2981,"游族-178平台",2,"0",},
    }
}

local __index_opgame_id_opid = {   
    ["1715_2444"] = 1,  
    ["1715_2446"] = 2,  
    ["1715_2984"] = 3,  
    ["1715_2981"] = 4,
}

local __key_map = { 
    opgame_id = 1,
    opid = 2,
    name = 3,
    type = 4,
    url = 5,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_spirit_guild_info")

        return t._raw[__key_map[k]]
    end
}


function spirit_guild_info.getLength()
    return #spirit_guild_info._data
end



function spirit_guild_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_spirit_guild_info
function spirit_guild_info.indexOf(index)
    if index == nil or not spirit_guild_info._data[index] then
        return nil
    end
    return setmetatable({_raw = spirit_guild_info._data[index]}, m)
end



---
--@return @class record_spirit_guild_info
function spirit_guild_info.get(opgame_id,opid)
    
    local k = opgame_id .. '_' .. opid
    return spirit_guild_info.indexOf(__index_opgame_id_opid[k])
     
end



function spirit_guild_info.set(opgame_id,opid, key, value)
    local record = spirit_guild_info.get(opgame_id,opid)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function spirit_guild_info.get_index_data()
    return __index_opgame_id_opid 
end

return  spirit_guild_info 