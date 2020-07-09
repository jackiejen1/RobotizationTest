---@classdef record_recharge_guide_info
local record_recharge_guide_info = {}


record_recharge_guide_info.id = 0--id
record_recharge_guide_info.post_id = 0--后置指引
record_recharge_guide_info.icon =  ""--图标
record_recharge_guide_info.position = 0--位置
record_recharge_guide_info.target_type = 0--目标类型
record_recharge_guide_info.target_id =  ""--关联目标
record_recharge_guide_info.function_id = 0--关联功能
record_recharge_guide_info.route_id = 0--跳转
record_recharge_guide_info.title =  ""--标题
record_recharge_guide_info.des =  ""--奖励描述

local recharge_guide_info = {
   _data = {   
    [1] = {1,2,"1",1,1,"1",20043,143,"首充任意金额送红将","充值任意金额可得[size=28]&<21>超强红将&[/size]",},  
    [2] = {2,3,"2",1,1,"6",20051,128,"提升贵族等级赢豪华礼包","再充[size=28]&<98>#num#&[/size]元可购买[size=28]&<98>大量资源&[/size]",},  
    [3] = {3,4,"2",1,1,"30",20051,129,"提升贵族等级赢豪华礼包","再充[size=28]&<98>#num#&[/size]元可购买[size=28]&<19>紫色称号&[/size]",},  
    [4] = {4,5,"1",1,1,"88",20043,143,"累充88元送神装","再充[size=28]&<98>#num#&[/size]元可得[size=28]&<21>朱雀法袍&[/size]",},  
    [5] = {5,6,"2",1,1,"100",20051,130,"提升贵族等级赢豪华礼包","再充[size=28]&<98>#num#&[/size]元可购买[size=28]&<20>剑客&[/size]",},  
    [6] = {6,7,"1",1,1,"188",20043,143,"累充188元送神装","再充[size=28]&<98>#num#&[/size]元可得[size=28]&<20>朱雀步履&[/size]",},  
    [7] = {7,8,"2",1,1,"300",20051,131,"提升贵族等级赢豪华礼包","再充[size=28]&<98>#num#&[/size]元可购买[size=28]&<21>霸王战靴&[/size]",},  
    [8] = {8,9,"2",1,1,"500",20051,132,"提升贵族等级赢豪华礼包","再充[size=28]&<98>#num#&[/size]元可购买[size=28]&<21>霸王神剑&[/size]",},  
    [9] = {9,10,"2",1,1,"900",20051,133,"提升贵族等级赢豪华礼包","再充[size=28]&<98>#num#&[/size]元可购买[size=28]&<21>霸王重甲&[/size]",},  
    [10] = {10,11,"2",1,1,"1500",20051,134,"提升贵族等级赢豪华礼包","再充[size=28]&<98>#num#&[/size]元可购买[size=28]&<22>无双金冠&[/size]",},  
    [11] = {11,12,"2",1,1,"2500",20051,135,"提升贵族等级赢豪华礼包","再充[size=28]&<98>#num#&[/size]元可购买[size=28]&<22>无双宝铠&[/size]",},  
    [12] = {12,13,"2",1,1,"4000",20051,136,"提升贵族等级赢豪华礼包","再充[size=28]&<98>#num#&[/size]元可购买[size=28]&<22>无双战靴&[/size]",},  
    [13] = {13,14,"2",1,1,"6500",20051,137,"提升贵族等级赢豪华礼包","再充[size=28]&<98>#num#&[/size]元可购买[size=28]&<21>红色时装&[/size]",},  
    [14] = {14,15,"2",1,1,"10000",20051,138,"提升贵族等级赢豪华礼包","再充[size=28]&<98>#num#&[/size]元可购买[size=28]&<22>金色武将&[/size]",},  
    [15] = {15,16,"2",1,1,"20000",20051,139,"提升贵族等级赢豪华礼包","再充[size=28]&<98>#num#&[/size]元可购买[size=28]&<22>金将万能碎片&[/size]",},  
    [16] = {16,17,"2",1,1,"35000",20051,140,"提升贵族等级赢豪华礼包","再充[size=28]&<98>#num#&[/size]元可购买[size=28]&<22>金色兵符&[/size]",},  
    [17] = {17,18,"2",1,1,"60000",20051,141,"提升贵族等级赢豪华礼包","再充[size=28]&<98>#num#&[/size]元可购买[size=28]&<22>金色称号&[/size]",},  
    [18] = {18,0,"2",1,1,"100000",20051,142,"提升贵族等级赢豪华礼包","再充[size=28]&<98>#num#&[/size]元可购买[size=28]&<22>金色时装&[/size]",},  
    [19] = {19,20,"5",2,3,"SS2_card1",20047,146,"购买月卡享超值返利","购买月卡享[size=28]&<98>20&[/size]倍返利",},  
    [20] = {20,21,"4",2,3,"SS2_subscription1",20048,148,"订阅享专属特权、礼包","订阅享[size=28]&<98>专属特权&[/size]，每日领取[size=28]&<98>专属礼包&[/size]",},  
    [21] = {21,22,"6",2,2,"1",20044,145,"天天充值送超强红将","今日再充[size=28]&<98>#num#&[/size]元，可领取海量[size=28]&<20>培养丹&[/size]",},  
    [22] = {22,23,"6",2,2,"2",20044,145,"天天充值送超强红将","今日再充[size=28]&<98>#num#&[/size]元，可领取[size=28]&<21>高级招将令&[/size]",},  
    [23] = {23,24,"6",2,2,"3",20044,145,"天天充值送超强红将","今日再充[size=28]&<98>#num#&[/size]元，可领取[size=28]&<20>顶级精炼石&[/size]",},  
    [24] = {24,25,"6",2,2,"4",20044,145,"天天充值送超强红将","今日再充[size=28]&<98>#num#&[/size]元，可领取[size=28]&<21>丰厚奖励&[/size]",},  
    [25] = {25,0,"6",2,2,"5",20044,145,"天天充值送超强红将","今日再充[size=28]&<98>#num#&[/size]元，可领取[size=28]&<21>超强红将&[/size]",},  
    [26] = {26,27,"8",3,3,"SS2_card2",20047,146,"购买至尊月卡得海量元宝","购买至尊月卡享[size=28]&<98>20&[/size]倍返利",},  
    [27] = {27,0,"7",3,3,"SS2_fund1",20045,144,"购买成长基金得海量元宝","购买成长基金，享[size=28]&<98>20&[/size]倍返利",},
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
}

local __key_map = { 
    id = 1,
    post_id = 2,
    icon = 3,
    position = 4,
    target_type = 5,
    target_id = 6,
    function_id = 7,
    route_id = 8,
    title = 9,
    des = 10,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_recharge_guide_info")

        return t._raw[__key_map[k]]
    end
}


function recharge_guide_info.getLength()
    return #recharge_guide_info._data
end



function recharge_guide_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_recharge_guide_info
function recharge_guide_info.indexOf(index)
    if index == nil or not recharge_guide_info._data[index] then
        return nil
    end
    return setmetatable({_raw = recharge_guide_info._data[index]}, m)
end



---
--@return @class record_recharge_guide_info
function recharge_guide_info.get(id)
    
    return recharge_guide_info.indexOf(__index_id[ id ])
     
end



function recharge_guide_info.set(id, key, value)
    local record = recharge_guide_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function recharge_guide_info.get_index_data()
    return __index_id 
end

return  recharge_guide_info 