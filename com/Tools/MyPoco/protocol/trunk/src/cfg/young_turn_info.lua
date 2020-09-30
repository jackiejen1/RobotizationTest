---@classdef record_young_turn_info
local record_young_turn_info = {}


record_young_turn_info.id = 0--编号
record_young_turn_info.young_id = 0--所属活动ID
record_young_turn_info.sign_reward = 0--签到奖励
record_young_turn_info.raise_time = 0--增长间隔
record_young_turn_info.extra_type = 0--关联节日掉落
record_young_turn_info.activity_name =  ""--活动名称
record_young_turn_info.tab_name_1 =  ""--商店页签
record_young_turn_info.tab_name_2 =  ""--掉落页签
record_young_turn_info.tab_name_3 =  ""--任务页签
record_young_turn_info.act_tab_1 =  ""--商店子页签1
record_young_turn_info.act_tab_2 =  ""--商店子页签2
record_young_turn_info.act_tab_3 =  ""--商店子页签3
record_young_turn_info.task_res =  ""--成就图片资源
record_young_turn_info.task_title =  ""--成就标语
record_young_turn_info.task_desc =  ""--成就说明
record_young_turn_info.relation_desc =  ""--联动标语
record_young_turn_info.h5_url =  ""--跳转H5
record_young_turn_info.price = 0--礼包价值
record_young_turn_info.process_limit = 0--进度上限
record_young_turn_info.recharge_desc =  ""--充值说明
record_young_turn_info.show_box = 0--礼包预览时间
record_young_turn_info.get_box = 0--礼包领取时间
record_young_turn_info.reward_box = 0--定时礼包
record_young_turn_info.box_name =  ""--定时礼包名称
record_young_turn_info.ready_title1 =  ""--预热标题1
record_young_turn_info.ready_title2 =  ""--预热标题2
record_young_turn_info.open_title1 =  ""--预热标题1
record_young_turn_info.open_title2 =  ""--预热标题2
record_young_turn_info.title_3 =  ""--标题3
record_young_turn_info.spacetime_type1 = 0--噩梦展示类型1
record_young_turn_info.spacetime_value1 = 0--噩梦展示类型值1
record_young_turn_info.spacetime_type2 = 0--噩梦展示类型2
record_young_turn_info.spacetime_value2 = 0--噩梦展示类型值2
record_young_turn_info.spacetime_type3 = 0--噩梦展示类型3
record_young_turn_info.spacetime_value3 = 0--噩梦展示类型值3
record_young_turn_info.spacetime_type4 = 0--噩梦展示类型4
record_young_turn_info.spacetime_value4 = 0--噩梦展示类型值4
record_young_turn_info.fight_image = 0--入口形象
record_young_turn_info.figeht_name =  ""--入口人物名称
record_young_turn_info.quality = 0--名称品质
record_young_turn_info.bubble =  ""--人物气泡
record_young_turn_info.spacetime_start = 0--时空外传开启时间
record_young_turn_info.recharge_money_type = 0--充值货币类型
record_young_turn_info.recharge_money_value = 0--充值货币值
record_young_turn_info.active_money_type = 0--活跃货币类型
record_young_turn_info.active_money_value = 0--活跃货币值

local young_turn_info = {
   _data = {   
    [1] = {1001,1,901,5,101,"少年庆典","庆典商城","限时掉落","镇魂成就","福利兑换","折扣商店","充值有礼","task_101","task_102","通关镇魂外传，获得丰厚奖励！","百万少年同协力，共铸神剑镇黄天！","https://sn.youzu.com/",10616,10000000,"组队战役",1592236800,1592928000,903,"庆典福袋","title_yuyue","title_yuyue2","title_kaiqi","title_kaiqi2","0",3,8005,3,8006,3,8007,3,8008,210012,"曹焱兵",6,"吾乃镇魂街镇魂将，罗刹街的曹焱兵是也！",0,3,188,3,194,},  
    [2] = {1002,2,905,5,102,"夏日狂欢","夏日商城","限时掉落","副本成就","福利兑换","折扣商店","充值有礼","task_101","task_103","通关时空外传，获得丰厚奖励！","0","https://sn.youzu.com/",10588,10000000,"组队战役",1596988800,1597852800,907,"夏日福袋","大乔相伴度盛夏","狂欢福利大放送","大乔相伴度盛夏","狂欢福利大放送","清凉夏日赢好礼",3,8009,3,8010,3,8011,3,8012,0,"0",0,"0",1596297600,3,217,3,216,},  
    [3] = {1003,3,908,5,103,"一战封神","太公商城","限时掉落","太公秘闻","福利兑换","折扣商店","充值有礼","task_101","task_104","通关太公秘闻，获得丰厚奖励！","0","https://sn.youzu.com/",10588,10000000,"组队战役",1602259200,1603123200,909,"太公礼盒","聚神力召唤太公","百亿豪礼大放送","聚神力召唤太公","百亿豪礼大放送","庆双节豪礼不停",3,8015,3,8016,3,8017,3,8018,0,"0",0,"0",1601568000,3,249,3,248,},
    }
}

local __index_id = {   
    [1001] = 1,  
    [1002] = 2,  
    [1003] = 3,
}

local __key_map = { 
    id = 1,
    young_id = 2,
    sign_reward = 3,
    raise_time = 4,
    extra_type = 5,
    activity_name = 6,
    tab_name_1 = 7,
    tab_name_2 = 8,
    tab_name_3 = 9,
    act_tab_1 = 10,
    act_tab_2 = 11,
    act_tab_3 = 12,
    task_res = 13,
    task_title = 14,
    task_desc = 15,
    relation_desc = 16,
    h5_url = 17,
    price = 18,
    process_limit = 19,
    recharge_desc = 20,
    show_box = 21,
    get_box = 22,
    reward_box = 23,
    box_name = 24,
    ready_title1 = 25,
    ready_title2 = 26,
    open_title1 = 27,
    open_title2 = 28,
    title_3 = 29,
    spacetime_type1 = 30,
    spacetime_value1 = 31,
    spacetime_type2 = 32,
    spacetime_value2 = 33,
    spacetime_type3 = 34,
    spacetime_value3 = 35,
    spacetime_type4 = 36,
    spacetime_value4 = 37,
    fight_image = 38,
    figeht_name = 39,
    quality = 40,
    bubble = 41,
    spacetime_start = 42,
    recharge_money_type = 43,
    recharge_money_value = 44,
    active_money_type = 45,
    active_money_value = 46,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_young_turn_info")

        return t._raw[__key_map[k]]
    end
}


function young_turn_info.getLength()
    return #young_turn_info._data
end



function young_turn_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_young_turn_info
function young_turn_info.indexOf(index)
    if index == nil or not young_turn_info._data[index] then
        return nil
    end
    return setmetatable({_raw = young_turn_info._data[index]}, m)
end



---
--@return @class record_young_turn_info
function young_turn_info.get(id)
    
    return young_turn_info.indexOf(__index_id[ id ])
     
end



function young_turn_info.set(id, key, value)
    local record = young_turn_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function young_turn_info.get_index_data()
    return __index_id 
end

return  young_turn_info 