---@classdef record_redpacket_rain_info
local record_redpacket_rain_info = {}


record_redpacket_rain_info.id = 0--编号
record_redpacket_rain_info.rain_activity_id = 0--活动ID
record_redpacket_rain_info.limit_level = 0--锦鲤最低等级
record_redpacket_rain_info.res_type = 0--显示形象类型
record_redpacket_rain_info.res = 0--图片资源
record_redpacket_rain_info.title_1 =  ""--常驻弹窗标题
record_redpacket_rain_info.title_2 =  ""--领取界面武将名称
record_redpacket_rain_info.text_1 =  ""--开启文本
record_redpacket_rain_info.text_2 =  ""--领取文本
record_redpacket_rain_info.text_3 =  ""--常驻文本
record_redpacket_rain_info.open_time = 0--开启时间
record_redpacket_rain_info.end_time = 0--结束时间
record_redpacket_rain_info.reward_drop_1 = 0--奖励1ID
record_redpacket_rain_info.reward_show_1 = 0--是否特殊展示
record_redpacket_rain_info.reward_drop_2 = 0--奖励2ID
record_redpacket_rain_info.reward_show_2 = 0--是否特殊展示
record_redpacket_rain_info.reward_drop_3 = 0--奖励3ID
record_redpacket_rain_info.reward_show_3 = 0--是否特殊展示
record_redpacket_rain_info.reward_drop_4 = 0--奖励4ID
record_redpacket_rain_info.reward_show_4 = 0--是否特殊展示
record_redpacket_rain_info.reward_drop_5 = 0--奖励5ID
record_redpacket_rain_info.reward_show_5 = 0--是否特殊展示
record_redpacket_rain_info.lucky_reward_drop_1 = 0--1号锦鲤奖励
record_redpacket_rain_info.lucky_reward_drop_2 = 0--2号锦鲤奖励
record_redpacket_rain_info.lucky_reward_drop_3 = 0--3号锦鲤奖励
record_redpacket_rain_info.notice_1 = 0--1号锦鲤走马灯
record_redpacket_rain_info.notice_2 = 0--2号锦鲤走马灯
record_redpacket_rain_info.notice_3 = 0--3号锦鲤走马灯
record_redpacket_rain_info.name_1 =  ""--1号锦鲤名称
record_redpacket_rain_info.name_2 =  ""--2号锦鲤名称
record_redpacket_rain_info.name_3 =  ""--3号锦鲤名称
record_redpacket_rain_info.pic_1 =  ""--1号锦鲤图片
record_redpacket_rain_info.pic_2 =  ""--2号锦鲤图片
record_redpacket_rain_info.pic_3 =  ""--3号锦鲤图片
record_redpacket_rain_info.barrage_1 =  ""--弹幕内容1
record_redpacket_rain_info.barrage_2 =  ""--弹幕内容2
record_redpacket_rain_info.barrage_3 =  ""--弹幕内容3
record_redpacket_rain_info.barrage_4 =  ""--弹幕内容4
record_redpacket_rain_info.barrage_5 =  ""--弹幕内容5

local redpacket_rain_info = {
   _data = {   
    [1] = {101,1,1,1,300510,"text_chenhe","shaonianchenhe","少年，本天才给你准备了红包大礼，快打开看看！","还有#num#次领红包的机会，抓紧打开看看！","红包已经领完了，本天才等着揭晓谁是今天的锦鲤！",1,11,701,2,702,1,703,1,704,1,0,0,705,706,707,2001,2002,2003,"现金锦鲤","元宝锦鲤","招将锦鲤","hongbao_198","hongbao_yuanbao","hongbao_zhaojiangling","恭喜#name#领取到#item#，喜气洋洋！","恭喜#name#领取到#item#，万事如意！","恭喜#name#领取到#item#，年年有余！","恭喜#name#领取到#item#，福气满满！","恭喜#name#领取到#item#，五福临门！",},  
    [2] = {201,2,1,1,500130,"text_daqiao","daqiao","将军，红包大礼就在眼前，快来打开看看吧！","将军，今日还可领取#num#次红包，机会难得，不要浪费哦！","将军，我陪您一起见证今日锦鲤的诞生！",1,11,701,2,702,1,703,1,704,1,0,0,705,706,707,2001,2002,2003,"现金锦鲤","元宝锦鲤","招将锦鲤","hongbao_198","hongbao_yuanbao","hongbao_zhaojiangling","恭喜#name#领取到#item#，喜气洋洋！","恭喜#name#领取到#item#，万事如意！","恭喜#name#领取到#item#，年年有余！","恭喜#name#领取到#item#，福气满满！","恭喜#name#领取到#item#，五福临门！",},  
    [3] = {301,3,1,1,210012,"text_caoyanbing","caoyanbing","吾乃镇魂街镇魂将，罗刹街的曹焱兵是也！","吾乃镇魂街镇魂将，罗刹街的曹焱兵是也！","吾乃镇魂街镇魂将，罗刹街的曹焱兵是也！",1,11,701,2,702,1,703,1,704,1,0,0,705,706,707,2001,2002,2003,"现金锦鲤","元宝锦鲤","招将锦鲤","hongbao_198","hongbao_yuanbao","hongbao_zhaojiangling","恭喜#name#领取到#item#，喜气洋洋！","恭喜#name#领取到#item#，万事如意！","恭喜#name#领取到#item#，年年有余！","恭喜#name#领取到#item#，福气满满！","恭喜#name#领取到#item#，五福临门！",},  
    [4] = {401,4,1,1,210012,"text_caoyanbing","caoyanbing","吾乃镇魂街镇魂将，罗刹街的曹焱兵是也！","吾乃镇魂街镇魂将，罗刹街的曹焱兵是也！","吾乃镇魂街镇魂将，罗刹街的曹焱兵是也！",1,11,701,2,702,1,703,1,704,1,0,0,705,706,708,2001,2002,2108,"现金锦鲤","元宝锦鲤","少年锦鲤","hongbao_198","hongbao_yuanbao","hongbao_shaonianzhili","恭喜#name#领取到#item#，喜气洋洋！","恭喜#name#领取到#item#，万事如意！","恭喜#name#领取到#item#，年年有余！","恭喜#name#领取到#item#，福气满满！","恭喜#name#领取到#item#，五福临门！",},
    }
}

local __index_id = {   
    [101] = 1,  
    [201] = 2,  
    [301] = 3,  
    [401] = 4,
}

local __key_map = { 
    id = 1,
    rain_activity_id = 2,
    limit_level = 3,
    res_type = 4,
    res = 5,
    title_1 = 6,
    title_2 = 7,
    text_1 = 8,
    text_2 = 9,
    text_3 = 10,
    open_time = 11,
    end_time = 12,
    reward_drop_1 = 13,
    reward_show_1 = 14,
    reward_drop_2 = 15,
    reward_show_2 = 16,
    reward_drop_3 = 17,
    reward_show_3 = 18,
    reward_drop_4 = 19,
    reward_show_4 = 20,
    reward_drop_5 = 21,
    reward_show_5 = 22,
    lucky_reward_drop_1 = 23,
    lucky_reward_drop_2 = 24,
    lucky_reward_drop_3 = 25,
    notice_1 = 26,
    notice_2 = 27,
    notice_3 = 28,
    name_1 = 29,
    name_2 = 30,
    name_3 = 31,
    pic_1 = 32,
    pic_2 = 33,
    pic_3 = 34,
    barrage_1 = 35,
    barrage_2 = 36,
    barrage_3 = 37,
    barrage_4 = 38,
    barrage_5 = 39,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_redpacket_rain_info")

        return t._raw[__key_map[k]]
    end
}


function redpacket_rain_info.getLength()
    return #redpacket_rain_info._data
end



function redpacket_rain_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_redpacket_rain_info
function redpacket_rain_info.indexOf(index)
    if index == nil or not redpacket_rain_info._data[index] then
        return nil
    end
    return setmetatable({_raw = redpacket_rain_info._data[index]}, m)
end



---
--@return @class record_redpacket_rain_info
function redpacket_rain_info.get(id)
    
    return redpacket_rain_info.indexOf(__index_id[ id ])
     
end



function redpacket_rain_info.set(id, key, value)
    local record = redpacket_rain_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function redpacket_rain_info.get_index_data()
    return __index_id 
end

return  redpacket_rain_info 