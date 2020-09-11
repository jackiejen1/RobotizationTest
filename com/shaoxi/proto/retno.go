package retno

/**
所有的报错信息id 都往后加 不要再中间添加了 方便策划核对新加了哪几个报错
*/
const (
	RET_ERROR                    uint32 = 0  //悟空 你又调皮了
	RET_OK                       uint32 = 1  //1 正确返回 非1 错误返回
	RET_SERVER_MAINTAIN          uint32 = 2  //服务器维护
	RET_NO_FIND_USER             uint32 = 3  //玩家不存在
	RET_LOGIN_REPEAT             uint32 = 4  //重复登陆
	RET_USER_NAME_REPEAT         uint32 = 5  //创建角色时,玩家名字重复
	RET_CHAT_OUT_OF_LENGTH       uint32 = 6  // 聊天 - 话太多
	RET_CHAT_CHAN_INEXISTENCE    uint32 = 7  // 聊天 - 频道不存在
	RET_SERVER_USER_OVER_CEILING uint32 = 8  //超过服务器上限
	RET_LOGIN_BAN_USER           uint32 = 9  //被封用户
	RET_SERVER_NO_OPEN           uint32 = 10 //服务器未开服
	RET_VERSION_ERR              uint32 = 11 //版本不一致
	RET_LOGIN_TOKEN_TIME_OUT     uint32 = 12 //登录超时
	RET_SERVER_BUSY              uint32 = 13 //服务器繁忙
	RET_LOCK_FAIL                uint32 = 14 //不能重复请求
	RET_USER_OFFLINE             uint32 = 15 //玩家不在线
	RET_NO_FIND_USER_OR_OFFLINE  uint32 = 16 //玩家不存在或不在线
	RET_REPEATED_ORDER_ID        uint32 = 17 //重复订单
	RET_UUID_NOT_ACTIVATE        uint32 = 18 //账号未激活
	RET_SERVER_CLOSE_REGIST      uint32 = 19 //服务器关闭注册 请选择其他服务器进行游戏
	RET_USER_ID_TEMPORARY_BAN    uint32 = 20 //玩家已被临时封号

	RET_EQUIP_NOT_EXIST         uint32 = 1001 //装备信息不存在
	RET_FRAG_NOT_EXIST          uint32 = 1002 //碎片信息不存在
	RET_TREASURE_NOT_EXIST      uint32 = 1003 //宝物信息不存在
	RET_ITEM_NOT_EXIST          uint32 = 1004 //道具不存在
	RET_GEM_NOT_EXIST           uint32 = 1005 //宝石不存在
	RET_KNIGHT_NOT_EXIST        uint32 = 1006 //武将信息不存在
	RET_USER_CORP_NOT_EXIST     uint32 = 1007 //玩家没有军团
	RET_USER_BIBLE_NOT_EXIST    uint32 = 1008 //真经不存在
	RET_USER_SOURCE_NOT_EXIST   uint32 = 1009 //法器不存在
	RET_MONTHLY_CARD_NOT_EXIST  uint32 = 1010 //月卡信息不存在
	RET_FOOD_NOT_EXIST          uint32 = 1011 //神将升星材料不存在
	RET_FOOD_FRAGMENT_NOT_EXIST uint32 = 1012 //神将升星材料碎片不存在
	RET_INSTRUMNET_NOT_EXIST    uint32 = 1013 //法宝不存在
	RET_GROUPBUY_NOT_EXIST      uint32 = 1014 //团购信息不存在

	RET_CHAT_CONTENT_OUT_OF_LEN uint32 = 1100 //聊天内容超出长度
	RET_CHAT_FORBID             uint32 = 1101 //禁止在该频道聊天
	RET_CHAT_HIGH_FREQUENCY     uint32 = 1102 //聊天太频繁

	RET_IS_NOT_UP_TO_LEVEL             uint32 = 2001 //主角等级不足
	RET_NOT_ENOUGH_MONEY               uint32 = 2002 //玩家銀兩不足
	RET_NOT_ENOUGH_GOLD                uint32 = 2003 //黄金不足
	RET_NOT_ENOUGH_VIT                 uint32 = 2004 //体力不足
	RET_NOT_ENOUGH_SPIRIT              uint32 = 2005 //主角精力不足
	RET_NOT_ENOUGH_FRAG                uint32 = 2006 //碎片不足
	RET_NOT_ENOUGH_ITEM                uint32 = 2007 //道具数量不足
	RET_NOT_ENOUGH_GEM                 uint32 = 2008 //宝石数量不足
	RET_NOT_ENOUGH_VIP                 uint32 = 2009 //vip等级不足
	RET_NOT_ENOUGH_MANA                uint32 = 2010 //法力不足
	RET_VIT_IS_FULL                    uint32 = 2011 //体力已满
	RET_SPIRIT_IS_FULL                 uint32 = 2012 //精力已满
	RET_NOT_ENOUGH_PRESTIGE            uint32 = 2013 //声望不足
	RET_NOT_ENOUGH_TOWER_RESOURCE      uint32 = 2014 //锁妖塔资源不足
	RET_NOT_ENOUGH_VIAGRA              uint32 = 2015 //围剿群妖丹药不足
	RET_NOT_ENOUGH_FRA_1               uint32 = 2016 //夺宝资源1不足
	RET_NOT_ENOUGH_FRA_2               uint32 = 2017 //夺宝资源2不足
	RET_NOT_ENOUGH_FRA_3               uint32 = 2018 //夺宝资源3不足
	RET_NOT_ENOUGH_MEDAL               uint32 = 2019 //战功不足
	RET_NOT_ENOUGH_TREASURE_REFINE_NUM uint32 = 2020 //宝物进阶材料不足
	RET_NOT_ENOUGH_YUANQI              uint32 = 2021 //元气不足
	RET_NOT_ENOUGH_ARENA_HONOR         uint32 = 2022 //跨服竞技荣誉不足
	RET_NOT_ENOUGH_LOCK_STONE          uint32 = 2023 //锁星石不足
	RET_NOT_ENOUGH_SOUL                uint32 = 2024 //将魂不足
	RET_NOT_ENOUGH_FOOD                uint32 = 2025 //升星材料不足
	RET_NOT_ENOUGH_KNIGHT              uint32 = 2026 //武将数量不足
	RET_NOT_ENOUGH_EQUIP               uint32 = 2027 //装备数量不足
	RET_NOT_ENOUGH_INSTRUMENT          uint32 = 2028 //法宝数量不足
	RET_NOT_ENOUGH_JADE                uint32 = 2029 //魂玉不足
	RET_NOT_ENOUGH_CARD                uint32 = 2030 //同名卡不足
	RET_NOT_ENOUGH_SOUL_JADE           uint32 = 2031 //灵玉不足
	RET_NOT_ENOUGH_SOUL_SCORE          uint32 = 2032 //积分不足
	RET_NOT_ENOUGH_GROUPBUY_SCORE      uint32 = 2033 //团购积分不足
	RET_NOT_ENOUGH_GROUPBUY_BUYTIMES   uint32 = 2034 //购买次数不足

	RET_KNIGHT_BAG_FULL     uint32 = 3001 //卡牌背包满
	RET_EQUIP_BAG_FULL      uint32 = 3002 //装备背包满
	RET_ITEM_BAG_FULL       uint32 = 3003 //道具背包满
	RET_FRIEND_FULL_1       uint32 = 3004 // 自己好友已满
	RET_FRIEND_FULL_2       uint32 = 3005 // 对方好友已满
	RET_IS_NOT_FRIEND       uint32 = 3006 //非好友
	RET_HAS_BEEN_FRIEND     uint32 = 3007 // 已经是好友
	RET_DAILY_GIFT_NUM_FULL uint32 = 3008 //玩家今日领取体力次数已满
	RET_BLACKLIST_FULL      uint32 = 3009 //黑名单满
	RET_TREASURE_BAG_FULL   uint32 = 3010 //宝物背包满
	RET_IN_BLACKLIST        uint32 = 3011 //该玩家在你黑名单中
	RET_SOUL_BAG_FULL       uint32 = 3012 //仙灵背包满

	RET_CHAPTERBOX_REWARDED          uint32 = 4001 //章节宝箱奖励已经领取
	RET_NOT_ENOUGH_CHAPTERBOX_STAR   uint32 = 4002 //章节宝箱星星数不够
	RET_CHAPTER_STAGE_WRONG_STAR     uint32 = 4003 //挑战错误的星数
	RET_CHAPTER_STAGE_NO_EXISTS_STAR uint32 = 4004 //不存在的星数

	RET_EQUIP_REFINE_LEVEL_IS_MAX                         uint32 = 5000 //装备精炼等级已达上限
	RET_EQUIP_UNABLE_TO_UPGRADE                           uint32 = 5001 //装备无法升级
	RET_EQUIP_LEVEL_EXCEED_LIMIT                          uint32 = 5002 //装备强化等级超过限制
	RET_FRAG_SYNTHETIC_EQUIP_NOT_EXIST                    uint32 = 5003 //碎片合成的装备信息不存在
	RET_TREASURE_CANNOT_STRENGTH                          uint32 = 5004 //该宝物无法被强化
	RET_TREASURE_LEVEL_EXCEED_LIMIT                       uint32 = 5005 //宝物强化等级超过限制
	RET_TREASURE_UPGREADED                                uint32 = 5006 //该宝物已被强化
	RET_TREASURE_IN_POSITION                              uint32 = 5007 //已装备宝物不可以被强化
	RET_ITEM_TYPE_INCORRECT                               uint32 = 5008 //道具类型错误
	RET_KNIGHT_CANNOT_UPGRADE_LEAD                        uint32 = 5009 //主将无法强化
	RET_KNIGHT_LEVEL_EXCEED_LEAD                          uint32 = 5010 //请提升主角等级
	RET_KNIGHT_LEAD_CANNOT_BE_UPGRADE                     uint32 = 5011 //主将不可用来强化
	RET_KNIGHT_BE_UPGRADE_REPEAT                          uint32 = 5012 //该武将已被强化
	RET_KNIGHT_FIGHT_CANNOT_BE_UPGRADE                    uint32 = 5013 //出阵武将不可被强化
	RET_KNIGHT_CANNOT_BE_ADVANCED                         uint32 = 5014 //武将不可升阶
	RET_KNIGHT_ADVANCED_LEVEL_EXCEED_LIMIT                uint32 = 5015 //武将阶级已经达到最高等级
	RET_KNIGHT_LEVEL_NOT_REACH                            uint32 = 5016 //进阶武将等级需求不足
	RET_KNIGHT_ADVANCED_NOT_ENOUGH_NUM                    uint32 = 5017 //进阶消耗卡牌数量不对
	RET_KNIGHT_FIGHT_CANNOT_BE_QUALITY_UP                 uint32 = 5018 //出阵武将不可当作突破材料
	RET_KNIGHT_TRAINING_VALUE_EXCEED_LIMIT                uint32 = 5019 //提升属性值均超过限制
	RET_KNIGHT_DESTINY_LEVEL_EXCEED_LIMIT                 uint32 = 5020 //不能超过最大天命等级
	RET_KNIGHT_ONETEAM                                    uint32 = 5021 //武将在阵位上
	RET_KNIGHT_INCORRECT_TEAM                             uint32 = 5022 //阵营类型错误
	RET_KNIGHT_INCORRECT_POS                              uint32 = 5023 //位置错误
	RET_KNIGHT_NOT_USE_LEAD_POS                           uint32 = 5024 //一号位只能放主角
	RET_TREASURE_REFINE_LEVEL_EXCEED_LIMIT                uint32 = 5025 //宝物进阶等级超过限制
	RET_KNIGHT_STAR_MAX                                   uint32 = 5026 //武将星级已达上限
	RET_KNIGHT_STAR_UP_ITEM_NOT_ENOUGH                    uint32 = 5027 //武将升星道具不足
	RET_KNIGHT_XP_IS_FULL                                 uint32 = 5028 //武将经验已达上限
	RET_KNIGHT_QUALITY_IS_FULL                            uint32 = 5029 //品质已达最高
	RET_KNIGHT_LEVEL_NOT_ENOUGH                           uint32 = 5030 //武将等级不足
	RET_KNIGHT_IS_UNIQUE                                  uint32 = 5031 //武将不可以重复
	RET_INSTRUMENT_LEVEL_IS_MAX                           uint32 = 5032 //法宝等级不能大于主角等级
	RET_PK_CD                                             uint32 = 5033 //切磋CD中
	RET_BIBLE_RECEIVE_NOT_AWARD                           uint32 = 5034 //月光宝盒宝珠奖励未领取
	RET_MUST_GO_INTO_BATTLE                               uint32 = 5035 //必须是上阵武将
	RET_WRONG_TARGET                                      uint32 = 5036 //错误的目标
	RET_MATERIALS_QUALITY_ERROR                           uint32 = 5037 //材料品质不匹配
	RET_MATERIALS_HAVE_BEEN_UPGRADED                      uint32 = 5038 //该材料被强化过
	RET_INSTRUMENT_RANK_MAX                               uint32 = 5039 //法宝突破等级已达上限
	RET_INSTRUMENT_LEVEL_CAN_NOT_BIGGER_THAN_KNIGHT_LEVEL uint32 = 5040 //法宝等级不能超过神将等级
	RET_INSTRUMNET_LEVEL_MAX                              uint32 = 5041 //法宝等级已达上限
	RET_GUIDE_ID_LESS_OLD                                 uint32 = 5042 //新手引导id不可回退
	RET_REFRESH_CD                                        uint32 = 5043 //刷新cd中
	RET_KNIGHT_MUST_MAX_UNIT                              uint32 = 5044 //第一阵容未上满神将
	RET_COMMON_CROSS_RANK_NO_SERVICE                      uint32 = 5045 //跨服排行榜无法提供服务
	RET_KNIGHT_COLOR_NOT_ENOUGH                           uint32 = 5046 //神将品质不足
	RET_KNIGHT_STAR_MATERIALS_EQUIPED                     uint32 = 5047 //觉醒材料已装备
	RET_KNIGHT_STAR_MAX_AWAKEN_LEVEL                      uint32 = 5048 //已至最大觉醒阶数
	RET_KNIGHT_STAR_MATERIALS_NOT_ENOUGH                  uint32 = 5049 //觉醒材料不足无法升阶
	RET_KNIGHT_INSTRUMENT_REFINE_FULL                     uint32 = 5050 //精炼属性已升满
	RET_KNIGHT_INSTRUMENT_REFINE_NOT_FULL                 uint32 = 5051 //精炼属性未升满
	RET_KNIGHT_INSTRUMENT_REFINE_LEVEL_MAX                uint32 = 5052 //精炼等级已达上限
	RET_KNIGHT_INSTRUMENT_LV_NOT_ENOUGH                   uint32 = 5053 //法宝等级不足
	RET_LOTTERY_REQUIRE_SIZE_NOT_ENOUGH                   uint32 = 5054 //条件不足
	RET_SELL_NUM_OVERFLOW                                 uint32 = 5055 //出售数量超出限制
	RET_MAMMON_GIFT_ALREADY_RECEIVE                       uint32 = 5056 //福袋已领取
	RET_MAMMON_CLOSED                                     uint32 = 5057 //活动未开启
	RET_MAGIC_CLOSED                                      uint32 = 5058 //神将幻化活动未开启
	RET_INSTRUMENT_MAGIC_CAN_NOT_MAGIC                    uint32 = 5059 //神将法宝不能幻化
	RET_INSTRUMENT_MAGIC_CLASS_ERROR                      uint32 = 5060 //神将法宝幻化类型错误
	RET_INSTRUMENT_MAGIC_TOID_ERROR                       uint32 = 5061 //神将法宝幻化目标错误

	RET_GEM_LEVEL_IS_TOP uint32 = 6001 //寶石等級已封頂

	RET_GROUPBUY_POINTPRIZE_LOOTED = 6050 //团购积分奖励已领取
	RET_GROUPBUY_SERVICE_STOP      = 6051 //团购活动停止
	RET_GROUPBUY_TIME_OVER         = 6052 //团购不在活动期间

	RET_WORLD_BOSS_NO_FIGHT_COUNT uint32 = 7001 //没有挑战次数
	RET_WORLD_BOSS_IS_DEAD        uint32 = 7002 //魔界BOSS死了
	RET_CHAPTER_STAGE_NO_COUNT    uint32 = 7003 //没有挑战次数
	RET_WORLD_BOSS_ATTACK_COOL    uint32 = 7004 //CD冷却中
	RET_WORLD_BOSS_SLEEP          uint32 = 7005 //睡觉呢

	RET_SHOP_BUY_COUNT_EXCEED_LIMIT uint32 = 8001 //商店购买数量超过限制
	RET_SHOP_GOODS_ALREADY_BUYED    uint32 = 8002 //商店物品已经购买过了
	RET_SHOP_MAGIC_SHOP_EXPIRED     uint32 = 8003 //神秘商店已经过期失效了
	RET_SHOP_EXCEED_REFRESH_LIMIT   uint32 = 8004 //超过了商店手动刷新次数上限

	RET_TRAVELSHOP_NOT_IN_TIME uint32 = 8006 //不在活动时间内

	RET_SUBTITLE_SEND_TOO_FAST     uint32 = 8010 //发送弹幕过快
	RET_SUBTITLE_FORBID_SEND       uint32 = 8011 //弹幕禁言
	RET_SUBTITLE_REDPACKET_ROBOVER uint32 = 8012 //红包已被抢完

	RET_BIAOCHE_EXCEED_SHIP_NUM   uint32 = 8020 //超过每日运镖次数
	RET_BIAOCHE_UPGRADE_FAILED    uint32 = 8021 //提升镖车品质失败
	RET_BIAOCHE_EXCEED_HELPED_NUM uint32 = 8022 //超过每日邀请好友运镖次数
	RET_BIAOCHE_EXCEED_HELP_NUM   uint32 = 8023 //超过每日帮助好友护镖次数
	RET_BIAOCHE_NO_NEED_ROB_COOL  uint32 = 8024 //不用移除劫镖冷却
	RET_BIAOCHE_REFRESH_RUNOUT    uint32 = 8025 //刷新镖车次数用尽
	RET_BIAOCHE_REFRESH_INCOOL    uint32 = 8026 //刷新镖车冷却中
	RET_BIAOCHE_REFRESH_TIMEDOUT  uint32 = 8027 //刷新镖车超时请重试
	RET_BIAOCHE_EXCEED_ROB_NUM    uint32 = 8028 //超过劫镖次数上限
	RET_BIAOCHE_CANNOT_ROB_FRIEND uint32 = 8029 //不能打劫好友
	RET_BIAOCHE_ROB_INCOOL        uint32 = 8030 //处于打劫冷却中
	RET_BIAOCHE_ALREADY_ROBED     uint32 = 8031 //打劫同一辆镖车次数过多
	RET_BIAOCHE_BIAOCHE_FINISHED  uint32 = 8032 //镖车已运完
	RET_BIAOCHE_EXCEED_ROBED_NUM  uint32 = 8033 //镖车被劫次数达到上限
	RET_BIAOCHE_IN_ROB_PROTECT    uint32 = 8034 //镖车正处于打劫保护期
	RET_BIAOCHE_SERVER_BUSY       uint32 = 8035 //服务器繁忙
	RET_BIAOCHE_ROB_FAILED        uint32 = 8036 //打劫中战斗失败

	RET_ARENA_RANK_NOT_REACH_20        uint32 = 9001 //该对手不可挑战
	RET_ARENA_RANK_LOCK                uint32 = 9002 //该对手正在被挑战
	RET_IS_NOT_UP_TO_RANK              uint32 = 9003 //历史最高排名未达到条件
	RET_ARENA_COOLING_TIME             uint32 = 9004 //挑战冷却时间中
	RET_ARENA_FIGHT_NUM_NOT_ENOUGH     uint32 = 9005 //挑战次数不足
	RET_ARENA_OPPONENT_THAN_OWN_STRONG uint32 = 9006 //对手排名高于己方排名

	RET_DEVIL_NOTVAILD                 uint32 = 10000 //BOSS未激活
	RET_DEVIL_NOT_PUBLIC               uint32 = 10001 //BOSS未共享
	RET_DEVIL_NOT_FRIEND               uint32 = 10002 //不是好友
	RET_DEVIL_NOT_FOUND_EXPLOIT_REWARD uint32 = 10003 //未找到功勋奖励

	RET_DAILY_DUNGEON_AWARD_ERROR       uint32 = 10004 //发奖出错
	RET_DAILY_DUNGEON_CLIENT_ERROR      uint32 = 10005 //客户端数据错误
	RET_DAILY_DUNGEON_IS_NOT_OPEN_LEVEL uint32 = 10006 //未达到开放等级
	RET_DAILY_DUNGEON_IS_NOT_OPEN_TIME  uint32 = 10007 //不在活动开放时间段
	RET_DAILY_DUNGEON_NOT_ENOUGH_COUNT  uint32 = 10008 //挑战次数不足
	RET_DAILY_DUNGEON_BATTLE_DATA_ERROR uint32 = 10009 //战斗数据出错

	RET_MAZE_EXPLORE_COUNT_UNENONGH   uint32 = 10010 //迷宫探索次数不足
	RET_MAZE_CHALLENGE_COUNT_UNENOUGH uint32 = 10011 //迷宫挑战次数不足
	RET_MAZE_MOVE_COUNT_UNENOUGH      uint32 = 10012 //迷宫移动次数不足
	RET_MAZE_POS_VALUE_LEGAL          uint32 = 10013 //玩家位置非法
	RET_MAZE_REACH_MAX_PUR_EXPLORE    uint32 = 10014 //达到迷宫的最大购买探索次数

	RET_SERVER_ARENA_NO_OPEN uint32 = 10015 //本服暂未开启跨服竞技
	RET_SERVER_ARENA_WEEKEND uint32 = 10016 //当前正在结算中

	RET_STAR_COLOR_MAX uint32 = 10017 //星宿已达最高品质

	RET_RICH_COUNT_UNENOUGH        uint32 = 10018 //大闹天宫次数不足
	RET_RICH_PLAY_END              uint32 = 10019 //大闹天宫玩法结束
	RET_RICH_POSITION_ERROR        uint32 = 10020 //大闹天宫当前位置错误
	RET_RICH_LEVEL_UNENOUGH        uint32 = 10021 //大闹天宫玩法等级不够
	RET_RICH_RUYI_DICE_ERROR       uint32 = 10022 //如意点数错误
	RET_RICH_RUYI_UNENOUGH         uint32 = 10023 //如意色子数不足
	RET_RICH_BATTLE_COUNT_UNENOUGH uint32 = 10024 //大闹天宫生命次数不足
	RET_RICH_RAND_EVENT_NOT_END    uint32 = 10025 //大闹天宫的随机事件玩法未选择

	RET_SERVER_ARENA_REFRESH_NOT_ENOUGH uint32 = 10026 //跨服竞技刷新次数已达上限

	RET_DAILY_TASK_AWARD_NOT_CONDITION uint32 = 10027 //日常任务未达到奖励条件
	RET_DAILY_TASK_AWARD_NOT_REPEAT    uint32 = 10028 //日常任务不能重复奖励
	RET_DAILY_TASK_AWARD_NOT_FOUND     uint32 = 10029 //日常任务没有找到奖励

	RET_PRE_FAIRYLAND_STAGE_NO_FINISHED uint32 = 10031 //前一关卡没有通过
	RET_FAIRYLAND_STAGE_NO_COUNT        uint32 = 10032 //仙界副本没有挑战次数了
	RET_CHAPTER_NO_FINISHED             uint32 = 10033 //对应关卡没有通过

	RET_NO_ENOUGH_VIP_LEVEL         uint32 = 10034 //VIP等级不足
	RET_NOT_ENOUGH_VALUE_TO_RECEIVE uint32 = 10035 //未达到领取条件
	RET_ALREADY_BUY_FUND_COIN       uint32 = 10036 //已购买过开服基金
	RET_BUY_FUND_COIN_TIME_ERR      uint32 = 10037 //购买时间错误
	RET_RECEIVE_TIME_ERR            uint32 = 10038 //领取时间已过
	RET_NOT_BUY_FUND_COIN           uint32 = 10039 //没有购买开服基金
	RET_ALREADY_RECEIVED            uint32 = 10040 //已领取

	RET_CITY_NOT_UP_LEVEL         uint32 = 10041 //巡逻城池的开放等级不够
	RET_CITY_PATROL_NOT_END       uint32 = 10042 //巡逻未结束
	RET_CITY_NOT_REPEAT_KNIGHT    uint32 = 10043 //巡逻不能派遣重复武将
	RET_CITY_NOT_FIND_CITY        uint32 = 10044 //无法找到城池
	RET_CITY_SPEEND_UNENOUGH      uint32 = 10045 //巡逻完成次数不足
	RET_CITY_IS_OCCUPY            uint32 = 10046 //城池已经攻克
	RET_CITY_NOT_SPEED_NOT_PATROL uint32 = 10047 //不能加速未在巡逻中的城池
	RET_CITY_NOT_AWARD            uint32 = 10048 //巡逻未达到奖励条件
	RET_CITY_NOT_REPEATED_AWARD   uint32 = 10049 //巡逻奖励不能重复领取
	RET_CITY_NOT_FIND_REBEL       uint32 = 10050 //未找到暴动城池,或暴动已被镇压
	RET_CITY_MAX_LEVEL_NOT_UP     uint32 = 10051 //城池达到最高等级，无法升级
	RET_CITY_NOT_EXP_UNENOUGH     uint32 = 10052 //经验不足，无法升级

	RET_FOOD_EATED                      uint32 = 10053 //升星装备已穿上
	RET_ACHIEVEMENT_AWARD_NOT_CONDITION uint32 = 10054 //成就未达到奖励条件
	RET_ACHIEVEMENT_AWARD_NOT_REPEAT    uint32 = 10055 //成就不能重复奖励

	RET_CA_AWARD_TIMENOT_REACH             uint32 = 10056 //可配置任务奖励领取时间未到
	RET_CA_AWARD_TIMES_EXCEED_LIMIT        uint32 = 10057 //可配置活动奖励次数超过限制
	RET_CA_AWARD_TIMES_EXCEED_SERVER_LIMIT uint32 = 10058 //可配置活动全服奖励次数超过限制
	RET_CA_AWARD_ID_ERROR                  uint32 = 10059 //可配置活动奖励ID错误
	RET_CA_QUEST_IS_NOT_COMPLETE           uint32 = 10060 //可配置活动奖励不可领取
	RET_ITEM_TYPE_ERROR                    uint32 = 10061 //道具类型不对
	RET_NO_FIND_REPORT                     uint32 = 10062 //战报不存在
	RET_MAZE_REACH_MAX_PUR_ACTION_COUNT    uint32 = 10063 //挖宝购买行动力次数达到上限
	RET_SEND_MAIL_CD                       uint32 = 10064 //发送邮件太快

	RET_ACT_EXCHANGE_NUM_ERROR         uint32 = 10065 //兑换次数不能为0
	RET_USER_IN_FORBID_BATTLE_TIME     uint32 = 10066 //免战中
	RET_TREASURE_FRAGMENT_EXIST        uint32 = 10067 //已经有该碎片
	RET_TREASURE_NO_FRAGMENT           uint32 = 10068 //宝物至少有一个碎片才能抢夺
	RET_TREASURE_FRAGMENT_NOT_ENOUGH   uint32 = 10069 //对方碎片不多啦 给他留点吧
	RET_TREASURE_FRAGMENT_USER_IN_ROB  uint32 = 10070 //对方正在被其他玩家抢夺
	RET_TREASURE_FRAGMENT_USER_IN_BUSY uint32 = 10071 //对方正忙呢
	RET_BATTLE_ERROR                   uint32 = 10072 //战斗出错
	RET_IS_NOT_UP_TO_LEVEL_OR_VIP      uint32 = 10073 //角色等级不足或者VIP等级不足

	RET_DAILY_DUNGEON_PRE_NOT_PASS uint32 = 10074 //日常副本前置关卡未通关
	RET_DAILY_DUNGEON_CD_TIME      uint32 = 10075 //日常副本CD时间未到
	RET_DAILY_DUNGEON_NOT_OPEN     uint32 = 10076 //日常副本关卡未开启

	RET_GIFT_CODE_VERFITY_ERROR      uint32 = 10078 //礼包码校验码错误
	RET_GIFT_CODE_TIME_OVER          uint32 = 10079 //礼包码时间过期
	RET_GIFT_CODE_MISS_PARAM         uint32 = 10080 //礼包码缺少参数
	RET_GIFT_CODE_PARAM_ERROR        uint32 = 10081 //礼包码参数错误
	RET_GIFT_CODE_VILIAD_1           uint32 = 10082 //活动批次的礼包码失效
	RET_GIFT_CODE_VILIAD_2           uint32 = 10083 //礼包码已经失效
	RET_GIFT_CODE_NOT_EXIST          uint32 = 10084 //礼包码不存在
	RET_GIFT_CODE_ACTIVITY_TIME_OVER uint32 = 10085 //礼包码活动过期
	RET_GIFT_CODE_OVER_USE_COUNT     uint32 = 10086 //礼包码超过使用次数
	RET_GIFT_CODE_CODE_ERROR         uint32 = 10087 //礼包码错误
	RET_GIFT_CODE_NOT_BAN_CODE       uint32 = 10088 //用户名非该码绑定用户
	RET_GIFT_CODE_FREQUENCY          uint32 = 10089 //用户礼包码兑换操作频繁
	RET_GIFT_CODE_NULL               uint32 = 10090 //礼包码参数为空
	RET_GIFT_CODE_AWARDED            uint32 = 10091 //礼包码已经领取过
	RET_GIFT_CODE_NET_OVERTIME       uint32 = 10092 //礼包码平台网络超时

	RET_BIBLE_HAS_READ uint32 = 10093 //月光宝盒已经点亮

	RET_TOWER_BUFF_HAS_SELECTED uint32 = 10094 //九重天buff已经选择过

	RET_SIGN_IN_ALREADY             uint32 = 10095 //不能重复签到
	RET_SIGN_IN_RECHARGE_NOT_ENOUGH uint32 = 10096 //充值不足

	RET_SEVEN_DAYS_ACTIVITY_NOT_OPEN            uint32 = 10097 //不在活动时间内 无法领取奖励
	RET_SEVEN_DAYS_ACTIVITY_NOT_REACH_CONDITION uint32 = 10098 //没有达到领奖条件
	RET_SEVEN_DAYS_ACTIVITY_NOT_REPEATED_AWARD  uint32 = 10099 //不能重复奖励
	RET_SEVEN_DAYS_ACTIVITY_GOD_UNENOUGH        uint32 = 10100 //物品数量不足
	RET_NOT_ENOUGH_RECRUIT_ZY_POINT             uint32 = 10101 //抽将阵营积分不够
	RET_USER_BEFORE_BIBLE_NOT_EXIST             uint32 = 10102 //前面的月光宝盒还未点亮

	RET_COMPENSATION_ALREADY_RECEIVE uint32 = 10103 //今日补偿奖励已领取
	RET_COMPENSATION_CAN_NOT_RECEIVE uint32 = 10104 //不能领取补偿奖励

	RET_CITY_PATROL_KNIGHT_UNENOUGH_CONDITION uint32 = 10105 //巡逻将不满足巡逻条件
	RET_CITY_BEFORE_CITY_NOT_OCCUPY           uint32 = 10106 //前一个山脉没有占领
	RET_CITY_FRIEND_BUSY                      uint32 = 10107 //好友正忙
	RET_CITY_NOT_REPEATED_REPRESS             uint32 = 10108 //不能重复镇压好友的暴动
	RET_RESIGN_IN_ALREADY                     uint32 = 10109 //不可补签
	RET_CITY_RIOT_IS_REPRESS                  uint32 = 10110 //好友的暴动已经被镇压
	RET_CITY_REPRESS_COUNT_UNENOUGH           uint32 = 10111 //镇压次数不足
	RET_INSTRUMENT_GOLD_DRAW_COUNT_UNENOUGH   uint32 = 10112 //法宝抽卡元宝抽卡次数不足

	RET_GUILD_ALREADY_IN                  uint32 = 10200 //玩家已经加入公会
	RET_GUILD_NAME_INVALID                uint32 = 10201 //公会名字非法
	RET_GUILD_NAME_REPEATED               uint32 = 10203 //公会名字已存在
	RET_GUILD_NOT_EXIST                   uint32 = 10204 //公会不存在
	RET_GUILD_NOT_FOUND_APPLICATION       uint32 = 10205 //公会申请不存在
	RET_GUILD_NOT_ALLOWED_APPLY           uint32 = 10206 //不可申请入会
	RET_GUILD_MEMBER_NOT_EXIST            uint32 = 10207 //公会成员不存在
	RET_GUILD_NO_PERMISSIONS              uint32 = 10208 //公会成员权限不足
	RET_GUILD_NOT_DISMISS                 uint32 = 10209 //无法解散公会
	RET_GUILD_ALREADY_IMPEACH             uint32 = 10210 //已有玩家发起弹劾
	RET_GUILD_SHOP_COUNT_NOT_ENOUGH       uint32 = 10211 //剩余数量不足
	RET_GUILD_LEADER_ONLINE               uint32 = 10212 //会长早先无法弹劾
	RET_GUILD_NO_IMPEACH                  uint32 = 10213 //没有人发起弹劾
	RET_GUILD_LEAVE_GUILD_24H_NOT_ALLWOED uint32 = 10214 //退会时间小于24小时不可申请
	RET_GUILD_MEMBER_APPLICATION_FULL     uint32 = 10215 //玩家申请公会个数已满
	RET_GUILD_APPLATION_FULL              uint32 = 10216 //公会申请已满
	RET_GUILD_MEMBER_FULL                 uint32 = 10217 //公会玩家已满
	RET_GUILD_FAILED_CREATE_GUILD_SHOP    uint32 = 10218 // 生成公会随机商店失败
	RET_GUILD_MESSAGE_NOT_EXIST           uint32 = 10219 //留言不存在
	RET_GUILD_MESSAGE_DO_REPEATED         uint32 = 10220 //重复操作
	RET_GUILD_MESSAGE_FREQUENCY           uint32 = 10221 //帮派留言太频繁
	RET_GUILD_MESSAGE_CONTENT_ILLEGAL     uint32 = 10222 //留言内容有非法字符

	RET_GUILD_NOT_IN_GUILD                  uint32 = 10300 //尚未加入公会
	RET_GUILD_SACRIFICE_RESOURCE_NOT_ENOUGH uint32 = 10301 //祭祀所需资源不足
	RET_GUILD_GUILD_CONTRIBUTION_NOT_ENOUGH uint32 = 10302 //公会贡献不足
	RET_GUILD_GUILD_SACRIFICE_NOT_ENOUGH    uint32 = 10303 //公会祭祀不足
	RET_GUILD_GUILD_SACRIFICE_AWARD_ALREADY uint32 = 10304 //公会祭祀奖励已领取
	RET_GUILD_GUILD_LEVEL_NOT_ENOUGH        uint32 = 10305 //公会等级不足
	RET_GUILD_GUILD_SKILL_LEVEL_ENOUGH      uint32 = 10306 //公会技能等级达到上限
	RET_GUILD_GUILD_SACRIFICE_ALREADY       uint32 = 10307 //今日已经祭祀

	RET_GUILD_GUILD_DUNGEON_DEAD                        uint32 = 10350 //目标已经死亡
	RET_GUILD_GUILD_DUNGEON_NO_BOX_AWARD                uint32 = 10351 //没资格领取公会副本关卡宝箱
	RET_GUILD_GUILD_DUNGEON_AREADY_BOX_AWARD            uint32 = 10352 //不可重复领取公会副本关卡宝箱
	RET_GUILD_GUILD_DUNGEON_AREADY_OTHER_USER_BOX_AWARD uint32 = 10353 //该宝箱已被其他人开启
	RET_GUILD_GUILD_DUNGEON_NO_FINISH                   uint32 = 10354 //公会副本未通关
	RET_GUILD_GUILD_DUNGEON_AREADY_AWARD                uint32 = 10355 //公会副本通关奖励已领取
	RET_GUILD_GUILD_DUNGEON_LEFT_COUNT_NOT_ENOUGH       uint32 = 10356 //公会副本挑战次数不足
	RET_GUILD_GUILD_DUNGEON_BUY_COUNT_NOT_ENOUGH        uint32 = 10357 //公会副本购买次数不足
	RET_GUILD_GUILD_DUNGEON_NOT_OPEN_TIME               uint32 = 10358 //公会副本不在开启时间
	RET_GUILD_GUILD_DUNGEON_AWARD_DAILY_MAX             uint32 = 10359 //公会副本关卡宝箱已达每日上限

	RET_GUILD_ACTIVITY_CHEERS_LIMIT     uint32 = 10360 //公会敬酒次数已用完
	RET_GUILD_ACTIVITY_ANSWERED         uint32 = 10361 //该问题已回答
	RET_GUILD_CORRECT_ANSWER_NOT_ENOUGH uint32 = 10362 //正确率不足
	RET_GUILD_ACTIVITY_CHEERS_OVER      uint32 = 10363 //敬酒结束
	RET_GUILD_ACTIVITY_ANSWER_OVER      uint32 = 10364 //答题结束
	RET_GUILD_ACTIVITY_LUCKY_OVER       uint32 = 10365 //抽签结束
	RET_GUILD_ACTIVITY_ALREADY_LUCKY    uint32 = 10366 //已抽签

	RET_REBATE_NOT_OPEN_TIME      uint32 = 10400 //不在充值返利活动期间
	RET_REBATE_NOT_REPEATED_AWARD uint32 = 10401 //不能重复领奖
	RET_REBATE_NOT_FIND_USER      uint32 = 10402 //找不到玩家信息

	/*定制活动*/
	RET_RANDOM_ACTIVITY_BUY_COUNT_NOT_ENOUGH     uint32 = 10500 //购买次数不足
	RET_RANDOM_ACTIVITY_HAS_RECEIVE_SCORE_REWARD uint32 = 10501 //已经领取奖励
	RET_RANDOM_ACTIVITY_GOOD_HAS_BUY             uint32 = 10502 //已经购买该商品
	RET_RECHARGE_HAS_RECEIVE_FIRST_CHARGE        uint32 = 10503 //已经领取过首冲奖励
	RET_NOT_IN_RANDOM_ACTIVITY_TIME              uint32 = 10504 //不在活动时间

	/*新服登录*/
	RET_ACTIVITY_OPEN_LOGIN_HAS_RECEIVE uint32 = 10600 //已经领取奖励

	/*vip福利*/
	RET_ACTIVITY_VIP_REWARD_HAS_RECEIVE uint32 = 10700 //已经领取奖励

	/*微信分享奖励*/
	RET_WX_SHARE_REWARD_HAS_RECEIVE uint32 = 10701 //微信分享领取奖励

	/*封测返利（跨服）*/
	RET_BETACOMP_NOT_OPEN_TIME      uint32 = 10750 //不在活动期间
	RET_BETACOMP_NOT_REPEATED_AWARD uint32 = 10751 //不能重复领奖
	RET_BETACOMP_NOT_FIND_USER      uint32 = 10752 //找不到玩家信息
	RET_BETACOMP_NOT_CONDITION      uint32 = 10753 //没有达到领奖条件
	RET_CROSS_SERVER_MAINTAIN       uint32 = 10754 //跨服务器维护中

	RET_GIFT_CODE_NOT_RELEASE       uint32 = 10800 //该服务器并未发布该礼品码
	RET_GIFT_CODE_BAN_FAILED        uint32 = 10801 //绑定失败
	RET_GIFT_CODE_NOT_CODE_BAN_USER uint32 = 10802 //用户名非该码绑定用户

	RET_NOT_ENOUGH_RECRUIT_ZY_COUNT uint32 = 10850 //阵营抽将次数已满

	RET_ACTIVITY_STAR_NOT_OPEN uint32 = 10900 //明星活动未开启

	RET_ACTIVITY_STAR_REDPACKET_NOT_COLLECTION uint32 = 10901 //明星红包奖励无法领取

	RET_SOUL_NOT_EXIST                   uint32 = 11000 //仙灵不存在
	RET_SOUL_SAME_TYPE_ONLY_ONE          uint32 = 11001 //同类型仙灵只能装备一个
	RET_SOUL_MATERIALS_UNMATCH           uint32 = 11002 //不匹配的升级材料
	RET_SOUL_ON_TEAM                     uint32 = 11003 //已装备的仙灵无法作为升级材料
	RET_SOUL_EXP_IS_FULL                 uint32 = 11004 //仙灵经验已满
	RET_SOUL_NEW_RANK_OPEN_SOON          uint32 = 11005 //敬请期待新的仙灵突破
	RET_SOUL_LEVEL_NOT_ENOUGH            uint32 = 11006 //仙灵等级不足
	RET_SOUL_ONCE_MONEY_DRAW_OVER        uint32 = 11007 //白银单抽次数已用完
	RET_SOUL_TEN_TIMES_MONEY_DRAW_OVER   uint32 = 11008 //白银十连抽次数已用完
	RET_SOUL_GROUP_CONDITION_UNMATCH     uint32 = 11009 //条件不足
	RET_SOUL_GROUP_STAR_MAX              uint32 = 11010 //仙灵组合升级已达上限
	RET_SOUL_TYPE_ERROR                  uint32 = 11011 //仙灵类型错误
	RET_SOUL_IS_INCUBATING               uint32 = 11012 //仙灵孵化中
	RET_SOUL_CONFIG_ERROR                uint32 = 11013 //找不到配置
	RET_SOUL_LEVEL_ERROR                 uint32 = 11014 //等级错误
	RET_SOUL_CANNOT_REFINE               uint32 = 11015 //不能洗练
	RET_SOUL_GIVE_POTENTIAL_ATTR_FAIL    uint32 = 11016 //洗练属性错误
	RET_SOUL_ID_NOT_MATCH                uint32 = 11017 //洗练ID不匹配
	RET_SOUL_GOLD_EGG_CANNOT_REBORN      uint32 = 11018 //金蛋不能重生
	RET_SOUL_HAS_EXTRA_AWARDS            uint32 = 11019 //转换时材料有剩余
	RET_SOUL_NOT_CANCEL_WITH_NOT_UPGRATE uint32 = 11020 //没有养成的金仙灵不能进行重置

	RET_FAME_HALL_GIVE_HEART_NUM_NOT_ENOUGH uint32 = 11100 //名人堂点赞次数不足
	RET_FAME_HALL_CANNOT_HEARTED_YOURSELF   uint32 = 11104 //不能给自己点赞
	RET_FAME_HALL_USER_NOT_IN_FAME_HALL     uint32 = 11105 //不在名人堂中

	RET_HOLIDAY_NOT_OPEN_TIME              uint32 = 11101 //不在节日狂欢任务的领奖时间段
	RET_HOLIDAY_NOT_REACH_REWARD_CONDITION uint32 = 11102 //没有达到节日狂欢的领奖条件
	RET_HOLIDAY_NOT_REPEATED_REWARD        uint32 = 11103 //不能重复领奖

	RET_ACTIVITY_PRAY_NOT_OPEN   uint32 = 11200 //不在活动期间
	RET_NOT_ENOUGH_USER_RESOURCE uint32 = 11202 //玩家资源不足

	RET_ACIENT_MATCH_ERROR            uint32 = 11250 //匹配对手出错
	RET_ACIENT_FIGHT_ERROR            uint32 = 11251 //战斗超时
	RET_ACIENT_VIEW_ERROR             uint32 = 11252 //查看对手信息超时
	RET_ACIENT_ENEMY_NOT_FOUND        uint32 = 11253 //对手不存在
	RET_ACIENT_FIGHT_TIMES_NOT_ENOUGH uint32 = 11254 //挑战次数不足
	RET_ACIENT_PLZ_OPEN_FREE_BOX      uint32 = 11255 //请先开启三种免费宝箱
	RET_ACIENT_LOOT_TIMES_OVER        uint32 = 11256 //宝箱开启次数已打上线
	RET_ACIENT_ENEMY_DEAD             uint32 = 11257 //对手已被击败
	RET_ACIENT_RESOURCE_NOT_ENOUGH    uint32 = 11258 //神兽之力不足

	RET_LOTTERY_OPENING_SOON        uint32 = 11270 //敬请等待活动开启
	RET_LOTTERY_EXCHANGE_TIMES_OVER uint32 = 11280 //兑换次数已达上限
	RET_LOTTERY_REBATE_OVER         uint32 = 11281 //返利次数已达上限

	RET_FIERCE_NOT_OPEN_ACTIVITY        uint32 = 11300 //不在活动期间
	RET_FIERCE_NOT_REPEATED_SELECT_RACE uint32 = 11301 //不能重复选种族
	RET_FIERCE_RACE_ERROR               uint32 = 11302 //种族选择错误
	RET_FIERCE_BUSY                     uint32 = 11303 //正在种族选择和挑战玩家匹配中
	RET_FIERCE_PROTOCOL_NOT_RETURN      uint32 = 11304 //协议不返回
	RET_FIERCE_NOT_REPEATED_CHALLENGE   uint32 = 11305 //不能重复挑战同一个玩家
	RET_FIERCE_NOT_FIND_CHALLENGE       uint32 = 11306 //未找到挑战玩家
	RET_FIERCE_CHALLENGING              uint32 = 11307 //正在挑战中
	RET_FIERCE_NOT_REPEATED_REWARD      uint32 = 11308 //不能重复领奖
	RET_FIERCE_NOT_REWARD_TIME          uint32 = 11309 //不在领奖时间段
	RET_FIRECE_MEDAL_NOT_ENOUGH         uint32 = 11310 //大闹天宫勋章不足
	RET_FIERCE_NOT_PROVIDE_SERVICE      uint32 = 11311 //正在同步跨服服务器信息 不能提供服务
	RET_FIERCE_NOT_GET_SERVER_MSG       uint32 = 11312 //不能得到玩家数据
	RET_FIERCE_CHALLENGE_COUNT_UNENOUGH uint32 = 11313 //挑战次数不足

	RET_CROSS_PK_IN_SETTING     uint32 = 11350 //跨服比武正在结算中
	RET_CROSS_PK_GROUP_ERROR    uint32 = 11351 //跨服比武分组错误
	RET_CROSS_PK_GROUP_ZERO     uint32 = 11352 //跨服比武分组为0
	RET_CROSS_PK_WRONG_DATE     uint32 = 11353 //跨服比武year和week错误
	RET_CROSS_PK_NOT_AWARD_TIME uint32 = 11354 //不是领奖时间内

	RET_WEEK_TASK_NO_FINISH           uint32 = 11360 //任务没有完成
	RET_WEEK_TASK_HAVE_RECEIVED       uint32 = 11361 //奖励已经领取
	RET_WEEK_TASK_RECEIVE_AWARD_ERROR uint32 = 11362 //领取奖励错误
	RET_TITLE_LESS_POWER              uint32 = 11363 //升级头衔战力不足
	RET_TITLE_ERROR                   uint32 = 11364 //升级头衔错误

	RET_COOL_NAME_NOE_REACH_REWARD_CONDITION uint32 = 11365 //激活称号条件未达成
	RET_COOL_NAME_ERROR                      uint32 = 11366 //激活称号错误
	RET_COOL_NAME_NOT_ACTIVE                 uint32 = 11367 //称号未激活
	RET_COOL_NAME_END                        uint32 = 11368 //称号已过期
	RET_COOL_NAME_NOE_USE                    uint32 = 11369 //当前没有称号

	RET_ACTIVITY_NOT_OPEN             uint32 = 11400 //活动未开启
	RET_ACTIVITY_NOT_REPEAT_BUY       uint32 = 11401 //不能重复购买
	RET_ACTIVITY_NOT_REPEATED_REWARD  uint32 = 11402 //不能重复领奖
	RET_ACTIVITY_CONDITION_NOT_ENOUGH uint32 = 11403 //没有达到领奖条件
	RET_ACTIVITY_GOOD_NOT_EXIST       uint32 = 11404 //商品不存在
	RET_ACTIVITY_REFRESH_MAX          uint32 = 11405 //刷新次数已满

	RET_SOUL_CHALLENGE_UNENOUGH uint32 = 11450 //仙灵副本挑战次数不足

	RET_GOLD_HAND_HAS_RECEIVE_BOX  uint32 = 11451 //已经领取摇钱树宝箱
	RET_GOLD_HAND_COUNT_NOT_ENOUGH uint32 = 11452 //点金次数不足

	RET_REDUCE_RESOURCE_ERROR uint32 = 11453 //资源不足

	RET_HOME_SYSTEM_EXIST_LOCATION               uint32 = 11454 //位置上已经存在建筑
	RET_HOME_SYSTEM_MAIN_BUILDING_LEVEL_UNENOUGH uint32 = 11455 //主建筑等级不足
	RET_HOME_SYSTEM_COUNT_UNENOUGH               uint32 = 11456 //挑战次数不足
	RET_HOME_SYSTEM_MONSTER_OVER                 uint32 = 11457 //小鬼已经过期
	RET_HOME_SYSTEM_MONSTER_DIE                  uint32 = 11458 //小鬼已经被击杀
	RET_HOME_SYSTEM_FRIEND_LEVEL_UNENOUGH        uint32 = 11459 //好友等级不足
	RET_HOME_SYSTEM_NOT_USER_FRIEND              uint32 = 11460 //不是玩家好友

	RET_DRAGON_HAS_BUY          uint32 = 11461 //龙宫探宝该宝箱已开启
	RET_DRAGON_SCORE_NOT_ENOUTH uint32 = 11462 //龙宫探宝领取积分不足

	RET_EXPEDITION_RESET_TIMES_NOT_ENOUGH   uint32 = 11500 //重置次数不足
	RET_EXPEDITION_DATA_NOT_FOUND           uint32 = 11501 //远征数据无法获取
	RET_EXPEDITION_BAN_NEXT                 uint32 = 11502 //无法进入下一关
	RET_EXPEDITION_FIGHT_TIMES_NOT_ENOUGH   uint32 = 11503 //挑战次数不足
	RET_EXPEDITION_ENEMY_NOT_FOUND          uint32 = 11504 //无法获取敌方数据
	RET_EXPEDITION_VIEW_TIMEOUT             uint32 = 11505 //获取玩家数据超时
	RET_EXPEDITION_FIGHT_TIMEOUT            uint32 = 11506 //战斗超时
	RET_EXPEDITION_MATCH_TIMEOUT            uint32 = 11507 //匹配跨服对手数据超时
	RET_EXPEDITION_MAX_LOOT                 uint32 = 11508 //宝箱次数已达上限
	RET_EXPEDITION_MATCH_ERROR              uint32 = 11509 //匹配对手出错
	RET_EXPEDITION_MAX_CHECKPOINT           uint32 = 11510 //已是最大章节
	RET_ACTIVITY_CONDITION_DAYS_LIMIT       uint32 = 11600 //超过领奖天数
	RET_ACTIVITY_CONDITION_AWARD_TIME_OUT   uint32 = 11601 //领奖过期
	RET_ACTIVITY_CONDITION_MONTH_CARD_LIMIT uint32 = 11602 //未激活双月卡
	RET_DRESS_LEVEL_UP_MAX_LEVEL            uint32 = 11700 //时装强化已达上限
	RET_DRESS_LEVEL_UP_STAR_NOT_ENOUGH      uint32 = 11701 //星数不足 不能强化
	RET_DRESS_STAR_UP_LEVEL_NOT_ENOUGH      uint32 = 11702 //等级不足 不能升星
	RET_DRESS_STAGE_BOSS_NOT_FOUND          uint32 = 11801 //神魔不存在
	RET_DRESS_STAGE_BOSS_HAS_ANGRY          uint32 = 11802 //神魔已激怒
	RET_DRESS_STAGE_BOSS_HAS_KILL           uint32 = 11803 //神魔已击杀
	RET_DRESS_STAGE_BOSS_TIME_ERROR         uint32 = 11804 //神魔不在击杀时间内

	RET_FIERCE_ARENA_NOT_PROVIDE_SERVICE uint32 = 11550 //争霸赛不提供服务
	RET_FIERCE_ARENA_DO_FREQUENT         uint32 = 11551 //争霸赛操作频繁
	RET_FIERCE_ARENA_RANK_CHANGED        uint32 = 11552 //争霸赛排名改变
	RET_FIERCE_ARENA_TIMEOUT             uint32 = 11553 //争霸赛超时
	RET_FIERCE_ARENA_CHALLENGE_UNENOUGH  uint32 = 11554 //争霸赛挑战次数不足
	RET_FIERCE_ARENA_CHEER_MAX           uint32 = 11555 //争霸赛对方助威次数已达上限
	RET_FIERCE_ARENA_NOT_TIME_PERIOD     uint32 = 11556 //争霸赛不在活动期间
	RET_FIERCE_ARENA_CHALLENGING         uint32 = 11557 //争霸赛玩家正在被挑战中
	RET_FIERCE_ARENA_RANK_MATCH          uint32 = 11558 //争霸赛玩家排名不够挑战对手排名
	RET_FIERCE_ARENA_CHEER_COUNT_UNEOUGH uint32 = 11559 //争霸赛助威次数不足
	RET_FIERCE_ARENA_CHEER_CDING         uint32 = 11560 //争霸赛助威cd中
	RET_PRAY_DO_FREQUENT                 uint32 = 11561 //八卦祈福操作太频繁

	RET_TREASURE_GODCOST_CONDITION_UNENOUGH    uint32 = 11600 //宝物神铸条件不足
	RET_TREASURE_MELTE_SIZE_ERROR              uint32 = 11601 //宝物炼宝数量错误
	RET_HOME_SYSTEM_NOT_RPEATED_REWARD         uint32 = 11602 //不能重复领取家园任务奖励
	RET_HOME_SYSTEM_NOT_REACH_REWARD_CONDITION uint32 = 11603 //没有达到领奖条件
	RET_HOME_SYSTEM_COMPLETE_COUNT_UNENOUGH    uint32 = 11604 //家园任务可完成次数不足
	RET_HOME_SYSTEM_STYLE_OVER                 uint32 = 11605 //家园风格过期
	RET_HOME_MSG_ILLEGAL                       uint32 = 11606 //家园留言内容非法
	RET_HOME_SYSTEM_TASK_OVER                  uint32 = 11607 //家园任务过期
	RET_HOME_SYSTEM_USER_COUNT_UNENOUGH        uint32 = 11608 //玩家完成任务次数不足

	RET_PET_LEVELUP_ITEM_NOT_ENOUGH        uint32 = 11900 //神兽升级道具不足
	RET_PET_IS_BATTLE_PET                  uint32 = 11901 //神兽已上阵
	RET_PET_IS_IN_PROTECTING               uint32 = 11902 //神兽已在护佑中
	RET_USER_DO_NOT_HAVE_BATTLE_PET        uint32 = 11903 //当前没有上阵的神兽
	RET_PET_RANKUP_ITEM_NOT_ENOUGH         uint32 = 11904 //渡劫石不足
	RET_PET_PET_FRAGMENT_NOT_ENOUGH        uint32 = 11905 //神兽碎片不足
	RET_PET_STARUP_ITEM_NOT_ENOUGH         uint32 = 11906 //神通石不足
	RET_PET_LEVEL_UP_TO_USER_MAX_LEVEL     uint32 = 11907 //神兽已升至玩家限制的最高等级
	RET_PET_IS_NOT_AVALIABLE               uint32 = 11908 //神兽不可用（已上阵或护佑中）
	RET_PET_PROTECT_POS_DO_NOT_HAVE_KNIGHT uint32 = 11909 //护佑位没有神将
	RET_PET_STAR_UP_TO_MAX_LEVEL           uint32 = 11910 //神兽神通等级已达最高等级
	RET_PET_BAG_FULL                       uint32 = 11911 //神兽包裹已满
	RET_PET_LEVEL_UP_ITEM_TOO_MUCH         uint32 = 11912 //道具太多
	RET_PET_NEED_6_FIRST_TEAM_KNIGHT       uint32 = 11913 //神兽上阵需要有6个阵位都有上阵神将
	RET_PET_PROTECT_SAME_PET               uint32 = 11914 //不能使用同一种神兽
	RET_PET_COLOR_IS_NOT_ENOUGHT           uint32 = 11915 //神兽品质不足
	RET_PET_SWALLOW_LEVEL_IS_MAX           uint32 = 11916 // 神兽吞噬等级已满

	RET_FIGHT_FOR_KING_NOT_OPEN             uint32 = 12000 //封神之战未开启
	RET_FIGHT_FOR_KING_REPORT_NOT_EXIST     uint32 = 12001 //封神之战战报不存在
	RET_FIGHT_FOR_KING_OP_TOO_MUCH          uint32 = 12002 //封神之战操作太频繁
	RET_FIGHT_FOR_KING_MATCH_NOT_ENOUGH     uint32 = 12003 //封神之战匹配次数不足
	RET_FIGHT_FOR_KING_NOT_PROVIDE_SERVICE  uint32 = 12004 //封神之战不提供服务
	RET_FIGHT_FOR_KING_TIMEOUT              uint32 = 12005 //封神之战超时
	RET_FIGHT_FOR_KING_NO_USER              uint32 = 12006 //封神之战匹配不到合适的玩家
	RET_FIGHT_FOR_KING_CONDITION_NOT_ENOUGH uint32 = 12007 //封神之战奖励条件不足
	RET_FIGHT_FOR_KING_NO_KING_USER         uint32 = 12008 //封神之战封神殿没有玩家

	RET_WEEK_FUND_NOT_RECHARGE uint32 = 12100 //没有充值
	RET_WEEK_FUND_HAVE_RECEIVE uint32 = 12101 //已经领过奖了

	RET_RECALL_COUNT_UNENOUGH     uint32 = 12150 //老玩家召回领奖次数不足
	RET_RECALL_CONDITION_UNENOUGH uint32 = 12151 //老玩家召回领奖条件不足

	RET_SCUFFLE_CROSS_NO_SERVICE          uint32 = 12200 //跨服服务器无法提供服务
	RET_SCUFFLE_GET_INFO_ERROR            uint32 = 12201 //获取三界斗法信息失败
	RET_SCUFFLE_FIGHTING                  uint32 = 12202 //三界斗法战斗中
	RET_SCUFFLE_DAILY_REWARD_HAS_RECEIVED uint32 = 12203 //已经领取奖励
	RET_SCUFFLE_MATCH_ENEMY_ERROR         uint32 = 12204 //匹配对手失败
	RET_SCUFFLE_GET_ENEMY_INFO_ERROR      uint32 = 12205 //获取对手战斗信息失败
	RET_SCUFFLE_IN_MATCHING               uint32 = 12206 //正在匹配对手中
	RET_SCUFFLE_HAS_RESET_ENEMY           uint32 = 12207 //玩家数据已重置
	RET_SCUFFLE_IN_ENEMY_VIEW             uint32 = 12208 //正在查看对手详情
	RET_SCUFFLE_CANNOT_REWARD_NOW         uint32 = 12209 //当前不能领取每日奖励

	RET_LEVEL_PRIZE_TIME_OUT      uint32 = 12300 //等级礼包过期
	RET_LEVEL_PRIZE_BUY_TIMES_OUT uint32 = 12301 //等级礼包超过购买次数

	RET_RENAME_TIME_CD     uint32 = 12400 //改名cd
	RET_RENAME_SAME_NAME   uint32 = 12401 //必须换一个名字
	RET_RENAME_REPEAT_NAME uint32 = 12402 //改名角色名重复

	RET_FLAME_CROSS_NOT_SERVICE                 uint32 = 12500 //跨服服务器无法提供服务器
	RET_FLAME_USER_MATCH_OVER                   uint32 = 12501 //玩家匹配队伍超时
	RET_FLAME_TEAM_MATCH_TEAM_OVER              uint32 = 12502 //队伍匹配队伍超时
	RET_FLAME_USER_MATCHING                     uint32 = 12503 //玩家正在匹配队伍中
	RET_FLAME_NOT_MATCHING_NOT_CANCEL           uint32 = 12504 //玩家无法取消玩家匹配队伍
	RET_FLAME_USER_TEAM_MATCHING                uint32 = 12505 //玩家队伍正在匹配队伍中
	RET_FLAME_NOT_ALLUSER_READY                 uint32 = 12506 //有玩家未准备 无法匹配
	RET_FLAME_TEAM_MATCHING                     uint32 = 12507 //队伍正在匹配中
	RET_FLAME_NOT_CAP_USER_NOT_OP_TEAM_MATCH    uint32 = 12508 //非队长无法操作队伍匹配
	RET_FLAME_FRIEND_EXIST_TEAM_NOT_REQUEST     uint32 = 12509 //好友已存在队伍 无法邀请
	RET_FLAME_NOT_EXIST_TEAM_NOT_REQUEST        uint32 = 12510 //不存在队伍无法邀请好友
	RET_FLAME_EXIST_TEAM_NOT_DEAL_REQUEST       uint32 = 12511 //存在队伍无法处理好友邀请
	RET_FLAME_EXIST_TEAM_NOT_USER_MATCH         uint32 = 12512 //存在队伍无法个人匹配队伍
	RET_FLAME_FRIEND_TEAM_NOT_EXIST             uint32 = 12513 //好友队伍不存在
	RET_FLAME_EXIST_TEAM_NOT_ADD_NEW_TEAM       uint32 = 12514 //存在队伍 无法加入新队伍
	RET_FLAME_USER_NUM_ENOUGH                   uint32 = 12515 //对方队伍人数已满
	RET_FLAME_USER_TEAM_NOT_EXIST               uint32 = 12516 //玩家队伍不存在
	RET_FLAME_CAP_USER_OFFLINE                  uint32 = 12517 //申请加入队伍队长不在线
	RET_FLAME_CAP_USER_NOT_CAP                  uint32 = 12518 //申请加入队伍的队长已换
	RET_FLAME_JOIN_USER_OFFLINE                 uint32 = 12519 //申请加入队伍的玩家不在线
	RET_FLAME_JOIN_USER_EXIST_TEAM              uint32 = 12520 //申请加入队伍的玩家存在队伍
	RET_FLAME_JOIN_USER_ADD_ERROR               uint32 = 12521 //申请加入队伍玩家加入队伍失败
	RET_FLAME_SHOP_SCORE_UNENOUGH               uint32 = 12522 //积分不足
	RET_FLAME_SHOP_COUNT_UNENOUGH               uint32 = 12523 //购买次数不足
	RET_FLAME_TEAM_MATCH_AND_USER_EXIT          uint32 = 12524 //队伍匹配时 有玩家退出或者掉线
	RET_FLAME_TIMEOUT                           uint32 = 12525 //大战火焰山超时
	RET_FLAME_OP_TOO_MUCH                       uint32 = 12526 //大战火焰山操作太频繁
	RET_FLAME_CROSS_RESETING_NOT_PURCHASE_GOODS uint32 = 12527 //大战火焰山跨服正在重置积分 不能购买商品
	RET_FLAME_NOT_FIND_FLAME_USER               uint32 = 12528 //跨服服务器中没有找到玩家信息
	RET_FLAME_NOT_FIND_FLAME_TEAM               uint32 = 12529 //跨服服务器中没有找到队伍信息
	RET_FLAME_KICK_USER_ERROR                   uint32 = 12530 //踢出玩家出错
	RET_FLAME_EXIST_USER_NOT_OP                 uint32 = 12531 //跨服存在玩家信息 不能再操作
	RET_FLAME_NOT_EXIST_USER_NOT_OP             uint32 = 12532 //跨服不存在玩家信息 不能再操作

	RET_WEALTH_GOD_NOT_OPEN            uint32 = 12600 //财神送礼活动未开放
	RET_WEALTH_GOD_DRAW_COUNT_UNENOUGH uint32 = 12601 //财神送礼抽奖次数不足

	RET_MAGIC_BAG_FULL         uint32 = 12700 //法术包裹已满
	RET_MAGIC_NOT_EXIST        uint32 = 12701 //法术不存在
	RET_MAGIC_EQUIP_SAME       uint32 = 12702 //不可装备相同法术
	RET_MAGIC_LEVEL_NOT_ENOUGH uint32 = 12703 //法术强化等级不足
	RET_MAGIC_COMPOSE_SAME     uint32 = 12704 //不能合成相同法术
	RET_MAGIC_RANK_NOT_MAX     uint32 = 12705 //法术升星未满
	RET_USER_MONEY_IS_FULL     uint32 = 12706 //银两超过上限，请先使用完

	RET_FIVE_FINGER_DAILY_BOX_RESET        uint32 = 12800 //每日宝箱已经重置
	RET_FIVE_FINGER_HAS_BUY                uint32 = 12801 //宝箱已经购买
	RET_FIVE_FINGER_XML_ERROR              uint32 = 12802 //前后端表不一致
	RET_FIVE_FINGER_DAILY_BOX_RESET_FAILED uint32 = 12803 //每日宝箱重置失败

	GUILD_TALENT_PRE_LEVEL_NOT_ENOUGH     uint32 = 12900 //前置技能等级不足
	GUILD_TALENT_END_TALENT_NOT_ALL_REACH uint32 = 12901 //该页签天赋没有全部点亮
	GUILD_TALENT_END_TAB_LEVEL_NOT_ENOUGH uint32 = 12902 //前置页签等级不足
	GUILD_TALENT_LEVEL_IS_MAX             uint32 = 12903 //已经达到最大等级了

	RET_KNIGHT_CHANGE_LEVEL_COLOR_ERR     uint32 = 13000 //化红品质错误
	RET_KNIGHT_CHANGE_LEVEL_CONDITION_ERR uint32 = 13001 //化红条件不足

	RET_GUILD_BATTLE_STEALTH_NUMBER_TOO_MUCH  uint32 = 13049 //归隐玩家过多
	RET_GUILD_BATTLE_CROSS_NOT_SERVICE        uint32 = 13050 //帮战跨服不提供服务
	RET_GUILD_BATTLE_TIMEOUT                  uint32 = 13051 //帮战超时
	RET_GUILD_BATTLE_SIGN_RIGHT_UNEOUGH       uint32 = 13052 //报名权限不够
	RET_GUILD_BATTLE_SIGN_TIME                uint32 = 13053 //不在报名时间段内
	RET_GUILD_BATTLE_REPEATED_SIGN            uint32 = 13054 //不能重复报名
	RET_GUILD_BATTLE_NOT_REACH_SIGN_CONDITION uint32 = 13055 //帮派未达帮战到报名条件
	RET_GUILD_BATTLE_BATTLING                 uint32 = 13056 //帮战中 不能调整布防
	RET_GUILD_BATTLE_ATTACK_COUNT_UNENOUGH    uint32 = 13057 //攻击次数不足
	RET_GUILD_BATTLE_NOT_ATTACK_TIME          uint32 = 13058 //不在帮战时间段内
	RET_GUILD_BATTLE_DEFENSE_DIE              uint32 = 13059 //防守者已死亡
	RET_GUILD_BATTLE_DEFENSE_CDING            uint32 = 13060 //防守者保护时间CD中
	RET_GUILD_BATTLE_OP_TOO_MUCH              uint32 = 13061 //操作太频繁
	RET_GUILD_BATTLE_BATTLE_END               uint32 = 13062 //帮战已经结束
	RET_GUILD_BATTLE_ATTACK_FAIL_CDING        uint32 = 13063 //攻击者失败CD中
	RET_GUILD_BATTLE_ADD_TIME_LATE            uint32 = 13064 //帮战报名截止后加入玩家无法参加本次帮派战
	RET_GUILD_BATTLE_BATTLEING_NOT_KICK_USER  uint32 = 13065 //帮战战斗期间不能踢出玩家

	RET_USER_IDENTITY_NAME_ERROR   uint32 = 13066 //姓名不合法
	RET_USER_IDENTITY_NUMBER_ERROR uint32 = 13067 //身份证不合法

	RET_GEM_DRAW_COUNT_UNENOUGH      uint32 = 13090 //抽奖次数不足
	RET_GEM_DRAW_GOODS_UNENOUGH      uint32 = 13091 //抽奖次数商品购买次数不足
	RET_GEM_DRAW_NOT_DRAW_PERIOD     uint32 = 13092 //当前时间不在抽奖时间段内
	RET_GEM_DRAW_NOT_ACTIVITY_PERIOD uint32 = 13093 //当前时间不在活动时间段内
	RET_GEM_DRAW_NOT_REACH_CONDITION uint32 = 13094 //没有达到购买条件

	RET_GEM_SYNC_TOP        uint32 = 13100 //宝石合成已达最高等级
	RET_GEM_EQUIP_SAME_TYPE uint32 = 13101 //不能镶嵌相同类型的宝石

	RET_KNIGHT_CARD_NOT_EXIST            uint32 = 13110 //魂卡不存在
	RET_NOT_ENOUGH_KNIGHT_CARD           uint32 = 13111 //魂卡不足
	RET_KNIGHT_CARD_TEAM_NOT_EXIST       uint32 = 13112 //魂卡队伍不存在
	RET_KNIGHT_CARD_TEAM_ACTIVE_MAX_STAR uint32 = 13113 //魂卡队伍星数最大
	RET_PARADE_RECHARGE_CAN_NOT_REWARD   uint32 = 13114 //奇遇充值领奖状态不对
	RET_PARADE_RECHARGE_ID_NOT_MATCH     uint32 = 13115 //奇遇充值领奖ID不匹配
	RET_PARADE_RECHARGE_ID_NOT_FIND      uint32 = 13116 //奇遇充值领奖ID不存在
	RET_PARADE_MAP_NOT_FIND              uint32 = 13117 //巡游地图不存在
	RET_PARADE_MAP_USER_LEVEL_NOT_ENOUGH uint32 = 13118 //巡游地图进入等级不足
	RET_PARADE_GET_EVENT_FAIL            uint32 = 13119 //巡游事件获取失败
	RET_PARADE_GET_EVENT_TYPE_ERROR      uint32 = 13120 //巡游事件类型错误
	RET_PARADE_GET_REWARD_FAIL           uint32 = 13121 //巡游事件奖励获取错误
	RET_PARADE_GET_REWARD_AWARDS_FAIL    uint32 = 13122 //巡游事件奖励道具获取错误
	RET_PARADE_GET_MONSTER_FAIL          uint32 = 13123 //巡游事件奖励获取怪物失败
	RET_PARADE_GET_MONSTER_AWARDS_FAIL   uint32 = 13124 //巡游事件怪物道具获取错误
	RET_PARADE_COUNT_NOT_ENOUGH          uint32 = 13125 //巡游次数不足
	RET_PARADE_GET_ZP_IDS_FAIL           uint32 = 13126 //巡游获取第一次转盘数据失败
	RET_PARADE_GET_PACKAGE_INFO_FAIL     uint32 = 13127 //巡游获取随机商人数据失败
	RET_PARADE_PACKAGE_DATA_ERROR        uint32 = 13128 //巡游获取随机商人数据异常
	RET_PARADE_EVENT_OUT_OF_TIME         uint32 = 13129 //巡游事件超时
	RET_PARADE_ZP_DATA_ERROR             uint32 = 13130 //巡游获取随机转盘数据异常
	RET_PARADE_GET_ZP_INFO_FAIL          uint32 = 13131 //巡游获取随机转盘数据失败
	RET_PARADE_RECHARGE_ERROR            uint32 = 13132 //奇遇充值数据异常
	RET_NOT_ENOUGH_PARADE_COUNT          uint32 = 13133 //巡游次数不足
	RET_PARADE_COUNT_IS_FULL             uint32 = 13134 //巡游次数已满
	RET_PARADE_EVENT_TOO_MANY            uint32 = 13135 //巡游事件过多
	RET_PARADE_PACKAGE_ALREADY_BUY       uint32 = 13136 //巡游商人重复购买

	RET_GOLD_KNIGHT_SWALLOW_LV_LIMIT   uint32 = 13150 //金将吞噬等级限制
	RET_GOLD_KNIGHT_SWALLOW_NOT_FOUND  uint32 = 13151 //金将吞噬数据不存在
	RET_GOLD_KNIGHT_SWALLOW_RANK_LIMIT uint32 = 13152 //金将吞噬突破等级不足

	/*诸神争霸*/
	RET_GOD_STRIVE_NOT_IN_FIRST_STAGE               uint32 = 13180 //不在初赛阶段
	RET_GOD_STRIVE_ENROLL_EXCEED_LIMIT              uint32 = 13181 //报名人数超过上限
	RET_GOD_STRIVE_FLAG_ALREADY_OCCUPIED            uint32 = 13182 //旗子已被他人占领
	RET_GOD_STRIVE_FLAG_OWNER_CHANGED               uint32 = 13183 //攻打的旗主已经变更
	RET_GOD_STRIVE_OTHER_OCCUPY_FLAG                uint32 = 13184 //其他玩家正在抢旗中
	RET_GOD_STRIVE_OTHER_ROBING                     uint32 = 13185 //其他玩家正在抢夺该玩家
	RET_GOD_STRIVE_STAGE_NOT_REACH                  uint32 = 13186 //比赛还未进行到该阶段
	RET_GOD_STRIVE_BATTLE_REPORT_NOT_EXIST          uint32 = 13187 //战报不存在
	RET_GOD_STRIVE_CROSS_SERVER_MAINTAIN            uint32 = 13200 //跨服暂停服务
	RET_GOD_STRIVE_NOT_IN_APPLY_STAGE               uint32 = 13201 //不在报名阶段
	RET_GOD_STRIVE_IN_CROSS_REQUEST                 uint32 = 13202 //请求太频繁
	RET_GOD_STRIVE_HAS_APPLY                        uint32 = 13203 //已经报名了
	RET_GOD_STRIVE_TIMEOUT                          uint32 = 13204 //请求超时
	RET_GOD_STRIVE_APPLY_LEVEL_NOT_ENOUGH           uint32 = 13205 //报名等级不足
	RET_GOD_STRIVE_NOT_IN_PRE_BATTLE                uint32 = 13206 //不在预赛战斗阶段
	RET_GOD_STRIVE_NOT_APPLY                        uint32 = 13207 //没有报名
	RET_GOD_STRIVE_IS_FINISH                        uint32 = 13208 //已经被淘汰
	RET_GOD_STRIVE_IS_LOADING_DATA                  uint32 = 13209 //正在加载数据 请稍后再试
	RET_GOD_STRIVE_USER_NOT_EXISTS                  uint32 = 13210 //预赛晋级玩家数据不存在
	RET_GOD_STRIVE_PRE_BATTLE_USER_HAS_CHANGE       uint32 = 13211 //用户已经刷新 请重试
	RET_GOD_STRIVE_PRE_BATTLE_IN_ATTACK_CD          uint32 = 13212 //正在战旗cd中
	RET_GOD_STRIVE_PRE_BATTLE_IN_BE_ATTACKED_CD     uint32 = 13213 //正在保护cd中
	RET_GOD_STRIVE_PRE_BATTLE_UNBELIEVE_ERROR       uint32 = 13214 //不可能发生的错误 程序赶紧查
	RET_GOD_STRIVE_PRE_BATTLE_IN_ROB_CD             uint32 = 13215 //正在抢夺cd中
	RET_GOD_STRIVE_PRE_BATTLE_IN_ROBED_CD           uint32 = 13216 //正在抢夺保护cd中
	RET_GOD_STRIVE_PRE_BATTLE_NOT_IN_ROB_LIST       uint32 = 13217 //玩家不在抢夺列表中
	RET_GOD_STRIVE_NOT_IN_PRE_BATTLE_BET_STAGE      uint32 = 13218 //不在投注阶段 包括查看上轮晋级名单阶段
	RET_GOD_STRIVE_BET_USER_NOT_EXISTS              uint32 = 13219 //投注玩家不存在
	RET_GOD_STRIVE_HAS_BET_USER                     uint32 = 13220 //已经有投注玩家了 不能更换
	RET_GOD_STRIVE_NOT_IN_FINAL                     uint32 = 13221 //还没到决赛阶段
	RET_GOD_STRIVE_NOT_IN_FINAL_GUESS               uint32 = 13222 //不在决赛竞猜阶段
	RET_GOD_STRIVE_NOT_IN_FINAL_BATTLE              uint32 = 13223 //不在决赛战斗阶段
	RET_GOD_STRIVE_FINAL_BATTLE_MATCH_FINISH        uint32 = 13224 //比赛已经结束 不能竞猜
	RET_GOD_STRIVE_FINAL_BATTLE_MATCH_GUESSED       uint32 = 13225 //已经竞猜过了 不能竞猜
	RET_GOD_STRIVE_PRE_BATTLE_ROB_LIST_NEED_REFRESH uint32 = 13226 //抢夺列表已经过期 需要刷新
	RET_GOD_STRIVE_PRE_BATTLE_FIGHT_IN_POS          uint32 = 13227 //在位置上的玩家不能抢占旗子
	RET_GOD_STRIVE_BATTLE_REPORT_ERROR              uint32 = 13228 //战报解析出错
	RET_GOD_STRIVE_NOT_IN_FINAL_CHAMPION_GUESS      uint32 = 13229 //不在决赛冠军竞猜阶段

	/*周年庆*/
	RET_ANNIVERSARY_IS_NOT_OPEN_TIME          uint32 = 13300 //不在活动开放时间段
	RET_ANNIVERSARY_ALREADY_SIGN_IN           uint32 = 13301 //已签到
	RET_ANNIVERSARY_MAX_SIGN_IN               uint32 = 13302 //都签到了
	RET_ANNIVERSARY_SHOP_TYPE_ERROR           uint32 = 13303 //商店类型错误
	RET_ANNIVERSARY_GOODS_BUY_NUM_ZERO        uint32 = 13304 //商品购买数量为零
	RET_ANNIVERSARY_SHOP_EXPIRED              uint32 = 13305 //商店已经过期失效了
	RET_ANNIVERSARY_JOURNEY_END               uint32 = 13306 //西游之路已走完
	RET_ANNIVERSARY_JOURNEY_ACTIVE_NOT_ENOUGH uint32 = 13307 //西游之路活跃度不足
	RET_ANNIVERSARY_IS_THANK                  uint32 = 13308 //已经感谢过了
	RET_ANNIVERSARY_WEEK_TASK_NO_FINISH       uint32 = 13309 //周任务没完成
	RET_ANNIVERSARY_WEEK_TASK_HAVE_RECEIVED   uint32 = 13310 //周任务已领奖

	/*噩梦副本*/
	RET_NIGHTMARE_CHALLENGE_NO_COUNT   uint32 = 13340 //挑战次数不足
	RET_NIGHTMARE_BOX_ALREADY_GET      uint32 = 13341 //宝箱已经领取
	RET_NIGHTMARE_CONDITION_NOT_ENOUGH uint32 = 13342 //难度条件不满足

	/*装备淬金*/
	RET_EQUIP_UPGRADE_GOLD_LIMIT uint32 = 13350 //装备淬金品质不足

	/*法宝铸魂*/
	RET_INSTRUMENT_STAR_INFO_NOT_FOUND  uint32 = 13355 //法宝铸魂数据未找到
	RET_INSTRUMENT_NEED_RANK_NOT_ENOUGH uint32 = 13356 //法宝铸魂觉醒等级不满足

	/*金色宝物*/
	RET_TREASURE_SWALLOW_COLOR_ILLEGAL     uint32 = 13360 //少年, 金色宝物吞噬必须要红色宝物
	RET_TREASURE_SWALLOW_COLOR_ERROR       uint32 = 13361 //金色宝物吞噬目标错误
	RET_TREASURE_SWALLOW_MAX_LV_LIMIT      uint32 = 13362 //金色宝物达到最大吞噬等级
	RET_TREASURE_AWAKEN_MAX_LV_LIMIT       uint32 = 13363 //金色宝物达到最大觉醒等级
	RET_TREASURE_SWALLOW_CONDITION_ILLEGAL uint32 = 13364 //不能吞噬已养成或上阵的红色宝物

	/*天天返利*/
	RET_DAY_REBATE_NO_CHARGE                    uint32 = 13365 //没有充值
	RET_DAY_REBATE_HAS_RECEIVE                  uint32 = 13366 //已经领奖
	RET_DAY_REBATE_NOT_AWARD_TIME               uint32 = 13367 //不在领奖时间内
	RET_DAY_REBATE_TOTAL_CHARGE_DAYS_NOT_ENOUGH uint32 = 13368 //累计充值天数不够
	RET_DAY_REBATE_HAS_RECEIVE_TOTAL_AWARD      uint32 = 13369 //已经领过累计奖励
	RET_DAY_REBATE_HAS_RECEIVE_DRAW_AWARD       uint32 = 13370 //已经领过转盘奖励

	/*宝石缘分*/
	RET_GEM_ASSOCIATIO_NOT_EXIST      uint32 = 13380 // 宝石缘分数据未找到
	RET_GEM_ASSOCIATIO_ALREADY_ACTIVE uint32 = 13381 // 宝石缘分已经激活
	RET_GEM_HAND_BOOK_NOT_EXIST       uint32 = 13382 // 宝石缘分激活需求宝石不存在

	/*公会Boss*/
	RET_GUILD_BOSS_NOT_FIND_SERVER         uint32 = 13390 //未找到服务器
	RET_GUILD_BOSS_NOT_FIND_USER           uint32 = 13391 //未找到玩家
	RET_GUILD_BOSS_NOT_FIND_GROUP          uint32 = 13392 //未找到战区
	RET_GUILD_BOSS_OTHER_USER_ATTACKING    uint32 = 13393 //其他玩家正在抢夺
	RET_GUILD_BOSS_NOT_SAME_GROUP          uint32 = 13394 //未找到战区
	RET_GUILD_BOSS_NOT_FIND_TARGET_USER    uint32 = 13395 //未找到被抢夺玩家
	RET_GUILD_BOSS_IS_IN_CD                uint32 = 13396 //CD中
	RET_GUILD_BOSS_RANK_TYPE_ERROR         uint32 = 13397 //排行榜类型错误
	RET_GUILD_BOSS_CROSS_NO_SERVICE        uint32 = 13398 //跨服服务器无法提供服务
	RET_GUILD_BOSS_IS_IN_FIGHTING          uint32 = 13399 //战斗中
	RET_GUILD_BOSS_IS_IN_ACTIVITY          uint32 = 13400 //公会战中禁止公会退出或解散或踢人
	RET_GUILD_BOSS_NOT_FIND_USER_GUILD     uint32 = 13401 //未找到玩家的公会
	RET_GUILD_BOSS_ACTIVITY_NOT_OPEN       uint32 = 13402 //活动未开始
	RET_GUILD_BOSS_ROB_LIST_REFRESH        uint32 = 13403 //抢夺列表刷新了
	RET_GUILD_BOSS_ROB_LIST_NOT_EXIST_USER uint32 = 13404 //抢夺列表里找不到玩家
	RET_GUILD_BOSS_TARGET_IS_IN_CD         uint32 = 13405 //目标CD中
	RET_GUILD_BOSS_TIMEOUT                 uint32 = 13406 //处理超时
	RET_GUILD_BOSS_ERROR_DAMAGE            uint32 = 13407 //伤害异常
	RET_GUILD_BOSS_ROB_SELF                uint32 = 13408 //不能抢夺自己

	/*周商店*/
	RET_WEEK_SHOP_BUY_MAX_LIMIT uint32 = 13409 //超过购买上限

	/*珍宝阁*/
	RET_RARESHOP_PRAY_COUNT_NOT_ENOUGH     uint32 = 13420 //拜访次数不足
	RET_RARESHOP_PRAY_NOT_EXIST            uint32 = 13421 //拜访数据未找到
	RET_RARESHOP_PRAY_GET_RAN_AWARD_FAILED uint32 = 13422 //获取随机道具奖励失败
	RET_RARESHOP_PRAYEXP_AWARD_NOT_EXIST   uint32 = 13423 //声望宝箱数据未找到
	RET_RARESHOP_NO_ITEM                   uint32 = 13424 //珍宝商店无该商品
	RET_RARESHOP_BUY_COUNT_NOT_ENOUGH      uint32 = 13425 //珍宝商店购买次数不足
	RET_RARESHOP_AMOUNT_WRONG              uint32 = 13426 //珍宝商店购买数量太大
	RET_RARESHOP_PRAY_EXP_AWARD_FAILED     uint32 = 13427 //领取声望宝箱失败
	RET_RARESHOP_BUY_MODE_ERROR            uint32 = 13428 //珍宝商店购买方式出错

	/*家园种植*/
	RET_HOME_PLANT_ALREADY_PLANT         uint32 = 13435 //地上已经种了植物
	RET_HOME_PLANT_BUILD_NOT_EXIST       uint32 = 13436 //建筑不存在
	RET_HOME_PLANT_BUILD_TYPE_ERROR      uint32 = 13437 //建筑类型错误
	RET_HOME_PLANT_PLANT_NOT_EXIST       uint32 = 13438 //植物不存在
	RET_HOME_PLANT_USER_HAS_NO_PLANT     uint32 = 13439 //玩家没有种植物
	RET_HOME_PLANT_STATE_ERROR           uint32 = 13440 //植物状态错误
	RET_HOME_PLANT_ALREADY_GET_FRUIT     uint32 = 13441 //已经摘取好友果实
	RET_HOME_PLANT_COUNT_NOT_ENOUGH      uint32 = 13442 //次数不足
	RET_HOME_PLANT_NOT_OTHER_WANT_TO_BUY uint32 = 13443 //没人想求购
	RET_HOME_PLANT_IS_NOT_UP_TO_LEVEL    uint32 = 13444 //种植等级不足
	RET_HOME_PLANT_AMRITA_IS_NOT_ENOUGH  uint32 = 13445 //甘露不足

	/*降妖伏魔*/
	RET_ELIMINATE_DEMON_STAGE_MAX_STAR        uint32 = 13450 //关卡满星了
	RET_ELIMINATE_DEMON_NOT_FIND_STAGE_INFO   uint32 = 13451 //没找到关卡信息
	RET_ELIMINATE_DEMON_NOT_FIND_CHAPTER      uint32 = 13452 //没找到章节
	RET_ELIMINATE_DEMON_NOT_FIND_CHAPTER_INFO uint32 = 13453 //没找到章节信息
	RET_ELIMINATE_DEMON_NOT_PASS_PRE_STAGE    uint32 = 13454 //前置关卡没通过
	RET_ELIMINATE_DEMON_BOX_CONDITION_FAIL    uint32 = 13455 //箱子条件未满足
	RET_ELIMINATE_DEMON_BOX_ALREADY_GET       uint32 = 13456 //箱子已经领了
	RET_ELIMINATE_DEMON_CHAPTER_NOT_PASS      uint32 = 13457 //章节没通关
	RET_ELIMINATE_DEMON_SHOP_CAN_NOT_SELL     uint32 = 13458 //东西不够卖
	RET_ELIMINATE_DEMON_NOT_IN_ACTIVITY       uint32 = 13459 //不在活动期间

	/*大闹天宫*/
	RET_TEMPLE_CROSS_NOT_FIND_SERVER       uint32 = 13460 //跨服未提供服务
	RET_TEMPLE_SINGLE_BATTLE_LAYER_ILLEGAL uint32 = 13461 //层数非法
	RET_TEMPLE_MONSTER_DATA_NOT_FOUND      uint32 = 13462 //配表信息未找到
	RET_TEMPLE_BATTLE_AWARD_NOT_ENOUGH     uint32 = 13463 //大闹天宫奖励次数不足
	RET_TEMPLE_TIMEOUT                     uint32 = 13464 //大闹天宫超时
	RET_TEMPLE_USER_MATCH_TIME_OUT         uint32 = 13465 //大闹天宫玩家匹配超时
	RET_TEMPLE_TEAM_GO_DIE                 uint32 = 13466 //大闹天宫队伍解散
	RET_TEMPLE_USER_MATCH_UNREADY          uint32 = 13467 //大闹天宫已经在队伍中, 不能取消匹配
	RET_TEMPLE_USER_NOT_FOUND              uint32 = 13468 //大闹天宫没有找到玩家信息
	RET_TEMPLE_TEAM_NOT_FOUND              uint32 = 13469 //大闹天宫没有找到队伍信息
	RET_TEMPLE_NOT_FOUND_USER_TEAM         uint32 = 13470 //大闹天宫玩家没有队伍
	RET_TEMPLE_TEAM_BATTLE                 uint32 = 13471 //大闹天宫队伍战斗中
	RET_TEMPLE_TEAM_IS_FULL                uint32 = 13472 //大闹天宫队伍满员
	RET_TEMPLE_INVITE_ILLEGAL              uint32 = 13473 //大闹天宫不能邀请自己
	RET_TEMPLE_TEAM_LEADER_OFFLINE         uint32 = 13474 //玩家已经下线
	RET_TEMPLE_TEAM_REQ_CANCEL             uint32 = 13475 //玩家已经取消申请
	RET_TEMPLE_TEAM_UNREADY                uint32 = 13476 //队伍还有玩家未准备
	RET_TEMPLE_TEAM_USER_EXIST             uint32 = 13477 //队伍已经有该玩家
	RET_TEMPLE_SEND_RANK_AWARD             uint32 = 13478 //服务器正在结算奖励, 不能继续战斗

	RET_GOD_STRIVE_BET_MAX_NUM uint32 = 13479 //投注已达上限

	RET_DISCOUNT_CARNIVAL_UPDATE_DATA_FAILED   uint32 = 13480 //折扣狂欢数据更新失败
	RET_DISCOUNT_CARNIVAL_ACTIVITY_NOT_OPEN    uint32 = 13481 //折扣狂欢活动未开放
	RET_DISCOUNT_CARNIVAL_DATA_NOT_FIND        uint32 = 13482 //未找到配置数据
	RET_DISCOUNT_CARNIVAL_BUY_COUNT_NOT_ENOUGH uint32 = 13483 //购买次数不足
	RET_DISCOUNT_CARNIVAL_BUY_COUNT_WRONG      uint32 = 13484 //购买次数出错
	RET_DISCOUNT_CARNIVAL_COUPON_USE_WRONG     uint32 = 13485 //折扣券使用错误
	RET_DISCOUNT_CARNIVAL_TASK_NOT_IN_TIME     uint32 = 13486 //不在任务可以完成并领取的时间内
	RET_DISCOUNT_CARNIVAL_TASK_NOT_COMPLETE    uint32 = 13487 //每日任务未完成
	RET_DISCOUNT_CARNIVAL_TASK_AWARD_IS_GOTTEN uint32 = 13488 //每日任务奖励已领取

	RET_MAGIC_SPECIAL_NOT_FIND_DATA        uint32 = 13489 //法术奇门无法找到配置数据
	RET_MAGIC_SPECIAL_ENERGY_WRONG         uint32 = 13490 //法术奇门计算能量错误
	RET_MAGIC_SPECIAL_ENERGY_NOT_ENOUGH    uint32 = 13491 //法术奇门能量不足
	RET_MAGIC_SPECIAL_NODE_TYPE_WRONG      uint32 = 13492 //法术奇门节点类型错误
	RET_MAGIC_SPECIAL_NODE_CONDITION_WRONG uint32 = 13493 //法术奇门升级前置条件错误
	RET_MAGIC_SPECIAL_NODE_IS_FULL         uint32 = 13494 //法术奇门节点升级满

	RET_TOTEM_ALL_IS_MAX_LEVEL uint32 = 13500 //所有英魂满级
	RET_TOTEM_IS_NO_EXIST      uint32 = 13501 //英魂信息不存在
	RET_TOTEM_TALENT_POS_ERROR uint32 = 13502 //英魂天赋位置错误
	RET_TOTEM_COST_TYPE_ERROR  uint32 = 13503 //错误的洗练类型
	RET_TOTEM_TEMP_IS_EMPTY    uint32 = 13504 //新洗练属性为空

	RET_DISCOUNT_PLAYER_RECALL_ACTIVITY_NOT_OPEN uint32 = 13510 //老玩家回归活动未开放
	RET_DISCOUNT_PLAYER_RECALL_NOT_FOUND_TICKETS uint32 = 13511 //没有资格领奖
	RET_DISCOUNT_PLAYER_RECALL_ALREADY_GET       uint32 = 13512 //奖励已经领过了
	RET_DISCOUNT_PLAYER_RECALL_MODULE_CLOSE      uint32 = 13513 //此模块没有开放
	RET_DISCOUNT_PLAYER_RECALL_NOT_FOUND_INFO    uint32 = 13514 //未找到配置数据
	RET_DISCOUNT_PLAYER_RECALL_COND_NOT_ENOUGH   uint32 = 13515 //条件不满足
	RET_DISCOUNT_PLAYER_RECALL_ACT_CLOSE         uint32 = 13516 //活动已经结束

	/*雷音寺论道*/
	RET_THUNDER_TEMPLE_CROSS_NO_SERVICE       uint32 = 13520 //跨服无法提供服务
	RET_THUNDER_TEMPLE_TEAM_NUM_ERROR         uint32 = 13521 //布阵队伍数量错误
	RET_THUNDER_TEMPLE_SESSION_MEMBER_ERROR   uint32 = 13522 //布阵单场人数错误
	RET_THUNDER_TEMPLE_KNIGHT_COUNT_TOO_MANY  uint32 = 13523 //布阵武将出场过多
	RET_THUNDER_TEMPLE_FORMATION_LOC_ERROR    uint32 = 13524 //单场位置已经被占用
	RET_THUNDER_TEMPLE_SESSION_ERROR          uint32 = 13525 //布阵场次异常
	RET_THUNDER_TEMPLE_FORMATION_ERROR        uint32 = 13526 //布阵上阵异常
	RET_THUNDER_TEMPLE_KNIGHT_SESSION_EXIST   uint32 = 13527 //该武将在本场次已经上过
	RET_THUNDER_TEMPLE_CROSS_TIMEOUT          uint32 = 13528 //跨服服务超时
	RET_THUNDER_TEMPLE_OPER_TIME_ERROR        uint32 = 13529 //操作时间段异常
	RET_THUNDER_TEMPLE_TIMEOUT                uint32 = 13530 //操作超时
	RET_THUNDER_TEMPLE_BOX_IS_GET             uint32 = 13531 //箱子已经领了
	RET_THUNDER_TEMPLE_BOX_CAN_NOT_GET        uint32 = 13532 //领箱子条件未达成
	RET_THUNDER_TEMPLE_NOT_ATTEND             uint32 = 13533 //未参加
	RET_THUNDER_TEMPLE_NO_RECORD              uint32 = 13534 //没有战斗记录
	RET_THUNDER_TEMPLE_NO_FINAL_ORDER         uint32 = 13535 //决赛场次异常
	RET_THUNDER_TEMPLE_FINAL_ORDER_NOT_FINISH uint32 = 13536 //决赛场次没完成

	RET_TREASURE_WRONG_QUALITY        uint32 = 13540 //宝物品质错误
	RET_TREASURE_QUALITY_NOT_MATCHING uint32 = 13541 //宝物类型不匹配

	RET_RETRIEVE_CAN_NOT_GET uint32 = 13550 //限时找回奖励不可领

	RET_AWARD_GOT          uint32 = 13560 //奖励已领取
	RET_CLIENT_PARAM_ERROR uint32 = 13561 //客户端参数错误

	RET_NETHER_WORLD_BUY_NUM_ERROR             uint32 = 13571 // 地府试炼购买次数错误
	RET_NETHER_WORLD_REWARD_NO_PASS            uint32 = 13572 // 地府试炼未通关奖励需要章节
	RET_NETHER_WORLD_REWARD_HAS_GET            uint32 = 13573 // 地府试炼章节通关奖励已领
	RET_NETHER_WORLD_CHAPTER_ERROR             uint32 = 13574 // 地府试炼关卡错误
	RET_NETHER_WORLD_NO_TOKEN                  uint32 = 13575 // 地府试炼挑战次数不足
	RET_NETHER_WORLD_FARM_STAR_NO_ENOUGH       uint32 = 13576 // 地府试炼星数不足无法扫荡
	RET_NETHER_WORLD_NO_PASS                   uint32 = 13577 // 地府试炼关卡尚未通关
	RET_NETHER_WORLD_OP_ERROR                  uint32 = 13578 // 地府试炼错误关卡操作
	RET_NETHER_WORLD_MOVE_TO_WALL              uint32 = 13579 // 地府试炼撞墙了
	RET_NETHER_WORLD_PRE_MAP_ID_NO_FINISH      uint32 = 13580 // 地府试炼前置事件未完成
	RET_NETHER_WORLD_MAP_ID_HAS_ALREADY_FINISH uint32 = 13581 // 地府试炼事件已经完成了

	/*神将悟道*/
	RET_WUDAO_KNIGHT_CANNOT_WUDAO                   uint32 = 13590 //神将没有悟道资格
	RET_WUDAO_KNIGHT_NO_FIND_WUDO_INFO              uint32 = 13591 //找不到悟道信息
	RET_WUDAO_KNIGHT_WRONG_TREE_ID                  uint32 = 13592 //技能树id错误
	RET_WUDAO_KNIGHT_HAS_CHOSEN_ANOTHER_TREE        uint32 = 13593 //已经选择了另外一条技能树
	RET_WUDAO_KNIGHT_FIRST_NODE_ZERO                uint32 = 13594 //首节点等级为0
	RET_WUDAO_KNIGHT_FIRST_NODE_NOT_ZERO            uint32 = 13595 //首节点等级不为0
	RET_WUDAO_KNIGHT_NODE_MAX_LEVEL                 uint32 = 13596 //节点已满级
	RET_WUDAO_KNIGHT_UPPER_NODE_NOT_REACH_MAX_LEVEL uint32 = 13597 //上一层没有节点满级
	RET_WUDAO_KNIGHT_NOT_REACH_CONDITION            uint32 = 13598 //不满足升级条件
	RET_WUDAO_KNIGHT_NOT_FIRST_NODE                 uint32 = 13599 //不是首节点
	RET_WUDAO_KNIGHT_HAS_NO_WUDAO                   uint32 = 13600 //神将没有悟道过

	/*帮派抢矿*/
	RET_GUILD_CRYSTAL_USER_NOT_FOUND     uint32 = 13610 //没有找到玩家
	RET_GUILD_CRYSTAL_GUILD_NOT_FOUND    uint32 = 13611 //没有找到玩家帮派
	RET_GUILD_CRYSTAL_ROB_ILLEGAL        uint32 = 13612 //不能攻击自己
	RET_GUILD_CRYSTAL_GROUP_ILLEGAL      uint32 = 13613 //玩家战区不一致
	RET_GUILD_CRYSTAL_ROB_RUNNING        uint32 = 13614 //玩家正在被攻击中
	RET_GUILD_CRYSTAL_ROB_CD             uint32 = 13615 //玩家CD中
	RET_GUILD_CRYSTAL_CLOSE              uint32 = 13616 //帮派抢矿未开启
	RET_GUILD_CRYSTAL_NOT_ENTER          uint32 = 13617 //派抢矿未报名
	RET_GUILD_CRYSTAL_CROSS_TIMEOUT      uint32 = 13618 //跨服服务超时
	RET_GUILD_CRYSTAL_ATTACK_NOT_ENOUGH  uint32 = 13619 //挑战次数不足
	RET_GUILD_CRYSTAL_REVENGE_NOT_ENOUGH uint32 = 13620 //复仇次数不足
	RET_GUILD_CRYSTAL_CRYSTAL_NOT_ENOUGH uint32 = 13621 //晶矿数量不足
	RET_GUILD_CRYSTAL_CRYSTAL_ACT_CLOSE  uint32 = 13622 //活动未开启
	RET_GUILD_CRYSTAL_JOINING            uint32 = 13623 //帮派抢矿已报名,不能解散帮派
	RET_GUILD_CRYSTAL_NO_ENEMY           uint32 = 13624 //帮派抢矿对手为空

	/*翅膀护阵*/
	RET_WING_BLESS_WING_NOT_EQUIPED           uint32 = 13630 //被护阵翅膀未装备
	RET_WING_BLESS_WING_CAN_NOT_BLESSED       uint32 = 13631 //翅膀不能被护阵
	RET_WING_BLESS_WRONG_POSITION             uint32 = 13632 //翅膀护阵位置错误
	RET_WING_BLESS_NO_FIND_INFO               uint32 = 13633 //翅膀护阵信息查询错误
	RET_WING_BLESS_WING_BLESS_OTHER_WING      uint32 = 13634 //翅膀护阵其他翅膀
	RET_WING_BLESS_WING_BLESS_CONDITION_WRONG uint32 = 13635 //翅膀不能护阵，条件错误
	RET_WING_BLESS_NO_BLESSING_WING           uint32 = 13636 //没有正在护阵的翅膀

	/*金装祈福*/
	RET_GOLD_PRAY_NOT_OPEN uint32 = 13640 //金装祈福没有开启

	/*主角修行*/
	RET_PRACTICE_BUDDHISM_WRONG_QUALITY       uint32 = 13650 //主角品质错误
	RET_PRACTICE_BUDDHISM_NOT_NOW_TASK        uint32 = 13651 //不是当前任务
	RET_PRACTICE_NO_FIND_BUDDHISM_INFO        uint32 = 13652 //找不到修行信息
	RET_PRACTICE_TASK_HAS_COMPLETED           uint32 = 13653 //任务已经完成
	RET_PRACTICE_TASK_CONDITION_NOT_SATISFIED uint32 = 13654 //任务条件不满足

	/*神符灵界*/
	RET_REALM_GRADE_AWARD_ALREADY_GET   uint32 = 13680 //神符灵界段位奖励重复领取
	RET_REALM_GRADE_SCORE_IS_NO_ENOUGHT uint32 = 13681 //神符灵界段位积分不够
	RET_REALM_NO_INIT                   uint32 = 13682 //神符灵界没有初始化
	RET_REALM_STAR_IS_NO_ENOUGH         uint32 = 13683 //神符灵界星数不足
	RET_REALM_BOX_CAN_NOT_OPEN          uint32 = 13684 //神符灵界宝箱开启次数不足
	RET_REALM_SHOP_CAN_NOT_BUY          uint32 = 13685 //神符灵界商店购买
	RET_REALM_BUFF_INDEX_ERROR          uint32 = 13686 //神符灵界选择BUFF错误
	RET_REALM_NEW_DAY                   uint32 = 13687 //神符灵界已经跨天
	RET_REALM_CROSS_NO_SERVICE          uint32 = 13688 //神符灵界跨服不可用
	RET_REALM_CAN_NOT_FAST              uint32 = 13689 //神符灵界当前关卡无法扫荡

	/*神符系统*/
	RET_RUNE_ITEM_IS_NOT_UNIQUE   uint32 = 13700 //道具类型不唯一
	RET_RUNE_ITEM_TYPE_ERROR      uint32 = 13701 //道具类型错误
	RET_RUNE_ITEM_ERROR           uint32 = 13702 //道具异常
	RET_RUNE_NOT_EXIST            uint32 = 13703 //神符不存在
	RET_RUNE_MAX_LEVEL            uint32 = 13704 //神符已经最大等级
	RET_RUNE_LEVEL_NOT_EXIST      uint32 = 13705 //神符阶段不存在
	RET_RUNE_EQUIP_SAME           uint32 = 13706 //同种神符已装备
	RET_RUNE_COMPOSE_SAME         uint32 = 13707 //不能合成相同神符
	RET_RUNE_IS_NOT_INITIAL_STATE uint32 = 13708 //神符养成过
	RET_RUNE_IN_EQUIP             uint32 = 13709 //神符上阵中

	/*图鉴系统*/
	RET_HANDBOOK_TYPE_ERROR    uint32 = 13720 //图鉴类型错误
	RET_HANDBOOK_NOT_EXIST     uint32 = 13721 //图鉴不存在
	RET_HANDBOOK_MAX_LEVEL     uint32 = 13722 //图鉴已满级
	RET_HANDBOOK_NOT_MAX_LEVEL uint32 = 13723 //图鉴未满级

	/*五行秘境挑战*/
	RET_FIVE_FINGER_STAGE_NOT_ENOUGH uint32 = 13730 //五行山挑战秘境条件不足

	/*神将护佑*/
	RET_KNIGHT_IS_BLESS              uint32 = 13735 //神将护佑中
	RET_KNIGHT_FORMATION_COUNT_ERROR uint32 = 13736 //上阵武将数量不足
	RET_KNIGHT_BLESS_NOT_OPEN        uint32 = 13737 //神将护佑位置未开放

	/*国战*/
	RET_COUNTRY_WAR_CROSS_NOT_FIND_SERVER      uint32 = 13740 //跨服未提供服务
	RET_COUNTRY_WAR_NOT_FOUND_USER             uint32 = 13741 //未找到玩家信息
	RET_COUNTRY_WAR_DATA_NOT_FOUND             uint32 = 13742 //配表信息未找到
	RET_COUNTRY_WAR_NOT_FOUND_COUNTRY          uint32 = 13743 //未找到联盟信息
	RET_COUNTRY_WAR_TIMEOUT                    uint32 = 13744 //国战超时
	RET_COUNTRY_WAR_MOVE_CD                    uint32 = 13745 //移动在CD中
	RET_COUNTRY_WAR_MOVE_ILLEGAL               uint32 = 13746 //此路不通
	RET_COUNTRY_WAR_CITY_NOT_NULL              uint32 = 13747 //此城已被占领
	RET_COUNTRY_WAR_ACT_IS_OVER                uint32 = 13748 //活动未开启
	RET_COUNTRY_WAR_CITY_NOT_FOUND             uint32 = 13749 //城池信息未找到
	RET_COUNTRY_WAR_BOSS_IS_DEAD               uint32 = 13750 //BOSS已经死了
	RET_COUNTRY_WAR_ATTACK_ILLEGAL             uint32 = 13751 //同联盟玩家不能自相残杀
	RET_COUNTRY_WAR_USER_RUNNING               uint32 = 13752 //玩家在操作中
	RET_COUNTRY_WAR_USER_CD                    uint32 = 13753 //玩家CD中
	RET_COUNTRY_WAR_NOT_FIND_GROUP             uint32 = 13770 //未找到战区
	RET_COUNTRY_WAR_NOT_IN_INNER_CITY          uint32 = 13771 //不在内城
	RET_COUNTRY_WAR_CANNOT_FIND_WALL           uint32 = 13772 //找不到城墙
	RET_COUNTRY_WAR_CANNOT_ATTACK_YOUR_WALL    uint32 = 13773 //不能攻打本仙盟城墙
	RET_COUNTRY_WAR_WALL_CD                    uint32 = 13774 //城墙保护CD中
	RET_COUNTRY_WAR_CANNOT_FIND_POS            uint32 = 13775 //找不到城墙
	RET_COUNTRY_WAR_USER_CHANGE                uint32 = 13776 //玩家已经改变
	RET_COUNTRY_WAR_CITY_USER_NOT_FOUND        uint32 = 13777 //玩家不在此城
	RET_COUNTRY_WAR_COUNT_NOT_ENOUGH           uint32 = 13778 //挑战次数不足
	RET_COUNTRY_WAR_TASK_NOT_FINISH            uint32 = 13779 //同盟任务没有完成
	RET_COUNTRY_WAR_TASK_HAS_RECEIVE           uint32 = 13780 //同盟任务已经领取
	RET_COUNTRY_WAR_TASK_RECEIVE_MAX           uint32 = 13781 //同盟任务已达领取上限
	RET_COUNTRY_WAR_WALL_ITEM_CD               uint32 = 13782 //城墙道具CD中
	RET_COUNTRY_WAR_WALL_OWN_ILLEGAL           uint32 = 13783 //没有拥有城门, 不能进入内城
	RET_COUNTRY_WAR_CITY_DATA_RESET            uint32 = 13784 //此城池已经结算了
	RET_COUNTRY_WAR_MESSAGE_LIMIT              uint32 = 13785 //留言板每日限制
	RET_COUNTRY_WAR_REFRESH_TIME_NOT_REACH     uint32 = 13786 //刷新时间未到
	RET_COUNTRY_WAR_REFRESH_ERROR              uint32 = 13787 //刷新异常
	RET_COUNTRY_WAR_CANNOT_ATTACK_SELF_COUNTRY uint32 = 13788 //不能攻击自己仙盟
	RET_COUNTRY_WAR_CANNOT_FIND_LAYER_PLAYER   uint32 = 13789 //找不到玩家的层数
	RET_COUNTRY_WAR_CANNOT_FIND_LAYER_INFO     uint32 = 13793 //找不到层数信息
	RET_COUNTRY_WAR_RANK_IS_NOT_FIRST          uint32 = 13794 //排名不是第一

	/*春节跨服活动*/
	RET_FEED_BEAST_ACTIVITY_NOT_OPEN              uint32 = 13760 //春节跨服活动未开启
	RET_FEED_BEAST_FEED_BONE_NUM_ERROR            uint32 = 13761 //大骨头数量错误
	RET_FEED_BEAST_BOX_HAS_RECEIVED               uint32 = 13762 //宝箱已领取过
	RET_FEED_BEAST_BUY_COUNT_WRONG                uint32 = 13763 //购买次数错误
	RET_FEED_BEAST_NO_FIND_INFO                   uint32 = 13764 //找不到信息
	RET_FEED_BEAST_FEED_VALUE_NOT_ENOUGH          uint32 = 13765 //喂养值不足
	RET_FEED_BEAST_BOX_TYPE_WRONG                 uint32 = 13766 //宝箱类型错误
	RET_FEED_BEAST_SEND_RED_PACKET_NUM_NOT_ENOUGH uint32 = 13767 //发放红包的次数不足
	RET_FEED_BEAST_RED_PACKET_TYPE_WRONG          uint32 = 13768 //红包大小类型错误
	RET_FEED_BEAST_RED_COST_NOT_ENOUGH            uint32 = 13769 //发放红包消耗不足
	RET_FEED_BEAST_BONE_COST_NUM_WRONG            uint32 = 13790 //购买大骨头消耗数量错误
	RET_FEED_BEAST_CAN_NOT_GET_RED_PACKET         uint32 = 13791 //不可领红包
	RET_FEED_BEAST_GET_RED_PACKET_NUM_ERROR       uint32 = 13792 //获得元宝数量错误

	/*神符护佑*/
	RET_RUNE_BLESS_RUNE_IS_BLESSING_OTHER_RUNE   uint32 = 13800 //神符护佑其他神符中
	RET_RUNE_BLESS_RUNE_COLOR_WRONG              uint32 = 13801 //护佑神符品质错误
	RET_RUNE_BLESS_RUNE_IS_NOT_INITIAL_STATE     uint32 = 13802 //护佑神符养成过
	RET_RUNE_BLESS_RUNE_IS_EQUIPED               uint32 = 13803 //护佑神符已装备
	RET_RUNE_TO_BLESS_RUNE_IS_NOT_EQUIPED        uint32 = 13804 //被护佑神符未上阵
	RET_RUNE_TO_BLESS_RUNE_NO_BLESS_RUNE         uint32 = 13805 //无护佑神符
	RET_RUNE_TO_BLESS_RUNE_BLESS_NUM_ILLEAGAL    uint32 = 13806 //护阵槽位数量非法
	RET_RUNE_BLESS_RUNE_IS_BLESSED_BY_OTHER_RUNE uint32 = 13807 //护佑神符被其他神符护佑中

	/*变性*/
	RET_GENDER_CHANGE_CD  uint32 = 13820 //变性冷却时间中
	RET_GENDER_CHANGE_XML uint32 = 13821 //变性缺少配置

	/*玄灵仙岛*/
	RET_SOUL_ISLANDS_NO_FIND_INFO                   uint32 = 13830 //未找到信息
	RET_SOUL_ISLANDS_PRE_CHAPTER_NOT_PASS           uint32 = 13831 //前一章未通过
	RET_SOUL_ISLANDS_BOSS_TYPE_ERROE                uint32 = 13832 //boss类型错误
	RET_SOUL_ISLANDS_NO_FIND_INITIAL_STAGE          uint32 = 13833 //没有找到本章的初始关卡
	RET_SOUL_ISLANDS_CHECK_COUNT_NOT_ENOUGH         uint32 = 13834 //洞察次数不足
	RET_SOUL_ISLANDS_GET_MONSTER_ERROR              uint32 = 13835 //获得关卡怪物错误
	RET_SOUL_ISLANDS_CHAPTER_NOT_PASS               uint32 = 13856 //本章未通关
	RET_SOUL_ISLANDS_AWARD_HAS_RECEIVED             uint32 = 13857 //奖励已领取
	RET_SOUL_ISLANDS_GET_CHAPTER_AWARD_ERROR        uint32 = 13858 //获得首通奖励错误
	RET_SOUL_ISLANDS_CHOICE_WRONG                   uint32 = 13859 //放弃选择错误
	RET_SOUL_ISLANDS_CHALLENGE_COUNT_NOT_ENOUGH     uint32 = 13860 //挑战次数不足
	RET_SOUL_ISLANDS_BUY_COUNT_ILLEGAL              uint32 = 13861 //购买挑战次数非法
	RET_SOUL_ISLANDS_GET_CHAPTER_TOTAL_AWARDS_ERROR uint32 = 13862 //获得本章所有关卡奖励错误
	RET_SOUL_ISLANDS_GET_BUY_CHECK_COUNT_GOLD_WRONG uint32 = 13863 //获得购买洞察次数的元宝数错误
	RET_SOUL_ISLANDS_RANK_TYPE_WRONG                uint32 = 13864 //排行榜类型错误
	RET_SOUL_ISLANDS_CHALLENGE_STAGE_NOT_CURRENT    uint32 = 13865 //挑战关卡错误
	RET_SOUL_ISLANDS_ATTACK_MONSTER_POS_ERROR       uint32 = 13866 //攻击怪物位置错误
	RET_SOUL_ISLANDS_GET_MONSTER_TYPE_ERROR         uint32 = 13867 //获得怪物类型错误
	RET_SOUL_ISLANDS_IN_OTHER_CHAPTER               uint32 = 13868 //在其他章节进度中
	RET_SOUL_ISLANDS_CHECK_STAGE_NOT_CURRENT        uint32 = 13869 //只能洞察当前关卡
	RET_SOUL_ISLANDS_STAGE_HAS_BEEN_CHECKED         uint32 = 13870 //本关已洞察过
	RET_SOUL_ISLANDS_STAGE_TYPE_BOSS                uint32 = 13871 //本关为boss类型关卡
	RET_SOUL_ISLANDS_AWARD_TYPE_ERROR               uint32 = 13872 //奖励类型错误

	/*微信绑定VIP客服头像*/
	RET_WECHAT_FRAME_NOT_ACTIVE    uint32 = 13880 //微信头像框未激活
	RET_WECHAT_FRAME_NOT_FIND_INFO uint32 = 13881 //未找到头像框信息
	RET_WECHAT_FRAME_WRONG_TYPE    uint32 = 13882 //头像框类型错误

	RET_CROSS_FRIEND_TEMPLE_BUSY      uint32 = 13889 //好友大闹天宫繁忙中
	RET_CROSS_FRIEND_CROSS_NO_SERVICE uint32 = 13890 //无跨服服务
	RET_CROSS_FRIEND_NO_SAME_GROUP    uint32 = 13891 //跨服好友不在同一分组
	RET_CROSS_FRIEND_BUSY             uint32 = 13892 //正在加好友
	RET_CROSS_FRIEND_CROSS_BLACKLIST  uint32 = 13893 //在对方黑名单中
	RET_CROSS_FRIEND_NO_FIND_USER     uint32 = 13894 //找不到此人
	RET_CROSS_FRIEND_CITY_BUSY        uint32 = 13895 //跨服巡山繁忙
	RET_CROSS_FRIEND_CROSS_PK_NO_USER uint32 = 13896 //跨服PK找不到玩家
	RET_CROSS_FRIEND_LOCAL_PK_NO_USER uint32 = 13897 //本服PK找不到玩家

	/*百战狮驼岭*/
	RET_LION_RIDGE_CROSS_NOT_SERVICE                 uint32 = 13900 //跨服服务器无法提供服务器
	RET_LION_RIDGE_USER_MATCH_OVER                   uint32 = 13901 //玩家匹配队伍超时
	RET_LION_RIDGE_TEAM_MATCH_TEAM_OVER              uint32 = 13902 //队伍匹配队伍超时
	RET_LION_RIDGE_USER_MATCHING                     uint32 = 13903 //玩家正在匹配队伍中
	RET_LION_RIDGE_NOT_MATCHING_NOT_CANCEL           uint32 = 13904 //玩家无法取消玩家匹配队伍
	RET_LION_RIDGE_USER_TEAM_MATCHING                uint32 = 13905 //玩家队伍正在匹配队伍中
	RET_LION_RIDGE_NOT_ALLUSER_READY                 uint32 = 13906 //有玩家未准备 无法匹配
	RET_LION_RIDGE_TEAM_MATCHING                     uint32 = 13907 //队伍正在匹配中
	RET_LION_RIDGE_NOT_CAP_USER_NOT_OP_TEAM_MATCH    uint32 = 13908 //非队长无法操作队伍匹配
	RET_LION_RIDGE_FRIEND_EXIST_TEAM_NOT_REQUEST     uint32 = 13909 //好友已存在队伍 无法邀请
	RET_LION_RIDGE_NOT_EXIST_TEAM_NOT_REQUEST        uint32 = 13910 //不存在队伍无法邀请好友
	RET_LION_RIDGE_EXIST_TEAM_NOT_DEAL_REQUEST       uint32 = 13911 //存在队伍无法处理好友邀请
	RET_LION_RIDGE_EXIST_TEAM_NOT_USER_MATCH         uint32 = 13912 //存在队伍无法个人匹配队伍
	RET_LION_RIDGE_FRIEND_TEAM_NOT_EXIST             uint32 = 13913 //好友队伍不存在
	RET_LION_RIDGE_EXIST_TEAM_NOT_ADD_NEW_TEAM       uint32 = 13914 //存在队伍 无法加入新队伍
	RET_LION_RIDGE_USER_NUM_ENOUGH                   uint32 = 13915 //对方队伍人数已满
	RET_LION_RIDGE_USER_TEAM_NOT_EXIST               uint32 = 13916 //玩家队伍不存在
	RET_LION_RIDGE_CAP_USER_OFFLINE                  uint32 = 13917 //申请加入队伍队长不在线
	RET_LION_RIDGE_CAP_USER_NOT_CAP                  uint32 = 13918 //申请加入队伍的队长已换
	RET_LION_RIDGE_JOIN_USER_OFFLINE                 uint32 = 13919 //申请加入队伍的玩家不在线
	RET_LION_RIDGE_JOIN_USER_EXIST_TEAM              uint32 = 13920 //申请加入队伍的玩家存在队伍
	RET_LION_RIDGE_JOIN_USER_ADD_ERROR               uint32 = 13921 //申请加入队伍玩家加入队伍失败
	RET_LION_RIDGE_SHOP_SCORE_UNENOUGH               uint32 = 13922 //积分不足
	RET_LION_RIDGE_SHOP_COUNT_UNENOUGH               uint32 = 13923 //购买次数不足
	RET_LION_RIDGE_TEAM_MATCH_AND_USER_EXIT          uint32 = 13924 //队伍匹配时 有玩家退出或者掉线
	RET_LION_RIDGE_TIMEOUT                           uint32 = 13925 //百战狮驼岭超时
	RET_LION_RIDGE_OP_TOO_MUCH                       uint32 = 13926 //百战狮驼岭操作太频繁
	RET_LION_RIDGE_CROSS_RESETING_NOT_PURCHASE_GOODS uint32 = 13927 //百战狮驼岭跨服正在重置积分 不能购买商品
	RET_LION_RIDGE_NOT_FIND_LION_RIDGE_USER          uint32 = 13928 //跨服服务器中没有找到玩家信息
	RET_LION_RIDGE_NOT_FIND_LION_RIDGE_TEAM          uint32 = 13929 //跨服服务器中没有找到队伍信息
	RET_LION_RIDGE_KICK_USER_ERROR                   uint32 = 13930 //踢出玩家出错
	RET_LION_RIDGE_EXIST_USER_NOT_OP                 uint32 = 13931 //跨服存在玩家信息 不能再操作
	RET_LION_RIDGE_NOT_EXIST_USER_NOT_OP             uint32 = 13932 //跨服不存在玩家信息 不能再操作
	RET_LION_RIDGE_NOT_FIND_TEAM_USER                uint32 = 13933 //队伍中没找到玩家
	RET_LION_RIDGE_USER_NOT_UNREADY                  uint32 = 13934 //玩家状态不是未准备
	RET_LION_RIDGE_TIME_ILLEGAL                      uint32 = 13935 //不在活动时间内
	RET_LION_RIDGE_USER_NOT_REQUEST_ANY_MORE         uint32 = 13936 //玩家已撤销申请

	/*巡山技能*/
	RET_CITY_SKILL_TIME_IS_NOT_ENOUGHT uint32 = 13940 //巡山升级技能时间不足

	/*分解法宝为法宝碎片 */
	RET_INSTRUMENT_NO_FIND_INSTRUMENT  uint32 = 13950 //玩家没有该法宝
	RET_INSTRUMENT_CAN_NOT_BE_RESOLVED uint32 = 13951 //该法宝不能被分解
	RET_INSTRUMENT_NO_FIND_INFO        uint32 = 13952 //找不到碎片信息

	/* 头像框 */
	RET_HEAD_FRAME_ID_WRONG          uint32 = 13960 //头像框ID错误
	RET_NO_FIND_HEAD_FRAME_INFO      uint32 = 13961 //找不到头像框信息
	RET_HEAD_FRAME_ACTIVE_ITEM_WRONG uint32 = 13962 //头像框激活道具ID错误
	RET_HEAD_FRAME_NOT_ACTIVE        uint32 = 13963 //头像未被激活
	RET_HEAD_FRAME_TIME_OUT          uint32 = 13964 //头像已过期

	/*符石*/
	RET_RUNE_STONE_IS_NOT_ENOUGH uint32 = 13970 //玩家符石不足
	RET_RUNE_STONE_HAS_SAME_TYPE uint32 = 13971 //已经装备相同类型符石
	RET_RUNE_STONE_NUM_MAX       uint32 = 13972 //符合合成数量超过上限

	/*灭世妖圣*/
	RET_DEVIL_BOSS_CROSS_NOT_SERVICE uint32 = 13980 //跨服服务器无法提供服务器
	RET_DEVIL_BOSS_USER_TIMEOUT      uint32 = 13981 //玩家超时中
	RET_DEVIL_BOSS_INFO_NOT_FOUND    uint32 = 13982 //BOSS信息未找到
	RET_DEVIL_BOSS_COUNT_NOT_ENOUGH  uint32 = 13983 //挑战次数不足
	RET_DEVIL_BOSS_REQ_TIMEOUT       uint32 = 13984 //灭世妖圣请求超时
	RET_DEVIL_BOSS_NOT_FOUND_GROUP   uint32 = 13985 //未找到服务器分组
	RET_DEVIL_BOSS_ACT_NOT_OPEN      uint32 = 13986 //活动还未开启
	RET_DEVIL_BOSS_INFO_UPDATE_ERR   uint32 = 13987 //BOSS信息已经更新
	RET_DEVIL_BOSS_RACE_REPEATED     uint32 = 13988 //不能重复种族
	RET_DEVIL_BOSS_AWARD_ERROR       uint32 = 13989 //奖励错误
	RET_DEVIL_BOSS_BOSS_DIED         uint32 = 13990 //BOSS已经死了
	RET_DEVIL_BOSS_NOT_FOUND_ITEM    uint32 = 13991 //道具数量不足

	/* 周年庆典 */
	RET_CELEBRATE_NOT_IN_TIME                  uint32 = 14000 //不在活动期间
	RET_CELEBRATE_WISH_ID_WRONG                uint32 = 14001 //许愿的id错误
	RET_CELEBRATE_TOO_FREQUENT                 uint32 = 14002 //周年庆典操作太频繁
	RET_CELEBRATE_WISH_EXIST                   uint32 = 14004 //已许过愿望
	RET_CELEBRATE_NO_WISH                      uint32 = 14005 //没有许过愿望
	RET_CELEBRATE_WISH_AWARD_GOTTEN            uint32 = 14006 //已领过奖励
	RET_CELEBRATE_WISH_FRIEND_NOT_ENOUGH       uint32 = 14007 //协助好友不足
	RET_CELEBRATE_FRIEND_WISH_COMPLETED        uint32 = 14008 //好友的愿望已完成
	RET_CELEBRATE_GET_FRIEND_WISH_TOO_FREQUENT uint32 = 14009 //获取好友愿望太频繁
	RET_CELEBRATE_NO_FIND_MAZE_EVENT_INFO      uint32 = 14010 //找不到迷宫事件信息
	RET_CELEBRATE_NO_FIND_MAZE_INFO            uint32 = 14011 //找不到迷宫信息
	RET_CELEBRATE_EVENT_TYPE_ERROR             uint32 = 14012 //迷宫事件类型错误
	RET_CELEBRATE_NO_FIND_MAZE_QUESTION_INFO   uint32 = 14013 //找不到迷宫问题信息
	RET_CELEBRATE_NO_FIND_MAZE_GOOD_INFO       uint32 = 14014 //找不到商品信息
	RET_CELEBRATE_BUY_COUNT_ILLEGAL            uint32 = 14015 //购买次数非法
	RET_CELEBRATE_BUY_GOOD_FAILED              uint32 = 14016 //购买商品失败
	RET_CELEBRATE_DICE_NOT_ENOUGH              uint32 = 14017 //骰子不够
	RET_CELEBRATE_CARD_BUFF_EXISTS             uint32 = 14018 //已存在卡牌buff
	RET_CELEBRATE_CARD_NOT_ENOUGH              uint32 = 14019 //卡牌不够
	RET_CELEBRATE_CARD_TYPE_WRONG              uint32 = 14020 //卡牌类型错误
	RET_CELEBRATE_BUY_ITEM_TYPE_ERROR          uint32 = 14021 //购买类型错误
	RET_CELEBRATE_GET_COST_ERROR               uint32 = 14022 //获得购买消耗错误
	RET_CELEBRATE_HAS_GOTTEN_GOLD              uint32 = 14023 //玩家已获得感谢元宝
	RET_CELEBRATE_SIGN_DAY_ERROR               uint32 = 14024 //签到天数错误
	RET_CELEBRATE_NO_FIND_SIGN_INFO            uint32 = 14025 //找不到签到信息
	RET_CELEBRATE_NO_FIND_ACHIEVEMENT_INFO     uint32 = 14026 //找不到成就信息
	RET_CELEBRATE_NOT_REACH_ACHIEVEMENT_VALUE  uint32 = 14027 //未达到成就要求值
	RET_CELEBRATE_HAS_GOTTEN_ACHIEVEMENT_AWARD uint32 = 14028 //已领取过成就奖励
	RET_CELEBRATE_GOOD_TYPE_ERROR              uint32 = 14029 //商品类型错误
	RET_CELEBRATE_CONTROL_CARD_VALUE_ILLEGAL   uint32 = 14030 //遥控卡选择的点数非法
	RET_CELEBRATE_HAS_HELP_TODAY               uint32 = 14031 //今天已经协助过该好友
	RET_CELEBRATE_ASSIST_FRIEND_TOO_FREQUENT   uint32 = 14032 //协助好友太频繁
	RET_CELEBRATE_HAS_SIGN                     uint32 = 14033 //已签到过
	RET_CELEBRATE_GOLD_NUM_ERROR               uint32 = 14034 //感谢信元宝数量错误
	RET_CELEBRATE_MAZE_EVENT_HAS_COMPLETED     uint32 = 14035 //该事件已被完成

	/* 变身卡界面 */
	RET_AVATAR_CARD_ID_WRONG              uint32 = 14040 //变身卡ID错误
	RET_AVATAR_CARD_NO_FIND_CARD_INFO     uint32 = 14041 //找不到变身卡信息
	RET_AVATAR_CARD_ALREADY_ACTIVED       uint32 = 14042 //变身卡已经被激活
	RET_AVATAR_CARD_NOT_USE_NOW           uint32 = 14043 //当前没有穿戴变身卡
	RET_AVATAR_CARD_CAN_NOT_USE_THIS_CARD uint32 = 14044 //不能穿戴该变身卡

	/* 宝物强化 */
	RET_TREASURE_INTENSIFY_MATERIALS_TOO_MUCH uint32 = 14050 //强化材料太多

	/* 金将立绘拼图 */
	RET_KNIGHTDRAW_NOT_FIND_INFO              uint32 = 14061 //配置不存在
	RET_KNIGHTDRAW_HAS_FINISHED_ACHIEVEMENT   uint32 = 14062 //已经完成过成就
	RET_KNIGHTDRAW_CAN_NOT_FINISH_ACHIEVEMENT uint32 = 14063 //成就条件未达成
	RET_KNIGHTDRAW_HAS_FINISHED_DRAW          uint32 = 14064 //已经激活了拼图
	RET_KNIGHTDRAW_HAS_LIKE                   uint32 = 14065 //已经喜欢过
	RET_KNIGHTDRAW_CROSS_NO_SERVICE           uint32 = 14066 //跨服无服务
	RET_KNIGHTDRAW_MESSAGE_AGAIN              uint32 = 14067 //今日重复留言
	RET_KNIGHTDRAW_MESSAGE_HAS_NO_KNIGHT      uint32 = 14068 //买不起金将不要留言
	RET_KNIGHTDRAW_MESSAGE_TOO_LONG           uint32 = 14069 //留言太长
	RET_KNIGHTDRAW_MESSAGE_IS_NOT_EXIST       uint32 = 14070 //留言不存在
	RET_KNIGHTDRAW_MESSAGE_HAS_PRAISED        uint32 = 14071 //留言已经点赞过

	/* 主角法宝封灵 */
	RET_INSTRUMENT_SEAL_SPRITE_PRACTICE_NOT_ENOUGH uint32 = 14080 //主角封灵条件不满足
	RET_INSTRUMENT_SEAL_SPRITE_NO_FIND_INFO        uint32 = 14081 //找不到法宝封灵信息
	RET_INSTRUMENT_SEAL_SPRITE_NODE_ID_ERROR       uint32 = 14082 //法宝封灵升级节点ID错误
	RET_INSTRUMENT_SEAL_SPRITE_NOT_FINISHED        uint32 = 14083 //法宝封灵未完成
	RET_INSTRUMENT_SEAL_SPRITE_REACH_MAX_LEVEL     uint32 = 14084 //法宝已达到最高封灵等级

	/* 暗金将养成 */
	RET_INSTRUMENT_SUPER_CAST_CONSUME_INSTRUMENT_NUM_ERROR uint32 = 14090 //神铸材料数量错误
	RET_INSTRUMENT_SUPER_CASTSTAR_NOT_ENOUGH               uint32 = 14091 //神铸的法宝觉醒星数不足
	RET_INSTRUMENT_SUPER_CAST_REACH_MAX_RANK               uint32 = 14092 //已达到神铸最高等级
	RET_INSTRUMENT_SUPER_CAST_NOT_FIND_INFO                uint32 = 14093 //找不到神铸信息
	RET_KNIGHT_ZHU_LING_NOT_FIND_INFO                      uint32 = 14094 //找不到注灵信息
	RET_KNIGHT_ZHU_LING_REACH_MAX_RANK                     uint32 = 14095 //已达到最大注灵等级
	RET_KNIGHT_ZHU_LING_REACH_MAX_VALUE                    uint32 = 14096 //注灵达到最大值
	RET_KNIGHT_ZHU_LING_FRAGMENT_DATA_ERROR                uint32 = 14097 //注灵碎片数据错误
	RET_KNIGHT_ZHU_LING_ADD_VALUE_TOO_MUCH                 uint32 = 14098 //增加的注灵值太多
	RET_KNIGHT_ZHU_LING_VALUE_NOT_ENOUGH                   uint32 = 14099 //注灵值不足
	RET_KNIGHT_ZHU_LING_FRAGMENT_NOT_ENOUGH                uint32 = 14100 //注灵消耗的碎片不足
	RET_KNIGHT_ZHU_LING_STAR_NOT_ENOUGH                    uint32 = 14101 //注灵的神将升魂星数不足
	RET_KNIGHT_ZHU_LING_FAST_TYPE_ERROR                    uint32 = 14102 //注灵的属性类型出错

	/* 通天之路 */
	RET_ROAD_TO_WEST_CROSS_NOT_SERVICE      uint32 = 14110 //跨服不能提供服务
	RET_ROAD_TO_WEST_CAN_NOT_RENT_MAIN_ROLE uint32 = 14111 //不能出租主角
	RET_ROAD_TO_WEST_KNIGHT_NOT_IN_TEAM     uint32 = 14112 //神将不在第一阵容
	RET_ROAD_TO_WEST_KNIGHT_NOT_FOUND       uint32 = 14113 //神将没找到
	RET_ROAD_TO_WEST_NOT_RENT_KNIGHT        uint32 = 14114 //没有出租神将
	RET_ROAD_TO_WEST_NO_FRIENDSHIP_COIN     uint32 = 14115 //没有友谊币可以领取
	RET_ROAD_TO_WEST_GRADE_NOT_ENOUGH       uint32 = 14116 //段位不足
	RET_ROAD_TO_WEST_REWARD_ALREADY_GET     uint32 = 14117 //奖励已领
	RET_ROAD_TO_WEST_NO_REWARD              uint32 = 14118 //没奖励
	RET_ROAD_TO_WEST_RENT_NUM_ERROR         uint32 = 14119 //租赁数量错误
	RET_ROAD_TO_WEST_TODAY_ALREADY_RENT     uint32 = 14120 //当天已租过该好友
	RET_ROAD_TO_WEST_CAN_NOT_FIEND_FRIEND   uint32 = 14121 //不存在好友
	RET_ROAD_TO_WEST_STAGE_ERROR            uint32 = 14122 //关卡错误
	RET_ROAD_TO_WEST_IS_MAIN_ROLE_KNIGHT    uint32 = 14123 //主角不可以呦
	RET_ROAD_TO_WEST_NEED_MORE_THAN_ORANGE  uint32 = 14124 //红将及以上
	RET_ROAD_TO_WEST_ACT_NOT_OPEN           uint32 = 14125 //活动没开启
	RET_ROAD_TO_WEST_FRIEND_RECIEVE_KNIGHT  uint32 = 14126 //好友已经收回神将
	RET_ROAD_TO_WEST_FRIEND_CHANGE_KNIGHT   uint32 = 14127 //好友已经换了神将

	/* 头像框 */
	RET_HEAD_FRAME_TYPE_ERROR uint32 = 14130 //头像框类型错误

	RET_KNIGHT_MUST_AT_LEAST_THREE uint32 = 14140 //少年,请上阵三人才能攻打主线哦！

	/* 特殊每日签到 */
	RET_DAY_LOGIN_SIGN_ACT_IS_OVER     uint32 = 14142 //签到活动已结束
	RET_DAY_LOGIN_SIGN_ALREADY_SIGN_IN uint32 = 14143 //已签到
	RET_DAY_LOGIN_SIGN_OUT_OF_RANGE    uint32 = 14144 //超出签到天数范围

	/*装备神淬*/
	RET_EQUIP_PURPLE_GOLD_GOLD_NOT_UP_TO_LEVEL uint32 = 14150 //装备淬金等级不足
	RET_EQUIP_PURPLE_CANNOT_FIND_SUIT          uint32 = 14151 //装备套装不存在
	RET_EQUIP_PURPLE_ALREADY_MAX_LEVEL         uint32 = 14152 //装备已经最高等级
	RET_EQUIP_PURPLE_SUIT_ID_ERROR             uint32 = 14153 //装备套装ID错误

	/* 方寸山弈数 */
	RET_SQUARE_INCH_ENEMY_NUM_ERROR          uint32 = 14160 //敌人数量错误
	RET_SQUARE_INCH_CHALLENGE_INDEX_ERROR    uint32 = 14161 //挑战的位置错误
	RET_SQUARE_INCH_NOT_DEFEAT_ALL_ENEMIES   uint32 = 14162 //没有击败所有敌人
	RET_SQUARE_INCH_HAS_GOTTEN_PASS_AWARD    uint32 = 14163 //已经领取过通关奖励
	RET_SQUARE_INCH_HAS_GOTTEN_LUCK_AWARD    uint32 = 14164 //已领取过幸运奖励
	RET_SQUARE_INCH_REFRESH_NUM_ERROR        uint32 = 14165 //刷新的敌人数量错误
	RET_SQUARE_INCH_ENEMY_NIL                uint32 = 14166 //敌人为空
	RET_SQUARE_INCH_NO_FIND_INFO             uint32 = 14167 //找不到配置信息
	RET_SQUARE_INCH_ALL_ENEMIES_ARE_DEFEATED uint32 = 14168 //所有敌人都被击败
	RET_SQUARE_INCH_NOT_IN_TIME              uint32 = 14169 //不在时间内
	RET_SQUARE_INCH_GET_RAND_SERVER_FAILED   uint32 = 14170 //取随机服务器失败
	RET_SQUARE_INCH_REQUEST_TOO_FREQUENT     uint32 = 14171 //请求太频繁
	RET_SQUARE_INCH_GET_ENEMIES_TIMED_OUT    uint32 = 14172 //获得敌人信息超时
	RET_SQUARE_INCH_GET_ENEMIES_FAILED       uint32 = 14173 //获得敌人信息失败
	RET_SQUARE_INCH_ACTION_ERROR             uint32 = 14174 //操作类型错误
	RET_SQUARE_INCH_ENEMY_HAS_BEEN_DEFEATED  uint32 = 14175 //敌人已经被击败
	RET_SQUARE_INCH_BOX_TYPE_ERROR           uint32 = 14176 //宝箱类型错误
	RET_SQUARE_INCH_CAN_NOT_GET_BOX          uint32 = 14177 //不能领取该宝箱
	RET_SQUARE_INCH_HAS_GOTTEN_BOX           uint32 = 14178 //已经领取过该宝箱
	RET_SQUARE_INCH_USE_COUNT_NOT_ENOUGH     uint32 = 14179 //使用次数不足

	/* 炼器坊 */
	RET_HOME_SYSTEM_RESOURCE_NOT_ENOUGH   uint32 = 14180 //资源不足
	RET_HOME_SYSTEM_COST_ITEM_NOT_EXIST   uint32 = 14181 //道具对应配置不存在
	RET_HOME_SYSTEM_COST_ITEM_NONE        uint32 = 14182 //没有消耗过道具
	RET_HOME_SYSTEM_NEXT_LEVEL_INFO_ERROR uint32 = 14183 //没有下一级建筑

	/* 神兽化身*/
	RET_PET_NOT_EXIST              uint32 = 14187 // 神兽不存在
	RET_PET_INFO_NOT_EXIST         uint32 = 14188 // 神兽信息不存在
	RET_PET_INCAR_SLOT_ERROR       uint32 = 14189 // 神兽化身孔错误
	RET_PET_INCAR_ALREADY_HAS_SLOT uint32 = 14190 // 神兽已经化身
	RET_PET_INCAR_SLOT_NOT_OPEN    uint32 = 14191 // 化身槽位没开启
	RET_PET_IS_INCAR_PET           uint32 = 14192 // 神兽在化身中

	/* 许愿树 */
	RET_PROMISE_TREE_NOT_ENOUGH          uint32 = 14200 //许愿币不够
	RET_PROMISE_TREE_RECHARGE_NOT_ENOUGH uint32 = 14201 //充值额度不够
	RET_PROMISE_TREE_TASK_NOT_ENOUGH     uint32 = 14202 //任务条件不够

	/* 盘丝洞 */
	RET_SPIDER_CAVE_VERIFY_FAILED    uint32 = 14210 //信息验证失败
	RET_SPIDER_CAVE_MONSTER_HP_ERROR uint32 = 14211 //怪物血量异常
	RET_SPIDER_CAVE_AWARD_ERROR      uint32 = 14212 //奖励已经领取了
	RET_SPIDER_CAVE_AWARD_NOT_ENOUGH uint32 = 14213 //奖励条件不足

	/* 神翼升星 */
	RET_WING_STAR_ID_ERROR        uint32 = 14220 //升星后的id错误
	RET_WING_NO_FIND_STAR_INFO    uint32 = 14221 //找不到神翼升星配置
	RET_WING_USER_NO_THIS_WING    uint32 = 14222 //玩家没有该翅膀
	RET_WING_HAS_REACHED_MAX_STAR uint32 = 14223 //翅膀已达到最大星数
	RET_WING_NO_FIND_NEW_ID       uint32 = 14224 //找不到新的id
	RET_WING_COLOR_ERROR          uint32 = 14225 //神翼品质错误
	RET_WING_IS_WEARING           uint32 = 14226 //神翼正在穿戴中
	RET_WING_NO_FIND_INFO         uint32 = 14227 //找不到配置
	RET_WING_NO_WEARING_WING      uint32 = 14228 //玩家没有穿戴神翼

	/* 帮派技能重置 */
	RET_GUILD_RESET_SILL_FAILED  uint32 = 14230 //重置帮派技能错误
	RET_GUILD_NOT_IN_TIME        uint32 = 14231 //不在时间内
	RET_GUILD_HAS_RESETED_SKILL  uint32 = 14232 //已经重置过帮派技能
	RET_GUILD_NO_FIND_SKILL_INFO uint32 = 14233 //找不到技能配置
	/* 金宝石 */
	RET_GEM_RESOURCE_NOT_EXIXT              uint32 = 14240 //金宝石材料不存在
	RET_GEM_GOLD_GROWTH_RESOURCE_NOT_ENOUGH uint32 = 14241 //升金材料不够
	RET_GEM_NOT_ROLL_BACK                   uint32 = 14242 //当前材料不能进行重生
	RET_GEM_NOT_GROPTH_GOLD                 uint32 = 14243 //当前宝石不能升金
	/* 仙阵养成 */
	RET_MATRIX_NO_FIND_INFO              uint32 = 14250 //找不到配置信息
	RET_MATRIX_CENTER_ID_ERROR           uint32 = 14251 //仙阵中心阵眼ID错误
	RET_MATRIX_PRE_LEVEL_NOT_ENOUGH      uint32 = 14252 //前一仙阵阵眼等级不足
	RET_MATRIX_CENTER_ID_LIMIT_NOT_REACH uint32 = 14253 //中心阵眼突破条件未满足
	RET_MATRIX_NODE_REACH_MAX_LEVEL      uint32 = 14254 //阵眼达到最高等级
	RET_MATRIX_AROUND_NODE_IDS_ERROR     uint32 = 14255 //周围阵眼错误

	/* 三界夺宝 */
	RET_FOR_TREASURE_GET_TIMES_REACH_LIMIT       uint32 = 14280 //已达到最高可中奖次数限制
	RET_FOR_TREASURE_INPUT_TIMES_REACH_LIMIT     uint32 = 14281 //投入的券数过多
	RET_FOR_TREASURE_ITEM_PERIOD_NUM_HAS_CHANGED uint32 = 14282 //奖品的期数已更改
	RET_FOR_TREASURE_USE_TICKET_TIMED_OUT        uint32 = 14283 //使用券超时
	RET_FOR_TREASURE_LOG_TYPE_ERROR              uint32 = 14284 //三界夺宝日志类型错误
	RET_FOR_TREASURE_ITEM_IS_DRAW                uint32 = 14285 //奖品正在抽奖中
	RET_FOR_TREASURE_ADD_TICKET_FAILED           uint32 = 14286 //奖品正在抽奖中
	RET_FOR_TREASURE_NO_FIND_ITEM_DATA           uint32 = 14287 //找不到奖品数据

	/* 通天之路一键扫荡 */
	RET_ROAD_TO_WEST_STAGE_IS_NOT_PASS      uint32 = 14270 //关卡没有通过
	RET_ROAD_TO_WEST_STAGE_IS_RECIVED_AWARD uint32 = 14271 //关卡已经领取奖励
	RET_ROAD_TO_WEST_FAST_NOT_RENT_KNIGHT   uint32 = 14272 //快速扫荡期间不能借将
	RET_ROAD_TO_WEST_STAGE_IS_NOT_EXIST     uint32 = 14273 //关卡不存在
	/* 宝物淬炼 */
	RET_TREASURE_CAN_NOT_PURPLE_GOLD               uint32 = 14290 //当前宝物不能进行淬炼
	RET_TREASURE_NOT_ENOUGH_LEVEL_UPTO_PURPLE_GOLD uint32 = 14291 //宝物淬炼等级不足
	RET_TREASURE_GET_MATERIAL_FAILED               uint32 = 14292 //宝物淬炼获得材料失败
	/* 烈焰秘窟 */
	RET_FLAME_CAVE_ENEMY_NUM_ERROR                  uint32 = 14300 //敌人数量错误
	RET_FLAME_CAVE_ATTACK_POSITION_ERROR            uint32 = 14301 //攻击的位置错误
	RET_FLAME_CAVE_ENEMY_HAS_BEEN_DEFEATED          uint32 = 14302 //敌人已经被击败
	RET_FLAME_CAVE_ENEMY_HAS_NOT_BEEN_DEFEATED      uint32 = 14303 //敌人未被击败
	RET_FLAME_CAVE_BOX_HAS_BEEN_GOTTEN              uint32 = 14304 //宝箱已经被领取
	RET_FLAME_CAVE_HP_FULL                          uint32 = 14305 //血量已满
	RET_FLAME_CAVE_GET_COST_FAILED                  uint32 = 14306 //获得消耗失败
	RET_FLAME_CAVE_GET_ENEMY_DATA_FAILED            uint32 = 14307 //拉取敌人数据失败
	RET_FLAME_CAVE_LAST_ENEMY_HAS_NOT_BEEN_DEFEATED uint32 = 14308 //上一个敌人未被击败
	RET_FLAME_CAVE_NO_FIND_ENEMY_DATA               uint32 = 14309 //找不到敌人数据
	RET_FLAME_CAVE_ALL_DEAD                         uint32 = 14310 //神将全部死亡

	RET_MAGIC_IS_ON_FORMATION uint32 = 14320 //法术在阵上
	RET_MAGIC_IS_ON_STRONG    uint32 = 14321 //法术在增幅中
	RET_MAGIC_IS_ON_ASSIST    uint32 = 14322 //法术已被辅修中

	/* 星宿 */
	RET_STAR_KNIGHT_ALREADY_EXIST uint32 = 14330 //星宿已经存在
	RET_STAR_KNIGHT_NOT_FOUND     uint32 = 14331 //星宿不存在

	/* 步步为赢对联 */
	RET_CELEBRATE_COUPLETS_CONVERT_FAILED uint32 = 14340 //选项转换失败

	/* 星宿副本 */
	RET_STAR_GOD_LEGEND_MAPTYPE_ERROR                     uint32 = 14350 //地图信息错误
	RET_STAR_GOD_LEGEND_MAPTYPE_PER_EVENT_NOT_FINISH      uint32 = 14351 //前置事件点没完成
	RET_STAR_GOD_LEGEND_MAPTYPE_OP_ERROR                  uint32 = 14352 //错误关卡操作
	RET_STAR_GOD_LEGEND_STAGE_IS_NOT_CLOSE                uint32 = 14353 //关卡未结算
	RET_STAR_GOD_LEGEND_STAGE_ENTER_MULTIPLE              uint32 = 14354 //关卡重复进入
	RET_STAR_GOD_LEGEND_STAGE_CANNOT_FIND_MONSTER_TEAM_ID uint32 = 14355 //找不到怪物队伍ID

	/* 遣云宫 */
	RET_CLOUD_PALACE_NO_FIND_USER_DATA            uint32 = 14360 //找不到玩家数据
	RET_CLOUD_PALACE_NO_FIND_ROOM_USER_DATA       uint32 = 14361 //找不到房间数据
	RET_CLOUD_PALACE_NO_FIND_ROOM_POS_LIMIT_DATA  uint32 = 14362 //找不到玩家位置上下限信息
	RET_CLOUD_PALACE_NO_FIND_ENEMY_DATA           uint32 = 14363 //找不到敌人数据
	RET_CLOUD_PALACE_TIME_NOT_COOL_DOWN           uint32 = 14364 //时间未冷却结束
	RET_CLOUD_PALACE_HAS_GOTTEN_AWARD             uint32 = 14365 //玩家已经领取过该奖励
	RET_CLOUD_PALACE_NOT_REACH_THE_SEG            uint32 = 14366 //玩家没有达到段位要求
	RET_CLOUD_PALACE_ENTER_TYPE_ERROR             uint32 = 14367 //进入选项错误
	RET_CLOUD_PALACE_UPDATE_USER_IN_MODULE_FAILED uint32 = 14368 //更新玩家缓存数据失败
	RET_CLOUD_PALACE_ROOM_USER_NUM_ERROR          uint32 = 14369 //房间人数错误
	RET_CLOUD_PALACE_NO_FIND_HP_DATA              uint32 = 14370 //找不到继承血量数据
	RET_CLOUD_PALACE_USER_UP_FAILED               uint32 = 14371 //玩家直升失败
	RET_CLOUD_PALACE_UP_ROUND_OVER_LIMIT          uint32 = 14372 //直升回合数大于房间人数
	RET_CLOUD_PALACE_CHANGE_COUNT_NOT_ENOUGH      uint32 = 14373 //换房间的次数不足
	RET_CLOUD_PALACE_GET_CHANGE_COUNT_COST_FAILED uint32 = 14374 //获得换房间次数的消耗错误
	RET_CLOUD_PALACE_CHALLENGE_TYPE_ERROR         uint32 = 14375 //挑战类型错误
	RET_CLOUD_PALACE_IN_SETTLE_TIME               uint32 = 14376 //在结算时间内
	RET_CLOUD_PALACE_NO_FIND_SEG_DATA             uint32 = 14377 //找不到段位数据
	RET_CLOUD_PALACE_USER_APPLY_FAILED            uint32 = 14378 //玩家报名失败
	RET_CLOUD_PALACE_NOT_SAME_ROOM                uint32 = 14379 //不在同一个房间
	RET_CLOUD_PALACE_HAS_REACHED_THEMAX_SEG       uint32 = 14380 //玩家到达最高段位
	RET_CLOUD_PALACE_CHANGE_ROOM_FAILED           uint32 = 14381 //玩家换房间失败
	RET_CLOUD_PALACE_LOAD_DATA_FAILED             uint32 = 14382 //载入数据失败
	RET_CLOUD_PALACE_GET_RANK_ERROR               uint32 = 14383 //获得排行榜失败
	RET_CLOUD_PALACE_NOT_IN_ATTACK_TIME           uint32 = 14384 //不在攻打时间内

	/* 储蓄罐 */
	RET_DEPOSIT_GOLD_NUM_IS_ERROR       uint32 = 14390 //投资的元宝数必须是100的倍数哦
	RET_DEPOSIT_GOLD_NUM_IS_ILLEGAL     uint32 = 14391 //投资的元宝数非法
	RET_DEPOSIT_CHOISE_IS_ERROR         uint32 = 14392 //投资方式非法
	RET_DEPOSIT_IS_NOT_EXIST            uint32 = 14393 //投资储蓄罐活动不存在
	RET_DEPOSIT_IS_IS_ALREADY_BUY       uint32 = 14394 //已经购买储蓄罐了不能重复购买
	RET_DEPOSIT_IS_ALREADY_RECIVED_TIME uint32 = 14395 //已经领取储蓄罐的奖励
	RET_DEPOSIT_AWARD_LOG_IS_ERROR      uint32 = 14396 //领取奖励日志出错
	RET_DEPOSIT_IS_NOT_INVESET          uint32 = 14397 //没有投资不能进行领奖
	RET_DEPOSIT_AWARD_MORE_THAN_LIMIT   uint32 = 14398 //领取的时间超过上限
	RET_DEPOSIT_NOT_DODEPOSITCOMPNESATE uint32 = 14399 //没有领取补发奖励不能手动领取

	/* 副本跳过 */
	RET_CHAPTER_STAGE_HAS_BEEN_ATTACKED          uint32 = 14400 //该关卡被攻打过
	RET_CHAPTER_STAGE_SKIP_GET_STAGE_POWER_ERROR uint32 = 14401 //获得该关卡战力错误
	RET_CHAPTER_STAGE_SKIP_GET_POWER_PARAM_ERROR uint32 = 14402 //获得战力系数错误
	RET_CHAPTER_STAGE_SKIP_USER_POWER_TOO_LOW    uint32 = 14403 //玩家战力不满足要求

	/* 防沉迷 */
	RET_ANTI_ONLINE_FCM_NOT_AUTH   uint32 = 14410 //未实名,在线时长达到上限被防沉迷了
	RET_ANTI_ONLINE_FCM_NOT_AGE    uint32 = 14411 //已实名未成年,在线时长达到上限被防沉迷了
	RET_ANTI_ONLINE_FCM_TIME_ERROR uint32 = 14412 //已实名未成年,不在家长设置的在线时间内
	RET_ANTI_ONLINE_IS_FORBID      uint32 = 14413 //家长设置禁玩了

	/* 主角经脉 */
	RET_PULSE_NOT_FIND_PULSE_DATA                 uint32 = 14420 //找不到主角经脉数据
	RET_PULSE_PRE_PULSE_NODE_HAS_NOT_BEEN_UPDATED uint32 = 14421 //升级的节点错误
	RET_PULSE_KNIGHT_NOT_REACH_RANK               uint32 = 14422 //神将突破等级不足
	RET_PULSE_HAS_REACHED_MAX_NODE                uint32 = 14423 //经脉已经升级满
	/* 须弥幻境 */
	RET_ILLUSORY_LAND_IN_STAGE                    uint32 = 14430 //已经在关卡中不能重复进入
	RET_ILLUSORY_LAND_IS_NOT_EXIST                uint32 = 14431 //关卡信息不存在
	RET_ILLUSORY_LAND_CHALLENGE_COUNT_NOT_ENOUGH  uint32 = 14432 //挑战次数不足
	RET_ILLUSORY_LAND_PRE_STAGE_IS_NOT_PASS       uint32 = 14433 //上一关卡没有通过,不能进入下一关
	RET_ILLUSORY_LAND_MONSTER_POS_IS_ERROR        uint32 = 14434 //幻影位置非法
	RET_ILLUSORY_LAND_WAVE_ERROR                  uint32 = 14435 //挑战波次非法
	RET_ILLUSORY_LAND_MONSTER_ERROR               uint32 = 14436 //获得幻影出现问题
	RET_ILLUSORY_LAND_SIGNET_ERROR                uint32 = 14437 //获得印记出现问题
	RET_ILLUSORY_LAND_REFRESH_COUNT_IS_NOT_ENOUGH uint32 = 14438 //刷新次数不足
	RET_ILLUSORY_LAND_NOT_FINSH_HIDE_REWARDS      uint32 = 14439 //没有达到隐藏奖励的条件
	RET_ILLUSORY_LAND_IS_ALREADY_HIDE_REWARDS     uint32 = 14440 //已经领取隐藏奖励
	RET_ILLUSORY_LAND_GET_HIDE_REWARDS_IS_ERROR   uint32 = 14441 //获得隐藏奖励失败
	RET_ILLUSORY_LAND_TALENT_IS_NOT_BE_CHOOSE     uint32 = 14442 //未选择天赋

	/* 大闹天宫  */
	RET_TEMPLE_NOT_LEADER uint32 = 14450 //队长才能一键邀请

	/* 西游天卷 */
	RET_MANUAL_SCROLL_TASK_NOT_FINISH uint32 = 14460 //任务未完成

	/* 魂卡扩展 */
	RET_KNIGHT_CARD_RARE_NOT_SAME uint32 = 14465 //魂卡种族不匹配

	/* 魂卡产出玩法 */
	RET_PARATE_FORTUNE_WEEK_TOUCH_TIME_ERROR        uint32 = 14470 //招财商店激活的次数出错
	RET_PARATE_GET_FORTUNE_ERROR                    uint32 = 14471 //获取招财商店信息出错
	RET_PARATE_GET_DISPLACE_ERROR                   uint32 = 14472 //获取置换商店的信息出错
	RET_PARATE_GET_DISPLACE_COLOR_IS_ERROR          uint32 = 14473 //没有能置换的魂卡
	RET_PARATE_GET_DISPLAE_AWARD_ERROR              uint32 = 14474 //置换商店获得产物信息出错
	RET_PARATE_GET_LEFT_COUNT_IS_ERROR              uint32 = 14475 //剩余次数不足
	RET_PARATE_GET_DIRECT_BUY_ERROR                 uint32 = 14476 //直充商店的信息出错
	RET_PARADE_DIRECT_BUY_REPEATED                  uint32 = 14477 //重复购买
	RET_PARADE_DIRECT_BUY_REPEATED_MONRY_NOT_ENOUGH uint32 = 14478 //充值金额不足
	RET_PARADE_DIRECT_BUY_REPEATED_EVENT_ERROR      uint32 = 14479 //巡游直充商店充值类型出错

	/* 616少年节 */
	RET_ACTIVITY_YOUTH_TASK_INFO_IS_NOT_EXIST       uint32 = 14480 //少年节活动信息不存在
	RET_ACTIVITY_YOUTH_TASK_TYPE_IS_NOT_EXIST       uint32 = 14481 //少年节任务类型对应的信息不存在
	RET_ACTIVITY_YOUTH_TASK_NOT_FINSH               uint32 = 14482 //少年节任务没有完成
	RET_ACTIVITY_YOUTH_SPECIAL_TASK_AWARD_NOT_FINSH uint32 = 14483 //少年节当前任务是特殊任务并且没有达到连线奖励的条件
	RET_ACTIVITY_YOUTH_CAN_NOT_ENTER_NEXT_ROUND     uint32 = 14484 //少年节所有的特殊任务没有全部完成不能就入下一回合
	RET_ACTIVITY_YOUTH_NOT_REWARD                   uint32 = 14485 //少年节没有领取奖励不能进入下一回合
	RET_ACTIVITY_YOUTH_NOT_CONIDS_IS_ERROR          uint32 = 14486 //少年节构成连线id有问题

	/* 星君星格 */
	RET_STAR_KNIGHT_PULSE_NOT_UNLOCK    uint32 = 14490 //未开孔
	RET_STAR_KNIGHT_PULSE_SLOT_ERROR    uint32 = 14491 //孔位错误
	RET_STAR_KNIGHT_PULSE_SLOT_NOT_ATTR uint32 = 14492 //非属性类孔

	/* 三界悬赏 */
	RET_RANDOM_TASK_NO_FIND_TASK_DATA              uint32 = 14500 //没有找到任务数据
	RET_RANDOM_TASK_HAS_INVITED_THIS_FRIEND        uint32 = 14501 //已经邀请过该好友
	RET_RANDOM_TASK_FRIEND_IS_HELPING              uint32 = 14502 //好友正在协助中
	RET_RANDOM_TASK_USER_HAS_NOT_INVITED_BY_FRIEND uint32 = 14503 //玩家没有被该好友邀请
	RET_RANDOM_TASK_TASK_IS_NOT_FRIEND             uint32 = 14504 //该任务不是好友任务
	RET_RANDOM_TASK_FRIEND_HAS_PROGRESS            uint32 = 14505 //好友已经有任务进度
	RET_RANDOM_TASK_OPERATE_TYPE_ERROR             uint32 = 14506 //操作类型错误
	RET_RANDOM_TASK_USER_HAS_NOT_INVITE_FRIEND     uint32 = 14507 //玩家没有邀请过该好友
	RET_RANDOM_TASK_USER_HAS_REACHED_THE_LIMIT     uint32 = 14508 //玩家已经达到接受任务的上限

	/* 回归西游 */
	RET_RECALL_CALL_MIAN_TYPE_IS_ERROR        uint32 = 14510 //回归西游领取感谢信奖励主类型有问题
	RET_RECALL_CALL_GET_IS_ERROR              uint32 = 14511 //回归西游获得数据出错
	RET_RECALL_CALL_HAS_GET_THANK_AWARD       uint32 = 14512 //回归西游已经领取感谢信
	RET_RECALL_DIRECT_BUY_ERROR               uint32 = 14513 //回归西游直充特惠信息出错
	RET_RECALL_DIRECT_BUY_TIMES_ERROR         uint32 = 14514 //回归西游充值特惠购买次数非法
	RET_RECALL_DIRECT_BUY_LOSE_DAY_NOT_ENOUGH uint32 = 14515 //回归西游直充流失天数不满足直充的条件

	/* 血月妖界 */
	RET_BLOOD_DEMON_NOT_IN_ATTACK_TIME uint32 = 14520 //不在可攻打时间内
	RET_BLOOD_DEMON_STAGE_ERROR        uint32 = 14521 //关卡id错误
	RET_BLOOD_DEMON_CHAPTER_NOT_OPEN   uint32 = 14522 //章节未开放
	RET_BLOOD_DEMON_STAGE_LOCKED       uint32 = 14523 //关卡未开放

	/* 神器养成 */
	RET_ARTIFACT_MATERIAL_NOT_ENOUGH uint32 = 14600 //材料不足
	RET_ARTIFACT_ID_NOT_VALID        uint32 = 14601 //神器ID无效，无法通过id查找到神器
	RET_ARTIFACT_MAP_ID_NOT_VALID    uint32 = 14602 //神器图纸ID无效，无法通过id查找到神器图纸
	RET_ARTIFACT_DELETE_FAIL         uint32 = 14603 //删除神器失败
	RET_ARTIFACT_ADD_FAIL            uint32 = 14604 //增加神器失败
	RET_ARTIFACT_BE_WEARD            uint32 = 14605 //神器在槽位中
	RET_ARTIFACT_NOT_INIT            uint32 = 14606 //神器未初始化，不能用于合成
	RET_ARTIFACT_QUALITY_ERROR       uint32 = 14607 //待合成神器品质错误
	RET_ARTIFACT_MAX_LEV             uint32 = 14607 //神器已达最大级
	RET_ARTIFACT_LEV_NOT_ENOUGH      uint32 = 14608 //神器等级不够
	RET_ARTIFACT_CAN_NOT_WEAR        uint32 = 14609 //已佩戴神器神将数量上限
	RET_ARTIFACT_BAG_FULL            uint32 = 14610 //神器背包满

	/* 胚子试炼场 */
	RET_PROVING_GROUND_ITEM_POS_ERROR      uint32 = 14620 //胚子位置错误
	RET_PROVING_GROUND_EQUIP_TOO_MANY_ITME uint32 = 14621 //装备的胚子数量超过限制
	RET_PROVING_GROUND_GET_ENEMY_FALIED    uint32 = 14622 //获取敌人数据失败
	RET_PROVING_GROUND_NO_FIND_ITEM        uint32 = 14623 //没有装备该胚子
	RET_PROVING_GROUND_POS_ERROR           uint32 = 14624 //装备胚子的位置错误
	RET_PROVING_GROUND_NO_ENEMY            uint32 = 14625 //找不到敌人信息
	RET_PROVING_GROUND_CAN_NOT_BE_TRIALED  uint32 = 14626 //该胚子不能试用
	RET_PROVING_GROUND_NO_OLD_ITEM         uint32 = 14627 //该位置必须先装备一个胚子

	/* 通用 这段放最后面 14260-14269 15000-15100*/
	RET_COMMON_CROSS_NOT_SERVICE           uint32 = 14260 //跨服不能提供服务
	RET_COMMON_NOT_FOUND_INFO              uint32 = 14261 //配表信息没有找到
	RET_COMMON_NOT_PASS_PRE_STAGE          uint32 = 14262 //前置关卡没通过
	RET_COMMON_TIMES_NOT_ENOUGH            uint32 = 14263 //次数不足
	RET_COMMON_NOT_AFTER_SEVEN_DAYS        uint32 = 14264 //不在开服七日后
	RET_COMMON_REQUEST_TOO_FREQUENT        uint32 = 14265 //用户请求太频繁
	RET_COMMON_NOT_IN_ACTIVITY_TIME        uint32 = 14266 //不在	活动时间内
	RET_COMMON_DATA_ILLEGAL                uint32 = 14267 //数据不合法
	RET_COMMON_BUY_COUNT_UP_TO_LIMIT       uint32 = 14268 //购买次数已达上限
	RET_COMMON_COLOR_NOT_ENOUGH            uint32 = 15001 //品质不足
	RET_COMMON_CONDITION_NOT_ENOUGH        uint32 = 15002 //条件不足
	RET_COMMON_REQUEST_TIME_OUT            uint32 = 15003 //请求超时
	RET_COMMON_REWARD_ALREADY_GET          uint32 = 20003 //奖励已领
	RET_COMMON_OPERATE_TYPE_NOT_SUPPORT    uint32 = 20004 //操作类型不支持
	RET_COMMON_OPERATE_HAS_ALREADY_TRIGGER uint32 = 20005 //操作重复触发
	RET_COMMON_USER_IS_DIED                uint32 = 20006 //玩家已经死亡
	RET_COMMON_SRAGE_NOT_PASS              uint32 = 20007 //未通过关卡
	RET_COMMON_USER_IS_NOT_DIED            uint32 = 20008 //玩家未死亡
	RET_COMMON_ALREADY_EQUIP_TEAM          uint32 = 20009 //已经上阵
	RET_COMMON_TEAM_NOT_FOUND_KNIGHT       uint32 = 20010 //阵位没有找到神将
	RET_COMMON_TYPE_ERROR                  uint32 = 20011 //类型错误
	RET_COMMON_ALREADY_GET_AWARD           uint32 = 20012 //已经获得奖励
	RET_COMMON_AWARD_NOT_ENOUGH            uint32 = 20013 //奖励已经没有了
	RET_COMMON_STAR_NOT_ENOUGH             uint32 = 20014 //星级未满
	RET_COMMON_TARGET_IS_MAX               uint32 = 20015 //目标项已满
	RET_COMMON_PARAM_ERROR                 uint32 = 20016 //参数错误
)
