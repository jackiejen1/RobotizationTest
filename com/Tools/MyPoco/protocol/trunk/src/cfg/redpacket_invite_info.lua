---@classdef record_redpacket_invite_info
local record_redpacket_invite_info = {}


record_redpacket_invite_info.holiday_id = 0--编号
record_redpacket_invite_info.name =  ""--活动名称
record_redpacket_invite_info.name_text =  ""--开启标题
record_redpacket_invite_info.knight_base = 0--人物立绘
record_redpacket_invite_info.name_pic = 0--开启标题
record_redpacket_invite_info.people_speak =  ""--人物文本
record_redpacket_invite_info.title_pic = 0--活动标语
record_redpacket_invite_info.title_pic2 = 0--非分享标语
record_redpacket_invite_info.share_pic = 0--分享背景
record_redpacket_invite_info.share_desc =  ""--分享文本
record_redpacket_invite_info.share_desc2 =  ""--非分享文本
record_redpacket_invite_info.share_title = 0--分享标题
record_redpacket_invite_info.share_id = 0--分享id

local redpacket_invite_info = {
   _data = {   
    [1] = {101,"新春福袋","1",300510,101,"新春快乐，本天才来送福了！",201,202,301,"分享开心时刻，新春集福，红包狂欢，陈赫给你满满福利！","回顾少年三国旅途，新春集福，又是一年热血三国梦！",0,8,},  
    [2] = {201,"新春福袋（测试）","1",300360,101,"新春快乐，本天才来送福了！",201,202,301,"分享开心时刻，新春集福，和陈赫一起来撸猫！","回顾少年三国旅途，新春集福，又是一年热血三国梦！",0,8,},  
    [3] = {301,"元宝福袋","1",300510,3101,"号外号外，本天才又来送福了！",3201,3202,301,"分享开心时刻，福袋集福，红包狂欢，陈赫给你满满福利！","回顾少年三国旅途，福袋集福，又是一年热血三国梦！",0,8,},  
    [4] = {401,"元宝福袋","1",210012,3101,"吾乃镇魂街镇魂将，罗刹街的曹焱兵是也！",3201,3202,401,"分享开心时刻，福袋集福，庆典狂欢，曹焱兵给你满满福利！","回顾少年三国旅途，福袋集福，又是一年热血三国梦！",0,8,},
    }
}

local __index_holiday_id = {   
    [101] = 1,  
    [201] = 2,  
    [301] = 3,  
    [401] = 4,
}

local __key_map = { 
    holiday_id = 1,
    name = 2,
    name_text = 3,
    knight_base = 4,
    name_pic = 5,
    people_speak = 6,
    title_pic = 7,
    title_pic2 = 8,
    share_pic = 9,
    share_desc = 10,
    share_desc2 = 11,
    share_title = 12,
    share_id = 13,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_redpacket_invite_info")

        return t._raw[__key_map[k]]
    end
}


function redpacket_invite_info.getLength()
    return #redpacket_invite_info._data
end



function redpacket_invite_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_redpacket_invite_info
function redpacket_invite_info.indexOf(index)
    if index == nil or not redpacket_invite_info._data[index] then
        return nil
    end
    return setmetatable({_raw = redpacket_invite_info._data[index]}, m)
end



---
--@return @class record_redpacket_invite_info
function redpacket_invite_info.get(holiday_id)
    
    return redpacket_invite_info.indexOf(__index_holiday_id[ holiday_id ])
     
end



function redpacket_invite_info.set(holiday_id, key, value)
    local record = redpacket_invite_info.get(holiday_id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function redpacket_invite_info.get_index_data()
    return __index_holiday_id 
end

return  redpacket_invite_info 