---@classdef record_spirit_help_info
local record_spirit_help_info = {}


record_spirit_help_info.id = 0--id
record_spirit_help_info.function_id = 0--关联功能
record_spirit_help_info.name =  ""--功能名称
record_spirit_help_info.tab = 0--所属页签
record_spirit_help_info.desc =  ""--描述说明
record_spirit_help_info.icon =  ""--图标
record_spirit_help_info.order = 0--排序
record_spirit_help_info.if_time = 0--是否显示次数
record_spirit_help_info.time_desc =  ""--次数文本
record_spirit_help_info.if_setting = 0--是否显示设置
record_spirit_help_info.chose_desc =  ""--勾选文本

local spirit_help_info = {
   _data = {   
    [1] = {1001,10203,"招将台",1,"消耗每日免费次数招将（每日4次）","icon/function/icon_zhaojiangtai.png",1,0,"0",0,"0",},  
    [2] = {1002,10204,"占星阁",1,"消耗每日免费次数占星（每日2次）","icon/function/icon_zhanxingge.png",2,0,"0",0,"0",},  
    [3] = {1003,10205,"神兵宝库",1,"消耗每日免费次数抽神兵（每日1次）","icon/function/icon_hd_sqzp1.png",3,0,"0",0,"0",},  
    [4] = {1004,10206,"好友赠礼",1,"赠送好友礼物增加亲密度","icon/function/icon_haoyou.png",4,1,"赠礼次数",0,"0",},  
    [5] = {1005,10207,"好友收礼",1,"领取好友赠送的小礼物","icon/function/icon_haoyou.png",5,1,"收礼次数",0,"0",},  
    [6] = {1006,10208,"每日俸禄",1,"领取城池争霸每日俸禄","icon/function/icon_fengdi.png",6,0,"0",0,"0",},  
    [7] = {1007,10209,"日常副本",1,"扫荡最新通关的日常副本","icon/function/icon_richangfuben.png",7,1,"副本次数",1,"0",},  
    [8] = {2001,10210,"军团赠礼",2,"军团赠礼获得奖励（每日3次）","icon/function/icon_juntuan.png",1,1,"赠送次数",0,"0",},  
    [9] = {2002,10211,"红包领取",2,"领取系统红包和玩家红包","icon/function/icon_hongbao.png",2,0,"领取次数",2,"仅领取系统红包",},  
    [10] = {2003,10212,"一键贡献",2,"领取贡献，赠礼和铸像任务奖励","icon/function/icon_hd_pm1.png",3,0,"0",0,"0",},
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
}

local __key_map = { 
    id = 1,
    function_id = 2,
    name = 3,
    tab = 4,
    desc = 5,
    icon = 6,
    order = 7,
    if_time = 8,
    time_desc = 9,
    if_setting = 10,
    chose_desc = 11,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_spirit_help_info")

        return t._raw[__key_map[k]]
    end
}


function spirit_help_info.getLength()
    return #spirit_help_info._data
end



function spirit_help_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_spirit_help_info
function spirit_help_info.indexOf(index)
    if index == nil or not spirit_help_info._data[index] then
        return nil
    end
    return setmetatable({_raw = spirit_help_info._data[index]}, m)
end



---
--@return @class record_spirit_help_info
function spirit_help_info.get(id)
    
    return spirit_help_info.indexOf(__index_id[ id ])
     
end



function spirit_help_info.set(id, key, value)
    local record = spirit_help_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function spirit_help_info.get_index_data()
    return __index_id 
end

return  spirit_help_info 