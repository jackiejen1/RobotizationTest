---@classdef record_login_reward_info
local record_login_reward_info = {}


record_login_reward_info.id = 0--id
record_login_reward_info.day = 0--天数
record_login_reward_info.reward_type = 0--奖励类型
record_login_reward_info.reward_value = 0--奖励类型值
record_login_reward_info.reward_size = 0--奖励数量
record_login_reward_info.bg_type = 0--奖励底类型
record_login_reward_info.pic = 0--展示形象
record_login_reward_info.txt =  ""--描述文字
record_login_reward_info.next_reward =  ""--次日奖励

local login_reward_info = {
   _data = {   
    [1] = {1,1,2,40020,10,1,1,"凤鸣兵符","明天领取&<12>三十连抽&",},  
    [2] = {2,2,3,6,30,2,1,"三十连抽","明天领取&<12>2888元宝&",},  
    [3] = {3,3,999,0,2888,1,3,"海量元宝","明天领取&<12>酷炫时装&",},  
    [4] = {4,4,11,300,1,2,3,"酷炫时装","明天领取&<12>五十连抽&",},  
    [5] = {5,5,3,6,50,1,2,"五十连抽","明天领取&<12>5888元宝&",},  
    [6] = {6,6,999,0,5888,2,2,"爆量元宝","明天领取&<12>绝世红装&",},  
    [7] = {7,7,7,402,1,1,2,"绝世红装","明天领取&<12>无双金装&",},  
    [8] = {8,8,7,424,1,2,2,"无双金装","0",},
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
}

local __key_map = { 
    id = 1,
    day = 2,
    reward_type = 3,
    reward_value = 4,
    reward_size = 5,
    bg_type = 6,
    pic = 7,
    txt = 8,
    next_reward = 9,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_login_reward_info")

        return t._raw[__key_map[k]]
    end
}


function login_reward_info.getLength()
    return #login_reward_info._data
end



function login_reward_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_login_reward_info
function login_reward_info.indexOf(index)
    if index == nil or not login_reward_info._data[index] then
        return nil
    end
    return setmetatable({_raw = login_reward_info._data[index]}, m)
end



---
--@return @class record_login_reward_info
function login_reward_info.get(id)
    
    return login_reward_info.indexOf(__index_id[ id ])
     
end



function login_reward_info.set(id, key, value)
    local record = login_reward_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function login_reward_info.get_index_data()
    return __index_id 
end

return  login_reward_info 