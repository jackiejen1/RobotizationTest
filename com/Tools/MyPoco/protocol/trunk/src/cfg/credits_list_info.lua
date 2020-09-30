---@classdef record_credits_list_info
local record_credits_list_info = {}


record_credits_list_info.id = 0--ID
record_credits_list_info.team_name =  ""--分组名称
record_credits_list_info.list =  ""--制作人员名单
record_credits_list_info.prominent = 0--是否突出

local credits_list_info = {
   _data = {   
    [1] = {1,"制作人","迈克斯",1,},  
    [2] = {2,"研发","浅笑,寒衣,欢欢,东东,夏十八,美杜鲨,路痴,衡衡,影风,黑白熊,廖廖,狙神,兰帕德,双叶,格格,麦超,此方方,莱昂,一繁,陶子,叶开,倪二,周亮,阿晨,八两,龙翔,猪猪侠,洛哥,红有三,魏无羡,笔墨,小魔王,夏戎,诺克,局长,柚子,嘉诚,螃蟹,随风,俊超,西子",0,},  
    [3] = {3,"美术","零号,啊东,小钱,麦麦哈,西尔,金角,钟飞飞,淇淇,喵吉,小包子,猫耳朵,巴伦,豆奶,哈尔,箱子,洋葱草,风颜,三秋,晓旭,菜菜一,莉莉,菜菜酱,大状,一棵,小菠萝,车厘子,雪宝,妮娜,张大钱,美玲",0,},  
    [4] = {4,"运营","枫叶政,十一,老法师,杰西卡,一方,诚玄,芝麻球,德莱文,宋辛巴,红茶,杜若,清歌寒,阿萨姆,娜娜",0,},  
    [5] = {5,"发行","罗卡,金龙,瑾瑜,瓜子,巾水,皮皮,阿漆,李潇林,叶大将,游游,解夏,伦伦,徐尛咪,寒冰,雨辰,辛德拉",0,},  
    [6] = {6,"市场","韩信,文明,九月酱,北北,奈斯,张聊,区区,蛋黄酱,原野",0,},  
    [7] = {7,"支持","小牧童,小天,小蝌蚪,鹰君,小伏,支支,阿金,灯灯,洞洞,君莫笑,江流儿,比尔,汉森,凌云,露西,鸣人,胖子,朱俊,楚平,蛛蛛,曹荷,大科比,关逸超,饼干,流风,金木,黄婷婷,廖白,麻酱,虾酱,玉珏,弗兰克,大金,左指环,思维",0,},  
    [8] = {8,"特别鸣谢","奇哥,玛克,发条,魏无忌,雷雨,鹏哥,禹兮,龙骑,陆虎,尼可,山涛,天之虹,冠亚,秋虫子,小浩,老狼,小弯,凯强",0,},
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
    team_name = 2,
    list = 3,
    prominent = 4,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_credits_list_info")

        return t._raw[__key_map[k]]
    end
}


function credits_list_info.getLength()
    return #credits_list_info._data
end



function credits_list_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_credits_list_info
function credits_list_info.indexOf(index)
    if index == nil or not credits_list_info._data[index] then
        return nil
    end
    return setmetatable({_raw = credits_list_info._data[index]}, m)
end



---
--@return @class record_credits_list_info
function credits_list_info.get(id)
    
    return credits_list_info.indexOf(__index_id[ id ])
     
end



function credits_list_info.set(id, key, value)
    local record = credits_list_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function credits_list_info.get_index_data()
    return __index_id 
end

return  credits_list_info 