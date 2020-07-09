---@classdef record_mail_info
local record_mail_info = {}


record_mail_info.id = 0--ID
record_mail_info.title =  ""--邮件名称
record_mail_info.from =  ""--发件人
record_mail_info.content =  ""--邮件内容描述
record_mail_info.mail_type = 0--邮件类型
record_mail_info.seen_type = 0--归属页签
record_mail_info.if_bubble = 0--悬浮提示

local mail_info = {
   _data = {   
    [1] = {1,"#name#的邮件","#name#","#content#",3,3,2,},  
    [2] = {2,"#mail_name#","#name#","#content#",2,2,2,},  
    [3] = {3,"#mail_name#","#name#","#content#",1,1,2,},  
    [4] = {4,"充值成功","系统","将军，您成功充值#money#元，获得#gold_recharge#元宝，额外赠送#gold_gift#元宝，再次感谢您的支持！",2,2,2,},  
    [5] = {5,"充值单数限额","系统","将军，为了限制非法充值，#gold_gift#档位每日限制#limit_num#单充值。您的对应档位充值单数已达上限，今日无法继续充值该档位，请更换其他档位或明日继续充值。给您带来的不便敬请谅解。",2,2,2,},  
    [6] = {6,"月卡购买成功","系统","将军，您成功购买#recharge_name#，获得#gold_recharge#元宝。从今日起，您每日可在月卡界面领取#gold_gift#元宝，以及#month_card_score#点积分，持续#days#天，再次感谢您的支持！",2,2,2,},  
    [7] = {7,"月卡到期提示","系统","您的#recharge_name#今日到期，购买#recharge_name#累计可获得10倍以上返利，赶快下手吧！",2,2,2,},  
    [8] = {8,"基金购买成功","系统","将军，您成功购买#recharge_name#，在达到指定等级后可以在基金界面领取奖励。再次感谢您的支持！",2,2,2,},  
    [9] = {9,"每日特惠礼包","系统","将军，您成功购买&<12>#recharge_name#&，快去每日特惠界面领取礼包奖励，祝您游戏愉快！",2,2,2,},  
    [10] = {10,"订阅成功","系统","将军，您成功购买#name#。从今日起，您每日可在订阅界面领取订阅专属礼包，持续#days#天，再次感谢您的支持！",2,2,2,},  
    [11] = {11,"订阅到期提示","系统","将军，您的#name#今日到期，购买#name#可每日领取订阅专属礼包，更可享受订阅专属特权，赶快下手吧！",2,2,2,},  
    [12] = {12,"限时商人直充邮件","系统","将军，您在限时商人活动中成功购买#name#礼包，请领取奖励后继续在三国世界冒险吧！",2,2,2,},  
    [13] = {13,"天公赐福直充礼包","系统","将军，您成功购买&<12>#recharge_name#&，快去天公赐福界面领取礼包奖励，祝您游戏愉快！",2,2,2,},  
    [14] = {14,"天公赐福奖励补发","系统","将军，您有天公赐福奖励未领取，请查收!",2,2,2,},  
    [15] = {15,"每日特惠周卡购买","系统","将军，您已成功购买每日特惠周卡，一周内每天可免费领取一次所有档位的每日礼包，祝您游戏愉快！",2,2,2,},  
    [16] = {16,"欢庆佳节直充邮件","系统","将军，您在#activity_name#活动中成功购买#name#礼包，请领取奖励后继续在三国世界冒险吧！",2,2,2,},  
    [17] = {17,"心愿礼包直充邮件","系统","将军，您在心愿礼包活动中成功购买#name#，请领取奖励后继续在三国世界冒险吧！",2,2,2,},  
    [18] = {18,"珍宝商店直充邮件","系统","将军，您在珍宝商店中成功购买#name#，请领取奖励后继续在三国世界冒险吧！",1,1,1,},  
    [19] = {19,"号令天下直充邮件","系统","将军，您在号令天下活动中成功购买#name#礼包，请领取奖励后继续在三国世界冒险吧！",2,2,2,},  
    [20] = {20,"月基金购买成功","系统","将军，您已成功购买#name#，快去月基金界面领取礼包奖励，祝您游戏愉快！",2,2,2,},  
    [21] = {21,"充值到账","系统","在任意充值中，点击充值优先扣除代金券，并可完成对应充值活动。",1,1,1,},  
    [22] = {22,"充值延迟到账","系统","因为网络问题导致，您的一笔充值到账延迟，未及时到账，我们将本次充值订单以代金券的形式补偿给您，在充值中，点击充值优先扣除对应档位代金券，并可完成对应充值活动。",1,1,1,},  
    [23] = {23,"超值礼包购买邮件","系统","将军，您在超值礼包活动中成功购买#name#，请领取奖励后继续在三国世界冒险吧！",2,2,2,},  
    [24] = {24,"实名认证成功邮件","系统","将军，恭喜您完成了实名认证！以下是您获得的奖励，祝您游戏愉快！",1,1,1,},  
    [25] = {25,"少年庆典充值有礼","系统","将军，您在少年庆典充值有礼活动中成功购买#name#，请领取奖励后继续在三国世界冒险吧！",2,2,2,},  
    [26] = {1001,"竞技场每日排名奖励","竞技场","将军，恭喜您打败各路英雄，排名达到&<12>第#rank#名&，以下是你的排名奖励：",1,1,2,},  
    [27] = {1002,"无双试炼周排名奖励","无双试炼","恭喜将军！百尺竿头更进一步，您上周的无双试炼排名达到&<12>第#rank#名&，以下是你的排名奖励：",1,1,2,},  
    [28] = {1003,"巨兽击败奖励","讨伐巨兽","恭喜将军，您身先士卒，击败了&<12>#name#&，您获得了击败奖励",1,1,2,},  
    [29] = {1004,"巨兽发现奖励","讨伐巨兽","恭喜将军，您发现的&<12>#name#&被击败，您获得了发现奖励",1,1,2,},  
    [30] = {1005,"巨兽累积伤害排名奖励","讨伐巨兽","您在昨天的讨伐巨兽活动中表现卓越，累积伤害排名&<12>第#rank#名&，获得以下奖励",1,1,2,},  
    [31] = {1006,"巨兽最高伤害排名奖励","讨伐巨兽","您在昨天的讨伐巨兽活动中奋勇当先，最高伤害排名&<12>第#rank#名&，获得以下奖励",1,1,2,},  
    [32] = {1007,"签到累签奖励补发","讨伐巨兽","将军，这是您漏领的累签奖励，这种只赚不亏的事，以后可不能忘了哦！",1,1,2,},  
    [33] = {1008,"战力竞赛排名奖励","战力竞赛","恭喜将军！您一骑当先，在战力竞赛活动中达到&<12>第#rank#名&，以下是你的排名奖励：",1,1,2,},  
    [34] = {1009,"竞技场排名变化","竞技场","将军，&<11>#role_name#&在竞技场中击败了您，您的排名下降至&<12>第#rank#名&。",2,2,2,},  
    [35] = {1010,"城池争霸排名奖励","过关斩将","恭喜将军！您在过关斩将#city|storm_info|name#城池挑战中，排名第#rank#名，并获得限时官职#city_lord|storm_city_lord_info|name#和以下奖励",1,1,2,},  
    [36] = {1011,"限时礼包补发","系统","将军，您有遗忘的礼包未领取，特来送上，请将军收下!",1,1,2,},  
    [37] = {1012,"图鉴竞赛排名奖励","图鉴竞赛","恭喜将军！您广纳英才，在图鉴竞赛活动中达到&<12>第#rank#名&，以下是你的排名奖励：",1,1,2,},  
    [38] = {1013,"限时神将奖励","限时神将","将军，您在限时神将中有未领取的积分奖励，请查收：",1,1,2,},  
    [39] = {1014,"限时神将排名奖励","限时神将","恭喜将军！您豪气冲天，在限时神将积分排行中达到&<12>第#rank#名&，以下是你的排名奖励：",1,1,2,},  
    [40] = {1015,"激斗神将个人排名奖励","限时神将","恭喜将军！您英武非凡，在本日的激斗神将个人排行中达到&<12>第#rank#名&，以下是你的排名奖励：",1,1,2,},  
    [41] = {1016,"激斗神将军团排名奖励","限时神将","恭喜将军！您所在的军团万众一心，在本日的激斗神将军团排行中达到&<12>第#rank#名&，以下是你的排名奖励：",1,1,2,},  
    [42] = {1017,"每日特惠奖励补领","每日特惠","将军，您&<12>#day#&有未领取的每日特惠礼包，请查收：",1,1,2,},  
    [43] = {1018,"锦鲤奖励补发","系统","将军，您有遗忘的锦鲤奖励未领取，特来送上，请将军收下!",1,1,2,},  
    [44] = {1019,"少三老玩家礼包","系统","将军，您为《少年三国志》老玩家，特来送上老玩家专属奖励：包含绝版称号以及多种豪华奖励，请将军收下!",1,1,2,},  
    [45] = {1020,"欢庆佳节直充礼包补发","系统","将军，您#activity_name#活动有遗忘的直充礼包未领取，特来送上，请将军收下!",1,1,2,},  
    [46] = {1021,"欢庆佳节任务奖励补发","系统","将军，您#activity_name#活动有遗忘的任务奖励未领取，特来送上，请将军收下!",1,1,2,},  
    [47] = {1022,"每日心愿奖励","系统","将军，您每日心愿中有遗忘的奖励未领取，特来送上，请将军收下!",1,1,1,},  
    [48] = {1023,"心愿任务奖励","系统","将军，您心愿任务中有遗忘的任务奖励未领取，特来送上，请将军收下!",1,1,1,},  
    [49] = {1024,"心愿礼包奖励","系统","将军，您心愿礼包中有遗忘的奖励未领取，特来送上，请将军收下!",1,1,1,},  
    [50] = {1025,"App Store兑换码奖励邮件","系统","少年，您的兑换码奖励请查收!",1,1,1,},  
    [51] = {1026,"App Store兑换码邮件","系统","少年，您已兑换过奖励了，无法再次兑换奖励~",1,1,1,},  
    [52] = {1027,"新春福袋任务奖励补发","系统","将军，您在新春福袋活动有遗忘的任务奖励未领取，特来送上，请将军收下!",1,1,2,},  
    [53] = {1028,"讨伐神兽掉落奖励","系统","将军，您在讨伐神兽中协力击败#id|mystery_boss_info|name#，并获得第#rank#名，由于离线未领取掉落奖励，特来送上，请将军收下!",1,1,1,},  
    [54] = {1029,"离线时神兽已被击败","系统","将军，您在讨伐神兽中协力击败#id|mystery_boss_info|name#，很遗憾并未获得名次，还请将军再接再厉。",1,1,2,},  
    [55] = {1030,"神兽已被击败","系统","将军，您在讨伐神兽中协力击败#id|mystery_boss_info|name#，并获得第#rank#名，奖励已直接发送至神兽装备背包！",1,1,2,},  
    [56] = {1031,"神兽装备背包已满","系统","将军，您在讨伐神兽中协力击败#id|mystery_boss_info|name#，由于神兽装备背包已满，掉落奖励附送在邮件中，请将军及时清理背包领取奖励！",1,1,2,},  
    [57] = {1032,"神兽掉落奖励","系统","将军，您在讨伐神兽中击败#id|mystery_boss_info|name#，奖励已直接发送至神兽装备背包！",1,1,2,},  
    [58] = {1033,"离线时神兽被击败","系统","将军，您在讨伐神兽中击败#id|mystery_boss_info|name#，由于离线未领取掉落奖励，特来送上，请将军收下!",1,1,2,},  
    [59] = {1034,"神兽已被击败","系统","将军，您在讨伐#id|mystery_boss_info|name#中，最终奖励被#server#&<11>#role_name#&获得，还请将军再接再厉。",1,1,2,},  
    [60] = {1035,"超值礼包奖励补发","系统","将军，您在超值礼包中有遗忘的奖励未领取，特来送上，请将军收下!",1,1,2,},  
    [61] = {10001,"升级升至10级（废弃）","系统","恭喜你达到10级，脱离了新兵行列！",1,2,2,},  
    [62] = {10002,"合击兵符开启（废弃）","系统","恭喜你升至20级，开启合击兵符了，快点来看看吧！",2,2,2,},  
    [63] = {10003,"竞拍出价最高","系统","恭喜将军，竞拍&<12>#name#&当前出价最高！",2,2,1,},  
    [64] = {10004,"竞拍失败-返还元宝","系统","将军，您竞拍的&<12>#name#&被其他玩家出了更高的价格，以下是返还您的竞拍元宝：",1,1,1,},  
    [65] = {10005,"一口价拍卖","系统","将军，您豪气冲天，一口价拍卖了&<12>#name#&，请收取您竞拍到的商品：",1,1,1,},  
    [66] = {10006,"竞拍成功","系统","恭喜将军，您竞拍成功了&<12>#name#&，请收取您竞拍到的商品：",1,1,1,},  
    [67] = {10007,"拍卖分红","系统","恭喜将军，您积极参与#name#，获得了此次拍卖分红：",1,1,1,},  
    [68] = {10008,"变装过期","系统","将军，您的变装#name#已过期。",2,2,2,},  
    [69] = {11001,"积分损失","系统","将军，您刚刚被#name#偷袭，损失#num#积分",2,2,2,},  
    [70] = {100001,"秘境寻宝寻宝日志","寻宝","将军，&<11>#role_name#&寻找到了此处，将你击败，并拿走了#treasure_fragment#",4,0,2,},  
    [71] = {100101,"城池排名下降","攻城略地","将军，#role_name#在城池中击败了您，排名下降至#rank#名。",2,0,2,},  
    [72] = {200001,"军团解散通知","军团","将军，天下无不散的筵席，您所在的军团已被军团长解散了！",2,2,2,},  
    [73] = {200002,"军团自动解散通知","军团","将军，天下无不散的筵席，您所在的军团，&<12>#day#天&内，成员不足&<12>#num#人&，已被自动解散",2,2,2,},  
    [74] = {200003,"军团职位变动通知","军团","将军，权力更迭，您的军团职位由&<12>#name_1#&改为&<12>#name_2#&",2,2,2,},  
    [75] = {200004,"军团弹劾通知","军团","将军，您已被弹劾，失去军团长职位，成为普通成员！",2,2,2,},  
    [76] = {200005,"军团副本最佳伤害奖励","军团","恭喜将军，您在军团副本&<12>第#num#章&，&<12>#name#关卡&累积伤害最高，获得关卡最佳奖励",1,1,2,},  
    [77] = {200006,"军团副本伤害排名奖励","军团","您的军团在本周的军团副本活动中表现卓越，伤害排名&<12>第#rank#名&，获得以下奖励",1,1,2,},  
    [78] = {200007,"军团竞赛排名奖励","军团","您的军团在军团竞赛排行活动中表现卓越，排名&<12>第#rank#名&，获得以下奖励",1,1,2,},  
    [79] = {200008,"军团成员赠礼","军团","将军，您所在军团的#name#给您赠送了一份礼物：",1,1,2,},  
    [80] = {200009,"军团铸像显灵奖励补发","军团","将军，这是您昨天漏领的军团铸像显灵奖励：",1,1,2,},  
    [81] = {200010,"攻城略地赛季结算","攻城略地","将军，经过鏖战，你的军团成功占领了&<12>#city|mine_map_info|name#&，请查收你的占城奖励：",1,1,1,},  
    [82] = {200011,"攻城略地元宝补领","攻城略地","将军，赛季已结束，您驻扎的城池还有未领取的元宝，请查收：",1,1,1,},  
    [83] = {200012,"头像框过期提醒","头像框","将军,您的头像框#name#已经过期",2,2,2,},  
    [84] = {200013,"号令天下任务奖励","号令天下","将军，您号令天下中有遗忘的任务奖励未领取，特来送上，请将军收下!",1,1,1,},  
    [85] = {200014,"号令天下充值奖励","号令天下","将军，您号令天下中有遗忘的充值奖励未领取，特来送上，请将军收下!",1,1,1,},  
    [86] = {200015,"号令天下兵力等级奖励","号令天下","将军，您号令天下中有遗忘的军团兵力等级奖励未领取，特来送上，请将军收下!",1,1,1,},  
    [87] = {200016,"号令天下本服排行奖励","号令天下","将军，恭喜您在号令天下中拥兵一方，在本服排行榜中名列前茅，获得以下奖励：",1,1,1,},  
    [88] = {200017,"号令天下军团荣誉榜","号令天下","将军，您号令天下中有遗忘的军团荣誉榜奖励未领取，特来送上，请将军收下!",1,1,1,},  
    [89] = {200018,"号令天下跨服排行奖励","号令天下","将军，恭喜您在号令天下中雄霸四方，在跨服排行榜中名列前茅，获得以下奖励：",1,1,1,},  
    [90] = {200019,"号令天下本服荣誉榜","号令天下","将军，您号令天下中有遗忘的本服荣誉榜奖励未领取，特来送上，请将军收下!",1,1,1,},  
    [91] = {200020,"称号过期提醒","系统","将军,您的称号#name#已过期。",2,2,2,},  
    [92] = {200021,"禁言提醒","系统","将军，检测到你存在不当言行，从&<12>#starttime#&开始将禁止你在&<12>#id|channel_text_info|channel_name#&发言，持续&<12>#duration#&分钟，将在&<12>#forbidtime#&解除禁言！",2,2,2,},  
    [93] = {200022,"解除禁言提醒","系统","将军，你在&<12>#id|channel_text_info|channel_name#&的禁言已解除，请注意文明用语！",2,2,2,},  
    [94] = {200023,"富甲天下奖励","富甲天下","将军，您在富甲天下中有未领取的积分奖励，请查收：",1,1,2,},  
    [95] = {200024,"决战定军山排名奖励","决战定军山","恭喜将军！您在决战定军山中排名战区第#rank#名，请查收您的奖励：",1,1,2,},  
    [96] = {200025,"王者竞技本服排名奖励","王者竞技","将军，恭喜您在王者竞技本赛季中表现卓越，本服排名&<12>第#rank#名&，请查收您的奖励：",1,1,2,},  
    [97] = {200026,"王者竞技战区排名奖励","王者竞技","将军，恭喜您在王者竞技本赛季中表现卓越，战区排名&<12>第#rank#名&，请查收您的奖励：",1,1,2,},  
    [98] = {200027,"王者竞技全服排名结算","王者竞技","将军，恭喜您在王者竞技本赛季中名列前茅，获得&<12>#name#&段位和全服排名&<12>第#rank#名&的卓越成绩。祝您百尺竿头更进一步！",1,1,2,},  
    [99] = {200028,"王者竞技段位突破奖励","王者竞技","将军，恭喜您在王者竞技本赛季中首次突破至&<12>#name#&段位，请查收您的奖励：",1,1,2,},  
    [100] = {200029,"攻城掠地新赛季阶段奖励","攻城略地","将军，经过鏖战，你的军团成功占领了<12>#id|wrest_city_info|name#，请查收你的占城奖励：",1,1,2,},  
    [101] = {200030,"攻城掠地新赛季结算奖励","攻城略地","将军，经过一番激烈争夺，您所在的#name#联盟获得了第#rank#名的优秀成绩，请查收您的奖励：",1,1,2,},  
    [102] = {200031,"兵临城下进度奖励补发","兵临城下","将军，这是您昨天漏领的兵临城下进度奖励：",1,1,2,},  
    [103] = {200032,"兵临城下进度奖励补发","兵临城下","将军，这是您昨天漏领的兵临城下进度奖励：",1,1,2,},  
    [104] = {200033,"兵临城下排行奖励","兵临城下","您的军团在兵临城下排行活动中表现卓越，排名&<12>第#rank#名&，获得以下奖励",1,1,2,},  
    [105] = {200034,"讨伐魔将最高荣誉排名奖励","讨伐魔将","将军，恭喜您在今日讨伐魔将中获得所属战区&<12>#camp|demon_boss_buff_info|camp#&阵营最高荣誉榜&<12>第#rank#名&的成绩，请查收您的奖励：",1,1,2,},  
    [106] = {200035,"讨伐魔将累计荣誉排名奖励","讨伐魔将","将军，恭喜您在今日讨伐魔将中获得所属战区&<12>#camp|demon_boss_buff_info|camp#&阵营累计荣誉榜&<12>第#rank#名&的成绩，请查收您的奖励：",1,1,2,},  
    [107] = {200036,"讨伐魔将军团荣誉排名奖励","讨伐魔将","将军，您所在的军团在今日讨伐魔将挑战中表现优异，获得战区内军团总荣誉榜&<12>第#rank#名&的成绩，请查收您的奖励：",1,1,2,},  
    [108] = {1000001,"请查收礼包奖励","系统","您的礼包奖励已发放，请查收",1,1,2,},
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
    [1001] = 26,  
    [1002] = 27,  
    [1003] = 28,  
    [1004] = 29,  
    [1005] = 30,  
    [1006] = 31,  
    [1007] = 32,  
    [1008] = 33,  
    [1009] = 34,  
    [1010] = 35,  
    [1011] = 36,  
    [1012] = 37,  
    [1013] = 38,  
    [1014] = 39,  
    [1015] = 40,  
    [1016] = 41,  
    [1017] = 42,  
    [1018] = 43,  
    [1019] = 44,  
    [1020] = 45,  
    [1021] = 46,  
    [1022] = 47,  
    [1023] = 48,  
    [1024] = 49,  
    [1025] = 50,  
    [1026] = 51,  
    [1027] = 52,  
    [1028] = 53,  
    [1029] = 54,  
    [1030] = 55,  
    [1031] = 56,  
    [1032] = 57,  
    [1033] = 58,  
    [1034] = 59,  
    [1035] = 60,  
    [10001] = 61,  
    [10002] = 62,  
    [10003] = 63,  
    [10004] = 64,  
    [10005] = 65,  
    [10006] = 66,  
    [10007] = 67,  
    [10008] = 68,  
    [11001] = 69,  
    [100001] = 70,  
    [100101] = 71,  
    [200001] = 72,  
    [200002] = 73,  
    [200003] = 74,  
    [200004] = 75,  
    [200005] = 76,  
    [200006] = 77,  
    [200007] = 78,  
    [200008] = 79,  
    [200009] = 80,  
    [200010] = 81,  
    [200011] = 82,  
    [200012] = 83,  
    [200013] = 84,  
    [200014] = 85,  
    [200015] = 86,  
    [200016] = 87,  
    [200017] = 88,  
    [200018] = 89,  
    [200019] = 90,  
    [200020] = 91,  
    [200021] = 92,  
    [200022] = 93,  
    [200023] = 94,  
    [200024] = 95,  
    [200025] = 96,  
    [200026] = 97,  
    [200027] = 98,  
    [200028] = 99,  
    [200029] = 100,  
    [200030] = 101,  
    [200031] = 102,  
    [200032] = 103,  
    [200033] = 104,  
    [200034] = 105,  
    [200035] = 106,  
    [200036] = 107,  
    [1000001] = 108,
}

local __key_map = { 
    id = 1,
    title = 2,
    from = 3,
    content = 4,
    mail_type = 5,
    seen_type = 6,
    if_bubble = 7,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_mail_info")

        return t._raw[__key_map[k]]
    end
}


function mail_info.getLength()
    return #mail_info._data
end



function mail_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_mail_info
function mail_info.indexOf(index)
    if index == nil or not mail_info._data[index] then
        return nil
    end
    return setmetatable({_raw = mail_info._data[index]}, m)
end



---
--@return @class record_mail_info
function mail_info.get(id)
    
    return mail_info.indexOf(__index_id[ id ])
     
end



function mail_info.set(id, key, value)
    local record = mail_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function mail_info.get_index_data()
    return __index_id 
end

return  mail_info 