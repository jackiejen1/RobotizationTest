---@classdef record_resource_info
local record_resource_info = {}


record_resource_info.id = 0--id
record_resource_info.name =  ""--名称
record_resource_info.icon = 0--图标
record_resource_info.quality = 0--品质
record_resource_info.description =  ""--描述
record_resource_info.gm = 0--是否GM后台发送
record_resource_info.show = 0--是否角色信息显示
record_resource_info.show_level = 0--显示等级
record_resource_info.sort = 0--排序值
record_resource_info.shop_id = 0--关联道具

local resource_info = {
   _data = {   
    [1] = {1,"角色经验",10001,4,"挑战副本获得，用于提升主角的等级。",1,1,1,2,0,},  
    [2] = {2,"贵族经验",10002,4,"可用于提升贵族等级，贵族等级越高福利也越好。",1,1,1,3,0,},  
    [3] = {3,"银币",10003,2,"上好白银熔炼而成，可用于角色与装备养成，以及购买各种道具。",1,1,1,4,0,},  
    [4] = {4,"体力值",10004,5,"用于各类副本战斗的消耗，可随时间自动恢复，也可使用体力丹立刻恢复。",1,2,1,1,101,},  
    [5] = {6,"威名",10016,5,"用于兑换指定装备，可通过分解装备与装备碎片、以及无双试炼玩法获得，",1,1,1,5,0,},  
    [6] = {8,"声望",10008,5,"通过竞技场挑战获得，可用于竞技场商店兑换指定武将和各种道具。",1,1,1,6,0,},  
    [7] = {9,"寻宝次数",10009,4,"秘境寻宝的玩法次数，该次数可随时间自动恢复，也可使用寻宝令立刻恢复。",1,2,43,2,102,},  
    [8] = {10,"灵玉",10020,5,"通过秘境寻宝玩法获得，可用于在宝物商店兑换指定宝物。",1,1,43,7,0,},  
    [9] = {11,"军团贡献",10011,4,"通过军团祭坛与军团副本获得，可在军团商店兑换武将碎片与各种道具。",1,1,1,8,0,},  
    [10] = {12,"征讨次数",10012,4,"可用于讨伐巨兽，可随时间自动恢复，也可使用巨兽讨伐令立刻恢复。",1,2,35,3,104,},  
    [11] = {13,"战功",10017,5,"通过讨伐巨兽获得，可用于在战功商店购买各种道具。",1,1,35,9,0,},  
    [12] = {14,"军武积分",10016,4,"通过军团副本挑战获得，可用于每周升级副本技能，军武功勋每周周一0点清空。",1,1,1,10,0,},  
    [13] = {15,"军团副本挑战次数",10005,5,"军团副本的挑战次数，该次数每日重置，也可通过元宝购买恢复。",1,0,0,0,0,},  
    [14] = {16,"将魂",10018,6,"天地奇物，可用于在将星商店购买各种珍贵道具。",1,1,1,11,0,},  
    [15] = {17,"进阶饰品精华",10005,4,"由蕴含天地能量的灵玉制成，可用于购买武将的进阶饰品材料。",1,1,1,12,0,},  
    [16] = {18,"神秘商店免费手刷次数",0,4,"蕴含一丝武将英魂的珍贵书卷，可用于刷新将魂商店的商品列表。",0,0,0,0,0,},  
    [17] = {19,"成就点数",10014,5,"通过成就获得，当成就点数达到一定程度，可以领取对应奖励。",1,1,1,13,0,},  
    [18] = {20,"招贤币",10010,5,"通体黄金制作，由朝廷颁发的高级招贤令，可用于在招将台进行高级招将。",1,0,0,0,0,},  
    [19] = {21,"水",10019,5,"一种灭火道具，可以用来参加七日活动",1,0,0,0,0,},  
    [20] = {22,"勇气值",10019,5,"勇气的象征，通过七日活动任务获得",1,0,0,0,0,},  
    [21] = {23,"月卡积分",10019,5,"充值月卡后，每日可领取月卡积分",1,0,0,0,0,},  
    [22] = {24,"疲劳值",10029,5,"在过关斩将中，攻打关隘时消耗疲劳值",1,2,48,16,0,},  
    [23] = {25,"军功",10006,5,"在战场上立下的功勋，参与过关斩将可获得",1,1,48,17,0,},  
    [24] = {26,"技能点",10028,5,"在战场上领悟的技能点数，挑战关城可获得",1,0,0,0,0,},  
    [25] = {27,"庆典积分",10030,5,"通过十四日活动任务获得",1,0,0,0,0,},  
    [26] = {28,"神兵精魄",10031,6,"神器的精华所在，可用于神兵商店购买物资",1,1,50,18,0,},  
    [27] = {30,"神器商店免费手刷次数",0,4,"蕴含一丝武将英魂的珍贵书卷，可用于刷新神器商店的商品列表。",0,0,0,0,0,},  
    [28] = {33,"列传次数",58,4,"完成列传内战斗任务所需要的次数",1,2,1,20,4,},  
    [29] = {34,"粮草",64,5,"攻城略地中补充兵力和移动",1,2,40,21,5,},  
    [30] = {35,"军令",65,5,"攻城略地中主动攻击消耗",1,2,40,22,6,},  
    [31] = {36,"兵力",66,5,"攻城略地中，战斗扣除兵力",0,0,0,0,0,},  
    [32] = {37,"心愿水晶",84,7,"蕴含心愿力量的水晶，可用于心愿商店兑换奖励",1,1,56,24,0,},  
    [33] = {38,"统治力",85,6,"过关斩将—城池争霸霸主专属奖励，积累足够的统治力可获得霸主专属奖励！",1,1,48,23,0,},  
    [34] = {39,"福气",99,5,"集2888福气，可领取春节福袋！",1,0,0,0,0,},  
    [35] = {42,"兽魂",126,6,"神兽魂魄凝练而成的神秘珍宝，传闻有使人羽化登仙的力量。可在神兽商店中兑换道具。",1,1,0,25,0,},  
    [36] = {43,"神兽商店免费手刷次数",0,4,"神兽商店刷新次数。",0,0,0,0,0,},  
    [37] = {44,"勋章",151,6,"在决战定军山中立下汗马功劳的象征，可以在勋章商店兑换道具。",1,1,65,30,0,},  
    [38] = {45,"讨伐魔将次数",201,5,"可用于讨伐魔将，可随时间自动恢复，也可通过元宝购买恢复",1,0,75,0,121,},  
    [39] = {46,"月卡活跃",0,5,"充值月卡后，每日领取月卡时可获得",1,0,0,0,0,},  
    [40] = {1000,"元宝",10000,7,"上等的足赤黄金熔炼而成，可用于购买各种珍贵道具和玩法服务。",0,1,1,1,0,},  
    [41] = {1001,"测试全属性",10000,7,"测试账号使用（战斗中的全属性绝对值）",0,0,0,0,0,},  
    [42] = {2000,"武将经验",10015,4,"用于提升武将的等级，可以通过主线副本战斗或使用道具获得。",0,0,0,0,0,},  
    [43] = {2001,"活跃度",10013,4,"通过每日参与活跃任务获得，可用于领取活跃度奖励。",0,0,0,0,0,},  
    [44] = {2002,"武将",10021,5,"武将，可上阵进行战斗且进行武将养成，提升武将属性，招将可获得。",0,0,0,0,0,},  
    [45] = {2003,"合击兵符",10022,5,"合击兵符，觉醒后可上阵释放援助合击，兵符养成可提升全体属性，将魂商店可购买获得。",0,0,0,0,0,},  
    [46] = {2004,"装备",10023,5,"装备，用于上阵武将穿戴和装备养成，增加武将属性，无双试炼可获得。",0,0,0,0,0,},  
    [47] = {2005,"宝物",10024,5,"宝物，用于上阵武将穿戴和宝物养成，增加武将属性，秘境寻宝可获得。",0,0,0,0,0,},  
    [48] = {2006,"称号",10025,5,"称号，用于主角穿戴，激活和穿戴可增加全体武将属性，军团红包、成就和VIP礼包可获得。",0,0,0,0,0,},  
    [49] = {2007,"红包",10026,5,"军团红包，可发放给军团成员领取，获得元宝、银币等资源，军团商店和无双试炼排行奖励中获得。",0,0,0,0,0,},  
    [50] = {2008,"时装",10027,5,"时装，用于主角穿戴和强化，可改变主角形象和主角技能，增加全体属性，军团商店和活动中可获得",0,0,0,0,0,},
    }
}

local __index_id = {   
    [1] = 1,  
    [2] = 2,  
    [3] = 3,  
    [4] = 4,  
    [6] = 5,  
    [8] = 6,  
    [9] = 7,  
    [10] = 8,  
    [11] = 9,  
    [12] = 10,  
    [13] = 11,  
    [14] = 12,  
    [15] = 13,  
    [16] = 14,  
    [17] = 15,  
    [18] = 16,  
    [19] = 17,  
    [20] = 18,  
    [21] = 19,  
    [22] = 20,  
    [23] = 21,  
    [24] = 22,  
    [25] = 23,  
    [26] = 24,  
    [27] = 25,  
    [28] = 26,  
    [30] = 27,  
    [33] = 28,  
    [34] = 29,  
    [35] = 30,  
    [36] = 31,  
    [37] = 32,  
    [38] = 33,  
    [39] = 34,  
    [42] = 35,  
    [43] = 36,  
    [44] = 37,  
    [45] = 38,  
    [46] = 39,  
    [1000] = 40,  
    [1001] = 41,  
    [2000] = 42,  
    [2001] = 43,  
    [2002] = 44,  
    [2003] = 45,  
    [2004] = 46,  
    [2005] = 47,  
    [2006] = 48,  
    [2007] = 49,  
    [2008] = 50,
}

local __key_map = { 
    id = 1,
    name = 2,
    icon = 3,
    quality = 4,
    description = 5,
    gm = 6,
    show = 7,
    show_level = 8,
    sort = 9,
    shop_id = 10,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_resource_info")

        return t._raw[__key_map[k]]
    end
}


function resource_info.getLength()
    return #resource_info._data
end



function resource_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_resource_info
function resource_info.indexOf(index)
    if index == nil or not resource_info._data[index] then
        return nil
    end
    return setmetatable({_raw = resource_info._data[index]}, m)
end



---
--@return @class record_resource_info
function resource_info.get(id)
    
    return resource_info.indexOf(__index_id[ id ])
     
end



function resource_info.set(id, key, value)
    local record = resource_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function resource_info.get_index_data()
    return __index_id 
end

return  resource_info 