---@classdef record_function_foreshow_info
local record_function_foreshow_info = {}


record_function_foreshow_info.id = 0--ID
record_function_foreshow_info.name =  ""--功能名字
record_function_foreshow_info.function_id = 0--功能id
record_function_foreshow_info.show_type = 0--显示类型
record_function_foreshow_info.show_level = 0--显示等级
record_function_foreshow_info.sort = 0--排序
record_function_foreshow_info.advertising_words =  ""--广告词
record_function_foreshow_info.description =  ""--功能描述
record_function_foreshow_info.guide_task_id = 0--将军手卷id

local function_foreshow_info = {
   _data = {   
    [1] = {1,"竞技场",10003,2,3,10,"竞技当先，王座舍我其谁","竞技场商店可兑换武将碎片、进阶丹和培养丹",0,},  
    [2] = {2,"名将传",10001,2,2,20,"体验神将列传，感受历史征途","大量产出武将碎片、兵符铸造石、兵符精华等珍稀资源",0,},  
    [3] = {3,"军团",10025,1,15,30,"我们热血同盟，一起征服三国","参加军团副本、军团铸像、可获丰富奖励",0,},  
    [4] = {4,"无双试炼",10009,1,20,40,"实力与策略的双重考验，攀登无双阁巅峰","产出橙装、红装、装备精炼石，打造一流装备",0,},  
    [5] = {5,"日常副本",10030,1,23,50,"日常资源，这里应有尽有","产出武将经验、兵符精华、银币、宝物经验等资源",0,},  
    [6] = {6,"秘境寻宝",10011,1,35,70,"搜尽天下秘境，炼铸绝世宝物","大量产出宝物、宝物精炼石，打造强力宝物",2010,},  
    [7] = {7,"讨伐巨兽",10024,1,30,60,"打败机械巨兽，豪取战功！","产出兵符和兵符资源、装备资源。",2008,},  
    [8] = {8,"名将传战役",10032,7,6,55,"大战一触即发，组队横扫三国","大量产出兵符、兵符铸造石、兵符精华等珍稀资源",2009,},  
    [9] = {9,"武将图鉴",1006,1,25,57,"天下名将，尽入吾彀中矣","激活武将图鉴，提供大量全体属性",1006,},  
    [10] = {10,"过关斩将",10033,1,43,75,"过关斩将，建不世功勋","大量产出装备纹晶、宝物纹晶等珍稀资源",2012,},  
    [11] = {11,"神兵",1900,1,50,80,"手握绝世神兵，号令天下群雄！","产出神兵和神兵锻造石，铸就无双神兵",1009,},  
    [12] = {12,"心愿商店",20080,1,53,90,"每日许心愿，超多豪华礼物！","每日领取心愿奖励，兑换稀有道具",2014,},  
    [13] = {13,"神翼",2100,1,48,85,"傲视四方，神翼飞扬！","进阶神翼，提供大量全体属性",1008,},  
    [14] = {14,"神兽",2200,1,56,95,"至尊神兽，征服秘境仙岛！","培育神兽，战斗中成为最强助力",1011,},  
    [15] = {15,"决战定军山",10037,1,63,97,"定军山上，迎战八方！","团队竞技，国士无双，受万人膜拜",2016,},  
    [16] = {16,"兵临城下",10047,1,77,100,"兵临城下，斩尽来犯之敌！","共抗强敌，赚军团积分，赢命星占星盘。",2019,},
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
}

local __key_map = { 
    id = 1,
    name = 2,
    function_id = 3,
    show_type = 4,
    show_level = 5,
    sort = 6,
    advertising_words = 7,
    description = 8,
    guide_task_id = 9,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_function_foreshow_info")

        return t._raw[__key_map[k]]
    end
}


function function_foreshow_info.getLength()
    return #function_foreshow_info._data
end



function function_foreshow_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_function_foreshow_info
function function_foreshow_info.indexOf(index)
    if index == nil or not function_foreshow_info._data[index] then
        return nil
    end
    return setmetatable({_raw = function_foreshow_info._data[index]}, m)
end



---
--@return @class record_function_foreshow_info
function function_foreshow_info.get(id)
    
    return function_foreshow_info.indexOf(__index_id[ id ])
     
end



function function_foreshow_info.set(id, key, value)
    local record = function_foreshow_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function function_foreshow_info.get_index_data()
    return __index_id 
end

return  function_foreshow_info 