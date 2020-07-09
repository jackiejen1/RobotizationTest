---@classdef record_spacetime_dungeon_message_info
local record_spacetime_dungeon_message_info = {}


record_spacetime_dungeon_message_info.chapter = 0--归属章节
record_spacetime_dungeon_message_info.event_id = 0--触发事件
record_spacetime_dungeon_message_info.description =  ""--日志描述

local spacetime_dungeon_message_info = {
   _data = {   
    [1] = {1,5,"建安十二年十月廿九，急行军翻越白狼山，前往山顶的乌桓部落。狼头匕首，我势在必得。",},  
    [2] = {1,6,"呼，高山之上屡遭战斗，实在疲乏不堪。东北方有造化台，暂且去提升一番实力。",},  
    [3] = {2,1,"建兴七年五月初四，入上古离火阵第五天。火……遍地都是火，诸葛究竟把阵旗藏在哪里？找到四面阵旗，才能破阵而出。",},  
    [4] = {2,4,"火焰终于熄灭了，天字阵旗操控的天之离火全灭了。",},  
    [5] = {2,11,"火灭了……地字阵旗一倒，遍地大火只剩一半。",},  
    [6] = {2,14,"火又灭了，玄字阵旗的倒下，让玄之离火全部熄灭。",},  
    [7] = {2,17,"黄字阵旗折断，哈哈，遍地离火均已熄灭。八卦阵盘已现，此物必将落入我手中。",},  
    [8] = {3,28,"光和三年春二月，大疫，入山寻药。仙人无情，一旦选错道路，便会被困山中。",},  
    [9] = {3,19,"轰——山石翻转，地面震动。似乎触动了什么机关……这就是仙人的考验吗？",},  
    [10] = {3,20,"远处传来巨大的声响，似乎出现了一些隐蔽的道路。这漫山的森林，难道只是仙人的障眼法？！",},  
    [11] = {4,21,"初平三年春二月，攻入洛阳城。董卓老贼火烧洛阳，城中残破不堪。有祥瑞现世！宫中那道冲天的紫光必有异常，得立刻赶过去查看！",},  
    [12] = {4,1,"当心！陷阱暗藏玄机，防不胜防，不能急于行军。先去寻找机关，破解陷阱。",},  
    [13] = {4,2,"不好！董卓竟然派了西凉精锐把守皇宫正门。为今之计，只有寻找小路绕道了。",},  
    [14] = {4,18,"轰隆隆——成了！远处传来机关转动的轰鸣声，可以再去宫门那边看看。",},  
    [15] = {4,20,"紫气近在眼前！那是？一口枯井？！井底的宝物竟然是传国玉玺，难怪城里有这么多西凉兵！",},  
    [16] = {1001,1,"灵槐树被修复以后，镇魂街似乎又恢复了平静。不对，镇魂街的结界再次不稳，是谁又对灵槐树出手？",},  
    [17] = {1001,20,"于禁被困，似乎有性命之忧。但灵槐枝又随时可能被恶灵吞食，必须尽快将它夺回。事情紧急，究竟该如何抉择……",},  
    [18] = {1001,6,"想要打通这些被烈火阻隔的道路，必须找到火符台。嗯？那群恶灵身后，好像有什么东西。",},  
    [19] = {1001,7,"恶灵不断变强，必须立刻夺回灵槐枝。不过，如果不想损失实力，要找到机关，解除陷阱。",},  
    [20] = {1001,21,"于禁的灵体消散了！黑衣人做了什么？击败黑衣人能消除大量恶灵，却会损失大量时空之力，我要……",},  
    [21] = {1002,38,"竟然有不明恶灵在袭击三国时代……",},  
    [22] = {1002,40,"可恶，曹操被恶灵困在了东南方的营寨之中，心神受损，必须先救他出来。",},  
    [23] = {1002,42,"草丛里埋伏着无数被恶灵附体的士兵，要时刻小心。不过，击败他们中的一些或许会有意外之喜。",},  
    [24] = {1002,43,"要挽救曹操必须收聚他散失的神识，也许他的佩剑孟德剑能帮上忙。孟德剑就在南边。",},  
    [25] = {1002,49,"果然孟德剑上藏着曹操的神识！曹操就有救了！",},  
    [26] = {1003,79,"到处都是恶灵，还是尽快带曹操离开这儿吧。不过路到底在哪啊？先调查下周围。",},  
    [27] = {1003,80,"没想到地上的司南可以开启传送阵，这些机关传送到底是谁留下的……",},  
    [28] = {1003,86,"我早该想到，除了那个古怪的黑衣人，还有谁会在三国作乱！想必这些司南也是他留下的！呵呵，那就借本大爷用用吧！",},  
    [29] = {1003,88,"黑衣人，总算找到你了！你这杂碎惹出这么多麻烦，别想跑！",},  
    [30] = {1003,90,"以清风化煞的威力，净化这里的阴气恶灵还是绰绰有余的，必须赶紧把它弄到手，三国时空可撑不了太久！",},  
    [31] = {1003,84,"靠！还是让他跑了！他好像说他要回镇魂街去？这杂碎到底想干什么！！",},  
    [32] = {1003,100,"眼皮一直跳，黑衣人那个杂碎一定还在谋划什么！还是尽快拿了清风化煞净化阴气，赶紧去找他吧！",},  
    [33] = {1004,25,"在三国的第十天，终于用清风化煞净化掉所有阴气，三国世界恢复正常。曹操竟然想把我留在三国？开什么玩笑，那个黑衣人夺走了转轮神珠，还不知道他要对镇魂街做什么。我必须尽快赶回镇魂街。",},  
    [34] = {1004,27,"返回镇魂街的道路地形错乱，阴气遮蔽，似乎就是个迷宫吗？幸好许褚谨慎，发现了潜藏在草丛里的恶灵。这些恶灵身上都有充沛的时空之力，看来后面要仔细搜索这种草丛了。",},  
    [35] = {1004,28,"通往镇魂街的路封闭了，究竟该怎么办？这个神神叨叨的老头说什么左边有传送阵，要不就去看看。",},  
    [36] = {1004,29,"这老头竟然是水镜先生。这人的话不能不听，三次传送才能返回镇魂街，看来得好好寻找传送阵了。",},  
    [37] = {1004,30,"黑衣人竟然用转轮神珠打开了阴界之门，镇魂街上现在遍地都是亡灵。我一定会夺回转轮神珠，关闭冥界阴门！小亮，等我回来！",},
    }
}

local __index_chapter_event_id = {   
    ["1_5"] = 1,  
    ["1_6"] = 2,  
    ["2_1"] = 3,  
    ["2_4"] = 4,  
    ["2_11"] = 5,  
    ["2_14"] = 6,  
    ["2_17"] = 7,  
    ["3_28"] = 8,  
    ["3_19"] = 9,  
    ["3_20"] = 10,  
    ["4_21"] = 11,  
    ["4_1"] = 12,  
    ["4_2"] = 13,  
    ["4_18"] = 14,  
    ["4_20"] = 15,  
    ["1001_1"] = 16,  
    ["1001_20"] = 17,  
    ["1001_6"] = 18,  
    ["1001_7"] = 19,  
    ["1001_21"] = 20,  
    ["1002_38"] = 21,  
    ["1002_40"] = 22,  
    ["1002_42"] = 23,  
    ["1002_43"] = 24,  
    ["1002_49"] = 25,  
    ["1003_79"] = 26,  
    ["1003_80"] = 27,  
    ["1003_86"] = 28,  
    ["1003_88"] = 29,  
    ["1003_90"] = 30,  
    ["1003_84"] = 31,  
    ["1003_100"] = 32,  
    ["1004_25"] = 33,  
    ["1004_27"] = 34,  
    ["1004_28"] = 35,  
    ["1004_29"] = 36,  
    ["1004_30"] = 37,
}

local __key_map = { 
    chapter = 1,
    event_id = 2,
    description = 3,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_spacetime_dungeon_message_info")

        return t._raw[__key_map[k]]
    end
}


function spacetime_dungeon_message_info.getLength()
    return #spacetime_dungeon_message_info._data
end



function spacetime_dungeon_message_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_spacetime_dungeon_message_info
function spacetime_dungeon_message_info.indexOf(index)
    if index == nil or not spacetime_dungeon_message_info._data[index] then
        return nil
    end
    return setmetatable({_raw = spacetime_dungeon_message_info._data[index]}, m)
end



---
--@return @class record_spacetime_dungeon_message_info
function spacetime_dungeon_message_info.get(chapter,event_id)
    
    local k = chapter .. '_' .. event_id
    return spacetime_dungeon_message_info.indexOf(__index_chapter_event_id[k])
     
end



function spacetime_dungeon_message_info.set(chapter,event_id, key, value)
    local record = spacetime_dungeon_message_info.get(chapter,event_id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function spacetime_dungeon_message_info.get_index_data()
    return __index_chapter_event_id 
end

return  spacetime_dungeon_message_info 