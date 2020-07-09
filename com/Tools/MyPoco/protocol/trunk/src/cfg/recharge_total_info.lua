---@classdef record_recharge_total_info
local record_recharge_total_info = {}


record_recharge_total_info.id = 0--id
record_recharge_total_info.post_id = 0--后置目标
record_recharge_total_info.num = 0--充值数额
record_recharge_total_info.reward_type_1 = 0--奖励类型1
record_recharge_total_info.reward_value_1 = 0--奖励类型值1
record_recharge_total_info.reward_size_1 = 0--奖励数量1
record_recharge_total_info.reward_type_2 = 0--奖励类型2
record_recharge_total_info.reward_value_2 = 0--奖励类型值2
record_recharge_total_info.reward_size_2 = 0--奖励数量2
record_recharge_total_info.reward_type_3 = 0--奖励类型3
record_recharge_total_info.reward_value_3 = 0--奖励类型值3
record_recharge_total_info.reward_size_3 = 0--奖励数量3
record_recharge_total_info.reward_type_4 = 0--奖励类型4
record_recharge_total_info.reward_value_4 = 0--奖励类型值4
record_recharge_total_info.reward_size_4 = 0--奖励数量4
record_recharge_total_info.des =  ""--奖励描述
record_recharge_total_info.pic = 0--展示图片
record_recharge_total_info.show_num = 0--预览金额

local recharge_total_info = {
   _data = {   
    [1] = {1,2,60,3,6,1,3,2,50,3,30,10,0,0,0,"0",400050,0,},  
    [2] = {2,3,150,3,6,2,3,2,100,3,30,10,0,0,0,"0",400050,0,},  
    [3] = {3,4,400,3,6,3,3,2,150,3,30,20,0,0,0,"0",400050,0,},  
    [4] = {4,5,700,3,6,5,3,2,200,3,30,20,0,0,0,"0",400050,0,},  
    [5] = {5,6,1200,3,2036,80,3,11,100,3,30,20,0,0,0,"0",400050,0,},  
    [6] = {6,7,1800,3,37,200,1,16,4500,3,30,20,0,0,0,"0",400050,0,},  
    [7] = {7,8,2300,3,2036,80,3,11,100,3,30,30,0,0,0,"0",400050,0,},  
    [8] = {8,9,2800,3,37,200,1,16,4500,3,30,30,0,0,0,"0",400050,0,},  
    [9] = {9,10,3500,3,2035,80,3,11,300,3,30,30,0,0,0,"0",400050,0,},  
    [10] = {10,11,4500,3,2035,90,3,11,300,3,30,50,0,0,0,"0",400050,0,},  
    [11] = {11,0,5500,3,2035,100,3,11,300,3,30,50,0,0,0,"0",400050,0,},
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
}

local __key_map = { 
    id = 1,
    post_id = 2,
    num = 3,
    reward_type_1 = 4,
    reward_value_1 = 5,
    reward_size_1 = 6,
    reward_type_2 = 7,
    reward_value_2 = 8,
    reward_size_2 = 9,
    reward_type_3 = 10,
    reward_value_3 = 11,
    reward_size_3 = 12,
    reward_type_4 = 13,
    reward_value_4 = 14,
    reward_size_4 = 15,
    des = 16,
    pic = 17,
    show_num = 18,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_recharge_total_info")

        return t._raw[__key_map[k]]
    end
}


function recharge_total_info.getLength()
    return #recharge_total_info._data
end



function recharge_total_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_recharge_total_info
function recharge_total_info.indexOf(index)
    if index == nil or not recharge_total_info._data[index] then
        return nil
    end
    return setmetatable({_raw = recharge_total_info._data[index]}, m)
end



---
--@return @class record_recharge_total_info
function recharge_total_info.get(id)
    
    return recharge_total_info.indexOf(__index_id[ id ])
     
end



function recharge_total_info.set(id, key, value)
    local record = recharge_total_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function recharge_total_info.get_index_data()
    return __index_id 
end

return  recharge_total_info 