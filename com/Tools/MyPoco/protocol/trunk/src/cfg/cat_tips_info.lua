---@classdef record_cat_tips_info
local record_cat_tips_info = {}


record_cat_tips_info.id = 0--ID
record_cat_tips_info.type = 0--功能类型
record_cat_tips_info.function_id = 0--功能id
record_cat_tips_info.condition_type = 0--条件类型
record_cat_tips_info.parameter1 = 0--参数1
record_cat_tips_info.parameter2 = 0--参数2
record_cat_tips_info.description =  ""--气泡内容
record_cat_tips_info.route_id =  ""--跳转
record_cat_tips_info.priority = 0--优先级
record_cat_tips_info.level = 0--开启等级

local cat_tips_info = {
   _data = {   
    [1] = {1,1,0,2,1,8,"连续登录送海量好礼，更有橙色时装，喵~","200065",1,1,},  
    [2] = {2,1,0,2,1,3,"首充6元得红色武将，喵~","143",2,1,},  
    [3] = {3,1,0,2,1,7,"完成7日活动得红色武将，喵~","67",6,1,},  
    [4] = {4,1,0,2,8,14,"参与半月庆典得红色防具，大幅提升战力，喵~","200066",7,1,},  
    [5] = {5,1,0,1,1,3,"升级图鉴赢红色兵符，喵~","200067",8,1,},  
    [6] = {6,1,0,1,4,7,"提升战力争核心红将，喵~","109",9,1,},  
    [7] = {7,1,0,1,8,11,"军团齐心竞争，共赢元宝奖励，喵~","111",10,1,},  
    [8] = {8,1,0,1,1,14,"限时特惠每日享，更有免费礼包，喵~","200069",11,1,},  
    [9] = {9,1,0,1,12,14,"限时抽卡得金将，喵~","200068",12,1,},  
    [10] = {10,2,10001,8,33,5,"神将列传-传记剩余次数：&<5>#num#&","11",13,10,},  
    [11] = {11,2,10032,4,5,1,"神将列传-战役剩余次数：&<5>#num#&","12",14,20,},  
    [12] = {12,2,10003,4,1,15,"竞技场剩余次数：&<5>#num#&","10",15,13,},  
    [13] = {13,2,0,9,1,0,"无双试炼可进行挑战","17",16,23,},  
    [14] = {14,2,0,8,9,20,"寻宝剩余次数：&<5>#num#&","19",17,43,},  
    [15] = {15,2,0,8,12,7,"巨兽剩余次数：&<5>#num#&","20",18,35,},  
    [16] = {16,2,0,8,18,5,"将魂商店剩余次数：&<5>#num#&","101",19,1,},  
    [17] = {17,1,20048,2,1,5,"购买订阅福利，每天领元宝，更可跳过普通战斗，喵~","148",4,1,},  
    [18] = {18,1,20045,5,15,25,"购买基金，升级领海量元宝，喵~","144",5,1,},  
    [19] = {19,1,20047,2,1,5,"购买月卡每日领元宝，喵~","146",3,1,},
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
}

local __key_map = { 
    id = 1,
    type = 2,
    function_id = 3,
    condition_type = 4,
    parameter1 = 5,
    parameter2 = 6,
    description = 7,
    route_id = 8,
    priority = 9,
    level = 10,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_cat_tips_info")

        return t._raw[__key_map[k]]
    end
}


function cat_tips_info.getLength()
    return #cat_tips_info._data
end



function cat_tips_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_cat_tips_info
function cat_tips_info.indexOf(index)
    if index == nil or not cat_tips_info._data[index] then
        return nil
    end
    return setmetatable({_raw = cat_tips_info._data[index]}, m)
end



---
--@return @class record_cat_tips_info
function cat_tips_info.get(id)
    
    return cat_tips_info.indexOf(__index_id[ id ])
     
end



function cat_tips_info.set(id, key, value)
    local record = cat_tips_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function cat_tips_info.get_index_data()
    return __index_id 
end

return  cat_tips_info 