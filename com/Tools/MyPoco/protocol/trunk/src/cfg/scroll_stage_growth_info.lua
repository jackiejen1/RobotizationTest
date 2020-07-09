---@classdef record_scroll_stage_growth_info
local record_scroll_stage_growth_info = {}


record_scroll_stage_growth_info.id = 0--ID
record_scroll_stage_growth_info.tab_type = 0--页签类型
record_scroll_stage_growth_info.prepose_id = 0--前置id
record_scroll_stage_growth_info.seen_directions =  ""--描述信息
record_scroll_stage_growth_info.function_type = 0--特殊功能类型
record_scroll_stage_growth_info.function_value = 0--特殊功能类型值
record_scroll_stage_growth_info.drop = 0--奖励掉落
record_scroll_stage_growth_info.attribute_type_1 = 0--增加属性类型1
record_scroll_stage_growth_info.attribute_value_1 = 0--增加属性类型值1
record_scroll_stage_growth_info.attribute_type_2 = 0--增加属性类型2
record_scroll_stage_growth_info.attribute_value_2 = 0--增加属性类型值2
record_scroll_stage_growth_info.attribute_type_3 = 0--增加属性类型3
record_scroll_stage_growth_info.attribute_value_3 = 0--增加属性类型值3
record_scroll_stage_growth_info.attribute_type_4 = 0--增加属性类型4
record_scroll_stage_growth_info.attribute_value_4 = 0--增加属性类型值4

local scroll_stage_growth_info = {
   _data = {   
    [1] = {1,1,0,"主角升至1星",2,1,0,0,0,0,0,0,0,0,0,},  
    [2] = {2,1,1,"主角品质提升至[color=#fd7100]橙色[/color]",1,5,0,0,0,0,0,0,0,0,0,},  
    [3] = {3,1,2,"主角升至2星",2,2,0,0,0,0,0,0,0,0,0,},  
    [4] = {4,1,3,"主角升至3星",2,3,0,0,0,0,0,0,0,0,0,},  
    [5] = {5,1,4,"主角品质提升至[color=#ff3127]红色[/color]",1,6,0,0,0,0,0,0,0,0,0,},  
    [6] = {6,1,5,"主角升至4星",2,4,0,0,0,0,0,0,0,0,0,},  
    [7] = {7,1,6,"主角品质提升至[color=#ffb61a]金色[/color]",1,7,0,0,0,0,0,0,0,0,0,},  
    [8] = {8,1,7,"主角升至5星",2,5,0,0,0,0,0,0,0,0,0,},  
    [9] = {9,1,8,"主角升至6星",2,6,0,0,0,0,0,0,0,0,0,},  
    [10] = {10,1,9,"主角升至7星",2,7,0,0,0,0,0,0,0,0,0,},  
    [11] = {101,2,0,"全队攻击+300；全队生命+6000",4,0,0,2,300,1,6000,0,0,0,0,},  
    [12] = {102,2,101,"全队攻击+1000；全队防御+500",4,0,0,2,1000,5,500,0,0,0,0,},  
    [13] = {103,2,102,"全队攻击+1700；全队生命+33300",4,0,0,2,1700,1,33300,0,0,0,0,},  
    [14] = {104,2,103,"全队防御+1000；全队攻击+2100",4,0,0,5,1000,2,2100,0,0,0,0,},  
    [15] = {105,2,104,"全队生命+50000；全队防御+1300",4,0,0,1,50000,5,1300,0,0,0,0,},  
    [16] = {106,2,105,"全队攻击+3000；全队生命+58300",4,0,0,2,3000,1,58300,0,0,0,0,},  
    [17] = {107,2,106,"全队防御+1700；全队攻击+3500",4,0,0,5,1700,2,3500,0,0,0,0,},  
    [18] = {108,2,107,"全队生命+75000；全队防御+1900",4,0,0,1,75000,5,1900,0,0,0,0,},  
    [19] = {109,2,108,"全队攻击+4300；全队生命+83300",4,0,0,2,4300,1,83300,0,0,0,0,},  
    [20] = {110,2,109,"全队防御+2400；全队攻击+4800",4,0,0,5,2400,2,4800,0,0,0,0,},  
    [21] = {111,2,110,"全队生命+100000；全队防御+2600",4,0,0,1,100000,5,2600,0,0,0,0,},  
    [22] = {112,2,111,"全队攻击+5700；全队生命+108300",4,0,0,2,5700,1,108300,0,0,0,0,},  
    [23] = {113,2,112,"全队防御+3000；全队攻击+6100",4,0,0,5,3000,2,6100,0,0,0,0,},  
    [24] = {114,2,113,"全队生命+116600；全队防御+3400",4,0,0,1,116600,5,3400,0,0,0,0,},  
    [25] = {115,2,114,"全队攻击+6500；全队生命+124900",4,0,0,2,6500,1,124900,0,0,0,0,},  
    [26] = {10001,5,0,"全体破击率+20%；全体生命+10%",4,0,0,106,200,11,100,0,0,0,0,},  
    [27] = {10002,5,10001,"全体格挡率+20%；全体攻击+10%",4,0,0,105,200,12,100,0,0,0,0,},  
    [28] = {10003,5,10002,"全体命中率+20%；全体防御+10%",4,0,0,101,200,15,100,0,0,0,0,},  
    [29] = {10004,5,10003,"全体闪避率+20%；全体生命+10%",4,0,0,102,200,11,100,0,0,0,0,},  
    [30] = {10005,5,10004,"全体抗暴率+20%；全体攻击+10%",4,0,0,104,200,12,100,0,0,0,0,},  
    [31] = {10006,5,10005,"全体暴击率+20%；全体防御+10%",4,0,0,103,200,15,100,0,0,0,0,},
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
    [101] = 11,  
    [102] = 12,  
    [103] = 13,  
    [104] = 14,  
    [105] = 15,  
    [106] = 16,  
    [107] = 17,  
    [108] = 18,  
    [109] = 19,  
    [110] = 20,  
    [111] = 21,  
    [112] = 22,  
    [113] = 23,  
    [114] = 24,  
    [115] = 25,  
    [10001] = 26,  
    [10002] = 27,  
    [10003] = 28,  
    [10004] = 29,  
    [10005] = 30,  
    [10006] = 31,
}

local __key_map = { 
    id = 1,
    tab_type = 2,
    prepose_id = 3,
    seen_directions = 4,
    function_type = 5,
    function_value = 6,
    drop = 7,
    attribute_type_1 = 8,
    attribute_value_1 = 9,
    attribute_type_2 = 10,
    attribute_value_2 = 11,
    attribute_type_3 = 12,
    attribute_value_3 = 13,
    attribute_type_4 = 14,
    attribute_value_4 = 15,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_scroll_stage_growth_info")

        return t._raw[__key_map[k]]
    end
}


function scroll_stage_growth_info.getLength()
    return #scroll_stage_growth_info._data
end



function scroll_stage_growth_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_scroll_stage_growth_info
function scroll_stage_growth_info.indexOf(index)
    if index == nil or not scroll_stage_growth_info._data[index] then
        return nil
    end
    return setmetatable({_raw = scroll_stage_growth_info._data[index]}, m)
end



---
--@return @class record_scroll_stage_growth_info
function scroll_stage_growth_info.get(id)
    
    return scroll_stage_growth_info.indexOf(__index_id[ id ])
     
end



function scroll_stage_growth_info.set(id, key, value)
    local record = scroll_stage_growth_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function scroll_stage_growth_info.get_index_data()
    return __index_id 
end

return  scroll_stage_growth_info 