NetMsg_ID =  {

  --网关中的协议
  ID_C2S_KeepAlive = 10000, --心跳包
  ID_S2C_KeepAlive = 10001, 
  ID_C2S_Login = 10002, --登录
  ID_S2C_Login = 10003,
  ID_C2S_Create = 10004, --创角
  ID_S2C_Create = 10005,
  ID_C2S_Offline = 10009, --下线
  ID_C2S_GetServerTime = 10011, --获取服务器时间
  ID_S2C_GetServerTime = 10012,

  ID_C2S_Flush = 10006,
  ID_S2C_Flush = 10007,
  ID_S2C_GetUser = 10008,
  ID_S2C_GetKnight = 10010,
  ID_C2S_TestBattle = 10013,
  ID_S2C_TestBattle = 10014,
  ID_S2C_SendBattleReport = 10015,
  ID_S2C_FightKnight = 10016,
  ID_C2S_ChangeFormation = 10017,
  ID_S2C_ChangeFormation = 10018,
  ID_C2S_ChangeTeamKnight = 10019,
  ID_S2C_ChangeTeamKnight = 10020,
  ID_C2S_AddTeamKnight = 10021,
  ID_S2C_AddTeamKnight = 10022,
  ID_S2C_GetItem = 10023,
  ID_S2C_GetFragment = 10024,
  ID_C2S_Shopping = 10025,
  ID_S2C_Shopping = 10026,
  ID_C2S_UseItem = 10027,
  ID_S2C_UseItem = 10028,
  ID_S2C_GetEquipment = 10029,
  ID_C2S_EnterShop = 10030,
  ID_S2C_EnterShop = 10031,
  ID_S2C_OpObject = 10032,
  ID_C2S_Sell = 10033,
  ID_S2C_Sell = 10034,
  ID_C2S_FragmentCompound = 10035,
  ID_S2C_FragmentCompound = 10036,
  ID_C2S_MysticalShopInfo = 10037,
  ID_S2C_MysticalShopInfo = 10038,
  ID_C2S_MysticalShopRefresh = 10039,
  ID_S2C_MysticalShopRefresh = 10040,
  ID_S2C_GetTreasureFragment = 10041,
  ID_S2C_GetTreasure = 10042,
  ID_S2C_FightResource = 10043,
  ID_C2S_AddFightEquipment = 10044,
  ID_S2C_AddFightEquipment = 10045,
  ID_C2S_ClearFightEquipment = 10046,
  ID_S2C_ClearFightEquipment = 10047,
  ID_C2S_AddFightTreasure = 10048,
  ID_S2C_AddFightTreasure = 10049,
  ID_C2S_ClearFightTreasure = 10050,
  ID_S2C_ClearFightTreasure = 10051,
  ID_C2S_GiftCode = 10052,
  ID_S2C_GiftCode = 10053,
  ID_S2C_RollNotice = 10054, --跑马灯公告
  ID_S2C_HOF_Points = 10055,
  ID_S2C_GetAwakenItem = 10056,
  ID_C2S_AwakenShopInfo = 10057,
  ID_S2C_AwakenShopInfo = 10058,
  ID_C2S_AwakenShopRefresh = 10059,
  ID_S2C_AwakenShopRefresh = 10060,
  ID_C2S_GetTencentReward = 10061, --获取腾讯应用宝礼包
  ID_C2S_ChangeTitle = 10062, --装备称号
  ID_S2C_ChangeTitle = 10063,
  ID_C2S_UpdateFightValue = 10064, --更新玩家战斗力数据(重算战斗力)
  ID_C2S_FragmentSale = 10065,
  ID_S2C_FragmentSale = 10066,
  ID_C2S_ItemCompose = 10067,
  ID_S2C_ItemCompose = 10068,
  ID_C2S_ChangeName = 10069,
  ID_S2C_ChangeName = 10070,
  ID_C2S_GetKnightProperty = 10071,	--武将属性
  ID_S2C_GetKnightProperty = 10072,	--武将属性
  ID_C2S_GetCrystalShopInfo = 10073,	--获取水晶商店信息请求
  ID_S2C_GetCrystalShopInfo = 10074,	--获取水晶商店信息返回
  ID_C2S_GetQuestionnaireTime = 10075,    --获取问卷信息请求
  ID_S2C_GetQuestionnaireTime = 10076,    --获取问卷信息返回
  ID_C2S_GetUserVersion = 10077,--你懂得
  ID_S2C_GetUserVersion = 10078,
  ID_C2S_GetRedHint = 10079,	--登陆数据(只登陆拉一次，中途有数据变动比如影响红点的放到GetRedHintSec)
  ID_S2C_GetRedHint = 10080,
  ID_C2S_GetCrystalWeekShopInfo = 10081,	--获取水晶周重置商店信息请求
  ID_S2C_GetCrystalWeekShopInfo = 10082,	--获取水晶周重置商店信息返回

	--红点协议整合(切换到主界面都会拉取，只需要登陆拉一次的放到GetRedHint)
	ID_C2S_GetRedHintSec = 10083,
	ID_S2C_GetRedHintSec = 10084,

	--阿里游戏中心(特权通知)
	ID_S2C_NotifyAliMsg = 10085,

  --通用积分资源
  ID_S2C_GetResource = 10086,

  --对武将使用物品
  ID_C2S_KnightUseItem = 10087,
  ID_S2C_KnightUseItem = 10088,

  --符文/符文书
  ID_S2C_GetRune = 10089,
  ID_S2C_GetRuneBook = 10090,
   
  --5.4.50 随机商店一键刷新购买
  ID_C2S_AutoShopRefresh = 10091, --随机商店一键刷新
  ID_S2C_AutoShopRefresh = 10092,

	--6.3.50 购买背包位置
	ID_C2S_BuyBagSize = 10093,
	ID_S2C_BuyBagSize = 10094,


  --聊天
  ID_C2S_ChatRequest = 10100,
  ID_S2C_ChatRequest = 10101,
  ID_S2C_Chat = 10102,
  ID_S2C_Notify = 10103,
  ID_C2S_GetCreate = 10104,
  ID_S2C_GetCreate = 10105,
  ID_C2S_UploadVoiceMailToken = 10106,
  ID_S2C_UploadVoiceMailToken = 10107,
  ID_C2S_DownloadVoiceMailToken = 10108,
  ID_S2C_DownloadVoiceMailToken = 10109,
  ID_C2S_UploadTopCorpMsgBoardVoiceMail = 10110,
  ID_S2C_UploadTopCorpMsgBoardVoiceMail = 10111,
  ID_C2S_DownloadTopCorpMsgBoardVoiceMail = 10112,
  ID_S2C_DownloadTopCorpMsgBoardVoiceMail = 10113,
  ID_C2S_SetChatShield = 10114,
  ID_S2C_SetChatShield = 10115,

  --好友
  ID_C2S_GetFriendList = 10200,
  ID_S2C_GetFriendList = 10201,
  ID_C2S_GetFriendReqList = 10202,
  ID_S2C_GetFriendReqList = 10203,
  ID_C2S_RequestAddFriend = 10204,
  ID_S2C_RequestAddFriend  = 10205,
  ID_C2S_RequestDeleteFriend = 10206,
  ID_S2C_RequestDeleteFriend = 10207,
  ID_C2S_ConfirmAddFriend = 10208,
  ID_S2C_ConfirmAddFriend = 10209,
  ID_C2S_FriendPresent = 10210,
  ID_S2C_FriendPresent = 10211,
  ID_C2S_GetFriendPresent = 10212,
  ID_S2C_GetFriendPresent = 10213,
  ID_C2S_GetPlayerInfo = 10214,
  ID_S2C_GetPlayerInfo = 10215,
  ID_S2C_AddFriendRespond = 10216,
  ID_C2S_ChooseFriend = 10217,
  ID_S2C_ChooseFriend = 10218,
  ID_C2S_GetFriendsInfo = 10219,
  ID_S2C_GetFriendsInfo = 10220,
  ID_C2S_KillFriend = 10221,
  ID_S2C_KillFriend = 10222,
  ID_S2C_DelFriend = 10223,

  ID_C2S_GetCrossFriendList = 10224,    --获取跨服好友列表
  ID_S2C_GetCrossFriendList = 10225,
  ID_C2S_ReqAddCrossFriend = 10226,     --请求添加跨服好友
  ID_S2C_ReqAddCrossFriend = 10227,
  ID_C2S_AcceptCrossFriend = 10228,     --通过跨服好友请求
  ID_S2C_AcceptCrossFriend = 10229,
  ID_S2C_RepAddCrossFriend = 10230,     --通知加好友成功
  ID_C2S_DeleteCrossFriend = 10231,     --请求删除跨服好友
  ID_S2C_DeleteCrossFriend = 10232,
  ID_C2S_RecommendCrossFriend = 10233,  --推荐跨服好友
  ID_S2C_RecommendCrossFriend = 10234,
  ID_C2S_ReqBanCrossFriend = 10235,     --拉黑跨服玩家
  ID_S2C_ReqBanCrossFriend = 10236,
  ID_C2S_ReqCrossPlayerInfo = 10237,    --请求跨服玩家信息
  ID_S2C_ReqCrossPlayerInfo = 10238,

  --主线副本
  ID_C2S_GetChapterList = 10300,
  ID_S2C_GetChapterList = 10301,
  --ID_C2S_GetStageList = 10302,
  --ID_S2C_GetStageList = 10303,
  ID_C2S_GetChapterRank = 10304,
  ID_S2C_GetChapterRank = 10305,
  ID_S2C_AddStage = 10306,
  ID_C2S_ExecuteStage  = 10307,
  ID_S2C_ExecuteStage  = 10308,
  ID_C2S_FastExecuteStage  = 10309,
  ID_S2C_FastExecuteStage  = 10310,
  ID_C2S_ChapterAchvRwdInfo  = 10311,--副本星数奖励信息
  ID_S2C_ChapterAchvRwdInfo  = 10312,
  ID_C2S_FinishChapterAchvRwd  = 10313,--获取星星成就奖励
  ID_S2C_FinishChapterAchvRwd  = 10314,
  ID_C2S_FinishChapterBoxRwd  = 10315,--获取箱子奖励
  ID_S2C_FinishChapterBoxRwd  = 10316,
  ID_C2S_ResetDungeonExecution = 10317,--重置副本次数
  ID_S2C_ResetDungeonExecution = 10318,
  ID_C2S_ResetDungeonFastTimeCd = 10319,--重置秒杀时间
  ID_S2C_ResetDungeonFastTimeCd = 10320,
  ID_S2C_ExecuteMultiStage = 10321,--副本战斗多战报协议
  ID_C2S_ExecuteMultiStage = 10322,
  ID_S2C_FirstEnterChapter = 10323,--第一次进入设置TAG
  ID_C2S_FirstEnterChapter = 10324,
  ID_C2S_FastExecuteStageOneKey = 10325,
  ID_S2C_FastExecuteStageOneKey = 10326,
  ID_C2S_ResetStageOneKey = 10327,
  ID_S2C_ResetStageOneKey = 10328,
	ID_C2S_OneKeysChapterBoxReward = 10329, --一键领取所有箱子
	ID_S2C_OneKeysChapterBoxReward = 10330,
	ID_C2S_OneKeysHardBoxReward = 10331, --一键领取所有箱子 精英副本
	ID_S2C_OneKeysHardBoxReward = 10332,

  --竞技场
  ID_C2S_GetArenaInfo = 10400,--获取竞技场信息
  ID_S2C_GetArenaInfo = 10401,
  ID_C2S_ChallengeArena = 10402,--挑战竞技场
  ID_S2C_ChallengeArena = 10403,
  ID_C2S_GetArenaTopInfo = 10404,--获取竞技场排行榜
  ID_S2C_GetArenaTopInfo = 10405,
  ID_C2S_GetArenaUserInfo = 10406,--获取竞技场排行榜
  ID_S2C_GetArenaUserInfo = 10407,
  ID_C2S_FastChallengeArena = 10408,--快速挑战竞技场
  ID_S2C_FastChallengeArena = 10409,

  --闯关
  ID_C2S_TowerInfo = 10500,
  ID_S2C_TowerInfo = 10501,
  ID_C2S_TowerChallenge = 10502,
  ID_S2C_TowerChallenge = 10503,
  ID_C2S_TowerStartCleanup = 10504,
  ID_S2C_TowerStartCleanup = 10505,
  ID_C2S_TowerStopCleanup = 10506,
  ID_S2C_TowerStopCleanup = 10507,
  ID_C2S_TowerReset = 10508,
  ID_S2C_TowerReset = 10509,
  ID_C2S_TowerGetBuff = 10510,
  ID_S2C_TowerGetBuff = 10511,
  ID_C2S_TowerRfBuff = 10512,
  ID_S2C_TowerRfBuff = 10513,
  ID_C2S_TowerRequestReward = 10514,
  ID_S2C_TowerRequestReward = 10515,
  ID_C2S_TowerRankingList = 10516,
  ID_S2C_TowerRankingList = 10517,
  ID_C2S_TowerChallengeGuide = 10518,
  ID_S2C_TowerChallengeGuide = 10519,

  --邮件
  ID_S2C_GetSimpleMail = 10600,
  ID_S2C_AddSimpleMail = 10601,
  ID_S2C_GetNewMailCount = 10602,
  ID_C2S_GetMail = 10603,
  ID_S2C_GetMail = 10604,--普通邮件
  ID_S2C_GetGiftMailCount = 10605,
  ID_C2S_GetGiftMail = 10606,
  ID_S2C_GetGiftMail = 10607,
  ID_C2S_ProcessGiftMail = 10608,
  ID_S2C_ProcessGiftMail = 10609,
  ID_C2S_TestMail= 10610,
  ID_C2S_Mail= 10611,
  ID_S2C_Mail= 10612,
  ID_C2S_GetSpecialGiftMail = 10613,
  ID_S2C_GetSpecialGiftMail = 10614,
  ID_C2S_ProcessGiftMailOneKey = 10615,
  ID_S2C_ProcessGiftMailOneKey = 10616,
	ID_C2S_RechargeErrorMail = 10617,		--充值异常
  ID_C2S_SetIgnoreStrangerMail = 10618,
  ID_S2C_SetIgnoreStrangerMail = 10619,
  ID_C2S_GetIgnoreStrangerMail = 10620,
  ID_S2C_GetIgnoreStrangerMail = 10621,

  --抽卡
  ID_C2S_RecruitInfo = 10700,
  ID_S2C_RecruitInfo = 10701,
  ID_C2S_RecruitLp = 10702,
  ID_S2C_RecruitLp = 10703,
  ID_C2S_RecruitLpTen = 10704,
  ID_S2C_RecruitLpTen = 10705,
  ID_C2S_RecruitJp = 10706,
  ID_S2C_RecruitJp = 10707,
  ID_C2S_RecruitJpTen = 10708,
  ID_S2C_RecruitJpTen = 10709,
  ID_C2S_RecruitJpTw = 10710,
  ID_S2C_RecruitJpTw = 10711,
  ID_C2S_RecruitZy = 10712,
  ID_S2C_RecruitZy = 10713,

  --技能树
  ID_C2S_GetSkillTree = 10800,
  ID_S2C_GetSkillTree = 10801,
  ID_C2S_LearnSkill = 10802,--学习和升级都用这条协议
  ID_S2C_LearnSkill = 10803,
  ID_C2S_ResetSkill= 10804,
  ID_S2C_ResetSkill = 10805,
  ID_C2S_PlaceSkill= 10806,
  ID_S2C_PlaceSkill = 10807,

  --剧情副本
  ID_C2S_GetStoryList = 10900,
  ID_S2C_GetStoryList = 10901,
  ID_C2S_ExecuteBarrier = 10902,
  ID_S2C_ExecuteBarrier = 10903,
  ID_C2S_FastExecuteBarrier = 10904,
  ID_S2C_FastExecuteBarrier = 10905,
  ID_C2S_SanguozhiAwardInfo = 10906,
  ID_S2C_SanguozhiAwardInfo = 10907,
  ID_C2S_FinishSanguozhiAward = 10908,
  ID_S2C_FinishSanguozhiAward = 10909,
  ID_C2S_ResetStoryFastTimeCd = 10910,--重置秒杀时间
  ID_S2C_ResetStoryFastTimeCd = 10911,
  ID_S2C_AddStoryDungeon = 10912,--新增剧情副本
  ID_C2S_SetStoryTag = 10913,
  ID_S2C_SetStoryTag = 10914,
  ID_C2S_GetBarrierAward = 10915,
  ID_S2C_GetBarrierAward = 10916,

  -- 武将养成
  ID_C2S_UpgradeKnight = 11000,--武将强化
  ID_S2C_UpgradeKnight = 11001,
  ID_C2S_AdvancedKnight = 11002,--武将升阶
  ID_S2C_AdvancedKnight = 11003,
  ID_C2S_TrainingKnight = 11004,--武将历练
  ID_S2C_TrainingKnight = 11005,
  ID_C2S_SaveTrainingKnight = 11006,--保存武将历练
  ID_S2C_SaveTrainingKnight = 11007,
  ID_C2S_GiveupTrainingKnight = 11008,--放弃武将历练
  ID_S2C_GiveupTrainingKnight = 11009,
  ID_C2S_RecycleKnight = 11010,--武将回收
  ID_S2C_RecycleKnight = 11011,
  ID_C2S_UpgradeKnightHalo = 11012,--升级武将光环
  ID_S2C_UpgradeKnightHalo = 11013,

  ID_C2S_GetKnightAttr = 11014,--获取武将一级属性(仅供开发测试使用)
  ID_S2C_GetKnightAttr = 11015,
  ID_C2S_KnightTransform = 11016,--武将八卦镜
  ID_S2C_KnightTransform = 11017,
  ID_C2S_KnightOrangeToRed = 11018, -- 武将橙色升红色
  ID_S2C_KnightOrangeToRed = 11019,
  ID_C2S_MainRoleTransexual = 11020,--主角变性
  ID_S2C_MainRoleTransexual = 11021,
  ID_C2S_KnightGolden = 11022, -- 武将升金
  ID_S2C_KnightGolden = 11023,
  ID_C2S_KnightOriginStar = 11024, -- 天金将升星
  ID_S2C_KnightOriginStar = 11025,
  ID_C2S_KnightOriginSwallow = 11026, -- 天金将吞噬
  ID_S2C_KnightOriginSwallow = 11027,
  ID_C2S_KnightOriginSwallowUpgrade = 11028, -- 天金将吞噬升级
  ID_S2C_KnightOriginSwallowUpgrade = 11029,
	ID_C2S_KnightSoulUpgrade = 11030,	--武将魂引
	ID_S2C_KnightSoulUpgrade = 11031,
	ID_C2S_CheckKnightTask = 11032,	--检查武将转职里的限制要求，将其提取出来作为一个通用的武将养成限制
	ID_S2C_CheckKnightTask = 11033,

  --练武阁
  --ID_C2S_UnlockMartial = 11100, --解锁武学
  --ID_S2C_UnlockMartial = 11101,
  ID_C2S_UpgradeMartial = 11102, --升级武学
  ID_S2C_UpgradeMartial = 11103,
  --ID_C2S_UnlockMartialTalent = 11104, --解锁天赋
  --ID_S2C_UnlockMartialTalent = 11105,
  ID_C2S_UpgradeMartialTalent = 11106, --升级天赋
  ID_S2C_UpgradeMartialTalent = 11107,
  ID_C2S_ResetMartialTalent = 11108, --重置天赋
  ID_S2C_ResetMartialTalent = 11109,
  ID_S2C_FlushMartialInfo = 11110, --Flush协议统一返回

  --武将换肤
  ID_C2S_ChangeKnightSkin = 11150, --武将换肤
  ID_S2C_ChangeKnightSkin = 11151,
  ID_S2C_FlushKnightSkinInfo = 11153,
  ID_C2S_RenewSkin = 11154,-- 延时
  ID_S2C_RenewSkin = 11155,
  ID_C2S_ChangeKnightVoice = 11156,-- 音频校验
  ID_S2C_ChangeKnightVoice = 11157,
  ID_C2S_ActiveSkinByItem = 11158,--使用皮肤体验卡激活
  ID_S2C_ActiveSkinByItem = 11159,

  --吃鸡H5相关接口
  ID_C2S_GetH5BindAuthCode = 11200, --吃鸡H5绑定验证码
  ID_S2C_GetH5BindAuthCode = 11201,

  --购买助手
  ID_C2S_BuyHelperInfo = 11300, --购买助手
  ID_S2C_BuyHelperInfo = 11301, --兼顾update
  ID_C2S_AddBuyHelper = 11302, --设置购买助手
  ID_S2C_AddBuyHelper = 11303,
  ID_C2S_DeleteBuyHelper = 11304, --删除购买助手设置
  ID_S2C_DeleteBuyHelper = 11305,
  ID_C2S_RunBuyHelper = 11306, --执行购买助手
  ID_S2C_RunBuyHelper = 11307,
  ID_C2S_ChangeBuyHelperIndex = 11308, --交换位置
  ID_S2C_ChangeBuyHelperIndex = 11309,

  --装备养成
  ID_C2S_UpgradeEquipment = 12000,--强化装备
  ID_S2C_UpgradeEquipment = 12001,
  ID_C2S_RefiningEquipment = 12002,--精炼装备
  ID_S2C_RefiningEquipment = 12003,
  ID_C2S_RecycleEquipment = 12004,--分解装备
  ID_S2C_RecycleEquipment = 12005,
  ID_C2S_RebornEquipment = 12006,--装备重生
  ID_S2C_RebornEquipment = 12007,
  ID_C2S_UpStarEquipment = 12008, --升星装备
  ID_S2C_UpStarEquipment = 12009,
  ID_C2S_FastRefineEquipment = 12010, --一键神练
  ID_S2C_FastRefineEquipment = 12011,
  ID_C2S_UpgradeEquipmentOneKey = 12012,--强化装备一键
  ID_S2C_UpgradeEquipmentOneKey = 12013,
  ID_C2S_EquipmentGolden = 12014,--装备升金
  ID_S2C_EquipmentGolden = 12015,--装备升金
  ID_C2S_UpStarDarkGoldEquipment = 12016, --暗金装备升星
  ID_S2C_UpStarDarkGoldEquipment = 12017, --
  ID_C2S_TransformEquipment = 12018,
  ID_S2C_TransformEquipment = 12019,
  ID_C2S_EquipmentSoulUpgrade = 12020,	--铸魂
  ID_S2C_EquipmentSoulUpgrade = 12021,
  ID_C2S_EquipmentSpiritualize = 12022,	--灵化
  ID_S2C_EquipmentSpiritualize = 12023,
  ID_C2S_EquipmentSetSpirit = 12024,	--设置器灵
  ID_S2C_EquipmentSetSpirit = 12025,


  --图鉴
  ID_C2S_GetHandbookInfo = 12100,
  ID_S2C_GetHandbookInfo = 12101,

  --叛军
  ID_S2C_GetRebel = 12200,
  ID_C2S_EnterRebelUI = 12201,
  ID_S2C_EnterRebelUI = 12202,
  ID_C2S_AttackRebel = 12203,
  ID_S2C_AttackRebel = 12204,
  ID_C2S_PublicRebel = 12205,
  ID_S2C_PublicRebel = 12206,
  ID_C2S_RebelRank = 12207,
  ID_S2C_RebelRank = 12208,
  ID_C2S_MyRebelRank = 12209,
  ID_S2C_MyRebelRank = 12210,
  ID_C2S_RefreshRebel = 12211,
  ID_S2C_RefreshRebel = 12212,
  ID_C2S_GetExploitAward = 12215,
  ID_S2C_GetExploitAward = 12216,
  ID_C2S_GetExploitAwardType = 12217,
  ID_S2C_GetExploitAwardType = 12218,
  ID_C2S_RefreshRebelShow = 12221,
  ID_S2C_RefreshRebelShow = 12222,
  ID_C2S_GetExploitAwardOneKey = 12223,
  ID_S2C_GetExploitAwardOneKey = 12224,
  ID_C2S_GetRebelOneKeyOptions = 12225,
  ID_S2C_GetRebelOneKeyOptions = 12226,
  ID_C2S_SetRebelOneKeyOptions = 12227,
  ID_S2C_SetRebelOneKeyOptions = 12228,

  --宝物系统
  ID_C2S_GetTreasureFragmentRobList = 12300,--获取宝物碎片抢夺列表
  ID_S2C_GetTreasureFragmentRobList = 12301,
  ID_C2S_RobTreasureFragment = 12302,--抢夺宝物碎片
  ID_S2C_RobTreasureFragment = 12303,
  ID_C2S_UpgradeTreasure = 12304,--强化宝物
  ID_S2C_UpgradeTreasure = 12305,
  ID_C2S_RefiningTreasure = 12306,--精炼宝物
  ID_S2C_RefiningTreasure = 12307,
  ID_C2S_ComposeTreasure = 12308,--合成宝物
  ID_S2C_ComposeTreasure = 12309,
  ID_C2S_TreasureFragmentForbidBattle = 12310,--使用免战牌
  ID_S2C_TreasureFragmentForbidBattle = 12311,
  ID_C2S_RecycleTreasure = 12312,--宝物重生
  ID_S2C_RecycleTreasure = 12313,
  ID_C2S_FastRobTreasureFragment = 12314,--5次夺宝
  ID_S2C_FastRobTreasureFragment = 12315,
  ID_C2S_TreasureSmelt = 12316,     --宝物熔炼
  ID_S2C_TreasureSmelt = 12317,
  ID_C2S_TreasureForge = 12318,     --宝物铸造
  ID_S2C_TreasureForge = 12319,
  ID_C2S_OneKeyRobTreasureFragment = 12320,	--一键夺宝
  ID_S2C_OneKeyRobTreasureFragment = 12321,
  ID_C2S_TreasureGolden = 12322, --升金
  ID_S2C_TreasureGolden = 12323,
  ID_C2S_TreasureTransform = 12324,
  ID_S2C_TreasureTransform = 12325,
  ID_C2S_UpgradeTreasureStar = 12326, --宝物升星
  ID_S2C_UpgradeTreasureStar = 12327,
  ID_C2S_PackageTreasure = 12328, --宝物打包
  ID_S2C_PackageTreasure = 12329,
	ID_C2S_TreasureSourceTrace = 12330,
	ID_S2C_TreasureSourceTrace = 12331,
	ID_C2S_TreasureSourceTraceReset = 12332,
	ID_S2C_TreasureSourceTraceReset = 12333,

  --新手引导
  ID_C2S_GetGuideId = 12400,
  ID_S2C_GetGuideId = 12401,
  ID_C2S_SaveGuideId = 12402,
  ID_S2C_SaveGuideId = 12403,

  --VIP副本
  ID_C2S_GetVip = 12500,
  ID_S2C_GetVip = 12501,
  ID_C2S_ExecuteVipDungeon = 12502,
  ID_S2C_ExecuteVipDungeon = 12503,
  ID_C2S_ResetVipDungeonCount = 12504,
  ID_S2C_ResetVipDungeonCount = 12505,

  -- 喝酒
  ID_C2S_LiquorInfo = 12600,
  ID_S2C_LiquorInfo = 12601,
  ID_C2S_Drink = 12602,
  ID_S2C_Drink = 12603,

  --icon点击统计
  ID_C2S_IconClick = 12620,
  ID_S2C_IconClick = 12621,

  --充值相关
  ID_C2S_GetRecharge = 12700,
  ID_S2C_GetRecharge = 12701,
  ID_C2S_UseMonthCard = 12702,
  ID_S2C_UseMonthCard = 12703,
  ID_S2C_RechargeSuccess = 12704,
  ID_C2S_GetRechargeBonus = 12705,
  ID_S2C_GetRechargeBonus= 12706,
  ID_C2S_GetMonthCardTimesReward = 12707,--4.8.0 获取月卡次数奖励
  ID_S2C_GetMonthCardTimesReward = 12708,
  ID_C2S_GetRechargeTimes     = 12709,
  ID_S2C_GetRechargeTimes     = 12710,

  -- 关公
  ID_C2S_MrGuanInfo = 12800,
  ID_S2C_MrGuanInfo = 12801,
  ID_C2S_Worship = 12802,
  ID_S2C_Worship = 12803,

  -- 登陆奖励
  ID_C2S_LoginRewardInfo = 12900,
  ID_S2C_LoginRewardInfo = 12901,
  ID_C2S_LoginReward = 12902,
  ID_S2C_LoginReward = 12903,

  --每日任务
  ID_C2S_GetDailyMission = 13000,
  ID_S2C_GetDailyMission = 13001,
  ID_C2S_FinishDailyMission = 13002,
  ID_S2C_FinishDailyMission = 13003,
  ID_C2S_GetDailyMissionAward = 13004,
  ID_S2C_GetDailyMissionAward = 13005,
  ID_C2S_ResetDailyMission = 13006,
  ID_S2C_ResetDailyMission = 13007,
  ID_S2C_FlushDailyMission = 13008,
  ID_C2S_DailyMissionGameHelper = 13009,
  ID_S2C_DailyMissionGameHelper = 13010,

  -- 无双
  ID_C2S_WushInfo = 13100,
  ID_S2C_WushInfo = 13101,
  ID_C2S_WushGetBuff = 13102,
  ID_S2C_WushGetBuff = 13103,
  ID_C2S_WushChallenge = 13104,
  ID_S2C_WushChallenge = 13105,
  ID_C2S_WushReset = 13106,
  ID_S2C_WushReset = 13107,
  ID_C2S_WushRankingList = 13108,
  ID_S2C_WushRankingList = 13109,
  ID_C2S_WushApplyBuff = 13110,
  ID_S2C_WushApplyBuff = 13111,
  ID_C2S_WushBuy = 13112,
  ID_S2C_WushBuy = 13113,
  ID_C2S_WushChallengePlus = 13114,
  ID_S2C_WushChallengePlus = 13115,

  --真三国无双  5.6.0
  ID_C2S_Wush2Info = 13130,    --获取信息
  ID_S2C_Wush2Info = 13131,  
  ID_C2S_Wush2Challenge = 13132,   --挑战
  ID_S2C_Wush2Challenge = 13133,
  ID_C2S_Wush2Reset = 13134,       --重置
  ID_S2C_Wush2Reset = 13135,
  ID_C2S_Wush2RankingList = 13136,  --排行，没有就先留着
  ID_S2C_Wush2RankingList = 13137,
  ID_C2S_Wush2ChallengePlus = 13138,  --一键挑战 
  ID_S2C_Wush2ChallengePlus = 13139,
  ID_C2S_Wush2Buy = 13140,   --次数购买
  ID_S2C_Wush2Buy = 13141,

  -- 目标系统
  ID_C2S_TargetInfo = 13200,
  ID_S2C_TargetInfo = 13201,
  ID_C2S_TargetGetReward = 13202,
  ID_S2C_TargetGetReward = 13203,

  --MAIN GROUTH
  ID_C2S_GetMainGrouthInfo = 13301,
  ID_S2C_GetMainGrouthInfo = 13302,
  ID_C2S_UseMainGrouthInfo = 13303,
  ID_S2C_UseMainGrouthInfo = 13304,

  --名人堂
  ID_C2S_HOF_UIInfo = 13400,
  ID_S2C_HOF_UIInfo = 13401,
  ID_C2S_HOF_Confirm = 13402,
  ID_S2C_HOF_Confirm = 13403,
  ID_C2S_HOF_Sign = 13404,
  ID_S2C_HOF_Sign = 13405,
  ID_C2S_HOF_RankInfo = 13406,
  ID_S2C_HOF_RankInfo = 13407,

  --开服基金
  ID_C2S_GetFundInfo = 13500, --获取全服基金购买信息
  ID_S2C_GetFundInfo = 13501,
  ID_C2S_GetUserFund = 13502, --获取个人基金信息
  ID_S2C_GetUserFund = 13503,
  ID_C2S_BuyFund = 13504, --购买基金
  ID_S2C_BuyFund = 13505,
  ID_C2S_GetFundAward = 13506, --领取基金奖励
  ID_S2C_GetFundAward = 13507,
  ID_C2S_GetFundWeal = 13508, --领取福利奖励
  ID_S2C_GetFundWeal = 13509,

  -- 城池挂机
  ID_C2S_CityInfo = 13600,
  ID_S2C_CityInfo = 13601,
  ID_C2S_CityAttack = 13602,
  ID_S2C_CityAttack = 13603,
  ID_C2S_CityPatrol = 13604,
  ID_S2C_CityPatrol = 13605,
  ID_C2S_CityReward = 13606,
  ID_S2C_CityReward = 13607,
  ID_C2S_CityAssist = 13608,
  ID_S2C_CityAssist = 13609,
  ID_C2S_CityCheck = 13610,
  ID_S2C_CityCheck = 13611,
  ID_S2C_CityAssisted = 13612,
  ID_C2S_CityOneKeyReward = 13613,
  ID_S2C_CityOneKeyReward = 13614,
  ID_C2S_CityOneKeyPatrol = 13615,
  ID_S2C_CityOneKeyPatrol = 13616,
  ID_C2S_CityOneKeyPatrolSet = 13617,
  ID_S2C_CityOneKeyPatrolSet = 13618,
  ID_C2S_CityTechUp = 13619,
  ID_S2C_CityTechUp = 13620,

  --可配置活动
  ID_C2S_GetCustomActivityInfo = 13700, --获取可配置活动信息
  ID_S2C_GetCustomActivityInfo = 13701,
  ID_S2C_UpdateCustomActivity = 13702, --更新可配置活动
  ID_S2C_UpdateCustomActivityQuest = 13703, --更新可配置活动任务
  ID_C2S_GetCustomActivityAward = 13704, --领取可配置活动奖励
  ID_S2C_GetCustomActivityAward = 13705,
  ID_S2C_UpdateCustomSeriesActivity = 13706, --更新系列活动
  ID_C2S_GetCustomSeriesActivity = 13707, --获取系列活动
  ID_S2C_GetCustomSeriesActivity = 13708,
  ID_C2S_GetWeekCustomActivityInfo = 13709, --获取周常活动信息
  ID_S2C_GetWeekCustomActivityInfo = 13710,
  ID_C2S_GetWeekCustomActivityAward = 13711, --领取周常活动奖励
  ID_S2C_GetWeekCustomActivityAward = 13712,
  ID_S2C_WeekUpdateCustomActivity = 13713, --更新周常新文件内容活动

  --节日活动
  ID_C2S_GetHolidayEventInfo = 13800,
  ID_S2C_GetHolidayEventInfo = 13801,
  ID_C2S_GetHolidayEventAward = 13802,
  ID_S2C_GetHolidayEventAward = 13803,

  --觉醒相关功能
  ID_C2S_ComposeAwakenItem = 13900, --道具合成
  ID_S2C_ComposeAwakenItem = 13901,
  ID_C2S_PutonAwakenItem = 13902, --装备觉醒道具
  ID_S2C_PutonAwakenItem = 13903,
  ID_C2S_AwakenKnight = 13904, --武将觉醒
  ID_S2C_AwakenKnight = 13905,
  ID_C2S_FastComposeAwakenItem = 13906, --一键道具合成
  ID_S2C_FastComposeAwakenItem = 13907,
  ID_C2S_AutoAwakenKnight = 13908, --武将一键觉醒
  ID_S2C_AutoAwakenKnight = 13909,

  --开服七天活动
  ID_C2S_GetDaysActivityInfo = 14000,
  ID_S2C_GetDaysActivityInfo = 14001,
  ID_C2S_FinishDaysActivity = 14002,
  ID_S2C_FinishDaysActivity = 14003,
  ID_C2S_GetDaysActivitySell = 14004,
  ID_S2C_GetDaysActivitySell = 14005,
  ID_C2S_PurchaseActivitySell = 14006,
  ID_S2C_PurchaseActivitySell = 14007,
  ID_S2C_FlushDaysActivity = 14008,
  ID_C2S_GetSevenDaysDailySales = 14009,
  ID_S2C_GetSevenDaysDailySales = 14010,
  ID_C2S_BuySevenDaysDailySale = 14011,
  ID_S2C_BuySevenDaysDailySale = 14012,

  ID_C2S_UpgradeDress = 14100,
  ID_S2C_UpgradeDress = 14101,
  ID_S2C_GetDress = 14156,
  ID_C2S_AddFightDress = 14157,
  ID_S2C_AddFightDress = 14158,
  ID_C2S_ClearFightDress = 14159,
  ID_S2C_ClearFightDress = 14160,
  ID_C2S_RecycleDress = 14161,
  ID_S2C_RecycleDress = 14162,
  ID_C2S_UpgradeDressOneKey = 14163,
  ID_S2C_UpgradeDressOneKey = 14164,
  ID_C2S_FairyDress = 14165,
  ID_S2C_FairyDress = 14166,

	--微信分享
  ID_C2S_Share = 14200,
  ID_S2C_Share = 14201,
  ID_C2S_GetShareState = 14202,
  ID_S2C_GetShareState = 14203,
  ID_C2S_GetPhoneBindNotice = 14204,
  ID_S2C_GetPhoneBindNotice = 14205,

  --封测充值返还
  ID_C2S_GetRechargeBack = 14300,--查看是否有返还信息
  ID_S2C_GetRechargeBack = 14301,
  ID_C2S_RechargeBackGold = 14302,--领取返还元宝
  ID_S2C_RechargeBackGold = 14303,

  --军团 16000 - 17000 为军团 勿用
  --默认获取
  ID_C2S_GetCorpList = 16000,--获取军团列表
  ID_S2C_GetCorpList = 16001,
  ID_C2S_GetJoinCorpList = 16002,--获取玩家申请军团列表
  ID_S2C_GetJoinCorpList = 16003,
  ID_C2S_GetCorpDetail = 16004,--获取自身帮会信息 刷新自身帮会信息都通过这条
  ID_S2C_GetCorpDetail = 16005,
  ID_C2S_GetCorpMember = 16006,--获取军团成员信息
  ID_S2C_GetCorpMember= 16007,
  ID_C2S_GetCorpHistory= 16008,--获取军团动态
  ID_S2C_GetCorpHistory= 16009,
  ID_S2C_NotifyCorpDismiss = 16010,--军团解散消息
  --军团权利行为
  --以下为所有人的权利
  ID_C2S_CreateCorp = 16100,--创建帮会
  ID_S2C_CreateCorp = 16101,
  ID_C2S_RequestJoinCorp = 16102,--请求加入帮会
  ID_S2C_RequestJoinCorp = 16103,
  ID_C2S_DeleteJoinCorp = 16104,--删除加入帮会请求
  ID_S2C_DeleteJoinCorp = 16105,
  ID_C2S_QuitCorp = 16106,--退出帮会
  ID_S2C_QuitCorp = 16107,
  ID_C2S_SearchCorp = 16108,--查找帮会
  ID_S2C_SearchCorp = 16109,
  ID_C2S_ExchangeLeader = 16110,--弹劾军团长
  ID_S2C_ExchangeLeader = 16111,
  --以下为部分人的权利（军团长 副军团长）
  ID_C2S_ConfirmJoinCorp = 16200,--确认加入帮会
  ID_S2C_ConfirmJoinCorp = 16201,
  ID_C2S_ModifyCorp = 16202,--修改军团信息（内部公告，宣言，标识）
  ID_S2C_ModifyCorp = 16203,
  ID_C2S_DismissCorpMember = 16204,--踢人
  ID_S2C_DismissCorpMember = 16205,
  ID_C2S_GetCorpJoin= 16206,--查看军团申请
  ID_S2C_GetCorpJoin= 16207,
  ID_S2C_MyCorpChangedByCorpLeader = 16208,
  --军团长Only
  ID_C2S_DismissCorp = 16300,--解散帮会
  ID_S2C_DismissCorp = 16301,
  ID_C2S_CorpStaff = 16302,--任命
  ID_S2C_CorpStaff = 16303,
  ID_C2S_SetCorpChapterId = 16304,--设置军团副本ID
  ID_S2C_SetCorpChapterId = 16305,--设置军团副本ID
	--军团演武台皮肤
	ID_C2S_CorpSkinInfo = 16320,	--演武台皮肤信息
	ID_S2C_CorpSkinInfo = 16321,
	ID_C2S_CorpSkinSelect = 16322,	--演武台选择
	ID_S2C_CorpSkinSelect = 16323,
  --军团祭天
  ID_C2S_GetCorpWorship = 16400,--祭天信息
  ID_S2C_GetCorpWorship = 16401,
  ID_C2S_CorpContribute = 16402,--祭天
  ID_S2C_CorpContribute = 16403,
  ID_C2S_GetCorpContributeAward = 16404,--祭祀领奖
  ID_S2C_GetCorpContributeAward = 16405,
  --军团商店 (特殊)
  ID_C2S_GetCorpSpecialShop = 16500,--获取特殊军团商店信息
  ID_S2C_GetCorpSpecialShop = 16501,
  ID_C2S_CorpSpecialShopping = 16502,--特殊军团商店购买
  ID_S2C_CorpSpecialShopping = 16503,
  --军团副本
  ID_C2S_GetCorpChapter= 16600,--获取军团副本信息
  ID_S2C_GetCorpChapter = 16601,
  ID_C2S_GetCorpDungeonInfo= 16602,--获取军团副本信息
  ID_S2C_GetCorpDungeonInfo = 16603,
  ID_C2S_ExecuteCorpDungeon = 16604,--获取军团副本信息
  ID_S2C_ExecuteCorpDungeon = 16605,
  ID_S2C_FlushCorpDungeon =16606,--有信息刷新 通知
  ID_C2S_GetDungeonAwardList = 16607,--获取军团副本砸蛋信息
  ID_S2C_GetDungeonAwardList = 16608,--
  ID_C2S_GetDungeonAward = 16609,--砸蛋
  ID_S2C_GetDungeonAward = 16610,
  ID_C2S_GetDungeonCorpRank = 16611,--军团排行
  ID_S2C_GetDungeonCorpRank = 16612,
  ID_C2S_GetDungeonCorpMemberRank = 16613,--军团个人排行
  ID_S2C_GetDungeonCorpMemberRank = 16614,
  ID_C2S_GetDungeonAwardCorpPoint = 16615,--获取军团副本通关后的帮贡奖励
  ID_S2C_GetDungeonAwardCorpPoint = 16616,--
  ID_S2C_FlushDungeonAward = 16617,
  ID_C2S_ResetDungeonCount = 16618,--购买副本挑战次数
  ID_S2C_ResetDungeonCount = 16619,--购买副本挑战次数
  ID_C2S_GetCorpChapterRank = 16620,--军团副本总排行
  ID_S2C_GetCorpChapterRank = 16621,
  --跨服群英战
  ID_C2S_GetCorpCrossBattleInfo = 16700,--获取群英战信息
  ID_S2C_GetCorpCrossBattleInfo = 16701,--获取群英战信息
  ID_C2S_ApplyCorpCrossBattle = 16702,--报名--军团长 副军团长才有权限
  ID_S2C_ApplyCorpCrossBattle = 16703,--
  ID_C2S_QuitCorpCrossBattle = 16704,--退出报名
  ID_S2C_QuitCorpCrossBattle = 16705,
  ID_C2S_GetCorpCrossBattleList = 16706,--获取报名列表
  ID_S2C_GetCorpCrossBattleList = 16707,
  ID_C2S_GetCrossBattleEncourage = 16708,--鼓舞信息
  ID_S2C_GetCrossBattleEncourage = 16709,
  ID_C2S_CrossBattleEncourage = 16710,--鼓舞
  ID_S2C_CrossBattleEncourage = 16711,
  ID_C2S_GetCrossBattleField = 16712,--赛区信息
  ID_S2C_GetCrossBattleField = 16713,
  ID_C2S_GetCrossBattleEnemyCorp = 16714,--对方军团信息
  ID_S2C_GetCrossBattleEnemyCorp = 16715,
  ID_C2S_CrossBattleChallengeEnemy= 16718,--挑战
  ID_S2C_CrossBattleChallengeEnemy = 16719,
  ID_C2S_ResetCrossBattleChallengeCD= 16720,--重置挑战CD
  ID_S2C_ResetCrossBattleChallengeCD= 16721,
  ID_C2S_SetCrossBattleFireOn = 16722,--设置集火
  ID_S2C_SetCrossBattleFireOn = 16723,
  ID_C2S_CrossBattleMemberRank = 16724,--军团成员战绩
  ID_S2C_CrossBattleMemberRank = 16725,
  --ID_C2S_CrossBattleFieldReport = 16726,--查看战况
  --ID_S2C_CrossBattleFieldReport = 16727,
  ID_S2C_BroadCastState = 16728,--广播状态
  ID_C2S_GetCorpCrossBattleTime = 16729,--获取时间
  ID_S2C_GetCorpCrossBattleTime = 16730,--获取时间
  ID_S2C_FlushCorpCrossBattleList = 16731,--刷新
  ID_S2C_FlushCorpCrossBattleField  = 16732,--刷新通知分配成功
  ID_S2C_FlushCorpEncourage = 16733,--鼓舞了发消息
  ID_S2C_FlushCorpBattleResult = 16734,--军团战斗发消息
  ID_S2C_FlushFireOn = 16735,--军团集火
  ID_S2C_FlushBattleMemberInfo = 16736,--军团玩家信息
  --军团副本(新版)
  ID_C2S_GetNewCorpChapter= 16800,--获取军团副本信息
  ID_S2C_GetNewCorpChapter = 16801,
  ID_C2S_GetNewCorpDungeonInfo= 16802,--获取军团副本信息
  ID_S2C_GetNewCorpDungeonInfo = 16803,
  ID_C2S_ExecuteNewCorpDungeon = 16804,--获取军团副本信息
  ID_S2C_ExecuteNewCorpDungeon = 16805,
  ID_S2C_FlushNewCorpDungeon =16806,--有信息刷新 通知
  ID_C2S_GetNewDungeonAwardList = 16807,--获取军团副本砸蛋列表
  ID_S2C_GetNewDungeonAwardList = 16808,--
  ID_C2S_GetNewDungeonAward = 16809,--砸蛋
  ID_S2C_GetNewDungeonAward = 16810,
  ID_C2S_GetNewDungeonCorpMemberRank = 16811,--军团个人排行
  ID_S2C_GetNewDungeonCorpMemberRank = 16812,
  ID_S2C_FlushNewDungeonAward = 16813,
  ID_C2S_ResetNewDungeonCount = 16814,--购买副本挑战次数
  ID_S2C_ResetNewDungeonCount = 16815,--购买副本挑战次数
  ID_C2S_GetNewChapterAward = 16816,--获取章节奖励
  ID_S2C_GetNewChapterAward = 16817,--
  ID_C2S_GetNewDungeonAwardHint = 16818,--获取军团副本砸蛋领奖相关
  ID_S2C_GetNewDungeonAwardHint = 16819,--
  ID_C2S_GetNewCorpChapterRank = 16820,--军团副本总排行
  ID_S2C_GetNewCorpChapterRank = 16821,
  ID_C2S_SetNewCorpRollbackChapter = 16822, --设置回退军团副本
  ID_S2C_SetNewCorpRollbackChapter = 16823,
  ID_C2S_GetCorpDungeonOption = 16824, --军团副本设置
  ID_S2C_GetCorpDungeonOption = 16825,
  ID_C2S_SetCorpDungeonOption = 16826, --军团副本设置
  ID_S2C_SetCorpDungeonOption = 16827,

  ID_C2S_GetCorpTechInfo = 16900, --获取军团科技信息
  ID_S2C_GetCorpTechInfo = 16901,
  ID_C2S_DevelopCorpTech = 16902, --研发军团科技
  ID_S2C_DevelopCorpTech = 16903,
  ID_C2S_LearnCorpTech = 16904, -- 学习军团科技
  ID_S2C_LearnCorpTech = 16905,
  ID_C2S_CorpUpLevel = 16906, -- 军团手动升级
  ID_S2C_CorpUpLevel = 16907,
  ID_S2C_DevelopCorpTechBroadcast = 16908, --军团科技等级变化时广播
  ID_S2C_CorpUpLevelBroadcast = 16909, --军团升级广播

  --精英副本
  ID_C2S_Hard_GetChapterList = 14400,
  ID_S2C_Hard_GetChapterList = 14401,
  ID_C2S_Hard_GetChapterRank = 14402,
  ID_S2C_Hard_GetChapterRank = 14403,
  ID_S2C_Hard_AddStage = 14404,
  ID_C2S_Hard_ExecuteStage  = 14405,
  ID_S2C_Hard_ExecuteStage  = 14406,
  ID_C2S_Hard_FastExecuteStage  = 14407,
  ID_S2C_Hard_FastExecuteStage  = 14408,
  ID_C2S_Hard_FinishChapterBoxRwd  = 14409,--获取箱子奖励
  ID_S2C_Hard_FinishChapterBoxRwd  = 14410,
  ID_C2S_Hard_ResetDungeonExecution = 14411,--重置副本次数
  ID_S2C_Hard_ResetDungeonExecution = 14412,
  ID_S2C_Hard_ExecuteMultiStage = 14413,--副本战斗多战报协议
  ID_C2S_Hard_ExecuteMultiStage = 14414,
  ID_S2C_Hard_FirstEnterChapter = 14415,--第一次进入设置TAG
  ID_C2S_Hard_FirstEnterChapter = 14416,
  ID_S2C_Hard_GetChapterRoit = 14417,--获取精英副本暴动列表
  ID_C2S_Hard_GetChapterRoit = 14418,
  ID_S2C_Hard_FinishChapterRoit = 14419,--解决副本暴动
  ID_C2S_Hard_FinishChapterRoit = 14420,
  ID_C2S_Hard_FastExecuteStageOneKey = 14421,
  ID_S2C_Hard_FastExecuteStageOneKey = 14422,
  ID_C2S_ResetHardStageOneKey = 14423,
  ID_S2C_ResetHardStageOneKey = 14424,

  -- 赌博
  ID_C2S_WheelInfo = 14500,
  ID_S2C_WheelInfo = 14501,
  ID_C2S_PlayWheel = 14502,
  ID_S2C_PlayWheel = 14503,
  ID_C2S_WheelReward = 14504,
  ID_S2C_WheelReward = 14505,
  ID_C2S_WheelRankingList = 14506,
  ID_S2C_WheelRankingList = 14507,

  ID_C2S_GoldWheelInfo = 14520,
  ID_S2C_GoldWheelInfo = 14521,
  ID_C2S_PlayGoldWheel = 14522,
  ID_S2C_PlayGoldWheel = 14523,
  ID_C2S_GoldWheelReward = 14524,
  ID_S2C_GoldWheelReward = 14525,
  ID_C2S_GoldWheelRankingList = 14526,
  ID_S2C_GoldWheelRankingList = 14527,
  ID_C2S_GoldWheelProcessReward = 14528,--领取轮盘积分进度奖
  ID_S2C_GoldWheelProcessReward = 14529,
  
	-- vip周礼包
  ID_C2S_VipDiscountInfo = 14600,
  ID_S2C_VipDiscountInfo = 14601,
  ID_C2S_BuyVipDiscount = 14602,
  ID_S2C_BuyVipDiscount = 14603,

  --单人跨服战
  ID_C2S_GetCrossBattleInfo = 14700,--获取跨服战信息
  ID_S2C_GetCrossBattleInfo = 14701,
  ID_C2S_GetCrossBattleTime = 14702,--获取跨服战时间
  ID_S2C_GetCrossBattleTime = 14703,
  --ID_C2S_GetCrossBattleGroup = 14704,--获取跨服战国家信息 --不用了
  --ID_S2C_GetCrossBattleGroup = 14705,
  ID_C2S_SelectCrossBattleGroup = 14706,--选择跨服战国家
  ID_S2C_SelectCrossBattleGroup = 14707,
  ID_C2S_EnterScoreBattle = 14708,--进入积分赛界面
  ID_S2C_EnterScoreBattle = 14709,
  ID_C2S_GetCrossBattleEnemy = 14710, --获取积分赛对手信息
  ID_S2C_GetCrossBattleEnemy = 14711,
  ID_C2S_ChallengeCrossBattleEnemy = 14712,--挑战对手
  ID_S2C_ChallengeCrossBattleEnemy = 14713,
  ID_C2S_GetWinsAwardInfo = 14714,--获取连胜信息
  ID_S2C_GetWinsAwardInfo= 14715,
  ID_C2S_FinishWinsAward = 14716,--获取连胜奖励
  ID_S2C_FinishWinsAward= 14717,
  ID_C2S_GetCrossBattleRank = 14718,--获取跨服战排名
  ID_S2C_GetCrossBattleRank = 14719,
  ID_C2S_CrossCountReset = 14720,--购买相关刷新次数
  ID_S2C_CrossCountReset = 14721,
  ID_S2C_FlushCrossContestScore = 14722,--跨服刷新积分
  ID_S2C_FlushCrossContestRank = 14723,--跨服刷新排名
  --争霸赛
  ID_C2S_GetCrossArenaInfo = 14724,--争霸赛信息
  ID_S2C_GetCrossArenaInfo = 14725,
  ID_C2S_GetCrossArenaInvitation = 14726,--邀请函信息
  ID_S2C_GetCrossArenaInvitation = 14727,
  ID_C2S_GetCrossArenaBetsInfo = 14728,--押注信息
  ID_S2C_GetCrossArenaBetsInfo = 14729,
  ID_C2S_GetCrossArenaBetsList = 14730,--押注列表
  ID_S2C_GetCrossArenaBetsList = 14731,
  ID_C2S_CrossArenaPlayBets = 14732,--押注玩家
  ID_S2C_CrossArenaPlayBets = 14733,
  ID_C2S_GetCrossArenaRankTop = 14734,--前十
  ID_S2C_GetCrossArenaRankTop = 14735,
  ID_C2S_GetCrossArenaRankUser = 14736,--自己周围的玩家信息
  ID_S2C_GetCrossArenaRankUser = 14737,
  ID_C2S_CrossArenaRankChallenge = 14738,--挑战
  ID_S2C_CrossArenaRankChallenge = 14739,--
  ID_C2S_CrossArenaCountReset = 14740,--购买相关刷新次数
  ID_S2C_CrossArenaCountReset = 14741,
  ID_C2S_GetCrossArenaBetsAward = 14742,--获取押注奖励
  ID_S2C_GetCrossArenaBetsAward = 14743,
  ID_C2S_CrossArenaServerAwardInfo = 14744,--获取全服奖励信息
  ID_S2C_CrossArenaServerAwardInfo = 14745,
  ID_C2S_FinishCrossArenaServerAward = 14746,--完成全服奖励
  ID_S2C_FinishCrossArenaServerAward = 14747,
  ID_C2S_FinishCrossArenaBetsAward = 14748,--完成押注奖励
  ID_S2C_FinishCrossArenaBetsAward = 14749,
  ID_C2S_CrossArenaAddBets = 14750,--押注
  ID_S2C_CrossArenaAddBets = 14751,
  ID_C2S_GetCrossUserDetail = 14752,--获取跨服玩家信息
  ID_S2C_GetCrossUserDetail = 14753,

	--大富翁活动
  ID_C2S_RichInfo = 14800,
  ID_S2C_RichInfo = 14801,
  ID_C2S_RichMove = 14804,
  ID_S2C_RichMove = 14805,
  ID_C2S_RichBuy = 14806,
  ID_S2C_RichBuy = 14807,
  ID_C2S_RichReward = 14808,
  ID_S2C_RichReward = 14809,
  ID_C2S_RichRankingList = 14810,
  ID_S2C_RichRankingList = 14811,

  --限时副本
  ID_C2S_GetTimeDungeonList = 14900, --取限时副本活动列表
  ID_S2C_GetTimeDungeonList = 14901,
  ID_S2C_FlushTimeDungeonList = 14902, --推送限时副本活动列表
  ID_C2S_GetTimeDungeonInfo = 14903, --取限时副本活动信息
  ID_S2C_GetTimeDungeonInfo = 14904,
  ID_C2S_AddTimeDungeonBuff = 14905, --鼓舞
  ID_S2C_AddTimeDungeonBuff = 14906,
  ID_C2S_AttackTimeDungeon = 14907, --挑战
  ID_S2C_AttackTimeDungeon = 14908,

  --动态代码ID
  ID_C2S_GetCodeId = 15000,
  ID_S2C_GetCodeId = 15001,
  ID_C2S_GetCode = 15002,
  ID_S2C_GetCode= 15003,
  ID_C2S_SetCDLevel = 15004,
  ID_S2C_SetCDLevel= 15005,

	--叛军BOSS
	ID_C2S_EnterRebelBossUI = 15101,
	ID_S2C_EnterRebelBossUI = 15102,
	--ID_C2S_RebelBossEncourage = 15103,
	--ID_S2C_RebleBossEncourage = 15104,
	ID_C2S_SelectAttackRebelBossGroup = 15105,
	ID_S2C_SelectAttackRebelBossGroup = 15106,
	ID_C2S_ChallengeRebelBoss = 15107,
	ID_S2C_ChallengeRebelBoss = 15108,
	ID_C2S_RebelBossRank = 15109,
	ID_S2C_RebelBossRank = 15110,
	ID_C2S_RebelBossAwardInfo = 15111,
	ID_S2C_RebelBossAwardInfo = 15112,
	ID_C2S_RebelBossAward = 15113,
	ID_S2C_RebelBossAward = 15114,
	ID_C2S_RefreshRebelBoss = 15115,
	ID_S2C_RefreshRebelBoss = 15116,
	ID_C2S_PurchaseAttackCount = 15117,
	ID_S2C_PurchaseAttackCount = 15118,
	ID_C2S_GetRebelBossReport = 15119,
	ID_S2C_GetRebelBossReport = 15120,
	ID_C2S_RebelBossCorpAwardInfo = 15121,
	ID_S2C_RebelBossCorpAwardInfo = 15122,
	ID_C2S_FlushBossACountTime = 15123,
	ID_S2C_FlushBossACountTime = 15124,
  ID_C2S_GetRebelBossCrossUserRank = 15125,
  ID_S2C_GetRebelBossCrossUserRank = 15126,
  ID_C2S_GetRebelBossCrossCorpRank = 15127,
  ID_S2C_GetRebelBossCrossCorpRank = 15128,
	ID_C2S_RebelBossOneKeyAward = 15129,
	ID_S2C_RebelBossOneKeyAward = 15130,
  ID_C2S_ChallengeRebelBossLocal = 15131,
  ID_S2C_ChallengeRebelBossLocal = 15132,

	--叛军boss扩展
	ID_C2S_RebelBossCrossInfo = 15150,
	ID_S2C_RebelBossCrossInfo = 15151,
	ID_C2S_RebelBossCrossChallenge = 15152,
	ID_S2C_RebelBossCrossChallenge = 15153,
	ID_C2S_RebelBossCrossListen = 15154,
	ID_S2C_RebelBossCrossListen = 15155,
	ID_C2S_RebelBossCrossReport = 15156,
	ID_S2C_RebelBossCrossReport = 15157,
	ID_S2C_RebelBossCrossHarm = 15158,
	ID_S2C_RebelBossCrossChallengeCount = 15159,
	ID_C2S_RebelBossCrossBattleTest = 15160,	--战斗测试
	ID_S2C_RebelBossCrossBattleTest = 15161,

	ID_C2S_GetBlackcardWarning = 15200, --黑卡警告
	ID_S2C_GetBlackcardWarning = 15201, --黑卡警告

	--laxin
	ID_C2S_GetSpreadId = 15300,
	ID_S2C_GetSpreadId = 15301,
	 --invited req register
	ID_C2S_RegisterId = 15302,
	ID_S2C_RegisterId = 15303,

	--laxin 老玩家领奖
	ID_C2S_InvitorGetRewardInfo = 15304,
	ID_S2C_InvitorGetRewardInfo = 15305,
	ID_C2S_InvitorDrawLvlReward = 15306,
	ID_S2C_InvitorDrawLvlReward = 15307,
	ID_C2S_InvitorDrawScoreReward = 15308,
	ID_S2C_InvitorDrawScoreReward = 15309,
	--laxin  新玩家领奖
	ID_C2S_InvitedDrawReward = 15310,
	ID_S2C_InvitedDrawReward = 15311,
	ID_C2S_InvitedGetDrawReward = 15312,
	ID_S2C_InvitedGetDrawReward = 15313,

	ID_C2S_QueryRegisterRelation = 15314,
	ID_S2C_QueryRegisterRelation = 15315,
    --新玩家得到老玩家name
	ID_C2S_GetInvitorName = 15316,
	ID_S2C_GetInvitorName = 15317,

  --5.7.0--三国纪要
  ID_C2S_GetUserSummarys = 15350, --三国纪要信息
  ID_S2C_GetUserSummarys = 15351, 
  ID_C2S_CompUserSummary = 15352, --领取奖励
  ID_S2C_CompUserSummary = 15353,
  ID_S2C_UserSummaryNtf  = 15354,--三国纪要任务信息通知

  --限时优惠
  ID_C2S_ShopTimeInfo = 15400,			--获取主界面信息
  ID_S2C_ShopTimeInfo = 15401,
  ID_C2S_ShopTimeRewardInfo = 15402,    --获取全服福利信息
  ID_S2C_ShopTimeRewardInfo = 15403,
  ID_C2S_ShopTimeGetReward = 15404,		--领取全服福利
  ID_S2C_ShopTimeGetReward = 15405,
  ID_S2C_ShopTimePurchase = 15406,		--购买成功返回信息
  ID_C2S_ShopTimeStartTime = 15407,		--请求开服时间
  ID_S2C_ShopTimeStartTime = 15408,

  -- vip日礼包
  ID_C2S_VipDailyInfo = 15500,
  ID_S2C_VipDailyInfo = 15501,
  ID_C2S_BuyVipDaily = 15502,
  ID_S2C_BuyVipDaily = 15503,

  --抢粮草
  ID_C2S_GetUserRice = 15600, --获取玩家粮草信息
  ID_S2C_GetUserRice = 15601,
  ID_S2C_UpdateUserRice = 15602, --更新客服端玩家粮草信息(包括对手信息)
  ID_C2S_FlushRiceRivals = 15603, --刷新对手
  ID_S2C_FlushRiceRivals = 15604,
  ID_C2S_RobRice = 15605, --抢粮
  ID_S2C_RobRice = 15606,
  ID_S2C_ChangeUserRice = 15607, --更新客户端玩家粮草数据
  ID_C2S_GetRiceEnemyInfo = 15608, --获取仇人列表
  ID_S2C_GetRiceEnemyInfo = 15609,
  ID_C2S_RevengeRiceEnemy = 15610, --复仇
  ID_S2C_RevengeRiceEnemy = 15611,
  ID_C2S_GetRiceAchievement = 15612, --获得成就
  ID_S2C_GetRiceAchievement = 15613,
  ID_C2S_GetRiceRankList = 15614, --获取排行榜
  ID_S2C_GetRiceRankList = 15615,
  ID_C2S_GetRiceRankAward = 15616, --获取排行奖励
  ID_S2C_GetRiceRankAward = 15617,
  ID_C2S_BuyRiceToken = 15618, --获取排行奖励
  ID_S2C_BuyRiceToken = 15619,
  ID_S2C_FlushRiceRank = 15620, --推送粮草排名
  -- GM 后台推送消息
  ID_C2S_PushSingleInfo = 15621,
  ID_S2C_PushSingleInfo = 15622,
  ID_C2S_GmChangeName   = 15623,  --后台改名,只修改跨服

  --月基金
  ID_C2S_GetMonthFundBaseInfo = 15700,
  ID_S2C_GetMonthFundBaseInfo = 15701,
  ID_C2S_GetMonthFundAwardInfo = 15702,
  ID_S2C_GetMonthFundAwardInfo = 15703,
  ID_C2S_GetMonthFundAward = 15704,
  ID_S2C_GetMonthFundAward = 15705,

  -- 限时抽卡
  ID_C2S_ThemeDropZY			= 15750,
  ID_S2C_ThemeDropZY			= 15751,
  ID_C2S_ThemeDropAstrology		= 15752,
  ID_S2C_ThemeDropAstrology		= 15753,
  ID_C2S_ThemeDropExtract		= 15754,
  ID_S2C_ThemeDropExtract		= 15755,

  -- 新日常副本
  ID_C2S_DungeonDailyInfo		= 15776,
  ID_S2C_DungeonDailyInfo		= 15777,
  ID_C2S_DungeonDailyChallenge  = 15778,
  ID_S2C_DungeonDailyChallenge  = 15779,

  --SpeXialScore(for tw)
  ID_C2S_GetSpeXialScoreInfo = 15800, --获取积分信息
  ID_S2C_GetSpeXialScoreInfo = 15801,
  ID_C2S_GetSpeXialScoreRank = 15802, --获取积分排名信息
  ID_S2C_GetSpeXialScoreRank = 15803,
  ID_C2S_GetSpeXialScoreAward = 15804, --获取积分成就奖励
  ID_S2C_GetSpeXialScoreAward = 15805,
  --社交账号绑定奖励(for sm)
  ID_C2S_GetAccountBindingInfo = 15810, --获取账号绑定信息
  ID_S2C_GetAccountBindingInfo = 15811,
  ID_C2S_GetAccountBindingAward = 15812, --获得绑定奖励
  ID_S2C_GetAccountBindingAward = 15813,

	--无双博士
  ID_C2S_WushBossInfo = 15900,
  ID_S2C_WushBossInfo = 15901,
  ID_C2S_WushBossChallenge = 15902,
  ID_S2C_WushBossChallenge = 15903,
  ID_C2S_WushBossBuy = 15904,
  ID_S2C_WushBossBuy = 15905,

  --限时团购
  ID_C2S_GetGroupBuyConfig	= 17000,		--获取配置
  ID_S2C_GetGroupBuyConfig	= 17001,
  ID_C2S_GetGroupBuyMainInfo	= 17002,		--主界面
  ID_S2C_GetGroupBuyMainInfo	= 17003,
  ID_C2S_GetGroupBuyRanking	= 17004,		--排行榜
  ID_S2C_GetGroupBuyRanking	= 17005,
  ID_C2S_GetGroupBuyTaskAwardInfo = 17006,	--任务奖励
  ID_S2C_GetGroupBuyTaskAwardInfo = 17007,
  ID_C2S_GetGroupBuyTaskAward	= 17008,	--领取奖励
  ID_S2C_GetGroupBuyTaskAward	= 17009,
  ID_C2S_GetGroupBuyEndInfo		= 17010,	--结束界面
  ID_S2C_GetGroupBuyEndInfo		= 17011,
  ID_C2S_GetGroupBuyRankAward	= 17012,	--排行奖励
  ID_S2C_GetGroupBuyRankAward	= 17013,
  ID_C2S_GroupBuyPurchaseGoods	= 17014,	--购买商品
  ID_S2C_GroupBuyPurchaseGoods	= 17015,
  ID_C2S_GetGroupBuyTimeInfo	= 17016,	--活动时间配置
  ID_S2C_GetGroupBuyTimeInfo	= 17017,

  --新手光环
  ID_C2S_RookieInfo = 17100,
  ID_S2C_RookieInfo = 17101,
  ID_C2S_GetRookieReward = 17102,
  ID_S2C_GetRookieReward = 17103,

  -- 人物头像框设置
  ID_C2S_SetPictureFrame = 17150,
  ID_S2C_SetPictureFrame = 17151,
	-- 聊天泡泡设置
	ID_C2S_SetChatBubble = 17152,
	ID_S2C_SetChatBubble = 17153,

  --活动入口时间配置
  ID_C2S_GetActivityTimeInfo = 17160,
  ID_S2C_GetActivityTimeInfo = 17161,

  --百战沙场
  ID_C2S_GetBattleFieldInfo = 17200,
  ID_S2C_GetBattleFieldInfo = 17201,
  ID_C2S_BattleFieldDetail = 17202,
  ID_S2C_BattleFieldDetail = 17203,
  ID_C2S_ChallengeBattleField = 17204,
  ID_S2C_ChallengeBattleField = 17205,
  ID_C2S_BattleFieldAwardInfo = 17206,
  ID_S2C_BattleFieldAwardInfo = 17207,
  ID_C2S_GetBattleFieldAward = 17208,
  ID_S2C_GetBattleFieldAward = 17209,
  ID_C2S_BattleFieldShopInfo = 17210,
  ID_S2C_BattleFieldShopInfo = 17211,
  ID_C2S_BattleFieldShopRefresh = 17212,
  ID_S2C_BattleFieldShopRefresh = 17213,
  ID_C2S_GetBattleFieldRank = 17214,
  ID_S2C_GetBattleFieldRank = 17215,

  -- 奇门八卦活动
  ID_C2S_TrigramInfo = 17300,
  ID_S2C_TrigramInfo = 17301,
  ID_C2S_TrigramPlay = 17302,
  ID_S2C_TrigramPlay = 17303,
  ID_C2S_TrigramPlayAll = 17304,
  ID_S2C_TrigramPlayAll = 17305,
  ID_C2S_TrigramRefresh = 17306,
  ID_S2C_TrigramRefresh = 17307,
  ID_C2S_TrigramReward = 17308,
  ID_S2C_TrigramReward = 17309,

  ID_C2S_GetTrigramRank = 17310,
  ID_S2C_GetTrigramRank = 17311,

  ID_C2S_TrigramScoreBox = 17312,
  ID_S2C_TrigramScoreBox = 17313,

  -- 长假活动 中秋国庆
  ID_C2S_GetSpecialHolidayActivity = 17400,
  ID_S2C_GetSpecialHolidayActivity = 17401,
  ID_S2C_UpdateSpecialHolidayActivity = 17402,
  ID_C2S_GetSpecialHolidayActivityReward = 17403,
  ID_S2C_GetSpecialHolidayActivityReward = 17404,
  ID_C2S_GetSpecialHolidaySales = 17405,
  ID_S2C_GetSpecialHolidaySales = 17406,
  ID_C2S_BuySpecialHolidaySale = 17407,
  ID_S2C_BuySpecialHolidaySale = 17408,

  ID_C2S_GetSpecialHolidayGodInfo = 17409,
  ID_S2C_GetSpecialHolidayGodInfo = 17410,
  ID_C2S_ConstructSpecialHolidayGod = 17411,
  ID_S2C_ConstructSpecialHolidayGod = 17412,
  ID_C2S_GetSpecialHolidayGodAward = 17413,
  ID_S2C_GetSpecialHolidayGodAward = 17414,
  ID_S2C_PushSpecialHolidayGodInfo = 17415,
  ID_C2S_GetAllSpeciallHolidayGodAward = 17416,
  ID_S2C_GetAllSpeciallHolidayGodAward = 17417,
  ID_S2C_PushConstructGodRecords = 17418,
  ID_C2S_PullSpecialHolidayGodInfo = 17419,
  ID_C2S_GetExcelSpecialHolidayInfo = 17420,
  ID_S2C_GetExcelSpecialHolidayInfo = 17421,
  ID_C2S_GetExcelSpecialHolidaySale = 17422,
  ID_S2C_GetExcelSpecialHolidaySale = 17423,
 
  --6.3.0-少年节新铸神像
  ID_C2S_ConstructJuvenileGod = 17432,	--铸造
  ID_S2C_ConstructJuvenileGod = 17433,
  ID_C2S_GetJuvenileGodAward = 17434,	--领奖
  ID_S2C_GetJuvenileGodAward = 17435,


  --三国庆典
  ID_C2S_CelebrationInfo = 17450,
  ID_S2C_CelebrationInfo = 17451,
  ID_C2S_CelebrationRechargeUserData = 17452,
  ID_S2C_CelebrationRechargeUserData = 17453,
  ID_C2S_CelebrationShopUserData = 17454,
  ID_S2C_CelebrationShopUserData = 17455,
  ID_C2S_CelebrationTaskUserData = 17456,
  ID_S2C_CelebrationTaskUserData = 17457,
  ID_C2S_CelebrationCheckReward = 17458,
  ID_S2C_CelebrationCheckReward = 17459,
  ID_C2S_CelebrationBuyGoods = 17460,
  ID_S2C_CelebrationBuyGoods = 17461,
	ID_C2S_CelebrationCheckAreaReward = 17462,
	ID_S2C_CelebrationCheckAreaReward = 17463,

  -- vip周商店
  ID_C2S_VipWeekShopInfo = 17500,
  ID_S2C_VipWeekShopInfo = 17501,
  ID_C2S_VipWeekShopBuy = 17502,
  ID_S2C_VipWeekShopBuy = 17503,

  --资料片副本
  ID_C2S_GetExpansiveDungeonChapterList = 17600,
  ID_S2C_GetExpansiveDungeonChapterList = 17601,
  ID_C2S_ExcuteExpansiveDungeonStage = 17602,
  ID_S2C_ExcuteExpansiveDungeonStage = 17603,
  ID_C2S_GetExpansiveDungeonChapterReward = 17604,
  ID_S2C_GetExpansiveDungeonChapterReward = 17605,
  ID_C2S_FirstEnterExpansiveDungeonChapter = 17606,
  ID_S2C_FirstEnterExpansiveDungeonChapter = 17607,
  ID_S2C_AddExpansiveDungeonNewStage = 17608,
  ID_C2S_PurchaseExpansiveDungeonShopItem = 17609,
  ID_S2C_PurchaseExpansiveDungeonShopItem = 17610,


  --宠物 18000 - 18099 为宠物
  ID_S2C_GetPet = 18000,
  ID_C2S_PetUpLvl = 18001,
  ID_S2C_PetUpLvl = 18002,
  ID_C2S_PetUpStar = 18003,
  ID_S2C_PetUpStar = 18004,
  ID_C2S_PetUpAddition = 18005,    --宠物神练
  ID_S2C_PetUpAddition = 18006,
  ID_C2S_ChangeFightPet = 18007,    --宠物上阵
  ID_S2C_ChangeFightPet = 18008,
  ID_C2S_RecyclePet = 18009,		--回收宠物（分解和重生）
  ID_S2C_RecyclePet = 18010,
  ID_C2S_PetFightValue = 18011,
  ID_S2C_PetFightValue = 18012,
  ID_C2S_GetPetProtect = 18013,
  ID_S2C_GetPetProtect = 18014,
  ID_C2S_SetPetProtect = 18015,
  ID_S2C_SetPetProtect = 18016,
  ID_C2S_PetSwallow = 18017, --金宠吞噬
  ID_S2C_PetSwallow = 18018,
  ID_C2S_PetFormation = 18019, --暗金宠玄阵
  ID_S2C_PetFormation = 18020,
  ID_C2S_PetFormationUpdate = 18021, --暗金宠玄阵升级
  ID_S2C_PetFormationUpdate = 18022,
  ID_C2S_PetFormationUpdateOneKey = 18023, --暗金宠玄阵一键升级
  ID_S2C_PetFormationUpdateOneKey = 18024,
  ID_C2S_DGPetFormation = 18025, --彩金宠暗金玄阵
  ID_S2C_DGPetFormation = 18026,
  ID_C2S_DGPetUpFormation = 18027,-- 彩金的暗金玄阵升阶
  ID_S2C_DGPetUpFormation = 18028,
  ID_C2S_DGPetUpFormationOneKey = 18029,-- 彩金的暗金玄阵一键
  ID_S2C_DGPetUpFormationOneKey = 18030,
	--6.0.0鎏金宠相关
  ID_C2S_CGPetFormation	= 18031,	--鎏金宠彩金玄阵
  ID_S2C_CGPetFormation	= 18032,
  ID_C2S_CGPetUpFormation = 18033,	-- 鎏金宠彩金阵升级
  ID_S2C_CGPetUpFormation = 18034,
  ID_C2S_CGPetUpFormationOneKey = 18035,	-- 鎏金宠彩金玄阵一键
  ID_S2C_CGPetUpFormationOneKey = 18036,
  ID_C2S_CGPetSummoningSkill	= 18037,	-- 宠护佑技能调整
  ID_S2C_CGPetSummoningSkill	= 18038,

  --跨服夺帅
  ID_C2S_GetCrossPvpSchedule = 19000,	-- 拉取所有配置信息
  ID_S2C_GetCrossPvpSchedule = 19001,
  ID_C2S_GetCrossPvpBaseInfo = 19002,	-- 拉取基本信息，round 和state主控
  ID_S2C_GetCrossPvpBaseInfo = 19003,
  ID_C2S_GetCrossPvpScheduleInfo = 19004, --每个战场信息（等级 人数...）
  ID_S2C_GetCrossPvpScheduleInfo = 19005,
  ID_C2S_ApplyCrossPvp = 19006,			--跨服夺帅报名
  ID_S2C_ApplyCrossPvp = 19007,
  --ID_C2S_GetAtcAndDefCrossPvp = 19008,  --鼓舞信息
  --ID_S2C_GetAtcAndDefCrossPvp = 19009,
  ID_C2S_ApplyAtcAndDefCrossPvp = 19010,--鼓舞
  ID_S2C_ApplyAtcAndDefCrossPvp = 19011,
  ID_C2S_GetCrossPvpRole = 19012,	--获取角色信息 (感觉没什么用啊)
  ID_S2C_GetCrossPvpRole = 19013,
  ID_C2S_GetCrossPvpArena = 19015,		--获取跨服战坑位信息
  ID_S2C_GetCrossPvpArena = 19016,
  ID_C2S_GetCrossPvpRank = 19017,		--获取排行榜
  ID_S2C_GetCrossPvpRank = 19018,
  ID_C2S_CrossPvpBattle = 19019,		--攻打坑位
  ID_S2C_CrossPvpBattle = 19020,
  ID_S2C_FlushCrossPvpArena = 19021,	--推送坑位变化信息同房间玩家
  ID_S2C_FlushCrossPvpSpecific = 19022,	--推送坑位变化信息给坑位上原玩家
  ID_S2C_FlushCrossPvpScore = 19023,	--推送积分变化
  ID_C2S_GetCrossPvpDetail = 19024,		--玩家战斗信息
  ID_S2C_GetCrossPvpDetail = 19025,
  ID_C2S_CrossPvpGetAward = 19026,		--领取排行奖励
  ID_S2C_CrossPvpGetAward = 19027,
  ID_C2S_CrossWaitInit = 19028,			--获取等待界面信息
  ID_S2C_CrossWaitInit = 19029,
  ID_C2S_CrossWaitRank = 19030,			--获取上一轮的排行榜
  ID_S2C_CrossWaitRank = 19031,
  ID_C2S_CrossWaitFlower = 19032,		--送鲜花扔鸡蛋
  ID_S2C_CrossWaitFlower = 19033,
  ID_C2S_CrossWaitFlowerRank = 19034,	--鲜花鸡蛋榜
  ID_S2C_CrossWaitFlowerRank = 19035,
  ID_C2S_CrossWaitFlowerAward = 19036,	--投注奖励
  ID_S2C_CrossWaitFlowerAward = 19037,
  ID_C2S_CrossWaitInitFlowerInfo = 19038, --一轮过后鲜花鸡蛋信息
  ID_S2C_CrossWaitInitFlowerInfo = 19039,
  ID_C2S_GetCrossPvpOb= 19040,--获取OB信息
  ID_S2C_GetCrossPvpOb = 19041,

  --弹幕系统
  ID_C2S_GetBulletScreenInfo = 20000,	--拉取弹幕信息
  ID_S2C_GetBulletScreenInfo = 20001,
  ID_C2S_SendBulletScreenInfo = 20002,	--发送弹幕
  ID_S2C_SendBulletScreenInfo = 20003,	--发送弹幕
  ID_S2C_FlushBulletScreen = 20004,

  -- 组队pvp 激战虎牢关
  ID_C2S_TeamPVPStatus = 21000, -- 组队pvp, 查询状态
  ID_S2C_TeamPVPStatus = 21001, -- 组队pvp，状态推送
  ID_C2S_TeamPVPCreateTeam = 21002, -- 组队pvp，创建队伍
  ID_S2C_TeamPVPCreateTeam = 21003,
  ID_C2S_TeamPVPJoinTeam = 21004, -- 组队pvp，加入队伍
  ID_S2C_TeamPVPJoinTeam = 21005,
  ID_C2S_TeamPVPLeave = 21008, --退出组队，及组队匹配
  ID_S2C_TeamPVPLeave = 21009,
  ID_C2S_TeamPVPChangePosition = 21010, -- 队长换位置
  ID_S2C_TeamPVPChangePosition = 21011,
  ID_C2S_TeamPVPKickTeamMember = 21012, -- 队长踢人
  ID_S2C_TeamPVPKickTeamMember = 21013,
  ID_C2S_TeamPVPSetTeamOnlyInvited = 21014, -- 队长设置房间是否开放
  ID_S2C_TeamPVPSetTeamOnlyInvited = 21015,
  ID_C2S_TeamPVPInvite = 21016, -- 邀请
  ID_S2C_TeamPVPInvite = 21017,
  ID_S2C_TeamPVPBeInvited = 21018, -- 被邀请
  ID_C2S_TeamPVPInvitedJoinTeam = 21019, -- 持邀请卡 加入队伍
  ID_S2C_TeamPVPInvitedJoinTeam = 21020,
  ID_S2C_TeamPVPInviteCanceled = 21021,
  ID_C2S_TeamPVPInviteNPC = 21022, --一键邀请
  ID_S2C_TeamPVPInviteNPC = 21023,
  ID_C2S_TeamPVPAgreeBattle = 21024, -- 组员准备好出战
  ID_S2C_TeamPVPAgreeBattle = 21025,
  ID_C2S_TeamPVPMatchOtherTeam = 21026, --队长 出战，组队完成，匹配其他队伍
  ID_S2C_TeamPVPMatchOtherTeam = 21027,
  ID_C2S_TeamPVPStopMatch = 21028, -- 队长取消 匹配其他队伍
  ID_S2C_TeamPVPStopMatch = 21029,
  ID_S2C_TeamPVPBattleResult = 21030, --战斗结果
  ID_C2S_TeamPVPHistoryBattleReport = 21031, -- 获取历史战报
  ID_S2C_TeamPVPHistoryBattleReport = 21032,
  ID_S2C_TeamPVPHistoryBattleReportEnd = 21033,
  ID_C2S_TeamPVPBattleTeamChange = 21034, --通知服务器布阵变化
  ID_S2C_TeamPVPBattleTeamChange = 21035,

  ID_S2C_TeamPVPCrossServerLost = 21040, -- 跨服服务器挂了

  ID_C2S_TeamPVPGetRank = 21041, -- 组队pvp排行版
  ID_S2C_TeamPVPGetRank = 21042,
  ID_C2S_TeamPVPGetUserInfo = 21043, -- 组队pvp玩家荣誉积分等信息
  ID_S2C_TeamPVPGetUserInfo = 21044,
  ID_C2S_TeamPVPBuyAwardCnt = 21045, -- 组队pvp，买奖励次数
  ID_S2C_TeamPVPBuyAwardCnt = 21046,
  ID_C2S_TeamPVPAcceptInvite = 21047, -- 组队pvp，是否接受邀请
  ID_S2C_TeamPVPAcceptInvite = 21048,
  ID_C2S_TeamPVPPopChat = 21049, -- 组队pvp，气泡聊天
  ID_S2C_TeamPVPPopChat = 21050,

  ID_C2S_TeamPVPTeamList = 21051, --队伍情报列表
  ID_S2C_TeamPVPTeamList = 21052,
  ID_C2S_TeamPVPApplyTeam = 21053, --申请加入队伍
  ID_S2C_TeamPVPApplyTeam = 21054,
  ID_C2S_TeamPVPCancelApply = 21055, -- 取消申请
  ID_S2C_TeamPVPCancelApply = 21056,
  ID_C2S_TeamPVPApplyList = 21057, --申请信息
  ID_S2C_TeamPVPApplyList = 21058,
  ID_C2S_TeamPVPApproveApply = 21059, --接受申请
  ID_S2C_TeamPVPApproveApply = 21060,
  ID_C2S_TeamPVPRejectApply = 21061, --拒绝申请
  ID_S2C_TeamPVPRejectApply = 21062,
  ID_S2C_TeamPVPNewApplyer = 21063,

  ID_C2S_TeamPVPSkipBattle = 21064,
  ID_S2C_TeamPVPSkipBattle = 21065,

  --商店标签,方便玩家购买合成所需材料
  ID_C2S_GetShopTag = 21100,
  ID_S2C_GetShopTag = 21101,
  ID_C2S_AddShopTag = 21102,
  ID_S2C_AddShopTag = 21103,
  ID_C2S_DelShopTag = 21104,
  ID_S2C_DelShopTag = 21105,

  --老玩家回归
  ID_C2S_GetOlderPlayerInfo = 21200,
  ID_S2C_GetOlderPlayerInfo = 21201,
  ID_C2S_GetOlderPlayerVipAward = 21202,
  ID_S2C_GetOlderPlayerVipAward = 21203,
  ID_C2S_GetOlderPlayerLevelAward = 21204,
  ID_S2C_GetOlderPlayerLevelAward = 21205,
  ID_C2S_GetOlderPlayerVipExp = 21206,
  ID_S2C_GetOlderPlayerVipExp = 21207,

  --本服老玩家回归
  ID_C2S_GetLocalVeteranInfo = 21250,				--老玩家信息
  ID_S2C_GetLocalVeteranInfo = 21251,
  ID_C2S_LocalVeteranWealFree = 21252,			--福利返还免费领取
  ID_S2C_LocalVeteranWealFree = 21253,
  ID_C2S_LocalVeteranWealBuy = 21254,				--福利返还元宝购买
  ID_S2C_LocalVeteranWealBuy = 21255,
  ID_C2S_LocalVeteranHeroFree = 21256,			--英雄归来免费领取
  ID_S2C_LocalVeteranHeroFree = 21257,
  ID_C2S_LocalVeteranHeroBuy = 21258,				--英雄归来元宝购买
  ID_S2C_LocalVeteranHeroBuy = 21259,
  ID_C2S_LocalVeteranHeroRecharge = 21260,	--英雄归来充值奖励
  ID_S2C_LocalVeteranHeroRecharge = 21261,
  ID_C2S_GetLocalVeteranActionAward = 21262, --三周年任务奖励
  ID_S2C_GetLocalVeteranActionAward = 21263,
  ID_C2S_LocalVeteranExtraBuy = 21264, --三周年活动贩售
  ID_S2C_LocalVeteranExtraBuy = 21265,

  --新服老玩家回归
  ID_C2S_GetNewSerVeteranInfo = 21270,			--新服老玩家信息
  ID_S2C_GetNewSerVeteranInfo = 21271,
  ID_C2S_GetNewSerVeteranVipAward = 21272,	--Vip经验领取
  ID_S2C_GetNewSerVeteranVipAward = 21273,
  ID_C2S_GetNewSerVeteranFreeGold = 21274,	--领取免费元宝
  ID_S2C_GetNewSerVeteranFreeGold = 21275,
  ID_C2S_GetNewSerVeteranGiftBag = 21276,		--优惠礼包
  ID_S2C_GetNewSerVeteranGiftBag = 21277,

  ID_C2S_LocalVeteranExtraGetDirects = 21278,   --请求获得直冲商品列表(用于过了12点之后客户端主动请求一次)
  ID_S2C_LocalVeteranExtraGetDirects = 21279,
  ID_S2C_LocalVeteranExtraDirectChargeSuc = 21280, --直冲完成后服务器推送信息
  ID_C2S_LocalVeteranExtraDirectReward = 21281, --请求领取直冲奖励
  ID_S2C_LocalVeteranExtraDirectReward = 21282,

  -- 充值翻牌
  ID_C2S_RCardInfo = 21300,
  ID_S2C_RCardInfo = 21301,
  ID_C2S_PlayRCard = 21302,
  ID_S2C_PlayRCard = 21303,
  ID_C2S_ResetRCard = 21304,
  ID_S2C_ResetRCard = 21305,
  ID_C2S_RCardBuy = 21306,
  ID_S2C_RCardBuy = 21307,

  ID_C2S_SetClothSwitch = 21311,
  ID_S2C_SetClothSwitch = 21312,

  ID_C2S_GetDays7CompInfo = 21316,
  ID_S2C_GetDays7CompInfo = 21317,
  ID_C2S_GetDays7CompAward = 21318,
  ID_S2C_GetDays7CompAward = 21319,

  ID_C2S_GetClothBook = 21330,
  ID_S2C_GetClothBook = 21331,
  ID_C2S_ChangeCloth = 21332,
  ID_S2C_ChangeCloth = 21333,
  ID_C2S_RenewCloth = 21334, --变装延期
  ID_S2C_RenewCloth = 21335,
  ID_S2C_UpClothBook = 21336, --更新变装图鉴

  ID_C2S_GetKsoul = 21400,--获取将灵信息
  ID_S2C_GetKsoul = 21401,
  ID_C2S_RecycleKsoul = 21402,--回收将灵
  ID_S2C_RecycleKsoul = 21403,
  ID_C2S_ActiveKsoulGroup = 21404,--激活阵图
  ID_S2C_ActiveKsoulGroup = 21405,
  ID_C2S_ActiveKsoulTarget = 21406,--激活成就
  ID_S2C_ActiveKsoulTarget = 21407,
  ID_C2S_SummonKsoul = 21408,--点将
  ID_S2C_SummonKsoul = 21409,
  ID_C2S_SummonKsoulExchange = 21410,--点将奇遇
  ID_S2C_SummonKsoulExchange  = 21411,
  ID_C2S_GetCommonRank =21412,--通用排行榜
  ID_S2C_GetCommonRank =21413,
  ID_C2S_ResetKsoulGroup = 21414,--重置阵图
  ID_S2C_ResetKsoulGroup = 21415,
  ID_C2S_KsoulGold = 21416,--金色将灵
  ID_S2C_KsoulGold = 21417,
	ID_C2S_ActiveKsoulFame = 21420,
	ID_S2C_ActiveKsoulFame = 21421,
	ID_C2S_UpgradeKsoulFame = 21422,
	ID_S2C_UpgradeKsoulFame = 21423,
	ID_C2S_ResetKsoulFame = 21424,
	ID_S2C_ResetKsoulFame = 21425,
	ID_C2S_OneKeyActiveKsoulFame = 21426,
	ID_S2C_OneKeyActiveKsoulFame = 21427,
	ID_C2S_OneKeyUpgradeKsoulFame = 21428,
	ID_S2C_OneKeyUpgradeKsoulFame = 21429,
  ID_C2S_AutoActiveKsoulGroup = 21430,
  ID_S2C_AutoActiveKsoulGroup = 21431,
  ID_C2S_AutoResetKsoulGroup = 21432,
  ID_S2C_AutoResetKsoulGroup = 21433,
  ID_C2S_AutoUpgradeKsoulGroup = 21434,
  ID_S2C_AutoUpgradeKsoulGroup = 21435,

  ID_C2S_OneKeyKsoulFame = 21436, 
  ID_S2C_OneKeyKsoulFame = 21437,
  ID_C2S_OneKeyResetKsoulFame = 21438,
  ID_S2C_OneKeyResetKsoulFame = 21439,

  ID_C2S_KsoulShopInfo = 21450,
  ID_S2C_KsoulShopInfo = 21451,
  ID_C2S_KsoulShopBuy = 21452,
  ID_S2C_KsoulShopBuy = 21453,
  ID_C2S_KsoulShopRefresh = 21454,
  ID_S2C_KsoulShopRefresh = 21455,
  ID_C2S_KsoulDungeonInfo = 21456,
  ID_S2C_KsoulDungeonInfo = 21457,
  ID_C2S_KsoulDungeonRefresh = 21458,
  ID_S2C_KsoulDungeonRefresh = 21459,
  ID_C2S_KsoulDungeonChallenge = 21460,
  ID_S2C_KsoulDungeonChallenge = 21461,
  ID_C2S_KsoulSetFightBase = 21462,
  ID_S2C_KsoulSetFightBase = 21463,
  ID_C2S_KsoulShopManualRefresh = 21464,
  ID_S2C_KsoulShopManualRefresh = 21465,


  --新马服FB分享协议
  ID_C2S_ShareFriendAwardInfo = 21470,
  ID_S2C_ShareFriendAwardInfo = 21471,
  ID_C2S_ShareFriendGetAward = 21472,
  ID_S2C_ShareFriendGetAward = 21473,

  -- 招财
  ID_C2S_FortuneInfo	= 21480,
  ID_S2C_FortuneInfo	= 21481,
  ID_C2S_FortuneBuySilver = 21482,
  ID_S2C_FortuneBuySilver = 21483,
  ID_C2S_FortuneGetBox	= 21484,
  ID_S2C_FortuneGetBox	= 21485,

  ID_C2S_GetSecondWeek = 21500,
  ID_S2C_GetSecondWeek = 21501,
  ID_C2S_SecondWeekAward = 21502,
  ID_S2C_SecondWeekAward = 21503,
  ID_C2S_SecondWeekBuy = 21504,
  ID_S2C_SecondWeekBuy = 21505,

  ID_C2S_CorpMsgBoardContent = 21550,
  ID_S2C_CorpMsgBoardContent = 21551,
  ID_C2S_CorpMsgBoardWrite	 = 21552,
  ID_S2C_CorpMsgBoardWrite	 = 21553,
  ID_C2S_CorpMsgBoardTop	 = 21554,
  ID_S2C_CorpMsgBoardTop = 21555,
  ID_C2S_CorpMsgBoardNewNum = 21556,
  ID_S2C_CorpMsgBoardNewNum = 21557,
  ID_S2C_CorpMsgBoardBroadCast  = 21558,
  ID_C2S_CorpMsgBoardReadProcess = 21559,
  ID_S2C_CorpMsgBoardReadProcess = 21560,
  ID_C2S_CorpMsgBoardDel = 21561,
  ID_S2C_CorpMsgBoardDel = 21562,

  ID_C2S_GetRedEnvRobList = 21600,
  ID_S2C_GetRedEnvRobList = 21601,			--抢红包列表
  ID_C2S_GetRedEnvRankInfo = 21602,
  ID_S2C_GetRedEnvRankInfo = 21603,			--财神榜和手气榜
  ID_C2S_GetRedEnvAchievementInfo = 21604,
  ID_S2C_GetRedEnvAchievementInfo = 21605,	--红包成就
  ID_C2S_RobTheRedEnvelope = 21606,
  ID_S2C_RobTheRedEnvelope = 21607,			--抢红包
  ID_C2S_UseTheRedEnvelope = 21608,
  ID_S2C_UseTheRedEnvelope = 21609,			--发红包
  ID_C2S_GetRedEnvRobRecord = 21610,
  ID_S2C_GetRedEnvRobRecord = 21611,		--领取记录
  ID_C2S_GetRedEnvAchievement = 21612,
  ID_S2C_GetRedEnvAchievement = 21613,	    --领取成就奖励
  ID_S2C_PushRedEnvelope = 21614,			--推送红包信息

  ID_C2S_LegionWarInfo = 21700,--获取信息
  ID_S2C_LegionWarInfo = 21701,
  ID_C2S_LegionWarTime = 21702,--时间信息
  ID_S2C_LegionWarTime = 21703,
  ID_C2S_LegionWarApply = 21704,--报名
  ID_S2C_LegionWarApply = 21705,
  ID_C2S_LegionWarSetDefend = 21706,--布阵
  ID_S2C_LegionWarSetDefend = 21707,
  ID_C2S_LegionWarGetDefend = 21708,--获取布阵信息
  ID_S2C_LegionWarGetDefend = 21709,
  ID_C2S_LegionWarEnemyInfo = 21710,--获取敌方信息
  ID_S2C_LegionWarEnemyInfo = 21711,
  ID_C2S_LegionWarEnemyDetail = 21712,--获取敌方详情
  ID_S2C_LegionWarEnemyDetail = 21713,
  ID_C2S_LegionWarChallengeEnemy= 21714,--挑战敌人
  ID_S2C_LegionWarChallengeEnemy = 21715,
  ID_S2C_LegionWarFlushEnemy = 21716,--刷新跨服数据过来
  ID_C2S_LegionWarGetAward =21717,--领奖
  ID_S2C_LegionWarGetAward =21718,--领奖
  ID_C2S_LegionWarCountReset = 21719,--购买相关刷新次数
  ID_S2C_LegionWarCountReset = 21720,
  ID_C2S_LegionWarSetFireOn= 21721,--设置集火
  ID_S2C_LegionWarSetFireOn= 21722,
  ID_C2S_LegionWarSelfInfo = 21723,--获取防守信息
  ID_S2C_LegionWarSelfInfo = 21724,
  ID_C2S_LegionWarWaitInfo = 21725,--获取战斗结束信息
  ID_S2C_LegionWarWaitInfo = 21726,
  ID_C2S_LegionWarMemberInfo = 21727,--获取军团成员信息
  ID_S2C_LegionWarMemberInfo = 21728,
  ID_C2S_LegionWarGetUserRank = 21729,--玩家排行榜 游戏服走通用
  ID_S2C_LegionWarGetUserRank =21730,
  ID_C2S_LegionWarGetCorpRank = 21731,--军团排行榜
  ID_S2C_LegionWarGetCorpRank =21732,

  ID_C2S_GetLuckyBag = 21800,--获取福袋信息
  ID_S2C_GetLuckyBag = 21801,
  ID_C2S_LuckyBagAward = 21802,--获取福袋奖励
  ID_S2C_LuckyBagAward = 21803,
  ID_C2S_GetLuckyBagUser = 21804,--获取福袋玩家列表
  ID_S2C_GetLuckyBagUser = 21805,
  ID_S2C_FlushLuckyBagUser = 21806,

  ID_C2S_GetNewYearCardAward = 21807,	--领取新年贺卡奖励
  ID_S2C_GetNewYearCardAward = 21808,

  ID_C2S_GetWingBag = 22000,--获得神翼背包
  ID_S2C_GetWingBag = 22001,--获得神翼背包
  ID_C2S_ChangeWing = 22002,--装备神翼
  ID_S2C_ChangeWing = 22003,--装备神翼
  ID_C2S_RebirthWing = 22004,--重铸神翼
  ID_S2C_RebirthWing = 22005,--重铸神翼
  ID_C2S_UpLvlWing = 22006,--重铸神翼
  ID_S2C_UpLvlWing = 22007,--重铸神翼
  ID_C2S_GemSetWing = 22008,--镶嵌宝石神翼
  ID_S2C_GemSetWing = 22009,--镶嵌宝石神翼
  ID_C2S_GemUnsetWing = 22010,--卸载宝石神翼
  ID_S2C_GemUnsetWing = 22011,--卸载宝石神翼
  ID_C2S_GetWingProtect = 22012,--神翼护佑信息
  ID_S2C_GetWingProtect = 22013,--神翼护佑信息
  ID_C2S_SetWingProtect = 22014,--设置神翼护佑
  ID_S2C_SetWingProtect = 22015,--设置神翼护佑
  ID_C2S_DelWingProtect = 22016,--卸下神翼护佑
  ID_S2C_DelWingProtect = 22017,--卸下神翼护佑
	ID_C2S_UpStarWing = 22018,	--神翼升星
	ID_S2C_UpStarWing = 22019,
	ID_C2S_WingMoultUpgrade = 22020,--神翼脱羽
	ID_S2C_WingMoultUpgrade = 22021,

  ID_C2S_GetGemList = 22100, --获取宝石背包
  ID_S2C_GetGemList = 22101, --获取宝石背包
  ID_C2S_ComposeGem = 22102, --合成宝石
  ID_S2C_ComposeGem = 22103, --合成宝石
  ID_C2S_TransformGem = 22104, --转换宝石
  ID_S2C_TransformGem = 22105, --转换宝石
  ID_C2S_OneKeyComposeGem = 22106, --一键合成宝石
  ID_S2C_OneKeyComposeGem = 22107, --一键合成宝石
  ID_C2S_ShortCutComposeGem = 22108, --快捷合成宝石
  ID_S2C_ShortCutComposeGem = 22109, --快捷合成宝石
  ID_C2S_FuseGem = 22110, --融合宝石
  ID_S2C_FuseGem = 22111, --融合宝石
  ID_C2S_BatchTransformGems = 22112, --批量转换宝石
  ID_S2C_BatchTransformGems = 22113, --批量转换宝石

  ID_C2S_JewelerInfo = 22200, -- 查
  ID_S2C_JewelerInfo = 22201,
  ID_C2S_JewelerMove = 22202, -- 移
  ID_S2C_JewelerMove = 22203,
  ID_C2S_JewelerClear = 22204, -- 清
  ID_S2C_JewelerClear = 22205,
  ID_C2S_JewelerBuy = 22206, -- 买
  ID_S2C_JewelerBuy = 22207,
  ID_C2S_JewelerRanking = 22208, -- 排行榜
  ID_S2C_JewelerRanking = 22209,
  ID_C2S_JewelerAward = 22210, -- 领
  ID_S2C_JewelerAward = 22211,
  ID_C2S_JewelerAutoMove = 22212, --宝石迷阵助手移动
  ID_S2C_JewelerAutoMove = 22213,
  ID_C2S_JewelerResetMap = 22214, --宝石迷阵助手重置地图
  ID_S2C_JewelerResetMap = 22215,

  -- 北伐
  ID_C2S_GVEDungeonTeamStatus = 22300, -- 北伐, 查询状态
  ID_S2C_GVEDungeonTeamStatus = 22301, -- 北伐，状态推送
  ID_C2S_GVEDungeonCreateTeam = 22302, -- 北伐，创建队伍
  ID_S2C_GVEDungeonCreateTeam = 22303,
  ID_C2S_GVEDungeonJoinTeam = 22304, -- 北伐，加入队伍
  ID_S2C_GVEDungeonJoinTeam = 22305,
  ID_C2S_GVEDungeonLeave = 22308, --退出组队，及组队匹配
  ID_S2C_GVEDungeonLeave = 22309,
  ID_C2S_GVEDungeonChangePosition = 22310, -- 队长换位置
  ID_S2C_GVEDungeonChangePosition = 22311,
  ID_C2S_GVEDungeonKickTeamMember = 22312, -- 队长踢人
  ID_S2C_GVEDungeonKickTeamMember = 22313,
  ID_C2S_GVEDungeonSetTeamOnlyInvited = 22314, -- 队长设置房间是否开放
  ID_S2C_GVEDungeonSetTeamOnlyInvited = 22315,
  ID_C2S_GVEDungeonInvite = 22316, -- 邀请
  ID_S2C_GVEDungeonInvite = 22317,
  ID_S2C_GVEDungeonBeInvited = 22318, -- 被邀请
  ID_C2S_GVEDungeonInvitedJoinTeam = 22319, -- 持邀请卡 加入队伍
  ID_S2C_GVEDungeonInvitedJoinTeam = 22320,
  ID_S2C_GVEDungeonInviteCanceled = 22321,
  ID_C2S_GVEDungeonInviteNPC = 22322, --一键邀请
  ID_S2C_GVEDungeonInviteNPC = 22323,
  ID_C2S_GVEDungeonAgreeBattle = 22324, -- 组员准备好出战
  ID_S2C_GVEDungeonAgreeBattle = 22325,
  ID_C2S_GVEDungeonExecute = 22326, --队长 出战
  ID_S2C_GVEDungeonExecute = 22327,
  ID_S2C_GVEDungeonBattleResult = 22330, --战斗结果
  ID_C2S_GVEDungeonBattleTeamChange = 22334, --通知服务器布阵变化
  ID_S2C_GVEDungeonBattleTeamChange = 22335,
  ID_S2C_GVEDungeonInviteNPCFail = 22336, -- 邀请NPC失败提示

  ID_S2C_GVEDungeonCrossServerLost = 22340, -- 跨服服务器挂了

  ID_C2S_GVEDungeonGetRank = 22341, -- 北伐排行版
  ID_S2C_GVEDungeonGetRank = 22342,
  ID_C2S_GVEDungeonGetUserInfo = 22343, -- 北伐玩家荣誉积分等信息
  ID_S2C_GVEDungeonGetUserInfo = 22344,
  ID_C2S_GVEDungeonBuyAwardCnt = 22345, -- 北伐，买奖励次数
  ID_S2C_GVEDungeonBuyAwardCnt = 22346,
  ID_C2S_GVEDungeonAcceptInvite = 22347, -- 北伐，是否接受邀请
  ID_S2C_GVEDungeonAcceptInvite = 22348,
  ID_C2S_GVEDungeonPopChat = 22349, -- 北伐，气泡聊天
  ID_S2C_GVEDungeonPopChat = 22350,
  ID_C2S_GVEDungeonRefreshMap = 22351, -- 北伐，刷新地图
  ID_S2C_GVEDungeonRefreshMap = 22352,

  ID_C2S_GVEDungeonListenChapterTeams = 22360, -- 北伐，监听某章节队伍列表
  ID_S2C_GVEDungeonListenChapterTeams = 22361,
  ID_S2C_GVEDungeonChapterTeam = 22362, -- 北伐，队伍信息，推送
  ID_C2S_GVEDungeonStopListenChapterTeams = 22363, -- 北伐，停止监听
  ID_S2C_GVEDungeonStopListenChapterTeams = 22364,
  ID_C2S_GVEDungeonJoinLocalTeam = 22365, -- 北伐，加入本服队伍
  ID_S2C_GVEDungeonJoinLocalTeam = 22366,

  ID_C2S_GVEDungeonSkipBattle = 22367,
  ID_S2C_GVEDungeonSkipBattle = 22368,
  ID_C2S_GVEDungeonOneKey = 22369,
  ID_S2C_GVEDungeonOneKey = 22370,

  -- 皇陵探宝活动
  ID_C2S_TombsInfo = 22400,
  ID_S2C_TombsInfo = 22401,
  ID_C2S_TombsExplore = 22402,
  ID_S2C_TombsExplore = 22403,
  ID_C2S_TombsShopRefresh = 22404,
  ID_S2C_TombsShopRefresh = 22405,
  ID_C2S_TombsShopBuy = 22406,
  ID_S2C_TombsShopBuy = 22407,
  ID_C2S_TombsChestOpen = 22408,
  ID_S2C_TombsChestOpen = 22409,
  ID_C2S_TombsFight = 22410,
  ID_S2C_TombsFight = 22411,
  ID_C2S_TombsAnswer = 22412,
  ID_S2C_TombsAnswer = 22413,
  ID_C2S_TombsRank = 22414,
  ID_S2C_TombsRank = 22415,
  ID_C2S_TombsRankReward = 22416,
  ID_S2C_TombsRankReward = 22417,
  ID_C2S_TombsScoreReward = 22418,
  ID_S2C_TombsScoreReward = 22419,
  ID_C2S_TombsGetRechargeReward = 22420,
  ID_S2C_TombsGetRechargeReward = 22421,
  ID_C2S_TombsDelEvent = 22422,
  ID_S2C_TombsDelEvent = 22423,
  ID_S2C_TombsRecharge = 22424,

  --交易所
  ID_C2S_SuperMarketInfo = 22500,--交易所详情--买信息
  ID_S2C_SuperMarketInfo = 22501,
  ID_C2S_SuperMarketDetail = 22502,--交易所物品详情
  ID_S2C_SuperMarketDetail = 22503,
  ID_C2S_SuperMarketPurchase = 22504,--购买
  ID_S2C_SuperMarketPurchase = 22505,
  ID_C2S_SuperMarketUserInfo = 22506,--玩家交易所信息--卖信息
  ID_S2C_SuperMarketUserInfo = 22507,
  ID_C2S_SuperMarketSell = 22508,--出售
  ID_S2C_SuperMarketSell = 22509,
  ID_C2S_SuperMarketGetBack = 22510,--下架或者回收
  ID_S2C_SuperMarketGetBack = 22511,
  ID_C2S_SuperMarketGetPay = 22512,--卖出了收钱
  ID_S2C_SuperMarketGetPay = 22513,
  ID_C2S_SuperMarketLockInfo = 22514,
  ID_S2C_SuperMarketLockInfo = 22515,
  ID_C2S_SuperMarketReleaseLock = 22516,
  ID_S2C_SuperMarketReleaseLock = 22517,
  ID_C2S_SuperMarketResetLock = 22518,
  ID_S2C_SuperMarketResetLock = 22519,
  ID_C2S_SuperMarketLog = 22520,
  ID_S2C_SuperMarketLog = 22521,

  ID_C2S_GetSacredwpBag = 22600, --获取神器背包
  ID_S2C_GetSacredwpBag = 22601, --获取神器背包
  ID_C2S_EquipSacredwp = 22602,  --装备神器
  ID_S2C_EquipSacredwp = 22603,  --装备神器
  ID_C2S_UpgradeSacredwp = 22604, --神兵升阶
  ID_S2C_UpgradeSacredwp = 22605, --神兵升阶
  ID_C2S_BaptizeSacredwpAttrs = 22606, --神兵洗炼
  ID_S2C_BaptizeSacredwpAttrs = 22607, --神兵洗炼
  ID_C2S_ReplaceSacredwpAttrs = 22608, --神兵洗炼替换
  ID_S2C_ReplaceSacredwpAttrs = 22609, --神兵洗炼替换
  ID_C2S_LockSacredwpAttrs = 22610,	--神兵洗炼锁定
  ID_S2C_LockSacredwpAttrs = 22611,	--神兵洗炼锁定
  ID_C2S_RebirthSacredwp = 22612,	--神兵重生
  ID_S2C_RebirthSacredwp = 22613,	--神兵重生
  ID_C2S_GetSacredwpRank = 22614,	--神兵排行榜
  ID_S2C_GetSacredwpRank = 22615,	--神兵排行榜
  ID_C2S_SoulTrainSacredwpAttr = 22616,	--神兵魂炼
  ID_S2C_SoulTrainSacredwpAttr = 22617,	--神兵魂炼
  ID_C2S_ConfirmSacredwpAttr = 22618,	--确认神兵魂炼
  ID_S2C_ConfirmSacredwpAttr = 22619,	--确认神兵魂炼
  ID_C2S_SacredwpDailyBaptizeInfo = 22620,	--神兵每日洗炼信息
  ID_S2C_SacredwpDailyBaptizeInfo = 22621,	--神兵每日洗炼信息
  ID_C2S_SacredwpDailyBaptizeAward = 22622,	--神兵每日洗炼奖励
  ID_S2C_SacredwpDailyBaptizeAward = 22623,	--神兵每日洗炼奖励
  ID_C2S_SacredwpTransform = 22624,	--神兵八卦镜
  ID_S2C_SacredwpTransform = 22625,	--神兵八卦镜
  ID_C2S_SacredwpSoulTrainLostInfo = 22626,	--神兵魂炼遗漏
  ID_S2C_SacredwpSoulTrainLostInfo = 22627,	--神兵魂炼遗漏
  ID_C2S_SacredwpExpandCurrentAttr = 22628, --神兵开孔
  ID_S2C_SacredwpExpandCurrentAttr = 22629, --神兵开孔
  --暗金神兵
  ID_C2S_UpdateSacredwpStar = 22630, --神兵升星
  ID_S2C_UpdateSacredwpStar = 22631,
  ID_C2S_SacredwpInherit = 22632, --神兵继承
  ID_S2C_SacredwpInherit = 22633,
  ID_C2S_WashSacredwpAskill = 22634, --神兵练技洗练
  ID_S2C_WashSacredwpAskill = 22635,
  ID_C2S_ReplaceSacredwpAskill = 22636, --神兵练技替换
  ID_S2C_ReplaceSacredwpAskill = 22637,
  ID_C2S_SoulTrainSacredwpAskill = 22638, --神兵练技魂练
  ID_S2C_SoulTrainSacredwpAskill = 22639,
  ID_C2S_ConfirmSacredwpAskill = 22640, --确认神兵练技魂练
  ID_S2C_ConfirmSacredwpAskill = 22641,
  ID_C2S_SacredwpAskillLostInfo = 22642, --神兵练技预览数据
  ID_S2C_SacredwpAskillLostInfo = 22643,
  ID_C2S_SacredwpInheritPreview = 22644, --神兵继承预览
  ID_S2C_SacredwpInheritPreview = 22645,
  ID_C2S_SacredwpQuenching = 22646, --彩金神兵-淬炼
  ID_S2C_SacredwpQuenching = 22647,
  ID_C2S_SeniorSoulTrainSacredwpAskill = 22648, --神兵练技高级魂练
  ID_S2C_SeniorSoulTrainSacredwpAskill = 22649,

  ID_C2S_GetWeekFundConfigInfo = 22650,--获取周基金时间配置
  ID_S2C_GetWeekFundConfigInfo = 22651,--获取周基金时间配置
  ID_C2S_GetWeekFundBaseInfo = 22652,--周基金详情
  ID_S2C_GetWeekFundBaseInfo = 22653,--周基金详情
  ID_C2S_AcquireWeekFundAward = 22654,--领取周基金奖励
  ID_S2C_AcquireWeekFundAward = 22655,--领取周基金奖励

	-- 天天返利活动
  ID_C2S_DailyRechargeInfo = 22700,
  ID_S2C_DailyRechargeInfo = 22701,
  ID_S2C_DailyRechargeNotice = 22702,
  ID_C2S_DailyRechargeReward = 22703,
  ID_S2C_DailyRechargeReward = 22704,

  -- 等级礼包活动
  ID_C2S_LevelGiftInfo = 22800,
  ID_S2C_LevelGiftInfo = 22801,
  ID_C2S_LevelGiftBuy = 22802,
  ID_S2C_LevelGiftBuy = 22803,
  ID_C2S_LevelGiftRechargeAward = 22804,
  ID_S2C_LevelGiftRechargeAward = 22805,
  ID_C2S_LevelGiftDirectAward = 22806, --领取直冲奖励
  ID_S2C_LevelGiftDirectAward = 22807,

  --王者争霸服务器技能
  ID_C2S_FFKSkillInfo = 22900,
  ID_S2C_FFKSkillInfo = 22901,
  ID_C2S_UpdateFFKSkillInfo = 22902,
  ID_S2C_UpdateFFKSkillInfo = 22903,

  ID_C2S_FFKUserInfo = 22910,
  ID_S2C_FFKUserInfo = 22911,
  ID_C2S_FFKGetRank = 22912,
  ID_S2C_FFKGetRank = 22913,
  ID_C2S_FFKGetTaskAward = 22914,
  ID_S2C_FFKGetTaskAward = 22915,
  ID_C2S_FFKGetPeakBriefs = 22916,
  ID_S2C_FFKGetPeakBriefs = 22917,
  ID_C2S_FFKPeak = 22918,
  ID_S2C_FFKPeak = 22919,

  --王者争霸
  ID_C2S_FFKStatus = 22920,
  ID_S2C_FFKStatus = 22921,
  ID_C2S_FFKMatch = 22922,
  ID_S2C_FFKMatch = 22923,
  ID_C2S_FFKLeave = 22924,
  ID_S2C_FFKLeave = 22925,
  ID_S2C_FFKBattle = 22926,

  ID_C2S_FFKHonorHall = 22930,
  ID_S2C_FFKHonorHall = 22931,

  ID_C2S_FFKUserLog = 22932,
  ID_S2C_FFKUserLog = 22933,

  ID_C2S_FFKLastBattleVideo = 22934,
  ID_S2C_FFKLastBattleVideo = 22935,
  ID_C2S_FFKLastBattleVideoBriefs = 22936,
  ID_S2C_FFKLastBattleVideoBriefs = 22937,

  --应用宝五一活动
  ID_C2S_GetLabourDayInfo = 23000,
  ID_S2C_GetLabourDayInfo = 23001,
  ID_C2S_GetLabourDayAward = 23002,
  ID_S2C_GetLabourDayAward = 23003,
  ID_C2S_GetLabourDayBoxAward = 23004,
  ID_S2C_GetLabourDayBoxAward = 23005,

  --应用宝充值活动
  ID_C2S_GetYyb521ActivityInfo = 23010,
  ID_S2C_GetYyb521ActivityInfo = 23011,
  ID_C2S_GetYyb521ActivityAward = 23012,
  ID_S2C_GetYyb521ActivityAward = 23013,

  --战马
  ID_C2S_GetHorseBag = 23100, --获取战马背包
  ID_S2C_GetHorseBag = 23101,
  ID_C2S_EquipHorse = 23102, --武将穿战马
  ID_S2C_EquipHorse = 23103,
  ID_C2S_FeedHorse = 23104, --喂养
  ID_S2C_FeedHorse = 23105,
  ID_C2S_HorseUpStar = 23106, --升星
  ID_S2C_HorseUpStar = 23107,
  ID_C2S_HorseCompose = 23108, --获取图鉴
  ID_S2C_HorseCompose = 23109,
  ID_C2S_HorseComposeUp = 23110, --升级图鉴
  ID_S2C_HorseComposeUp = 23111,
  ID_C2S_GetHorseInfo = 23112, --马魂，好感成就，相马已使用免费次数
  ID_S2C_GetHorseInfo = 23113,
  ID_C2S_ActiveHorseTarget = 23114, --激活好感成就
  ID_S2C_ActiveHorseTarget = 23115,
  ID_C2S_HorseConjure = 23116, --相马
  ID_S2C_HorseConjure = 23117,
  ID_C2S_HorseReborn = 23118,
  ID_S2C_HorseReborn = 23119,
  ID_C2S_HorseSetProtector = 23120, --金马义从
  ID_S2C_HorseSetProtector = 23121,
  ID_C2S_HorseUnsetProtector = 23122, --金马义从，卸下
  ID_S2C_HorseUnsetProtector = 23123,
  ID_C2S_ActiveHorseTargetOneKey = 23124, --激活好感成就, 一键
  ID_S2C_ActiveHorseTargetOneKey = 23125,
  ID_C2S_HorseSetProtectorDG = 23126, --暗金马协战
  ID_S2C_HorseSetProtectorDG = 23127,

  --群雄逐鹿
  ID_C2S_CaptureInfo = 24000,--状态
  ID_S2C_CaptureInfo = 24001,
  ID_C2S_CaptureAwardInfo = 24002,--奖励状态
  ID_S2C_CaptureAwardInfo = 24003,
  ID_C2S_CaptureGetAward = 24004,--获取奖励
  ID_S2C_CaptureGetAward = 24005,
  ID_C2S_CaptureRank = 24006,--排行榜--弃用 用通用排行榜
  ID_S2C_CaptureRank = 24007,
  ID_C2S_CaptureTeamInvite = 24008,--邀请好友
  ID_S2C_CaptureTeamInvite = 24009,
  ID_S2C_CaptureTeamInvited = 24010,--被邀请推送
  ID_C2S_CaptureTeamJoin = 24011,--加入TEAM
  ID_S2C_CaptureTeamJoin = 24012,
  ID_C2S_CaptureTeamKick = 24013,--剔除
  ID_S2C_CaptureTeamKick = 24014,
  ID_C2S_CaptureTeamInfo = 24015,--状态
  ID_S2C_CaptureTeamInfo = 24016,
  ID_C2S_CaptureTime = 24017,--时间
  ID_S2C_CaptureTime = 24018,
	ID_C2S_CreateCaptureTeam = 24019,	--开房间
	ID_S2C_CreateCaptureTeam = 24020,
	ID_C2S_OpenCaptureTeam = 24021,	--开放房间
	ID_S2C_OpenCaptureTeam = 24022,
	ID_C2S_JoinCaptureTeam = 24023,		--加入房间
	ID_S2C_JoinCaptureTeam = 24024,

  ID_C2S_CaptureMatch = 24050,--开始匹配
  ID_S2C_CaptureMatch = 24051,
  ID_C2S_CaptureStopMatch = 24052,--开始匹配
  ID_S2C_CaptureStopMatch = 24053,
  ID_C2S_CaptureGameInfo = 24054,--游戏信息
  ID_S2C_CaptureGameInfo = 24055,
  ID_C2S_CaptureGameRank = 24056,--游戏信息--弃用
  ID_S2C_CaptureGameRank = 24057,
  ID_C2S_CaptureGameTips = 24058,--游戏信息
  ID_S2C_CaptureGameTips = 24059,
  ID_C2S_CaptureGameMap = 24060,--游戏信息--弃用
  ID_S2C_CaptureGameMap = 24061,
  ID_S2C_CaptureGamePositionFlush = 24062,
  ID_C2S_CaptureGameMove = 24063,--玩家移动
  ID_S2C_CaptureGameMove = 24064,
  ID_C2S_CaptureGameItemUse = 24065,--使用道具
  ID_S2C_CaptureGameItemUse = 24066,
  ID_S2C_CaptureGameResult = 24067,
  ID_S2C_CaptureGameMapFlush = 24068,
	ID_S2C_CaptureGameResetTeamer = 24069,	--重置队友
	ID_C2S_CaptureGameResetTeamer = 24070,

  ID_C2S_GetDays7DrawTaskInfo = 24500, --开服抽将
  ID_S2C_GetDays7DrawTaskInfo = 24501,
  ID_C2S_GetDays7DrawTaskAward = 24502,
  ID_S2C_GetDays7DrawTaskAward = 24503,

	-- 暑假活动
  ID_C2S_SummerSignInfo = 24600,	-- 查信息
  ID_S2C_SummerSignInfo = 24601,
  ID_C2S_GetSummerSign = 24602,	-- 领奖
  ID_S2C_GetSummerSign = 24603,

  ID_C2S_CorpActiveInfo = 24700, --军团活跃的信息
  ID_S2C_CorpActiveInfo = 24701,
  ID_C2S_FinishCorpActiveMission = 24702, --完成任务
  ID_S2C_FinishCorpActiveMission = 24703,
  ID_C2S_OpenCorpActiveBox = 24704, -- 打开箱子
  ID_S2C_OpenCorpActiveBox = 24705,
  ID_C2S_CorpActiveLottery = 24706, -- 抽奖
  ID_S2C_CorpActiveLottery = 24707,
  ID_C2S_CorpActiveLotteryLog = 24708, -- 抽奖记录
  ID_S2C_CorpActiveLotteryLog = 24709,

  ID_C2S_AuctionInfo = 24800, --交易所信息
  ID_S2C_AuctionInfo = 24801,
  ID_C2S_AuctionUserInfo = 24802, --交易所User信息
  ID_S2C_AuctionUserInfo = 24803,
  ID_C2S_AuctionPurchase = 24804, --交易所购买
  ID_S2C_AuctionPurchase = 24805,
  ID_C2S_AuctionLog = 24806, --交易所日志信息
  ID_S2C_AuctionLog = 24807,
  ID_S2C_FlushAuctionItem = 24808,--推送交易所信息
  ID_S2C_FlushAuctionBonus= 24809,--推送交易所分红

  ID_C2S_CorpRiceMyInfo = 24900,
  ID_S2C_CorpRiceMyInfo = 24901,
  ID_C2S_CorpRiceRefreshCorps = 24902,
  ID_S2C_CorpRiceRefreshCorps = 24903,
  ID_C2S_CorpRiceGetCorpMembers = 24904,
  ID_S2C_CorpRiceGetCorpMembers = 24905,
  ID_C2S_CorpRiceRob = 24906,
  ID_S2C_CorpRiceRob = 24907,
  ID_C2S_CorpRiceGetEnemy = 24908,
  ID_S2C_CorpRiceGetEnemy = 24909,
  ID_C2S_CorpRiceShareEnemy = 24910,
  ID_S2C_CorpRiceShareEnemy = 24911,
  ID_C2S_CorpRiceRevenge = 24912,
  ID_S2C_CorpRiceRevenge = 24913,
  ID_C2S_CorpRiceGetUserRanks = 24914,
  ID_S2C_CorpRiceGetUserRanks = 24915,
  ID_C2S_CorpRiceGetCorpRanks = 24916,
  ID_S2C_CorpRiceGetCorpRanks = 24917,
  ID_C2S_CorpRiceFinishAchieve = 24918,
  ID_S2C_CorpRiceFinishAchieve = 24919,
  ID_C2S_CorpRiceBuyAttackCnt = 24920,
  ID_S2C_CorpRiceBuyAttackCnt = 24921,
  ID_C2S_CorpRiceBuyRevengeCnt = 24922,
  ID_S2C_CorpRiceBuyRevengeCnt = 24923,
  ID_C2S_CorpRiceSetAnnounce = 24924,
  ID_S2C_CorpRiceSetAnnounce = 24925,
  ID_C2S_CorpRiceMarkEnemyCorp = 24926,
  ID_S2C_CorpRiceMarkEnemyCorp = 24927,
  ID_C2S_CorpRiceBuyAssistCnt = 24928,
  ID_S2C_CorpRiceBuyAssistCnt = 24929,
  ID_C2S_CorpRiceGetAttackCnt = 24930,
  ID_S2C_CorpRiceGetAttackCnt = 24931,
  ID_C2S_CorpRiceGetAchieve = 24932,
  ID_S2C_CorpRiceGetAchieve = 24933,

  ID_C2S_GetNewHolidayTimeXmlInfo = 25000,       --获取time_xml信息
  ID_S2C_GetNewHolidayTimeXmlInfo = 25001,
  ID_C2S_GetNewHolidayActionXmlInfo = 25002,     --获取action_xml信息
  ID_S2C_GetNewHolidayActionXmlInfo = 25003,
  ID_C2S_GetNewHolidayExchangeXmlInfo = 25004,  --获取exchange_xml信息
  ID_S2C_GetNewHolidayExchangeXmlInfo = 25005,
  ID_C2S_GetNewHolidayMainInfo = 25006,         --获取主界面信息
  ID_S2C_GetNewHolidayMainInfo = 25007,
  ID_C2S_NewHolidayLuckyDraw = 25008,           --抽奖
  ID_S2C_NewHolidayLuckyDraw = 25009,
  ID_C2S_NewHolidayLotteryNotice = 25010,       --抽奖公告
  ID_S2C_NewHolidayLotteryNotice = 25011,
  ID_C2S_NewHolidayActionInfo = 25012,          --全民福利信息
  ID_S2C_NewHolidayActionInfo = 25013,
  ID_C2S_NewHolidayDailySignIn = 25014,         --全民福利签到
  ID_S2C_NewHolidayDailySignIn = 25015,
  ID_C2S_NewHolidayActionAward = 25016,         --全民福利奖励
  ID_S2C_NewHolidayActionAward = 25017,
  ID_C2S_NewHolidayLotteryBackInfo = 25018,     --累抽界面信息
  ID_S2C_NewHolidayLotteryBackInfo = 25019,
  ID_C2S_NewHolidayLotteryBackAward = 25020,    --领取累抽奖励
  ID_S2C_NewHolidayLotteryBackAward = 25021,
  ID_C2S_NewHolidayFriendsFlowerInfo = 25022,   --好友鲜花界面
  ID_S2C_NewHolidayFriendsFlowerInfo = 25023,
  ID_C2S_NewHolidayDonateFlowers = 25024,       --赠送好友鲜花
  ID_S2C_NewHolidayDonateFlowers = 25025,
  ID_C2S_NewHolidayExchangeInfo = 25026,        --兑换界面信息
  ID_S2C_NewHolidayExchangeInfo = 25027,
  ID_C2S_NewHolidayExchangeGood = 25028,        --兑换商品
  ID_S2C_NewHolidayExchangeGood = 25029,
  ID_C2S_OneKeyLotteryBackAward = 25030,        --一键领取领取累抽奖励
  ID_S2C_OneKeyLotteryBackAward = 25031,

  ID_C2S_GetHomeInfo = 25100,--家园信息
  ID_S2C_GetHomeInfo = 25101,
  ID_C2S_GetHomeUserInfo = 25102,--家园详情
  ID_S2C_GetHomeUserInfo = 25103,
  ID_C2S_GetHomeTask = 25104,--家园任务
  ID_S2C_GetHomeTask = 25105,
  ID_C2S_FinishHomeTask= 25106,--完成家园任务
  ID_S2C_FinishHomeTask= 25107,
  ID_C2S_RefreshHomeTask= 25108,--刷新家园随机任务
  ID_S2C_RefreshHomeTask= 25109,
  ID_C2S_SetHomeInfo = 25110,--设置家园（气泡等）
  ID_S2C_SetHomeInfo = 25111,
  ID_C2S_GetHomeSkillTree = 25112,--技能树
  ID_S2C_GetHomeSkillTree = 25113,
  ID_C2S_SetHomeSkillTree = 25114,--设置技能树
  ID_S2C_SetHomeSkillTree = 25115,
  ID_C2S_ResetHomeSkillTree = 25116,--重置技能树
  ID_S2C_ResetHomeSkillTree = 25117,
  ID_C2S_GetHomeOfficeAward = 25118,--获取军衔奖励
  ID_S2C_GetHomeOfficeAward = 25119,
  ID_C2S_GetHomeCorpRank = 25120,--获取军团排行
  ID_S2C_GetHomeCorpRank = 25121,
  ID_C2S_GetHomeProProduct = 25122,--这个貌似不需要
  ID_S2C_GetHomeProProduct = 25123,
  ID_C2S_UpgradeHomePro = 25124,
  ID_S2C_UpgradeHomePro = 25125,
  ID_C2S_GetHomeProPlatform = 25126,
  ID_S2C_GetHomeProPlatform = 25127,
  ID_C2S_SetHomeProPlatform = 25128,
  ID_S2C_SetHomeProPlatform = 25129,
  ID_C2S_CollectHomeProProduct = 25130,
  ID_S2C_CollectHomeProProduct = 25131,
  ID_C2S_GetHomeProDinner = 25132,
  ID_S2C_GetHomeProDinner = 25133,
  ID_C2S_HoldHomeProDinner = 25134,
  ID_S2C_HoldHomeProDinner = 25135,
  ID_C2S_PublicHomeProDinner = 25136,
  ID_S2C_PublicHomeProDinner = 25137,
  ID_C2S_GetPublicHomeDinner = 25138,
  ID_S2C_GetPublicHomeDinner = 25139,
  ID_C2S_GetHomeDinnerLog = 25140,
  ID_S2C_GetHomeDinnerLog = 25141,
  ID_C2S_GetHomeDinnerAward = 25142,
  ID_S2C_GetHomeDinnerAward = 25143,
  ID_C2S_GetCrossHomeInfo = 25144,
  ID_S2C_GetCrossHomeInfo = 25145,
  ID_C2S_GetCrossHomeDinner = 25146,
  ID_S2C_GetCrossHomeDinner = 25147,
  ID_C2S_JoinCrossHomeDinner = 25148,
  ID_S2C_JoinCrossHomeDinner = 25149,
  ID_C2S_GetHomeDinnerInvite = 25150,
  ID_S2C_GetHomeDinnerInvite = 25151,
  ID_C2S_InviteHomeDinner = 25152,
  ID_S2C_InviteHomeDinner = 25153,
  ID_C2S_PurchaseHomeTaskCount = 25154,
  ID_S2C_PurchaseHomeTaskCount = 25155,
  ID_C2S_InviteHomeDinnerOnline = 25156,
  ID_S2C_InviteHomeDinnerOnline = 25157,
  ID_C2S_GetHomeTech = 25158,--学院科技
  ID_S2C_GetHomeTech = 25159,
  ID_C2S_SetHomeTech = 25160,
  ID_S2C_SetHomeTech = 25161,
  ID_C2S_GetHomeSalary = 25162,
  ID_S2C_GetHomeSalary = 25163,
  ID_C2S_BuyHomeDefense = 25164,
  ID_S2C_BuyHomeDefense = 25165,
  ID_S2C_UpdateTechValue = 25166,
  ID_C2S_FlushHomeShop = 25167,
  ID_S2C_FlushHomeShop = 25168,
  ID_C2S_ActiveHomeSkin = 25169,
  ID_S2C_ActiveHomeSkin = 25170,
  ID_C2S_ChangeHomeSkin = 25171,
  ID_S2C_ChangeHomeSkin = 25172,
  ID_S2C_UpdateHomeSkin = 25173, --更新皮肤信息

  ID_C2S_GetNightMareDungeonInfo = 25200, --获取噩梦副本信息，包括 已通关关卡，总星数，已领取宝箱，已领取星数奖励等，已购买次数，已挑战次数等
  ID_S2C_GetNightMareDungeonInfo = 25201,
  ID_C2S_ChallengeNightMareDungeon = 25202, --挑战关卡
  ID_S2C_ChallengeNightMareDungeon = 25203,
  ID_C2S_BuyNightMareDungeonCnt = 25204, --购买次数
  ID_S2C_BuyNightMareDungeonCnt = 25205,
  ID_C2S_OpenNightMareChapterBox = 25206, --领取金银铜宝箱奖励
  ID_S2C_OpenNightMareChapterBox = 25207,
  ID_C2S_GetNightMareStarAward = 25208, --领取 星数奖励
  ID_S2C_GetNightMareStarAward = 25209,
  ID_C2S_GetNightMareDungeonVideo = 25212, --获取某关卡录像
  ID_S2C_GetNightMareDungeonVideo = 25213,
  ID_C2S_NightMareDungeonIsOpen = 25214, --获取关卡是否开放
  ID_S2C_NightMareDungeonIsOpen = 25215,

  ID_C2S_GetCorpCaveMainInfo = 25300,
  ID_S2C_GetCorpCaveMainInfo = 25301,
  ID_C2S_GetCorpCaveDetail = 25302,
  ID_S2C_GetCorpCaveDetail = 25303,
  ID_C2S_CorpCaveDoAttack = 25304,
  ID_S2C_CorpCaveDoAttack = 25305,
  ID_C2S_CorpCaveMakeAWish = 25306,
  ID_S2C_CorpCaveMakeAWish = 25307,
  ID_C2S_GetCorpCaveWishBox = 25308,
  ID_S2C_GetCorpCaveWishBox = 25309,
  ID_C2S_GetCorpCaveTroveAward = 25310,
  ID_S2C_GetCorpCaveTroveAward = 25311,
  ID_C2S_GetCorpCaveBoxAward = 25312,
  ID_S2C_GetCorpCaveBoxAward = 25313,
  ID_C2S_GetCorpCaveDailyAward = 25314,
  ID_S2C_GetCorpCaveDailyAward = 25315,
  ID_C2S_CorpCavePurchaseAttack = 25316,
  ID_S2C_CorpCavePurchaseAttack = 25317,
  ID_S2C_PushCorpCaveChapterInfo = 25318,
  ID_C2S_GetCorpCaveCorpRank = 25319,
  ID_S2C_GetCorpCaveCorpRank = 25320,
  ID_S2C_PushCorpCaveKillInfo = 25321,
  ID_C2S_GetCorpCaveMemberRank = 25322,
  ID_S2C_GetCorpCaveMemberRank = 25323,
  ID_C2S_GetCorpCaveAllAward = 25324,       -- 领取军团迷窟当前层数所有奖励（许愿奖励除外）
  ID_S2C_GetCorpCaveAllAward = 25325,

  ID_C2S_GetCityDefenseMainInfo = 25400,  --获取主要信息
  ID_S2C_GetCityDefenseMainInfo = 25401,
  ID_C2S_GetCityDefensePageInfo = 25402,  --获取页签信息
  ID_S2C_GetCityDefensePageInfo = 25403,
  ID_C2S_GetCityDefenseTownInfo = 25404,  --获取城池信息
  ID_S2C_GetCityDefenseTownInfo = 25405,
  ID_C2S_GetCityDefenseCorpTown = 25406,  --军团占领城池
  ID_S2C_GetCityDefenseCorpTown = 25407,
  ID_C2S_GetCityDefenseNullTown = 25408,  --获取空闲城池
  ID_S2C_GetCityDefenseNullTown = 25409,
  ID_C2S_GetCityDefenseUserInfo = 25410,  --获取占领录
  ID_S2C_GetCityDefenseUserInfo = 25411,
  ID_C2S_CityDefenseOccupyARoom = 25412,  --占领一个仓库
  ID_S2C_CityDefenseOccupyARoom = 25413,
  ID_C2S_CityDefenseGainRoomAwd = 25414,  --收获占领奖励
  ID_S2C_CityDefenseGainRoomAwd = 25415,
  ID_C2S_CityDefenseGiveUpARoom = 25416,  --放弃一个仓库
  ID_S2C_CityDefenseGiveUpARoom = 25417,
  ID_C2S_CityDefenseExtendARoom = 25418,  --延长一个仓库
  ID_S2C_CityDefenseExtendARoom = 25419,
  ID_C2S_CityDefenseFastGainAwd = 25420,  --快速收获奖励
  ID_S2C_CityDefenseFastGainAwd = 25421,
  ID_C2S_CityDefenseDeclaration = 25422,  --设置个人宣言
  ID_S2C_CityDefenseDeclaration = 25423,
  ID_C2S_CityDefenseFindAnEnemy = 25424,  --查找一个敌人
  ID_S2C_CityDefenseFindAnEnemy = 25425,
  ID_S2C_CityDefensePushTheTown = 25426,  --推送城池变化
  ID_C2S_RequestCityDefenseRank = 25427,  --请求排行榜
  ID_S2C_RequestCityDefenseRank = 25428,
  ID_C2S_RequestCityDefenseGain = 25429,
  ID_S2C_RequestCityDefenseGain = 25430,
  ID_S2C_CityDefenseDefeatInfo  = 25431,  --防守失败推送

  ID_C2S_SpecialQuestionnaire = 25480,  --特殊问卷调查
  ID_S2C_SpecialQuestionnaire = 25481,  --特殊问卷调查

  ID_C2S_CityWarUserInfo = 25500,--问鼎中原
  ID_S2C_CityWarUserInfo = 25501,
  ID_C2S_CityWarInfo = 25502,--单个战区城市信息
  ID_S2C_CityWarInfo = 25503,
  ID_C2S_CityWarSingleInfo = 25504,--单个城市
  ID_S2C_CityWarSingleInfo = 25505,
  ID_C2S_CityWarSingleRankInfo = 25506,--单个城市军团排行
  ID_S2C_CityWarSingleRankInfo = 25507,
  ID_C2S_CityWarCorpRankInfo = 25508,--总战区城市军团排行
  ID_S2C_CityWarCorpRankInfo = 25509,
  ID_C2S_CityWarUserRankInfo = 25510,--总战区城市玩家排行
  ID_S2C_CityWarUserRankInfo = 25511,
  ID_C2S_CityWarGetAward = 25512,--领取个人次数奖励
  ID_S2C_CityWarGetAward = 25513,
  ID_C2S_CityWarAttackInfo = 25514,--个人悬赏榜文
  ID_S2C_CityWarAttackInfo = 25515,
  ID_C2S_CityWarAttackRefresh = 25516,--个人悬赏榜文刷新
  ID_S2C_CityWarAttackRefresh = 25517,
  ID_C2S_CityWarAttackAward = 25518,--个人悬赏榜文奖励
  ID_S2C_CityWarAttackAward = 25519,
  ID_C2S_CityWarChallengeCity = 25520,--挑战
  ID_S2C_CityWarChallengeCity = 25521,
  ID_C2S_CityWarAttackPurchase = 25522,--个人悬赏购买奖励次数
  ID_S2C_CityWarAttackPurchase = 25523,
  ID_C2S_CityWarTimeInfo = 25524,--个人悬赏购买奖励次数
  ID_S2C_CityWarTimeInfo = 25525,
  ID_C2S_CityWarSetFireOn = 25526,--设置集火
  ID_S2C_CityWarSetFireOn = 25527,
  ID_S2C_CityWarFlushFireOn = 25528,
  ID_C2S_CityWarUserLog = 25529,--玩家日志
  ID_S2C_CityWarUserLog= 25530,
  ID_S2C_CityWarFlushUserInfo = 25531,--同步玩家位置协议
  ID_S2C_CityWarFlushMap = 25532,--同步地图信息
  ID_S2C_CityWarFlushUser= 25533,--同步移动和房间内
  ID_S2C_CityWarFlushScore = 25534,--同步城里积分
  ID_C2S_GetCityWarShopInfo = 25535,--获取商城购买次数
  ID_S2C_GetCityWarShopInfo = 25536,--获取商城购买次数
  ID_S2C_BroadcastOp = 25537,
  ID_C2S_BroadcastOp = 25538,

  ID_C2S_UserFreezeGoldInfo = 25590,
  ID_S2C_UserFreezeGoldInfo = 25591,
  ID_C2S_GetUserFreezeGold = 25592,
  ID_S2C_GetUserFreezeGold = 25593,

  ID_C2S_GetGroupDungeonInfo = 25600,
  ID_S2C_GetGroupDungeonInfo = 25601,
  ID_C2S_ChallengeGroupDungeonSingle = 25602,
  ID_S2C_ChallengeGroupDungeonSingle = 25603,
  ID_C2S_BuyGroupDungeonCnt = 25604, --购买次数
  ID_S2C_BuyGroupDungeonCnt = 25605,

  ID_C2S_GroupDungeonTeamStatus = 25620, -- 北伐, 查询状态
  ID_S2C_GroupDungeonTeamStatus = 25621, -- 北伐，状态推送
  ID_C2S_GroupDungeonCreateTeam = 25622, -- 北伐，创建队伍
  ID_S2C_GroupDungeonCreateTeam = 25623,
  ID_C2S_GroupDungeonJoinTeam = 25624, -- 北伐，加入队伍
  ID_S2C_GroupDungeonJoinTeam = 25625,
  ID_C2S_GroupDungeonLeave = 25628, --退出组队，及组队匹配
  ID_S2C_GroupDungeonLeave = 25629,
  ID_C2S_GroupDungeonKickTeamMember = 25632, -- 队长踢人
  ID_S2C_GroupDungeonKickTeamMember = 25633,
  ID_C2S_GroupDungeonSetTeamOnlyInvited = 25634, -- 队长设置房间是否开放
  ID_S2C_GroupDungeonSetTeamOnlyInvited = 25635,
  ID_C2S_GroupDungeonInvite = 25636, -- 邀请
  ID_S2C_GroupDungeonInvite = 25637,
  ID_S2C_GroupDungeonBeInvited = 25638, -- 被邀请
  ID_C2S_GroupDungeonInvitedJoinTeam = 25639, -- 持邀请卡 加入队伍
  ID_S2C_GroupDungeonInvitedJoinTeam = 25640,
  ID_S2C_GroupDungeonInviteCanceled = 25641,
  ID_C2S_GroupDungeonSelectKnight = 25642,
  ID_S2C_GroupDungeonSelectKnight = 25643,
  ID_C2S_GroupDungeonAgreeBattle = 25644, -- 组员准备好出战
  ID_S2C_GroupDungeonAgreeBattle = 25645,
  ID_C2S_GroupDungeonExecute = 25646, --队长 出战
  ID_S2C_GroupDungeonExecute = 25647,
  ID_S2C_GroupDungeonBattleResult = 25650, --战斗结果

  ID_S2C_GroupDungeonCrossServerLost = 25651, -- 跨服服务器挂了

  ID_C2S_GroupDungeonSelectPet = 25652,
  ID_S2C_GroupDungeonSelectPet = 25653,

  ID_C2S_GroupDungeonGetRank = 25661, -- 组队pvp排行版
  ID_S2C_GroupDungeonGetRank = 25662,
  ID_C2S_ChallengeOneKeyGroupDungeonSingle = 25663,--游戏助手-征战九州一键
  ID_S2C_ChallengeOneKeyGroupDungeonSingle = 25664,

  ID_C2S_GetRunestoneBag  = 25700,      --获取所有兵符
  ID_S2C_GetRunestoneBag  = 25701,
  ID_C2S_EquipRunestone = 25702,        --装备一个兵符
  ID_S2C_EquipRunestone = 25703,
  ID_C2S_GetWarSoulBag = 25704,         --获取所有战魂
  ID_S2C_GetWarSoulBag = 25705,
  ID_C2S_EquipOneWarSoul = 25706,       --装备一个战魂
  ID_S2C_EquipOneWarSoul = 25707,
  ID_C2S_CompoundOneWarSoul = 25708,    --合成一个战魂
  ID_S2C_CompoundOneWarSoul = 25709,
  ID_C2S_CompoundAllWarSoul = 25710,    --一键合成战魂
  ID_S2C_CompoundAllWarSoul = 25711,
  ID_C2S_CompoundInlaidWarSoul = 25712, --镶嵌战魂合成
  ID_S2C_CompoundInlaidWarSoul = 25713,
  ID_C2S_GetRunestoneCompose = 25714,   --获取兵符图鉴
  ID_S2C_GetRunestoneCompose = 25715,
  ID_C2S_GetWarSoulCompose = 25716,     --获取战魂图鉴
  ID_S2C_GetWarSoulCompose = 25717,
  ID_C2S_ResolveTheWarSoul = 25718,     --战魂分解
  ID_S2C_ResolveTheWarSoul = 25719,
  ID_C2S_GetRunestoneShop = 25720,      --获取战魂商店
  ID_S2C_GetRunestoneShop = 25721,
  ID_C2S_ShoppingRunestoneShop = 25722, --战魂商店购买
  ID_S2C_ShoppingRunestoneShop = 25723,
  ID_C2S_RefreshRunestoneShop = 25724,  --刷新战魂商店
  ID_S2C_RefreshRunestoneShop = 25725,
  ID_C2S_RunestoneSetProtector = 25726, --金兵符护佑
  ID_S2C_RunestoneSetProtector = 25727,
  ID_C2S_RunestoneUnSetProtector = 25728, --金兵符护佑
  ID_S2C_RunestoneUnSetProtector = 25729,
  ID_C2S_RunestoneDGOpProtector	= 25730, --暗金兵符护佑
  ID_S2C_RunestoneDGOpProtector	= 25731,

	-- 刷新商店
  ID_C2S_GetFlushShopInfo = 26000, --获取刷新商店信息
  ID_S2C_GetFlushShopInfo = 26001,
  ID_C2S_FlsuhShopBuy = 26002, --刷新商店购买
  ID_S2C_FlsuhShopBuy = 26003,
  ID_C2S_FlushShopGoods = 26004, --刷新商店商品
  ID_S2C_FlushShopGoods = 26005,

  --名将(英灵)
  ID_C2S_SetSecondFamousFormation = 26098,
  ID_S2C_SetSecondFamousFormation = 26099,
  ID_C2S_GetFamous    = 26100,
  ID_S2C_GetFamous    = 26101,
  ID_C2S_FamousStarUp = 26102,
  ID_S2C_FamousStarUp = 26103,
  ID_C2S_FamousFormation = 26104,
  ID_S2C_FamousFormation = 26105,
  ID_C2S_FamousLevelUp = 26106,
  ID_S2C_FamousLevelUp = 26107,
  ID_C2S_FamousRebirthLook = 26108,
  ID_S2C_FamousRebirthLook = 26109,
  ID_C2S_FamousRebirth = 26110,
  ID_S2C_FamousRebirth = 26111,
  ID_C2S_GetFamousFormation = 26112,
  ID_S2C_GetFamousFormation = 26113,
  ID_C2S_GetFamousComposeGro = 26114,
  ID_S2C_GetFamousComposeGro = 26115,
  ID_S2C_AddFamousComposeGro = 26116,
  ID_C2S_GetFamousProperty = 26117,
  ID_S2C_GetFamousProperty = 26118,
	ID_C2S_FamousTeachUpgrade = 26119,
	ID_S2C_FamousTeachUpgrade = 26120,
	ID_C2S_FamousReset = 26121,
	ID_S2C_FamousReset = 26122,

  --日常大地图
  ID_C2S_WorldWarEnterMap = 26200,
  ID_S2C_WorldWarEnterMap = 26201,
  ID_C2S_WorldWarMoveMap = 26202,
  ID_S2C_WorldWarMoveMap = 26203,
  ID_S2C_WorldWarCellChange = 26204,
  ID_C2S_WorldWarMapListen = 26205,
  ID_S2C_WorldWarMapListen = 26206,
  ID_C2S_WorldWarMapQuit = 26207,
  ID_S2C_WorldWarMapQuit = 26208,
  ID_C2S_WorldWarMigrateUser = 26209,
  ID_S2C_WorldWarMigrateUser = 26210,
  ID_C2S_WorldWarMigrateCorp = 26211,
  ID_S2C_WorldWarMigrateCorp = 26212,
  ID_C2S_WorldWarAttackMonster = 26213,
  ID_S2C_WorldWarAttackMonster = 26214,
  ID_C2S_WorldWarSummonMonster = 26215,
  ID_S2C_WorldWarSummonMonster = 26216,
  ID_C2S_WorldWarAttackSummonMonster = 26217,
  ID_S2C_WorldWarAttackSummonMonster = 26218,
  ID_C2S_WorldWarMyInfo = 26219,
  ID_S2C_WorldWarMyInfo = 26220,
  ID_C2S_WorldWarSelectCorpBossGroup = 26221,
  ID_S2C_WorldWarSelectCorpBossGroup = 26222,
  ID_C2S_WorldWarAttackCorpBoss = 26223,
  ID_S2C_WorldWarAttackCorpBoss = 26224,
  ID_C2S_WorldWarGetCorpBoss = 26225,
  ID_S2C_WorldWarGetCorpBoss = 26226,
  ID_C2S_WorldWarGetCorpBossLocalUserRank = 26227,
  ID_S2C_WorldWarGetCorpBossLocalUserRank = 26228,
  ID_C2S_WorldWarGetCorpBossAreaUserRank = 26229,
  ID_S2C_WorldWarGetCorpBossAreaUserRank = 26230,
  ID_C2S_WorldWarGetCorpBossCorpRank = 26231,
  ID_S2C_WorldWarGetCorpBossCorpRank = 26232,
  ID_C2S_WorldWarBuyMigratePoint = 26233,
  ID_S2C_WorldWarBuyMigratePoint = 26234,
  ID_C2S_WorldWarBuyCampaignPoint = 26235,
  ID_S2C_WorldWarBuyCampaignPoint = 26236,
  ID_C2S_WorldWarBuyAttackSummonMonsterCnt = 26237,
  ID_S2C_WorldWarBuyAttackSummonMonsterCnt = 26238,
  ID_C2S_WorldWarReceiveDailyAward = 26239,
  ID_S2C_WorldWarReceiveDailyAward = 26240,
  ID_C2S_WorldWarAreaList = 26241,
  ID_S2C_WorldWarAreaList = 26242,
  ID_C2S_WorldWarGetOtherMap = 26243,
  ID_S2C_WorldWarGetOtherMap = 26244,
  ID_C2S_WorldWarMigrateArsenal = 26245,
  ID_S2C_WorldWarMigrateArsenal = 26246,
	ID_C2S_WorldWarAttackSpringMonster = 26247,
	ID_S2C_WorldWarAttackSpringMonster = 26248,

  --好友度
  ID_C2S_SendFriendGifts = 26250,  --赠送礼物
  ID_S2C_SendFriendGifts = 26251,
  ID_C2S_GetFriendGifts = 26252,  --领取礼物
  ID_S2C_GetFriendGifts = 26253,

  --积分兑礼
  ID_C2S_GetScoreExchargeTimeXmlInfo = 26260,
  ID_S2C_GetScoreExchargeTimeXmlInfo = 26261,
  ID_C2S_GetScoreExchargeActionXmlInfo = 26262,
  ID_S2C_GetScoreExchargeActionXmlInfo = 26263,
  ID_C2S_GetScoreExchargeItemXmlInfo = 26264,
  ID_S2C_GetScoreExchargeItemXmlInfo = 26265,
  ID_C2S_ScoreExchargeActionInfo = 26266,
  ID_S2C_ScoreExchargeActionInfo = 26267,
  ID_C2S_GetScoreExchargeActionScore = 26268, --领取积分
  ID_S2C_GetScoreExchargeActionScore = 26269,
  ID_C2S_ScoreExchargeItemInfo = 26270,
  ID_S2C_ScoreExchargeItemInfo = 26271,
  ID_C2S_ScoreExchargeItemGood = 26272, --兑换道具
  ID_S2C_ScoreExchargeItemGood = 26273,

  ID_C2S_SetRealNameAndIdentityId = 26290, --实名认证
  ID_S2C_SetRealNameAndIdentityId = 26291,
	ID_C2S_IdentityAuthentication = 26292,	--实名认证信息
	ID_S2C_IdentityAuthentication = 26293,

  ID_C2S_GetSkyTestInfo = 26300,
  ID_S2C_GetSkyTestInfo = 26301,
  ID_C2S_SkyTestEnter   = 26302,      --进入试炼
  ID_S2C_SkyTestEnter   = 26303,
  ID_C2S_SkyTestEnterNextFloor = 26304, --进入新的一层
  ID_S2C_SkyTestEnterNextFloor = 26305,
  ID_C2S_SkyTestEnterEntry = 26306, --获取指路人信息
  ID_S2C_SkyTestEnterEntry = 26307,
  ID_C2S_SkyTestDoEvent = 26308,  --处理事件
  ID_S2C_SkyTestDoEvent = 26309,
  ID_C2S_SkyTestUseItem = 26310,  --使用道具
  ID_S2C_SkyTestUseItem = 26311,
  ID_C2S_SkyTestBuyTimes= 26312,  --购买次数
  ID_S2C_SkyTestBuyTimes= 26313,
  ID_S2C_SkyTestUpdateBuff = 26314,
  ID_C2S_SkyTestBuyShop= 26315,  --商店购买
  ID_S2C_SkyTestBuyShop= 26316,
  ID_C2S_SkyTestGetFloorAward = 26317,
  ID_S2C_SkyTestGetFloorAward = 26318,
  ID_C2S_SkyTestAskHelp = 26319,
  ID_S2C_SkyTestAskHelp = 26320,
  ID_C2S_SkyTestHelpUser = 26321,
  ID_S2C_SkyTestHelpUser = 26322,
  ID_S2C_SkyTestHelpRet  = 26323,
  ID_C2S_SkyTestGetAskList = 26324,
  ID_S2C_SkyTestGetAskList = 26325,
  ID_S2C_SkyTestItemUpdate = 26326,
  ID_S2C_SkyTestHelpUpdate = 26327,
  ID_C2S_SkyTestOneKeyHelper = 26328, --6.3.50通天试炼一键助手
  ID_S2C_SkyTestOneKeyHelper = 26329,

  ID_C2S_GetStarGiftInfo = 26350,   --明星送礼信息
  ID_S2C_GetStarGiftInfo = 26351,
  ID_C2S_GiveALikeToStar = 26352,   --给明星点赞
  ID_S2C_GiveALikeToStar = 26353,
  ID_C2S_GetStarPieceAward = 26354, --获取翻牌奖励
  ID_S2C_GetStarPieceAward = 26355,
  ID_C2S_PushStarLikeInfo = 26356,  --推送点赞信息
  ID_S2C_PushStarLikeInfo = 26357,

	--传奇系统(武将培养)
	ID_C2S_GetLegendTreeInfo = 26360,	--获取界面信息
	ID_S2C_GetLegendTreeInfo = 26361,
	ID_C2S_UpLegendTreeNode = 26362,	--升级节点
	ID_S2C_UpLegendTreeNode = 26363,
	ID_C2S_ResetLegendTree = 26364,		--重置
	ID_S2C_ResetLegendTree = 26365,
	ID_C2S_GetLegendTreeNodes = 26366,	--获取对应路径节点信息
	ID_S2C_GetLegendTreeNodes = 26367,

  ID_C2S_WorldWarCreateFarmLand = 26400,
  ID_S2C_WorldWarCreateFarmLand = 26401,
  ID_C2S_WorldWarEraseFarmLand = 26402,
  ID_S2C_WorldWarEraseFarmLand = 26403,
  ID_C2S_WorldWarHarvestFarmLand = 26404,
  ID_S2C_WorldWarHarvestFarmLand = 26405,
  ID_C2S_WorldWarRobFarmLand = 26406,
  ID_S2C_WorldWarRobFarmLand = 26407,
  ID_C2S_WorldWarRobLog = 26408,
  ID_S2C_WorldWarRobLog = 26409,
  ID_C2S_WorldWarBuyTiredPoint = 26410,
  ID_S2C_WorldWarBuyTiredPoint = 26411,
  ID_C2S_WorldWarRobUser = 26412,
  ID_S2C_WorldWarRobUser = 26413,
  ID_C2S_WorldWarBuyRobFarmCnt = 26414,
  ID_S2C_WorldWarBuyRobFarmCnt = 26415,
  ID_C2S_WorldWarAutoProtect = 26416,
  ID_S2C_WorldWarAutoProtect = 26417,
  ID_S2C_WorldWarUpdateDefense = 26418,
  ID_C2S_WorldWarGetPoints = 26419,
  ID_S2C_WorldWarGetPoints = 26420,

	--老模块红点协议整合优化(新功能红点不要加到以下协议，加到GetRedHintRelate中)
	ID_C2S_GetOldRedHint = 26421,
	ID_S2C_GetOldRedHint = 26422,
	ID_C2S_GetOldRedHintSec = 26423,
	ID_S2C_GetOldRedHintSec = 26424,
	ID_C2S_GetOldRedHintRelate = 26425,
	ID_S2C_GetOldRedHintRelate = 26426,
	ID_C2S_GetOldRedHintRelateSec = 26427,
	ID_S2C_GetOldRedHintRelateSec = 26428,

	--七星坛(3.9.5)
	ID_C2S_GetDipperInfo = 26430,	--获取界面信息
	ID_S2C_GetDipperInfo = 26431,
	ID_C2S_GetDipperLogInfo = 26432,	--获取祭祀日志
	ID_S2C_GetDipperLogInfo = 26433,
	ID_C2S_GetDipperAward = 26434,	--领取七星坛等级奖励
	ID_S2C_GetDipperAward = 26435,
	ID_C2S_DipperSacrifice = 26436,	--祭祀
	ID_S2C_DipperSacrifice = 26437,
	ID_C2S_GetDipperTasks = 26438,	--筑造任务
	ID_S2C_GetDipperTasks = 26449,
	ID_C2S_BuyDipperTask = 26450,		--任务追回(购买)
	ID_S2C_BuyDipperTask = 26451,
	ID_C2S_GetDipperTaskAwards = 26452,	--领取任务奖励
	ID_S2C_GetDipperTaskAwards = 26453,

  --日常大地图，城池扩展(4.0.0)
  ID_C2S_WorldWarGetCity = 26500, --日常大地图，看城池
  ID_S2C_WorldWarGetCity = 26501,
  ID_S2C_WorldWarCityCellChange = 26502,
  ID_C2S_WorldWarListenCity = 26503,
  ID_S2C_WorldWarListenCity = 26504,
  ID_C2S_WorldWarQuitCity = 26505,
  ID_S2C_WorldWarQuitCity = 26506,
  ID_C2S_WorldWarMigrateToCity = 26507,
  ID_S2C_WorldWarMigrateToCity = 26508,
  ID_C2S_WorldWarOccupyCityBuilding = 26509,
  ID_S2C_WorldWarOccupyCityBuilding = 26510,
  ID_C2S_WorldWarAttackCityBuilding = 26511,
  ID_S2C_WorldWarAttackCityBuilding = 26512,
  ID_C2S_WorldWarCityGetUserRank = 26513,
  ID_S2C_WorldWarCityGetUserRank = 26514,
  ID_C2S_WorldWarCityGetAllianceRank = 26515,
  ID_S2C_WorldWarCityGetAllianceRank = 26516,
  ID_C2S_WorldWarCityRepairDefense = 26517,
  ID_S2C_WorldWarCityRepairDefense = 26518,
  ID_C2S_WorldWarCityMyInfo = 26519,
  ID_S2C_WorldWarCityMyInfo = 26520,
  ID_C2S_WorldWarCityScore = 26521,
  ID_S2C_WorldWarCityScore = 26522,
  ID_C2S_WorldWarCityBriefUserRank = 26523,
  ID_S2C_WorldWarCityBriefUserRank = 26524,
  ID_C2S_WorldWarGetCityTitles = 26525,
  ID_S2C_WorldWarGetCityTitles = 26526,
  ID_C2S_WorldWarSetCityTitle = 26527,
  ID_S2C_WorldWarSetCityTitle = 26528,
  ID_C2S_WorldWarCityWinAlliances = 26529,
  ID_S2C_WorldWarCityWinAlliances = 26530,
  ID_C2S_WorldWarGetCityAnnounce = 26531,
  ID_S2C_WorldWarGetCityAnnounce = 26532,
  ID_C2S_WorldWarSetCityAnnounce = 26533,
  ID_S2C_WorldWarSetCityAnnounce = 26534,
  ID_C2S_WorldWarCityTime = 26535,
  ID_S2C_WorldWarCityTime = 26536,
  ID_C2S_WorldWarCityOtherUserScore = 26537,
  ID_S2C_WorldWarCityOtherUserScore = 26538,
  ID_S2C_WorldWarCityBuildingOwner = 26539,
  ID_C2S_WorldWarCityUseItem = 26540,
  ID_S2C_WorldWarCityUseItem = 26541,

	--军团联盟(4.0.0)
	ID_C2S_GetCorpAllianceInfo = 26550,	--获取军团信息
	ID_S2C_GetCorpAllianceInfo = 26551,
	ID_C2S_CreateCorpAlliance = 26552,	--创建
	ID_S2C_CreateCorpAlliance = 26553,
	ID_C2S_GetCorpAllianceList = 26554,	--联盟列表
	ID_S2C_GetCorpAllianceList = 26555,
	ID_C2S_GetCorpAllianceJoinApplied = 26556,	--获取玩家已申请列表
	ID_S2C_GetCorpAllianceJoinApplied = 26557,
	ID_C2S_ReqJoinCorpAlliance = 26558,	--申请加入
	ID_S2C_ReqJoinCorpAlliance = 26559,
	ID_C2S_GetCorpAllianceJoinApply = 26560,	--获取联盟申请列表-联盟长
	ID_S2C_GetCorpAllianceJoinApply = 26561,
	ID_C2S_ResJoinCorpAlliance = 26562,	--审核申请
	ID_S2C_ResJoinCorpAlliance = 26563,
	ID_C2S_CorpAllianceAppoint = 26564,	--任命/罢免(联盟长，副联盟长，成员)
	ID_S2C_CorpAllianceAppoint = 26565,
	ID_C2S_CorpAllianceKick = 26566,	--踢出联盟
	ID_S2C_CorpAllianceKick = 26567,
	ID_C2S_CorpAllianceDimiss = 26568,	--解散
	ID_S2C_CorpAllianceDimiss = 26569,
	ID_C2S_OpCorpAllianceMsg = 26570,	--修改联盟信息
	ID_S2C_OpCorpAllianceMsg = 26571,
	ID_C2S_CorpAllianceImpeach = 26572,	--弹劾
	ID_S2C_CorpAllianceImpeach = 26573,
	ID_C2S_GetCorpAllianceCorpMembers = 26574,	--获取军团成员
	ID_S2C_GetCorpAllianceCorpMembers = 26575,
	ID_C2S_CorpAllianceQuit = 26576,	--退出
	ID_S2C_CorpAllianceQuit = 26577,
	ID_C2S_SearchCorpAlliance = 26578,	--搜索
	ID_S2C_SearchCorpAlliance = 26579,
	ID_C2S_GetCorpAllianceNews = 26580,	--获取联盟动态
	ID_S2C_GetCorpAllianceNews = 26581,

	--军团联盟-留言板
	ID_C2S_GetCorpAllianceMsgBoard = 26583,	--获取信息
	ID_S2C_GetCorpAllianceMsgBoard = 26584,
	ID_C2S_CorpAllianceMsgBoardOp = 26585,	--留言板操作
	ID_S2C_CorpAllianceMsgBoardOp = 26586,
	ID_S2C_CorpAllianceMsgBoardOpBroadCast = 26587,

	--军团联盟-任务
	ID_C2S_ReqCorpAllianceTaskInfo = 26590,	--获取任务信息
	ID_S2C_ReqCorpAllianceTaskInfo = 26591,
	ID_C2S_GetCorpAllianceTaskExpAward = 26592,	--领取里程碑奖励
	ID_S2C_GetCorpAllianceTaskExpAward = 26593,
	ID_C2S_GetCorpAllianceTaskAward = 26594,		--领取任务奖励
	ID_S2C_GetCorpAllianceTaskAward = 26595,
	ID_C2S_RefreshCorpAllianceTask = 26596,	--刷新任务
	ID_S2C_RefreshCorpAllianceTask = 26597,

	--军团联盟-军备所
	ID_C2S_ReqCorpAllianceSkillInfo = 26600,	--获取信息
	ID_S2C_ReqCorpAllianceSkillInfo = 26601,
	ID_C2S_UpCorpAllianceSkill = 26602,	--研究
	ID_S2C_UpCorpAllianceSkill = 26603,

  ID_C2S_GetRoadInfo = 26610,
  ID_S2C_GetRoadInfo = 26611,
  ID_C2S_PlayRoadGame= 26612,
  ID_S2C_PlayRoadGame = 26613,
  ID_C2S_PurchaseRoadCount = 26614,
  ID_S2C_PurchaseRoadCount = 26615,
  ID_C2S_RoadGameMove = 26616,--现阶段只有同步记录 正常应该走具体逻辑
  ID_S2C_RoadGameMove = 26617,
  ID_C2S_RoadGameProcessMonster = 26618,--玩家处理怪物逻辑
  ID_S2C_RoadGameProcessMonster = 26619,
  ID_C2S_RoadGameUseItem = 26620,--使用
  ID_S2C_RoadGameUseItem = 26621,
  ID_C2S_RoadGameComposeItem = 26622,--合成
  ID_S2C_RoadGameComposeItem = 26623,
  ID_S2C_RoadGamePositionFlush = 26624,--位置信息刷新
  ID_C2S_RoadGameInfo = 26625,--获取地图信息
  ID_S2C_RoadGameInfo = 26626,
  ID_C2S_PurchaseRoadRevive = 26627,--购买复活
  ID_S2C_PurchaseRoadRevive = 26628,
  ID_C2S_RoadGameMonsterAttack = 26629,--怪物互相战斗逻辑
  ID_S2C_RoadGameMonsterAttack = 26630,
  ID_C2S_RoadStarAward = 26631,
  ID_S2C_RoadStarAward = 26632,
  ID_C2S_RoadFinishStage = 26633,--扫荡
  ID_S2C_RoadFinishStage = 26634,
  ID_C2S_RoadGameGiveUp = 26635,--放弃关卡
  ID_S2C_RoadGameGiveUp = 26636,
  ID_C2S_RoadGameItemProcess = 26637,--道具作用
  ID_S2C_RoadGameItemProcess = 26638,
  ID_C2S_RoadGameDetailInfo = 26639,--GAME详情
  ID_S2C_RoadGameDetailInfo = 26640,
  ID_C2S_RoadAskItem = 26641,--要道具
  ID_S2C_RoadAskItem = 26642,
  ID_C2S_RoadGiveItem = 26643,--给道具
  ID_S2C_RoadGiveItem = 26644,
  ID_C2S_RoadItemAskInfo = 26645,--道具请求信息
  ID_S2C_RoadItemAskInfo = 26646,
  ID_S2C_RoadPointFlush = 26647,
  ID_C2S_RoadGetHandbook = 26648,
  ID_S2C_RoadGetHandbook = 26649,

  ID_C2S_WorldWarAttackCorpAltar = 26650,
  ID_S2C_WorldWarAttackCorpAltar = 26651,
  ID_C2S_WorldWarBuyCorpAltarDefense = 26652,
  ID_S2C_WorldWarBuyCorpAltarDefense = 26653,
  ID_C2S_WorldWarSetAllianceGuard = 26654,
  ID_S2C_WorldWarSetAllianceGuard = 26655,
  ID_C2S_WorldWarAttackArsenal = 26656,
  ID_S2C_WorldWarAttackArsenal = 26657,
  ID_C2S_WorldWarGetCorpGuard = 26658,
  ID_S2C_WorldWarGetCorpGuard = 26659,
  ID_C2S_WorldWarGetAllianceGuard = 26660,
  ID_S2C_WorldWarGetAllianceGuard = 26661,
  ID_C2S_WorldWarAttackBrokenArsenal = 26662,
  ID_S2C_WorldWarAttackBrokenArsenal = 26663,
  ID_C2S_WorldWarRobArsenal = 26664,
  ID_S2C_WorldWarRobArsenal = 26665,
  ID_C2S_WorldWarCityItemBag = 26666,
  ID_S2C_WorldWarCityItemBag = 26667,
  ID_S2C_WorldWarCityItemBuff = 26669,
  ID_S2C_WorldWarCityItemEffect = 26670,

  --战斗平衡测试
  ID_C2S_ExecuteBattleBalanceTest = 26700,
  ID_S2C_ExecuteBattleBalanceTest = 26701,

	--王者殿堂(4.1.70)
	ID_C2S_GetKingPalaceInfo = 26710,	--主信息
	ID_S2C_GetKingPalaceInfo = 26711,
	ID_C2S_BetonKingPalace = 26712,		--押注
	ID_S2C_BetonKingPalace = 26713,
	ID_C2S_GetKingPalaceReward = 26714,	--领取奖励
	ID_S2C_GetKingPalaceReward = 26715,

  --直冲活动
  ID_C2S_GetIndieRechargeInfo = 26800, --获得活动信息
  ID_S2C_GetIndieRechargeInfo = 26801,
  ID_S2C_UpdateIndieRechargeInfo = 26802, --更新任务信息
  ID_S2C_UpdateUserIndieRechargeTask = 26803, --更新玩家任务数据
  ID_C2S_GetIndieRechargeAward = 26804, --领奖接口
  ID_S2C_GetIndieRechargeAward = 26805,

  -- 新每日签到
  ID_C2S_NewDailySignInfo = 26900,   -- 拉取当月签到的数据
  ID_S2C_NewDailySignInfo = 26901,   --
  ID_C2S_NewDailySign = 26902,   -- 新每日签到签到
  ID_S2C_NewDailySign = 26903,   --

  -- 绑定手机号
  ID_C2S_SetPhoneNum = 27000, -- 绑定
  ID_S2C_SetPhoneNum = 27001,

	--阵法养成
	ID_C2S_GetAncientInfo = 28000,  --获取阵法当前培养信息
	ID_S2C_GetAncientInfo = 28001,
	ID_C2S_UpdateAncient  = 28002,  --阵法升级
	ID_S2C_UpdateAncient  = 28003,
	ID_C2S_UnlockAncient  = 28004,  --阵法解锁
	ID_S2C_UnlockAncient  = 28005,
	ID_C2S_ChangeAncientFlag = 28006,  --阵法旗子移动
	ID_S2C_ChangeAncientFlag = 28007,
	ID_C2S_ResetAncient = 28008,	--阵法重置
	ID_S2C_ResetAncient = 28009,
  ID_C2S_UpdateAncientStar = 28010,   --魂阵升星
  ID_S2C_UpdateAncientStar = 28011,
  ID_C2S_UpdateAncientFlag = 28012,   --阵旗升级
  ID_S2C_UpdateAncientFlag = 28013,
  ID_C2S_ResetAncientConsume = 28014, --获得重置材料
  ID_S2C_ResetAncientConsume = 28015,

  -- 吃鸡
  ID_C2S_ChickenMatch = 28500, --开始匹配
  ID_S2C_ChickenMatch = 28501,
  ID_C2S_ChickenStopMatch = 28502, --停止匹配
  ID_S2C_ChickenStopMatch = 28503,
  ID_C2S_ChickenInfo = 28504, --信息
  ID_S2C_ChickenInfo = 28505,
  ID_C2S_ChickenTouch = 28506, --点击
  ID_S2C_ChickenTouch = 28507,
  ID_C2S_ChickenCheckBox = 28508, --查看所在地图格的箱子
  ID_S2C_ChickenCheckBox = 28509,
  ID_C2S_ChickenPickUp = 28510, --拾取物品
  ID_S2C_ChickenPickUp = 28511,
  ID_C2S_ChickenDiscard = 28512, --丢弃物品
  ID_S2C_ChickenDiscard = 28513,
  ID_C2S_ChickenUseItem = 28514, --使用道具
  ID_S2C_ChickenUseItem = 28515,
  ID_C2S_ChickenSwitchWeapon = 28516, --切换武器
  ID_S2C_ChickenSwitchWeapon = 28517,
  ID_C2S_ChickenReload = 28518, --上膛
  ID_S2C_ChickenReload = 28519,
  ID_C2S_ChickenMatchStatus = 28520, --匹配状态
  ID_S2C_ChickenMatchStatus = 28521,

  ID_S2C_ChickenNotifyMove = 28522, --广播: 移动
  ID_S2C_ChickenNotifyDamage = 28523, --广播: 扣血
  ID_S2C_ChickenNotifyHeal = 28524, --广播: 回血
  ID_S2C_ChickenNotifyDie = 28525, --广播: 死亡
  ID_S2C_ChickenNotifyArrowAppear = 28526, --广播: 飞行箭出现
  ID_S2C_ChickenNotifyArrowDisappear = 28527, --广播: 飞行箭消失
  ID_S2C_ChickenNotifyToxin = 28528, --广播: 增加毒圈
  ID_S2C_ChickenNotifyItemAppear = 28529, --广播: 地图出现道具
  ID_S2C_ChickenNotifyItemDisappear = 28530, --广播: 地图道具消失
  ID_S2C_ChickenNotifyArmorPoint = 28531, --广播: 护甲值改变
  ID_S2C_ChickenGameOver = 28532, --游戏结束，玩家结算
  ID_C2S_ChickenTime = 28533, --活动时间
  ID_S2C_ChickenTime = 28534,
  ID_C2S_ChickenStartUseItem = 28535, --开始使用道具
  ID_S2C_ChickenStartUseItem = 28536,
  ID_C2S_ChickenUseHorse = 28537, --使用战马
  ID_S2C_ChickenUseHorse = 28538,

	--吃鸡组队模式(4.5.0)
	ID_C2S_ChickenUseBagItem = 28539,--队伍广播：使用背包道具 比如战鹰
	ID_S2C_ChickenUseBagItem = 28540,
	ID_C2S_ChickenInvite = 28541,--发起组队邀请
	ID_S2C_ChickenInvite = 28542,
	ID_S2C_ChickenInvited = 28543,--接收到邀请消息
	ID_C2S_ChickenResInvited = 28544,--响应邀请
	ID_S2C_ChickenResInvited = 28545,
	ID_C2S_ChickenKick = 28546,	--踢人或者离队
	ID_S2C_ChickenKick = 28547,
	ID_C2S_ChickenCreateTeam = 28548,--主动创建队伍
	ID_S2C_ChickenCreateTeam = 28559,
	ID_C2S_ChickenOpenTeam = 28550,	--设置队伍开放
	ID_S2C_ChickenOpenTeam = 28551,
	ID_C2S_ChickenJoinTeam = 28552,	--加入队伍
	ID_S2C_ChickenJoinTeam = 28553,
	ID_C2S_ChickenTeamInfo = 28554,	--组队信息
	ID_S2C_ChickenTeamInfo = 28555,
	ID_C2S_ChickenRescue = 28556,	--救援队友
	ID_S2C_ChickenRescue = 28557, --队伍：通知救援

	--骁勇榜
  ID_C2S_BraveListInfo = 28600,       --拉取制霸骁勇榜活动信息
  ID_S2C_BraveListInfo = 28601,
  ID_C2S_BraveListRoomInfo = 28602,   --拉取房间信息
  ID_S2C_BraveListRoomInfo = 28603,
  ID_C2S_BraveListChallenge = 28604,  --骁勇榜 挑战对手
  ID_S2C_BraveListChallenge = 28605,
  ID_C2S_BraveListVideo = 28606,  --骁勇榜 直升录像获取
  ID_S2C_BraveListVideo = 28607,
  ID_C2S_BraveListVideoList = 28608,	--直升录像列表，列出有哪些录像可看，不带具体录像
  ID_S2C_BraveListVideoList = 28609,
  ID_C2S_BraveListChallengeAllList = 28610, --直升挑战开始，获取直升对手列表
  ID_S2C_BraveListChallengeAllList = 28611,
  ID_C2S_BraveListChallengeAllOver = 28612, --直升挑战结束
  ID_S2C_BraveListChallengeAllOver = 28613,
  ID_C2S_BraveListChallengeAll = 28614,   --直升挑战
  ID_S2C_BraveListChallengeAll = 28615,
  ID_C2S_BraveListLevelChange = 28616,   --段位变化
  ID_S2C_BraveListLevelChange = 28617,
  ID_C2S_GetBraveListRank = 28618, --获取骁勇榜排行榜
  ID_S2C_GetBraveListRank = 28619,
  ID_C2S_BraveListRefuseRoomInfo = 28620,	--停止接收房间信息的推送
  ID_S2C_BraveListRefuseRoomInfo = 28621,
  ID_C2S_BraveListChangeRoom = 28622, --更换房间
  ID_S2C_BraveListChangeRoom = 28623,


  ID_C2S_GetFormationSwitch = 28680,
  ID_S2C_GetFormationSwitch = 28681,
  ID_C2S_SaveFormationSwitch = 28682,
  ID_S2C_SaveFormationSwitch = 28683,
  ID_C2S_SwitchFormation = 28684,
  ID_S2C_SwitchFormation = 28685,

  --天下营寨抢boss(4.3.0)
  ID_C2S_WorldWarGetCamp = 28700, --日常大地图，看城池
  ID_S2C_WorldWarGetCamp = 28701,
  ID_S2C_WorldWarCampCellChange = 28702,
  ID_C2S_WorldWarListenCamp = 28703,
  ID_S2C_WorldWarListenCamp = 28704,
  ID_C2S_WorldWarQuitCamp = 28705,
  ID_S2C_WorldWarQuitCamp = 28706,
  ID_C2S_WorldWarMigrateToCamp = 28707,
  ID_S2C_WorldWarMigrateToCamp = 28708,
  ID_C2S_WorldWarAttackCampMonster = 28709,
  ID_S2C_WorldWarAttackCampMonster = 28710,
  ID_C2S_WorldWarAttackCampUser = 28711,
  ID_S2C_WorldWarAttackCampUser = 28712,
  ID_S2C_WorldWarCampInfoChange = 28713,
  ID_C2S_WorldWarCampList = 28714,
  ID_S2C_WorldWarCampList = 28715,
  ID_C2S_WorldWarCampNotice = 28716,
  ID_S2C_WorldWarCampNotice = 28717,
  ID_C2S_WorldWarCampMyInfo = 28718,
  ID_S2C_WorldWarCampMyInfo = 28719,
  ID_C2S_WorldWarCampBuyAwardCnt = 28720,
  ID_S2C_WorldWarCampBuyAwardCnt = 28721,
  ID_S2C_WorldWarCampMonsterKilled = 28722,
  ID_C2S_WorldWarCampReviveWinner = 28723,
  ID_S2C_WorldWarCampReviveWinner = 28724,
  ID_S2C_WorldWarCampWinnerKicked = 28725,
  ID_C2S_WorldWarCampFollowRevive = 28726, --关注某异族，复活时收到推送消息
  ID_S2C_WorldWarCampFollowRevive = 28727,
  ID_C2S_WorldWarCampBuyEvil = 28728, --异族购买善恶值
  ID_S2C_WorldWarCampBuyEvil = 28729,
  ID_C2S_WorldWarCampGetProtectedAward = 28730, --异族领取保护奖励
  ID_S2C_WorldWarCampGetProtectedAward = 28731,
  ID_S2C_WorldWarCampUserKickedTimes   = 28732, --异族通知被击飞次数

  ID_C2S_WorldWarQueryUserPos = 28740, --日常大地图，查询玩家位置
  ID_S2C_WorldWarQueryUserPos = 28741,
  ID_C2S_QueryCorpAllianceInfo = 28742, --根据联盟id查联盟信息
  ID_S2C_QueryCorpAllianceInfo = 28743,

  --军团联盟-外交留言板
  ID_C2S_GetCorpAllianceForeignMsgBoard = 28744, --获取信息
  ID_S2C_GetCorpAllianceForeignMsgBoard = 28745,
  ID_C2S_CorpAllianceForeignMsgBoardOp = 28746,
  ID_S2C_CorpAllianceForeignMsgBoardOp = 28747,
  ID_S2C_CorpAllianceForeignMsgBoardOpBroadCast = 28748,

	--配置表下发 4.4.0
	ID_C2S_CheckFileChange = 28780,
	ID_S2C_CheckFileChange = 28781,
	ID_C2S_UpdateFilesData = 28782,
	ID_S2C_UpdateFilesData = 28783,
	ID_S2C_ServerFileChanged = 28784,

	--副将系统
	ID_C2S_GetViceFormationInfo = 28790,
	ID_S2C_GetViceFormationInfo = 28791,
	ID_C2S_SetViceFormationPos = 28792,
	ID_S2C_SetViceFormationPos = 28793,

	--传奇之路扩展
	ID_C2S_GetRoadExInfo = 28800,
	ID_S2C_GetRoadExInfo = 28801,
	ID_C2S_RoadExSelectLevel = 28802,
	ID_S2C_RoadExSelectLevel = 28803,
	ID_C2S_RoadExCheckAward = 28804,
	ID_S2C_RoadExCheckAward = 28805,
	ID_C2S_RoadExBuyCount = 28806,
	ID_S2C_RoadExBuyCount = 28807,
	ID_C2S_RoadExRush = 28808,
	ID_S2C_RoadExRush = 28809,
	ID_C2S_RoadExChallenge = 28810,
	ID_S2C_RoadExChallenge = 28811,
	ID_C2S_RoadExResetStage = 28812,
	ID_S2C_RoadExResetStage = 28813,

	--传奇之路 活动副本 4.5.0
	ID_C2S_GetRoadActInfo = 28830,	--获取活动副本信息
	ID_S2C_GetRoadActInfo = 28831,
	ID_C2S_RoadActSelectStory = 28832,	--选择章节
	ID_S2C_RoadActSelectStory = 28833,
	ID_C2S_RoadActKnightJoin = 28834,	--选择武将加入队伍
	ID_S2C_RoadActKnightJoin = 28835,

	--传奇之路联动副本-镇魂街 4.7.50
	ID_C2S_GetRoadLDInfo = 28840,
	ID_S2C_GetRoadLDInfo = 28841,

	--传奇之路-传记 4.9.0
	ID_C2S_RoadBiInfo = 28850,
	ID_S2C_RoadBiInfo = 28851,
	ID_C2S_RoadBiPerfectAward = 28852,
	ID_S2C_RoadBiPerfectAward = 28853,
	ID_C2S_RoadBiSelectAward = 28854,
	ID_S2C_RoadBiSelectAward = 28855,
	ID_C2S_RoadBiMiniInfo = 28856,
	ID_S2C_RoadBiMiniInfo = 28857,
	ID_S2C_RoadTimedEvent = 28858,	--通知发生定时事件


  --天下扩展组队以及营帐挑战
  ID_C2S_WorldWarTeamStatus = 28900,
  ID_S2C_WorldWarTeamStatus = 28901,
  ID_C2S_WorldWarTeamCreate = 28902,
  ID_S2C_WorldWarTeamCreate = 28903,
  ID_C2S_WorldWarTeamList = 28904,
  ID_S2C_WorldWarTeamList = 28905,
  ID_C2S_WorldWarTeamJoin = 28906,
  ID_S2C_WorldWarTeamJoin = 28907,
  ID_C2S_WorldWarTeamInvite = 28908,
  ID_S2C_WorldWarTeamInvite = 28909,
  ID_S2C_WorldWarTeamInvited = 28910,
  ID_C2S_WorldWarTeamInviteAll = 28911,
  ID_S2C_WorldWarTeamInviteAll = 28912,
  ID_C2S_WorldWarTeamKick = 28913,
  ID_S2C_WorldWarTeamKick = 28914,
  ID_C2S_WorldWarTeamLeave = 28915,
  ID_S2C_WorldWarTeamLeave = 28916,
  ID_C2S_WorldWarTeamChangeFormation = 28917,
  ID_S2C_WorldWarTeamChangeFormation = 28918,
  ID_C2S_WorldWarTeamChangePos = 28919,
  ID_S2C_WorldWarTeamChangePos = 28920,

  ID_C2S_WorldWarTeamAttackTent = 28921,--组队挑战营帐
  ID_S2C_WorldWarTeamAttackTent = 28922,

  ID_C2S_WorldWarTeamChangeTarget = 28923,--更改队伍目标
  ID_S2C_WorldWarTeamChangeTarget = 28924,

  ID_C2S_LoadFormationInfo      = 28925, --获取阵型信息
  ID_S2C_LoadFormationInfo      = 28926,
  ID_C2S_UpgradgeFormation      = 28927, --升级阵型
  ID_S2C_UpgradgeFormation      = 28928,
  
  ID_C2S_WorldWarTeamLog = 28930,
  ID_S2C_WorldWarTeamLog = 28931,

  ID_C2S_WorldWarTeamBossAwardForGameHelper = 28932, --异兽副本领取奖励-游戏助手
  ID_S2C_WorldWarTeamBossAwardForGameHelper = 28933, --异兽副本领取奖励-游戏助手

  ID_C2S_UpgrageRune = 29000, --符文升级/突破
  ID_S2C_UpgrageRune = 29001,
  ID_C2S_RecycleRune = 29002, --符文分解
  ID_S2C_RecycleRune = 29003,
  ID_C2S_UnlockRuneBook = 29004, --符文书解锁
  ID_S2C_UnlockRuneBook = 29005,
  ID_C2S_EquipRune = 29006, --装备符文
  ID_S2C_EquipRune = 29007,
  ID_C2S_RebornRune = 29008, --符文重生
  ID_S2C_RebornRune = 29009,

--4.5.0-新功能引导
	ID_C2S_GuideTaskInfo = 29050,				--获取引导成就任务数据
	ID_S2C_GuideTaskInfo = 29051,
	ID_C2S_GuideCheckTask = 29052,			--提交任务
	ID_S2C_GuideCheckTask = 29053,
	ID_C2S_TalkOverBroadInfo = 29054,		--获取留言板数据
	ID_S2C_TalkOverBroadInfo = 29055,
	ID_C2S_TalkOverBroadAdd = 29056,		--发言
	ID_S2C_TalkOverBroadAdd = 29057,
	ID_C2S_TalkOverBroadDel = 29058,		--删除
	ID_S2C_TalkOverBroadDel = 29059,
	ID_C2S_TalkOverBroadUp = 29060,			--赞
	ID_S2C_TalkOverBroadUp = 29061,
	ID_C2S_GuideRedHint = 29062,		--红点
	ID_S2C_GuideRedHint = 29063,

  --4.6.50-世界杯竞猜
  ID_C2S_GetWorldCupInfo = 29100, --世界杯竞猜配置信息
  ID_S2C_GetWorldCupInfo = 29101,
  ID_C2S_WorldCupChampionGuess = 29102, --冠军竞猜
  ID_S2C_WorldCupChampionGuess = 29103,
  ID_C2S_WorldCupGameGuess = 29104, --单场竞猜
  ID_S2C_WorldCupGameGuess = 29105,
  ID_C2S_WorldCupGameAward = 29106, --单场竞猜奖励
  ID_S2C_WorldCupGameAward = 29107,
  ID_C2S_WorldCupGuessMerit = 29108, --竞猜成就
  ID_S2C_WorldCupGuessMerit = 29109,

  --4.6.0-天下boss及集结组队
  ID_C2S_WorldWarTeamReport     = 29832,   --天下试炼队伍战报
  ID_S2C_WorldWarTeamReport     = 29833,
  ID_C2S_WorldWarTeamUserReport = 29834,   --天下试炼玩家个人日报
  ID_S2C_WorldWarTeamUserReport = 29835,
  ID_S2C_WorldWarTeamMove       = 29836,   --天下试炼队伍移动通知
  ID_C2S_WorldWarTeamReady      = 29837,   --队员准备，如果时队长准备，则通知开始副本
  ID_S2C_WorldWarTeamReady      = 29838,
  ID_S2C_WorldWarTeamBossStart  = 29839,   -- 副本开始
  ID_S2C_WorldWarTeamBossEnd    = 29840,   -- 副本结束
  ID_C2S_WorldWarTeamAttactBoss = 29841,   -- 玩家攻击boss
  ID_S2C_WorldWarTeamAttactBoss = 29842,
  ID_C2S_WorldWarTeamBossUserMove = 29843, -- 玩家移动
  ID_S2C_WorldWarTeamBossUserMove = 29844,
  ID_S2C_WorldWarTeamBossAct    = 29845,  --boss信息下发通知
  ID_C2S_WorldWarTeamBossInfo   = 29846,  --获取boss信息
  ID_S2C_WorldWarTeamBossInfo   = 29847,
  ID_S2C_WorldWarTeamBossCellChange = 29848,
  ID_C2S_WorldWarTeamSetLestenState = 29849, --设置监听状态
  ID_S2C_WorldWarTeamSetLestenState = 29850,

	ID_S2C_SendBattleReportBytes = 29851, --战报分段

  --4.6.5-天下boss优化
  ID_C2S_WorldWarTeamSetState  = 29852,
  ID_S2C_WorldWarTeamSetState  = 29853,

  --4.7.0
  ID_C2S_WorldWarTeamBossGetUserRank = 29854,
  ID_S2C_WorldWarTeamBossGetUserRank = 29855,

	--4.7.0-修罗道场
	ID_C2S_GetShuraFieldInfo = 29860,	--获取界面信息
	ID_S2C_GetShuraFieldInfo = 29861,
	ID_C2S_ShuraFieldChallenge = 29862, --挑战
	ID_S2C_ShuraFieldChallenge = 29863,
	ID_C2S_ShuraFieldRefresh = 29864, --刷新
	ID_S2C_ShuraFieldRefresh = 29865,
	ID_C2S_GetShuraFieldTaskAward = 29866, --领取活跃奖励
	ID_S2C_GetShuraFieldTaskAward = 29867,
  ID_C2S_BetOnShuraFieldPK = 29868, --竞猜精英对决
	ID_S2C_BetOnShuraFieldPK = 29869,
	ID_C2S_ViewShuraFieldPKReport = 29870, --回看昨日对决信息
	ID_S2C_ViewShuraFieldPKReport = 29871,
	ID_C2S_GetShuraFieldLog = 29872,	--日志记录
	ID_S2C_GetShuraFieldLog = 29873,
	ID_C2S_GetShuraFieldLevelAward = 29874,	--领取段位奖励
	ID_S2C_GetShuraFieldLevelAward = 29875,
	ID_C2S_GetShuraFieldBriefInfo = 29876,	--获取简要信息 开启，血量
	ID_S2C_GetShuraFieldBriefInfo = 29877,

	--4.7.50-联动拼图
	ID_C2S_JigsawInfo = 29900,	--获取信息
	ID_S2C_JigsawInfo = 29901,
	ID_C2S_JigsawOp = 29902,		--拼图激活、领奖
	ID_S2C_JigsawOp = 29903,
	ID_C2S_JigsawShare = 29904,	--领取分享奖励
	ID_S2C_JigsawShare = 29905,

	--4.8.0-无上秘境
	ID_C2S_MysteryInfo = 29920,	--获取信息
	ID_S2C_MysteryInfo = 29921,
	ID_C2S_MysteryChallenge = 29922, --挑战
	ID_S2C_MysteryChallenge = 29923,
	ID_C2S_MysteryReward = 29924,	--进度奖励
	ID_S2C_MysteryReward = 29925,
	ID_C2S_MysteryMonsterInfo = 29926, --查看怪物信息
	ID_S2C_MysteryMonsterInfo = 29927,
	ID_C2S_MysteryPurchaseCount = 29928, --购买次数
	ID_S2C_MysteryPurchaseCount = 29929,
	ID_C2S_MysteryChapterMonsterInfo = 29930,--获取章节内关卡显示
	ID_S2C_MysteryChapterMonsterInfo = 29931,
	ID_C2S_MysteryShopInfo = 29932,	--获取商店已购买次数
	ID_S2C_MysteryShopInfo = 29933,
	ID_S2C_MysteryCoinInfo = 29934,	--推送代币变化
	ID_C2S_MysteryChallengeFast = 29935, --快速挑战
	ID_S2C_MysteryChallengeFast = 29936,
	ID_C2S_MysteryRewardOneKey = 29937,	--一键进度奖励
	ID_S2C_MysteryRewardOneKey = 29938,


	--天下一键  游戏助手
	ID_C2S_WorldWarAttackMonsterOneKey = 30001,
	ID_S2C_WorldWarAttackMonsterOneKey = 30002,
	ID_C2S_WorldWarAttackSummonMonsterOneKey = 30003,
	ID_S2C_WorldWarAttackSummonMonsterOneKey = 30004,
	--彩金图鉴
	ID_C2S_GetMGKnightHandbookInfo = 30005,
	ID_S2C_GetMGKnightHandbookInfo = 30006,
	ID_C2S_UpgradeMGKnightHandbook = 30007,	--升级
	ID_S2C_UpgradeMGKnightHandbook = 30008,
	ID_C2S_EquipMGKnightHandbook = 30009,	--装备
	ID_S2C_EquipMGKnightHandbook = 30010,
	ID_S2C_UpdateKnightHandbook = 30011,	--更新
    --xcb新赤壁
    ID_C2S_GetAncientPvpSchedule = 31000,	-- 拉取所有配置信息
    ID_S2C_GetAncientPvpSchedule = 31001,
    ID_C2S_GetAncientPvpBaseInfo = 31002,	-- 拉取基本信息，round 和state主控
    ID_S2C_GetAncientPvpBaseInfo = 31003,
    ID_C2S_GetAncientPvpScheduleInfo = 31004, --每个战场信息（等级 人数...）
    ID_S2C_GetAncientPvpScheduleInfo = 31005,
    ID_C2S_ApplyAncientPvp = 31006,			--跨服夺帅报名
    ID_S2C_ApplyAncientPvp = 31007,
    ID_C2S_ApplyAtcAndDefAncientPvp = 31010,--鼓舞
    ID_S2C_ApplyAtcAndDefAncientPvp = 31011,
    ID_C2S_AncientMove = 31012,--房间内移动
    ID_S2C_AncientMove = 31013,--房间内移动
    ID_C2S_GetAncientPvpRoomInfo = 31015,		--获取跨服战房间信息
    ID_S2C_GetAncientPvpRoomInfo = 31016,
    ID_S2C_AncientBroadRoomChange = 31017,		--广播房间内变化
    ID_C2S_AncientPvpBattle = 31019,		--攻打坑位
    ID_S2C_AncientPvpBattle = 31020,
    ID_C2S_GetAncientPvpRank = 31021,		--获取房间排行榜
    ID_S2C_GetAncientPvpRank = 31022,
    ID_C2S_AncientWaitRank = 31030,			--回顾阶段获取当前轮的排行榜
    ID_S2C_AncientWaitRank = 31031,
    ID_C2S_AncientWaitFlower = 31032,		--送鲜花扔鸡蛋
    ID_S2C_AncientWaitFlower = 31033,
    ID_C2S_ReplayAncientPvpRole = 31034,	--战斗后的回顾
    ID_S2C_ReplayAncientPvpRole = 31035,	--战斗后的回顾
    ID_C2S_AncientWaitInitFlowerInfo = 31038, --一轮过后鲜花鸡蛋信息
    ID_S2C_AncientWaitInitFlowerInfo = 31039,
    ID_C2S_GetAncientPvpOb= 31040,--获取OB信息
    ID_S2C_GetAncientPvpOb = 31041,
    ID_C2S_AncientWaitFlowerRank = 31042,	--鲜花鸡蛋榜
    ID_S2C_AncientWaitFlowerRank = 31043,
    ID_C2S_AncientFlowerEggBetRank = 31044,
    ID_S2C_AncientFlowerEggBetRank = 31045,
    ID_C2S_AncientPvpObRoom = 31046,--进入和离开房间 0表示离开房间, >0表示进入房间
    ID_S2C_AncientPvpObRoom = 31047,
    ID_C2S_AncientPvpGetAward = 31048,		--领取排行奖励
    ID_S2C_AncientPvpGetAward = 31049,
    ID_S2C_AncientPvpNotifyBattle = 31050,
    ID_C2S_AncientPvpPlay = 31051,  --进入\离开在新赤壁界面
    ID_S2C_AncientPvpPlay = 31052,
    ID_S2C_AncientPvpBroadState = 31053,
    --------/以上是新赤壁目前实现的协议--------------------------/
    ID_C2S_SurfaceShopping = 31100,--外观商店购买
    ID_S2C_SurfaceShopping = 31101,
    ID_C2S_SurfaceShopEquip = 31102,--商店中正在体验的皮肤
    ID_S2C_SurfaceShopEquip = 31103,
    ID_S2C_FlushSurfaceRMBInfo = 31105,--直充成功发奖信息


  --军师
  ID_C2S_GetMilitarist    = 31120,        --获取军师数据
  ID_S2C_GetMilitarist    = 31121,
  ID_C2S_GetMilitaristComposeGro = 31122, --获取军师已激活图鉴组数据
  ID_S2C_GetMilitaristComposeGro = 31123,

  ID_S2C_MilitaristBookScore = 31124,     --服务器主动推送图鉴评分信息（军师升星，军师重生，军师转生都会推送）

  --军师养成
  ID_C2S_MilitaristStarUp = 31125,        --请求军师升星
  ID_S2C_MilitaristStarUp = 31126,
  ID_C2S_MilitaristTrans = 31127,         --请求军师转生
  ID_S2C_MilitaristTrans = 31128,
  ID_C2S_MilitaristRebirth = 31129,       --请求军师重生
  ID_S2C_MilitaristRebirth = 31130,

  --军师图鉴养成
  ID_C2S_MilitaristBookStar = 31131,      --请求军师图鉴升星
  ID_S2C_MilitaristBookStar = 31132,
  ID_C2S_MilitaristBookLevelUp = 31133,   --请求军师图鉴升阶
  ID_S2C_MilitaristBookLevelUp = 31134,
  ID_C2S_MilitaristBookRebirth = 31135,   --请求军师图鉴升阶
  ID_S2C_MilitaristBookRebirth = 31136,

  ID_C2S_GetCommonFormation = 31137,  --请求军师阵型
  ID_S2C_GetCommonFormation = 31138,
  ID_C2S_SetCommonFormation = 31139,  --请求设置军师阵型
  ID_S2C_SetCommonFormation = 31140,

  ID_C2S_MilitaristUp = 31141, --请求军师升级
  ID_S2C_MilitaristUp = 31142, --返回军师升级
  ID_C2S_MilitaristMatrixUpgrade = 31143, --军师阵法
  ID_S2C_MilitaristMatrixUpgrade = 31144, 
  
  --少三之路
  ID_C2S_AnniversaryMove = 31150, --攀登
  ID_S2C_AnniversaryMove = 31151,
  ID_C2S_AnniversaryAward = 31152, --领取据点奖励
  ID_S2C_AnniversaryAward = 31153,
  ID_C2S_AnniversaryJigsaw = 31154, --激活拼图
  ID_S2C_AnniversaryJigsaw = 31155,
  ID_C2S_AnniversaryJigsawAwards = 31156, --领取拼图奖励
  ID_S2C_AnniversaryJigsawAwards = 31157,
  ID_C2S_AnniversaryData = 31158, --玩家活动数据
  ID_S2C_AnniversaryData = 31159,
  ID_C2S_AnniversaryInfo = 31160, --活动基本信息
  ID_S2C_AnniversaryInfo = 31161,
  ID_S2C_AnniversaryScoreChange = 31162,--推送前端积分变化

	--联盟驻地
	ID_C2S_AllianceFarmInfo = 31200,	--联盟农场信息
	ID_S2C_AllianceFarmInfo = 31201,
	ID_C2S_AllianceFarmSeedAdd = 31202, --投放种子
	ID_S2C_AllianceFarmSeedAdd = 31203,
	ID_C2S_AllianceFarmGather = 31204,	--收获
	ID_S2C_AllianceFarmGather = 31205,
	ID_C2S_AllianceFarmLog = 31206,	--查看日志
	ID_S2C_AllianceFarmLog = 31207,
	ID_C2S_AllianceFarmDaily = 31208,	--完成每日任务
	ID_S2C_AllianceFarmDaily = 31209,
	ID_C2S_AllianceFarmHelp = 31210,	--帮助他人除虫
	ID_S2C_AllianceFarmHelp = 31211,
	ID_C2S_AllianceFarmDetailInfo = 31212, --农田详情
	ID_S2C_AllianceFarmDetailInfo = 31213,
	ID_C2S_AllianceFarmSelfInfo = 31214,	--自己农田相关信息
	ID_S2C_AllianceFarmSelfInfo = 31215,
	ID_C2S_AllianceFarmStopPlant = 31216, --停止种田
	ID_S2C_AllianceFarmStopPlant = 31217,
	ID_C2S_AllianceFarmSpreadLog = 31218,	--查看施肥日志
	ID_S2C_AllianceFarmSpreadLog = 31219,

  --5.2.0 神机阁扩展-神器屋
	ID_C2S_FlushArtifactInfo = 31230, --养成信息
	ID_S2C_FlushArtifactInfo = 31231, 
	ID_C2S_ArtifactCompose = 31232,--养成
	ID_S2C_ArtifactCompose = 31233,
	ID_C2S_ArtifactEquip = 31234,--装备神器
	ID_S2C_ArtifactEquip = 31235, 
	ID_C2S_FlushArtifactDonateInfo = 31236,--联盟成员请求列表
	ID_S2C_FlushArtifactDonateInfo = 31237, 
	ID_C2S_ArtifactDonateRequest = 31238, --发起捐赠请求
	ID_S2C_ArtifactDonateRequest = 31239, 
	ID_C2S_ArtifactDonateGive = 31240, --赠与
	ID_S2C_ArtifactDonateGive = 31241, 
	ID_S2C_GetSimpleItem = 31242,	--全部简单道具推送

  ID_S2C_NotifyKnightInfo = 31300, --武将信息更新
  ID_S2C_NotifyAntiIndulData = 31301, --通知玩家防沉迷数据
  ID_S2C_NotifyAntiIndulState = 31302,--通知玩家进入防沉迷状态倒计时
  ID_C2S_EquipQuench = 31303, --请求淬火
  ID_S2C_EquipQuench = 31304, --淬火返回结果
  ID_C2S_EquipInherit = 31305, --装备继承
  ID_S2C_EquipInherit = 31306, --装备继承返回结果
  ID_S2C_NotifyDelayKick = 31307, --通知客户端将要被踢
  ID_S2C_TouristTimeOut = 31308, --游客模式到期

	--5.1.0 联盟合战
	ID_C2S_AllianceBattleInfo = 31310, --获取信息
	ID_S2C_AllianceBattleInfo = 31311,
	ID_C2S_AllianceBattleChallenge = 31312,	--挑战关卡
	ID_S2C_AllianceBattleChallenge = 31313,
	ID_C2S_AllianceBattleChapterInfo = 31314, --获取章节信息
	ID_S2C_AllianceBattleChapterInfo = 31315,
	ID_C2S_AllianceBattleGetAimAward = 31316, --领取目标奖励
	ID_S2C_AllianceBattleGetAimAward = 31317,
	ID_C2S_AllianceBattleGetAllianceReward = 31318, --领取联盟合战进度奖励
	ID_S2C_AllianceBattleGetAllianceReward = 31319,
	ID_C2S_AllianceBattleRankInfo = 31320, --战绩信息
	ID_S2C_AllianceBattleRankInfo = 31321,
	ID_C2S_AllianceBattleHelpList = 31322, --拉取助战列表
	ID_S2C_AllianceBattleHelpList = 31323,
	ID_C2S_AllianceBattleUpdate = 31324, --定时请求更新
	ID_S2C_AllianceBattleUpdate = 31325,
	ID_C2S_AllianceBattleOnekey = 31326, --6.3.50-时间简化
	ID_S2C_AllianceBattleOnekey = 31327,

  --5.2.0 天下宠物扩展
  ID_C2S_WorldWarSearchSummonMonster = 31328,
  ID_S2C_WorldWarSearchSummonMonster = 31329,
  ID_C2S_WorldWarCancleSummonMonster = 31330,
  ID_S2C_WorldWarCancleSummonMonster = 31331,
  ID_C2S_WorldWarGetSummonMonster = 31332,
  ID_S2C_WorldWarGetSummonMonster = 31333,

  --5.2.0 军师图鉴一键升星升阶
  ID_C2S_MilitaristBookStarLevelUp = 31334,
  ID_S2C_MilitaristBookStarLevelUp = 31335,

	--5.3.0 寻龙摸金
	ID_C2S_RogueInfo = 31350,
	ID_S2C_RogueInfo = 31351,
	ID_C2S_RogueGameCreate = 31352,	--创建队伍
	ID_S2C_RogueGameCreate = 31353,
	ID_C2S_RogueGameInvite = 31354,	--邀请
	ID_S2C_RogueGameInvite = 31355,
	ID_C2S_RogueGameJoin = 31356,	--加入队伍
	ID_S2C_RogueGameJoin = 31357,
	ID_C2S_RogueGameStart  = 31358, --下墓
	ID_S2C_RogueGameStart  = 31359,
	ID_C2S_RogueGameAction = 31360,		--游戏内行动
	ID_S2C_RogueGameAction = 31361,
	ID_S2C_RogueGameInfo  = 31362,		--推送房间整体信息
	ID_S2C_RogueGameUpdate = 31363,		--推送游戏内变更
	ID_S2C_RogueGameInTurn = 31364, 	--玩家换手
	ID_S2C_RogueGameInviteNotify = 31365, --通知被邀请者
	ID_C2S_RogueGameInviteNotify = 31366, --拉取
	ID_C2S_RogueGameLeave = 31369,  --离开游戏
	ID_S2C_RogueGameLeave	= 31370,
	ID_C2S_RogueGameKick = 31371, --组队房间中，踢人
	ID_S2C_RogueGameKick = 31372, --这条消息会发给房间内双方，根据sid，uid判断是不是自己被踢了
	ID_C2S_RogueGameBuy = 31374,	--商店购买
	ID_S2C_RogueGameBuy = 31375,
	ID_C2S_RogueGameAddAI = 31376,	--添加ai 
	ID_S2C_RogueGameAddAI = 31377,
	ID_C2S_RogueGameReconnection = 31378, --断线重连
	ID_S2C_RogueGameReconnection = 31379,
	ID_C2S_RogueGameSelectFloor = 31380, --选层
	ID_S2C_RogueGameSelectFloor = 31381,
	ID_S2C_RogueGamePoint = 31382,	--指示
	ID_C2S_RogueGamePoint = 31383,	


  ID_S2C_SyncFarmPos = 31373, --同步农田位置

	--5.3.0 军师副将系统
	ID_C2S_GetMilitaristViceFormationInfo = 31400,
	ID_S2C_GetMilitaristViceFormationInfo = 31401,
	ID_C2S_SetMilitaristViceFormationPos = 31402,
	ID_S2C_SetMilitaristViceFormationPos = 31403,
	
	--5.3.0 藏经阁系统
	ID_C2S_GetBookLibraryInfo 	= 31500,	--获取信息
	ID_S2C_GetBookLibraryInfo 	= 31501,
	ID_C2S_ReadBook 			= 31502,	--研读
	ID_S2C_ReadBook 			= 31503,
	ID_C2S_ReadBookSpeedUp 		= 31504,	--加速
	ID_S2C_ReadBookSpeedUp 		= 31505,
	ID_C2S_ReadBookTimeQuery 	= 31506,	--研读时间查询（进入研读界面时由客户端主动发起）
	ID_S2C_ReadBookTimeQuery 	= 31507,
	ID_C2S_ReadBookTimeAward 	= 31508,	--领取研读顿悟奖励
	ID_S2C_ReadBookTimeAward 	= 31509,
	
	--5.4.0 鏖战英灵
	ID_C2S_WorldWarSpiritGetInfo 		= 31600,	--获取信息
	ID_S2C_WorldWarSpiritGetInfo 		= 31601,
	ID_C2S_WorldWarSpiritSelectGroup	= 31602,	--选择阵营
	ID_S2C_WorldWarSpiritSelectGroup 	= 31603,
	ID_C2S_WorldWarSpiritChallenge 		= 31604,	--挑战boss
	ID_S2C_WorldWarSpiritChallenge 		= 31605,
	ID_C2S_WorldWarSpiritGetAwardInfo 	= 31606,	--获取伤害奖励信息
	ID_S2C_WorldWarSpiritGetAwardInfo 	= 31607,
	ID_C2S_WorldWarSpiritAward 			= 31608,	--领取伤害奖励
	ID_S2C_WorldWarSpiritAward 			= 31609,
	ID_C2S_WorldWarSpiritBuyCount 		= 31610,	--购买挑战次数
	ID_S2C_WorldWarSpiritBuyCount 		= 31611,
	

	ID_C2S_CorpAllianceSpiritAwardInfo	= 31620, 	--联盟奖励分配信息
	ID_S2C_CorpAllianceSpiritAwardInfo 	= 31621,		
	ID_C2S_CorpAllianceSpiritAward 		= 31622,	--联盟奖励分配
	ID_S2C_CorpAllianceSpiritAward 		= 31623,
	ID_C2S_CorpSpiritAwardInfo 			= 31624,	--军团奖励分配信息
	ID_S2C_CorpSpiritAwardInfo 			= 31625,
	ID_C2S_CorpSpiritAward 				= 31626,	--军团奖励分配
	ID_S2C_CorpSpiritAward 				= 31627,
	ID_C2S_CorpSpiritMemberList 		= 31628,	--军团可分配成员列表
	ID_S2C_CorpSpiritMemberList 		= 31629,

	ID_C2S_CalmanBlessingSet = 31700, --战斗测试用，设置属性
	ID_S2C_CalmanBlessingSet = 31701,
	ID_C2S_CalmanBlessingReset = 31702,--战斗测试用，重置
	ID_S2C_CalmanBlessingReset = 31703,

    ID_C2S_TestDataType = 31750, --测试协议数据类型
    ID_S2C_TestDataType = 31751, --

	ID_C2S_TestSrpgBattle = 31760,
	ID_S2C_TestSrpgBattle = 31761,
	ID_S2C_SendSrpgBattleReportBytes = 31762,
	
--!!!!!!!!!!!!!!!!!!!!!!!!消息号定义新规则-新加都加到下面!!!!!!!!!!!!!!!!!!!!!!!!!!!!
----------------------------200000 -- 290000 C2S--------------------------------
--远征   200000-------200100    start
  ID_C2S_AreaBattleTeamCreate       = 200000,     --创建队伍
  ID_S2C_AreaBattleTeamCreate       = 200001,

  ID_C2S_AreaBattleTeamInvite       = 200002,     --邀请成员
  ID_S2C_AreaBattleTeamInvite       = 200003,

  ID_C2S_AreaBattleTeamKick         = 200004,     --踢出成员
  ID_S2C_AreaBattleTeamKick         = 200005,

  ID_C2S_AreaBattleTeamEnter        = 200006,     --加入队伍
  ID_S2C_AreaBattleTeamEnter        = 200007,

  ID_C2S_AreaBattleTeamApply        = 200008,     --队伍报名
  ID_S2C_AreaBattleTeamApply        = 200009,

  ID_C2S_AreaBattleTeamChangePos    = 200010,     --队伍调整位置
  ID_S2C_AreaBattleTeamChangePos    = 200011,

  ID_C2S_AreaBattleTeamReady        = 200012,     --成员准备-》进入房间，带battleuser，准备战斗
  ID_S2C_AreaBattleTeamReady        = 200013,


  ID_C2S_AreaBattleInfo             = 200014,     --活动详细信息
  ID_S2C_AreaBattleInfo             = 200015,

  ID_C2S_AreaBattleGameInfo         = 200016,      --一个战斗的信息
  ID_S2C_AreaBattleGameInfo         = 200017,

  ID_C2S_AreaBattleGameList         = 200018,      --队伍战斗列表
  ID_S2C_AreaBattleGameList         = 200019,

  ID_C2S_AreaBattleSendBrave        = 200020,      --鼓舞精彩
  ID_S2C_AreaBattleSendBrave        = 200021,

  ID_S2C_AreaBattleInfoNtf          = 200022,      --活动信息变化通知
  ID_S2C_AreaBattleGameInfoNtf      = 200023,      --战斗信息变化通知
  ID_S2C_AreaBattleAreaGameBattleNtf = 200024,     --成员战斗结果通知
  ID_S2C_AreaBattleAreaGameResultNtf = 200025,     --战斗结果通知
  ID_S2C_AreaBattleTeamInviteNtf     = 200026,     --邀请通知
  ID_S2C_AreaBattleTeamKickNtf       = 200027,     --踢出玩家通知
  ID_S2C_AreaBattleTeamInfoNtf       = 200028,     --队伍信息变化通知

  ID_C2S_AreaBattleTeamInfo          = 200029,
  ID_S2C_AreaBattleTeamInfo          = 200030,     --队伍信息

  ID_C2S_AreaBattleGetRewards          = 200031,
  ID_S2C_AreaBattleGetRewards          = 200032,     --获取奖励

  ID_C2S_AreaBattleUseSkill             = 200035,  --使用技能
  ID_S2C_AreaBattleUseSkill             = 200034,

  --ID_S2C_AreaBattleBraveAwardsNtf       = 200035,  --押注鼓舞，奖励下方

  ID_C2S_AreapveLoadMonsterPrepareInfo = 200050,  --加载战备副本信息
  ID_S2C_AreapveLoadMonsterPrepareInfo = 200051,  
  ID_C2S_AreapveLoadMonsterInfo        = 200052,  --加载战区守护兽相关信息
  ID_S2C_AreapveLoadMonsterInfo        = 200053,
  ID_C2S_AreapveCreateGame             = 200054,  --开始一次对局
  ID_S2C_AreapveCreateGame             = 200055,
  ID_C2S_AreapveChangeFormation        = 200056,  --变阵
  ID_S2C_AreapveChangeFormation        = 200057,
  ID_C2S_AreapveSelectSkill            = 200058,  --选择技能
  ID_S2C_AreapveSelectSkill            = 200059,
  ID_C2S_AreapveAttack                 = 200060,  --锁定阵型开始战斗
  ID_S2C_AreapveAttack                 = 200061,
  ID_C2S_AreapveGetMonsterLevelAward   = 200062,  --领取守护兽升级奖励
  ID_S2C_AreapveGetMonsterLevelAward   = 200063,   
  ID_C2S_AreapveCancelGame             = 200064,  --放弃游戏
  ID_S2C_AreapveCancelGame             = 200065,
--远征   200000-------200100    end

--真三国无双 200101-------200150
 -- ID_C2S_RealDeadBattleLoadInfo        = 200101,  --加载真三国无双数据
 -- ID_S2C_RealDeadBattleLoadInfo        = 200102,
 -- ID_C2S_RealDeadBattleRankChallenge   = 200103,  --真三国无双定级挑战
 -- ID_S2C_RealDeadBattleRankChallenge   = 200104,
 -- ID_C2S_RealDeadBattleChallenge       = 200105,  --真三国无双挑战
 -- ID_S2C_RealDeadBattleChallenge       = 200106,
 -- ID_C2S_RealDeadBattleChallengeAuto   = 200107,  --真三国无双三星扫荡
 -- ID_S2C_RealDeadBattleChallengeAuto   = 200108,
 -- ID_C2S_RealDeadBattleReset           = 200109,  --真三国无双重置
 -- ID_S2C_RealDeadBattleReset           = 200110,
 -- ID_C2S_RealDeadBattleEliteInfo       = 200111,  --真三国无双精英数据
 -- ID_S2C_RealDeadBattleEliteInfo       = 200112,
 -- ID_C2S_RealDeadBattleEliteChallenge  = 200113,  --真三国无双精英挑战
 -- ID_S2C_RealDeadBattleEliteChallenge  = 200114,
--真三国无双 200101-------200150    end

--限时道具 200151--------200170
	ID_C2S_UseTimeItem			= 200151,	--使用定时道具
	ID_S2C_UseTimeItem			= 200152,	
	ID_S2C_GetTimeItem			= 200153,	--获取定时道具
	ID_S2C_UpdateUserModuleFlags = 200154,	--更新user flag 暂时放这里


--v3通用榜 
	ID_C2S_GetV3CRank = 200171,
	ID_S2C_GetV3CRank = 200172,
----------------------------/

--换包奖励 200201-------200250
	ID_C2S_GetUpdateReward			= 200201, --获取换包奖励
	ID_S2C_GetUpdateReward			= 200202,

--新表情包 200251 -------200260
	ID_C2S_UserEmoji = 200251,
	ID_S2C_UserEmoji = 200252,

--通行证 200261--------200280
  ID_C2S_BattlePassInfo = 200261, -- 获取通行证信息
  ID_S2C_BattlePassInfo = 200262,
  ID_C2S_BattlePassGetAward = 200263, -- 通行证领奖
  ID_S2C_BattlePassGetAward = 200264,
  ID_S2C_BattlePassBuyPass = 200265, -- 购买通行证
  ID_S2C_BattlePassBuyExp = 200266, -- 购买通行证经验
  ID_S2C_BattlePassNtf    = 200267, --升级通知
  ID_C2S_BattlePassGetLevelAward = 200268, -- 通行证领等级奖
  ID_S2C_BattlePassGetLevelAward = 200269,


--客户端获配置表格 200281--------200290
  ID_C2S_GetExcelData = 200281, -- 获取配置表格
  ID_S2C_GetExcelData = 200282,

--210000------211000  ----楼兰烽火 begin
  ID_C2S_LouLanEnterMap         = 210000,      --进入楼兰
  ID_S2C_LouLanEnterMap         = 210001,
  ID_C2S_LouLanAttackUser       = 210002,      --攻打人
  ID_S2C_LouLanAttackUser       = 210003,
  ID_C2S_LouLanAttackMonster    = 210004,      --攻打怪物
  ID_S2C_LouLanAttackMonster    = 210005,
  ID_C2S_LouLanAttackCity       = 210006,      --攻打城池
  ID_S2C_LouLanAttackCity       = 210007,
  ID_C2S_LouLanMigrate          = 210008,      --迁移
  ID_S2C_LouLanMigrate          = 210009,

  ID_C2S_LouLanWarCity          = 210010,      --城池宣战
  ID_S2C_LouLanWarCity          = 210011,

  ID_C2S_LouLanReturnCity       = 210012,      --回城
  ID_S2C_LouLanReturnCity       = 210013,

  ID_S2C_LouLanCellChangeNtf    = 210014,      --cell变化通知
  ID_S2C_LouLanWarCityNtf       = 210015,      --城池被宣战通知
  ID_S2C_LouLanCityChangeNtf    = 210016,      --城池变化通知
  ID_S2C_LouLanAwardsNtf        = 210017,      --发奖通知

  ID_C2S_LouLanMapMove          = 210018,      --拉取地图窗口
  ID_S2C_LouLanMapMove          = 210019,

  ID_C2S_LouLanMapListen        = 210020,      --监听地图
  ID_S2C_LouLanMapListen        = 210021,

  ID_C2S_LouLanSetMigratePos    = 210022,      --设置集结点
  ID_S2C_LouLanSetMigratePos    = 210023,

  ID_C2S_LouLanGetRewards       = 210024,      --获取最终奖励
  ID_S2C_LouLanGetRewards       = 210025,

  ID_C2S_LouLanMapQuit 			= 210026,	   --离开地图
  ID_S2C_LouLanMapQuit 			= 210027,
  
  --丝绸之路 6.5.0 start
  ID_C2S_LouLanEscortCartList = 210028, --镖车信息
  ID_S2C_LouLanEscortCartList = 210029,

  ID_C2S_LouLanRobCart = 210030,  --抢夺镖车
  ID_S2C_LouLanRobCart = 210031,

  ID_C2S_LouLanGetEscortCart = 210032,  --开始运镖
  ID_S2C_LouLanGetEscortCart = 210033,

  ID_C2S_LouLanRequestBackCart = 210034,  --请求夺回镖车
  ID_S2C_LouLanRequestBackCart = 210035,

  ID_C2S_LouLanHelpBackCart = 210036,  --帮助夺回镖车
  ID_S2C_LouLanHelpBackCart = 210037,

  ID_S2C_LouLanCartInfoNtf = 210038,   --镖车信息变更广播
  ID_S2C_LouLanRequestBackCartNtf = 210039, --请求夺回镖车通知
  ID_S2C_LouLanHelpBackCartNtf = 210040, --帮助夺回镖车通知

  ID_C2S_LouLanRandEscortCart  = 210041, --随机镖车
  ID_S2C_LouLanRandEscortCart  = 210042, --随机镖车
  --丝绸之路 6.5.0 end


  ID_C2S_LouLanBaseInfo         = 210120,      --基础信息
  ID_S2C_LouLanBaseInfo         = 210121,
  ID_C2S_LouLanGroupInfo        = 210122,      --阵营信息
  ID_S2C_LouLanGroupInfo        = 210123,
  ID_C2S_LouLanGroupJob         = 210124,      --阵营官职(取消)
  ID_S2C_LouLanGroupJob         = 210125,
  ID_C2S_LouLanGroupCandidate   = 210126,      --阵营官职候选人列表(取消)
  ID_S2C_LouLanGroupCandidate   = 210127,
  ID_C2S_LouLanSetJobMinister   = 210128,      --设置丞相
  ID_S2C_LouLanSetJobMinister   = 210129,
  ID_C2S_LouLanSetJobLeader     = 210130,      --设置王
  ID_S2C_LouLanSetJobLeader     = 210131,
  ID_C2S_LouLanImpeachLeader    = 210132,      --弹劾王
  ID_S2C_LouLanImpeachLeader    = 210133,
  ID_C2S_LouLanGroupLeaderCandidate = 210134, -- 阵营初始王候选人列表
  ID_S2C_LouLanGroupLeaderCandidate = 210135,
  ID_S2C_LouLanGroupJobChange = 210136, --通知客户端职位变化

  ID_C2S_LouLanGetTechInfos		= 210150,	--获取科技信息
  ID_S2C_LouLanGetTechInfos		= 210151,
  ID_C2S_LouLanUplevelTech		= 210152,	--升级科技
  ID_S2C_LouLanUplevelTech		= 210153,
  ID_C2S_LouLanResetTech		= 210154,	--重置科技
  ID_S2C_LouLanResetTech		= 210155,
  ID_C2S_LouLanGetItemInfos		= 210156,	--获取道具信息
  ID_S2C_LouLanGetItemInfos		= 210157,
  ID_S2C_LouLanAddItem			= 210158,	--获得道具
  ID_C2S_LouLanBuyItem			= 210159,	--购买道具
  ID_S2C_LouLanBuyItem			= 210160,
  ID_C2S_LouLanUseItem			= 210161,	--使用道具
  ID_S2C_LouLanUseItem			= 210162,
  ID_C2S_LouLanBuyRes			= 210163,	--购买资源
  ID_S2C_LouLanBuyRes			= 210164,

  ID_C2S_LouLanGroupMsgBoardGet = 210180,	--势力留言板-获取信息
  ID_S2C_LouLanGroupMsgBoardGet = 210181,
  ID_C2S_LouLanGroupMsgBoardOp 	= 210182,	--势力留言板-操作
  ID_S2C_LouLanGroupMsgBoardOp 	= 210183,
  ID_S2C_LouLanGroupMsgBoardOpBroadCast = 210184,--势力留言板-广播

--210000------211000  ----楼兰烽火 end

--春节祝福语211001------211050
  ID_C2S_GetSpringWordsInfo		= 211001,	--获取春节祝福语的领取记录
  ID_S2C_GetSpringWordsInfo		= 211002,
  ID_C2S_GetSpringWordsAwards	= 211003,	--领取春节祝福语奖励
  ID_S2C_GetSpringWordsAwards	= 211004,
	ID_S2C_SpringFirecrackerShow = 211005, --春节祝福爆竹

--汉室秘宝-----211051-211100
  ID_C2S_RateTreasureGetInfo		= 211051, --汉室秘宝信息
  ID_S2C_RateTreasureGetInfo		= 211052,   
  ID_C2S_RateTreasureDraw			= 211053, --抽奖
  ID_S2C_RateTreasureDraw			= 211054,
  ID_C2S_RateTreasureDrawAll		= 211055, --抽取全部
  ID_S2C_RateTreasureDrawAll		= 211056,
  ID_C2S_RateTreasureResetGifts		= 211057, --重置奖池
  ID_S2C_RateTreasureResetGifts   	= 211058,
  ID_C2S_RateTreasureSelectGift 	= 211059, --选择奖池奖励
  ID_S2C_RateTreasureSelectGift 	= 211060,
  ID_C2S_UpgradeRunestoneEnhance    = 212001,--兵符赋能强化
  ID_S2C_UpgradeRunestoneEnhance    = 212002,
  ID_C2S_SelectRunestoneEnhance     = 212003,--兵符赋能分支选择
  ID_S2C_SelectRunestoneEnhance     = 212004,
  ID_C2S_ResetRunestoneEnhance      = 212005,--兵符赋能重置
  ID_S2C_ResetRunestoneEnhance      = 212006,
  ID_C2S_OneKeyInstallRunestoneWarSoul = 212007,--兵符一键装备战魂
  ID_S2C_OneKeyInstallRunestoneWarSoul = 212008,
  ID_C2S_OneKeyUninstallRunestoneWarSoul = 212009,--兵符一键卸载所有孔位战魂
  ID_S2C_OneKeyUninstallRunestoneWarSoul = 212010,
  ID_C2S_PreviewRunestoneEnhance         = 212030,--赋能预览
  ID_S2C_PreviewRunestoneEnhance         = 212031, 


  --213000 ---- 213100 南征北战  start
  ID_C2S_WarFareInfo              = 213000,     --副本信息
  ID_S2C_WarFareInfo              = 213001,

  ID_C2S_GetChapterAwards         = 213002,     --领取章节奖励
  ID_S2C_GetChapterAwards         = 213003,

  ID_C2S_SelectChapterRoad        = 213004,     --章节选路
  ID_S2C_SelectChapterRoad        = 213005,

  ID_C2S_WarFareChapterInfo       = 213006,     --获取章节的关卡信息
  ID_S2C_WarFareChapterInfo       = 213007,

  ID_C2S_StepNext                 = 213008,     --下一步，触发事件,
  ID_S2C_StepNext                 = 213009,

  ID_C2S_GetUserListPos             = 213010,     --拉取玩家位置列表
  ID_S2C_GetUserListPos             = 213011,

  ID_C2S_SupportMessage           = 213012,     --点赞留言
  ID_S2C_SupportMessage           = 213013,

  ID_C2S_ResetChapterRoad         = 213014,     --重置章节选路
  ID_S2C_ResetChapterRoad         = 213015,

  ID_S2C_WarFareAwardsNtf         = 2132016,     --结算奖励通知
  ID_S2C_WriteMessageNtf          = 2132017,     --留言通知
  ID_S2C_SupportMessageNtf        = 2132018,     --点赞通知

  --TEst msg
  ID_C2S_StartBattle              = 213019,     --开启一场战斗
  ID_S2C_StartBattle              = 213020,
  --TEST msg end

  ID_C2S_WarFareBuyResetTimes    = 213040 ,  --购买重置次数
  ID_S2C_WarFareBuyResetTimes    = 213041 ,

  --213000 ---- 213100 南征北战  end

  --213101 ---- 213200 backthisservice3 start
  ID_C2S_OldPlayerInfo              = 213101,    --老玩家信息
  ID_S2C_OldPlayerInfo              = 213102,

  ID_C2S_OldPlayerCompleteTask      = 213103,     --完成任务
  ID_S2C_OldPlayerCompleteTask      = 213104,

  ID_C2S_OldPlayerBuyItem           = 213105,        --购买物品
  ID_S2C_OldPlayerBuyItem           = 213106,

  ID_C2S_OldPlayerSelectBox         = 213107,     --选择心愿礼盒
  ID_S2C_OldPlayerSelectBox         = 213108,

  ID_C2S_OldPlayerGetGift           = 213109,     --获取见面礼
  ID_S2C_OldPlayerGetGift           = 213110,

  ID_S2C_OldPlayerTaskNtf           = 213119,     --任务状态通知
  ID_S2C_OldPlayerDataNtf           = 213120,     --老玩家数据通知
  --213101 ---- 213200 backthisservice3 end
--------------------------------------------------------------------------------

--6.2.0-鎏金装备-器灵 211101-211150 
 ID_C2S_FlushEquipmentSpirit = 211101, --获取全部器灵信息
 ID_S2C_FlushEquipmentSpirit = 211102,
 ID_C2S_FlushEquipmentSpiritBooks = 211103, --获取全部器灵书信息
 ID_S2C_FlushEquipmentSpiritBooks = 211104,
 ID_C2S_CreateEquipmentSpirit = 211105, --鉴定
 ID_S2C_CreateEquipmentSpirit = 211106,
 ID_C2S_MergeEquipmentSpirit = 211107, --融合
 ID_S2C_MergeEquipmentSpirit = 211108,
 ID_C2S_EquipmentSpiritLearnSkill = 211109, --融合
 ID_S2C_EquipmentSpiritLearnSkill = 211110,
 
-- 6.2. 50-推送礼包 214001 ---- 214005 
 ID_C2S_GetPropellingInfo = 214001, -- 拉取推送礼包信息
 ID_S2C_GetPropellingInfo = 214002, 
 ID_S2C_FlushPropellingInfo = 214003, -- 刷新推送信息
 ID_C2S_GetPropellingRechargeAward = 214004, --领取直冲奖励
 ID_S2C_GetPropellingRechargeAward = 214005,
 --6.3.0-超级幸运星 
  ID_C2S_LucklyLottery            = 214100,--超级幸运星抽奖
  ID_S2C_LucklyLottery            = 214101,
  ID_C2S_LucklyLotteryAppointPet  = 214102,--超级幸运抽奖指定战宠
  ID_S2C_LucklyLotteryAppointPet  =214103,
  ID_C2S_LucklyLotteryUserData    = 214104,--获取玩家超级幸运数据
  ID_S2C_LucklyLotteryUserData    =214105,
  ID_C2S_LucklyLotteryExchangeCoin =214106,--兑换代币
  ID_S2C_LucklyLotteryExchangeCoin =214107,
  ID_C2S_LucklyLotteryProgressAward =214108,--领取抽奖进度奖励
  ID_S2C_LucklyLotteryProgressAward =214109,
  ID_C2S_LucklyLotteryLogs          =214110,--获超级幸运日志数据 
  ID_S2C_LucklyLotteryLogs          =214111,
  ID_C2S_LucklyLotteryActiviteData  = 214112,--获取超级幸运星活动数据
  ID_S2C_LucklyLotteryActiviteData  = 214113,
 --6.3.0-主线守关人    
  ID_C2S_MainRoadDefender          =214114,--章节主线守关人 
  ID_S2C_MainRoadDefender          =214115,
  
 --6.3.0-定制欢庆-九州巡礼    214201 ---- 214212
  ID_C2S_GetCustomFestivalActivity = 214201, --获取定制欢庆信息
  ID_S2C_GetCustomFestivalActivity = 214202,
  ID_C2S_GetCustomFestivalActivityReward = 214203, --获取欢庆活动奖励
  ID_S2C_GetCustomFestivalActivityReward = 214204,
  ID_C2S_GetCustomFestivalSales = 214205, --获取欢庆兑换商店信息
  ID_S2C_GetCustomFestivalSales = 214206,
  ID_C2S_BuyCustomFestivalSale = 214207, --购买欢庆商品
  ID_S2C_BuyCustomFestivalSale = 214208,
  ID_C2S_GetExcelCustomFestivalInfo = 214209, --获取客户端欢庆信息
  ID_S2C_GetExcelCustomFestivalInfo = 214210,
  ID_C2S_GetExcelCustomFestivalSale = 214211, --获取客户端欢庆兑换商店
  ID_S2C_GetExcelCustomFestivalSale = 214212,
 --6.3.0-H5预抽卡 214301 ---- 214307
  ID_C2S_BindLotteryCode = 214301, --绑定激活码
  ID_S2C_BindLotteryCode = 214302, 
  ID_C2S_GetPreLotteryInfo = 214303, --客户端获取预抽奖礼包情况
  ID_S2C_GetPreLotteryInfo = 214304,
  ID_C2S_GetPreLotteryAward = 214305, --客户端领取预抽奖奖励
  ID_S2C_GetPreLotteryAward = 214306,
  ID_S2C_BindLotteryCodeResult = 214307, --绑定激活码回调结果

  --6.3.0-登录贺卡 214500 ---- 214599
  ID_C2S_GetGreetingCardInfo     = 214500,    --获取信息
  ID_S2C_GetGreetingCardInfo     = 214501,
  ID_C2S_AwardGreetingCard       = 214502,    --领奖
  ID_S2C_AwardGreetingCard       = 214503, 
  --6.4.0-主角新养成
  ID_C2S_MainRoleTransferJobSelect = 214520,--选择职业
  ID_S2C_MainRoleTransferJobSelect = 214521,
  ID_C2S_MainRoleTransferJobGiveUp = 214524,--主角放弃试炼
  ID_S2C_MainRoleTransferJobGiveUp = 214525,
  ID_C2S_MainRoleTransferJobComplete = 214526,--确认选择职业
  ID_S2C_MainRoleTransferJobComplete = 214527,
  ID_C2S_MainRoleTransferJobUpgrade  = 214528,--职业升级
  ID_S2C_MainRoleTransferJobUpgrade = 214529,
  ID_C2S_MainRoleTransferBookUpgrade = 214530,--书籍升级
  ID_S2C_MainRoleTransferBookUpgrade = 214531,
  ID_C2S_MainRoleTransferJobReselect = 214532,--重新选择职业 
  ID_S2C_MainRoleTransferJobReselect = 214533,
  ID_C2S_MainRoleTransferJobCompose = 214534,--书籍合成
  ID_S2C_MainRoleTransferJobCompose = 214535,
  

  --6.3.0-通用活动信息214600 --- 214650
  ID_C2S_Activity = 214600,
  ID_S2C_Activity = 214601,

  --6.4.0 新版月基金 214700-214799
  ID_C2S_GetDirectMonthFundInfo = 214700,
  ID_S2C_GetDirectMonthFundInfo = 214701,
  ID_C2S_GetDirectMonthFundReward = 214702,
  ID_S2C_GetDirectMonthFundReward = 214703,
  ID_S2C_BuyDirectMonthFund = 214704,

  -- 6.4.50-镇魂街联动（大富翁） 214800 --- 214819
  ID_C2S_GetChessInfo = 214800,
  ID_S2C_GetChessInfo = 214801,
  ID_C2S_ChessDice = 214802,
  ID_S2C_ChessDice = 214803,
  ID_C2S_GetChessDailyMission = 214804,
  ID_S2C_GetChessDailyMission = 214805,
  ID_C2S_GetChessDailyMissionAward = 214806,
  ID_S2C_GetChessDailyMissionAward = 214807,
  ID_S2C_ChessEventPlay = 214808,
  ID_S2C_ChessEventEnd = 214809,
  ID_S2C_ChessEventMove = 214810,
  ID_S2C_ChessEventQuestion = 214811,
  ID_C2S_ChessEventAnswer = 214812,
  ID_S2C_ChessEventAnswer = 214813,

  --6.4.50 主线战令 214900-214999
  ID_C2S_GetBattlePassDungeonInfo = 214900, -- 获取主线战令活动信息
  ID_S2C_GetBattlePassDungeonInfo = 214901,
  ID_C2S_GetBattlePassDungeonAward = 214902, -- 领取战令任务奖励
  ID_S2C_GetBattlePassDungeonAward = 214903,
  ID_C2S_GetBattlePassDungeonServerAward = 214904, -- 领取全服人数奖励
  ID_S2C_GetBattlePassDungeonServerAward = 214905,
  ID_S2C_BuyBattlePassPaySuccess = 214906, -- 购买至尊版成功主动推送
  --6.4.50-首充累登录 
  ID_C2S_GetNewFirstRechargeDayAward = 214930,--领取登录奖励
  ID_S2C_GetNewFirstRechargeDayAward = 214931,

  --6.5.0-鎏金神兵 214950-214969
  ID_C2S_GetSacredwpBooks = 214950,
  ID_S2C_GetSacredwpBooks = 214951,
  ID_C2S_SetSacredwpBook = 214952,
  ID_S2C_SetSacredwpBook = 214953,
  ID_C2S_BaptizeSacredwpBook = 214954,
  ID_S2C_BaptizeSacredwpBook = 214955,
  ID_C2S_UpStarSacredwpBook = 214956,
  ID_S2C_UpStarSacredwpBook = 214957,
  ID_C2S_RebirthSacredwpBook = 214958,
  ID_S2C_RebirthSacredwpBook = 214959,
  --6.5.0-定制礼包TODO
  ID_C2S_SelectCustomPack            = 214970,--选择礼包奖池
  ID_S2C_SelectCustomPack            = 214971,
  ID_C2S_ObtainCustomPackAward       = 214972,--领取奖励 
  ID_S2C_ObtainCustomPackAward       = 214973, 
  ID_C2S_ObtainUserCustomPackData    = 214974,--获取定制礼包数据 
  ID_S2C_ObtainUserCustomPackData    = 214975,
  --6.5.0-将军弈 
  -- 养成 215000-215019
  ID_C2S_SrpgGetInfo                 = 215000,--拉取将军弈养成信息
  ID_S2C_SrpgGetInfo                 = 215001,
  ID_C2S_SrpgKnightLevelUp           = 215002,--将领升级
  ID_S2C_SrpgKnightLevelUp           = 215003,
  ID_C2S_SrpgKnightSaveArms          = 215004,--将领保存兵种
  ID_S2C_SrpgKnightSaveArms          = 215005,
  ID_C2S_SrpgSaveFormation           = 215006,--保存队列信息
  ID_S2C_SrpgSaveFormation           = 215007,
  ID_C2S_SrpgGetKnightAttr           = 215008,--拉取将领属性
  ID_S2C_SrpgGetKnightAttr           = 215009,
  -- pve玩法215020-215039
  ID_C2S_SrpgGetPveInfo              = 215020,--拉取PVE信息
  ID_S2C_SrpgGetPveInfo              = 215021,
  ID_C2S_SrpgGetPveStageRecordInfo   = 215022,--拉取关卡信息
  ID_S2C_SrpgGetPveStageRecordInfo   = 215023,
  ID_C2S_SrpgSavePveFormation        = 215024,--存储PVE队伍阵容
  ID_S2C_SrpgSavePveFormation        = 215025,
  ID_C2S_SrpgPveBattle               = 215026,--进行PVE战斗
  ID_S2C_SrpgPveBattle               = 215027,
  ID_C2S_SrpgGetPveUserList          = 215028,--拉取玩家列表的进度
  ID_S2C_SrpgGetPveUserList          = 215029,
  --6.5.0-退款相关
  ID_S2C_UpdateUserRefundInfo   = 215100, --退款限制信息更新
--------------------------------------------------------------------------------
}
return NetMsg_ID
