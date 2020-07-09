--
-- Author: lyChen
-- Date: 2017-09-01 16:21:48
--
local testData = {
	atk_type = 2,    		--//战斗类型 1 pve 2 pvp
	random_seed = 10,
	random_seeds = {99,199,299,399,499,599,699,799,899,999},
	battle_id = 1,
	is_auto = true,
	own_teams = {
		{
		fight_value = 10000, -- 总战力
		combo = {
			attrs = {
				{
					type = 601,--//合击值
					value = 200,
				},	
				{
					type = 602,--//合击最大值
					value = 200,
				},
				{
					type = 603,--//合击值行动回复
					value = 4,
				},
				{
					type = 604,--//合击值技能额外回复
					value = 1,
				},	
				{
					type = 605,--//合击值回合回复
					value = 10,
				},
			},
			tokens = {50160,40010,40020,40050},	    --//合击技能列表，里面存放的是合击技能id
		},
		units = {
			{
				pos = 1,
				id = 500130,
				star = 1,
				skills = {}, -- 被动技能
				attrs = {
					{
						type = 1,--//生命
						value = 1000000,
					},	
					{
						type = 2,--//攻击
						value = 2000,
					},
					{
						type = 3,--//物防
						value = 400,
					},
					{
						type = 4,--//法防
						value = 100,
					},	
					{
						type = 102,--//闪避率
						value = 200,
					},
					{
						type = 103,--//暴击率
						value = 200,
					},
					{
						type = 105,--//格挡率
						value = 500,
					},
					{
						type = 401,--//怒气
						value = 4,
					},
					{
						type = 701,--//生命
						value = 1000000,
					},
					{
						type = 509,
						value = 1000,
					},
					{
						type = 511,
						value = 1000,
					},
				},
			},
			{
				pos = 2,
				id = 500090,
				star = 1,
				attrs = {
					{
						type = 1,--//生命
						value = 1000000,
					},	
					{
						type = 2,--//攻击
						value = 2000,
					},
					{
						type = 3,--//物防
						value = 400,
					},
					{
						type = 4,--//法防
						value = 100,
					},	
					{
						type = 102,--//闪避率
						value = 200,
					},
					{
						type = 103,--//暴击率
						value = 200,
					},
					{
						type = 105,--//格挡率
						value = 500,
					},
					{
						type = 401,--//怒气
						value = 4,
					},
					{
						type = 701,--//生命
						value = 1000000,
					},
					{
						type = 503,
						value = 1000,
					},
					{
						type = 509,
						value = 1000,
					},
					{
						type = 511,
						value = 1000,
					},
				},
				skills = {}, -- 被动技能
			},
			{
				pos = 3,
				id = 500100,
				star = 1,
				attrs = {
					{
						type = 1,--//生命
						value = 1000000,
					},	
					{
						type = 2,--//攻击
						value = 2000,
					},
					{
						type = 3,--//物防
						value = 400,
					},
					{
						type = 4,--//法防
						value = 100,
					},	
					{
						type = 102,--//闪避率
						value = 200,
					},
					{
						type = 103,--//暴击率
						value = 200,
					},
					{
						type = 105,--//格挡率
						value = 500,
					},
					{
						type = 401,--//怒气
						value = 4,
					},
					{
						type = 701,--//生命
						value = 1000000,
					},
				},
				skills = {}, -- 被动技能
			},
			{
				pos = 4,
				id = 500080,
				star = 1,
				attrs = {
					{
						type = 1,--//生命
						value = 1000000,
					},	
					{
						type = 2,--//攻击
						value = 2000,
					},
					{
						type = 3,--//物防
						value = 400,
					},
					{
						type = 4,--//法防
						value = 100,
					},	
					{
						type = 102,--//闪避率
						value = 200,
					},
					{
						type = 103,--//暴击率
						value = 200,
					},
					{
						type = 105,--//格挡率
						value = 500,
					},
					{
						type = 401,--//怒气
						value = 4,
					},
					{
						type = 701,--//生命
						value = 1000000,
					},
				},
				skills = {}, -- 被动技能
			},
			{
				pos = 5,
				id = 510060,
				star = 1,
				attrs = {
					{
						type = 1,--//生命
						value = 1000000,
					},	
					{
						type = 2,--//攻击
						value = 2000,
					},
					{
						type = 3,--//物防
						value = 400,
					},
					{
						type = 4,--//法防
						value = 100,
					},	
					{
						type = 102,--//闪避率
						value = 200,
					},
					{
						type = 103,--//暴击率
						value = 200,
					},
					{
						type = 105,--//格挡率
						value = 500,
					},
					{
						type = 401,--//怒气
						value = 4,
					},
					{
						type = 701,--//生命
						value = 1000000,
					},
				},
				skills = {}, -- 被动技能
			},
			{
				pos = 6,
				id = 510040,
				star = 1,
				attrs = {
					{
						type = 1,--//生命
						value = 1000000,
					},	
					{
						type = 2,--//攻击
						value = 2000,
					},
					{
						type = 3,--//物防
						value = 400,
					},
					{
						type = 4,--//法防
						value = 100,
					},	
					{
						type = 102,--//闪避率
						value = 200,
					},
					{
						type = 103,--//暴击率
						value = 200,
					},
					{
						type = 105,--//格挡率
						value = 500,
					},
					{
						type = 401,--//怒气
						value = 4,
					},
					{
						type = 701,--//生命
						value = 1000000,
					},
				},
				skills = {}, -- 被动技能
			},
		}, 
		},
	},
	enemy_teams = {
		{
			fight_value = 10000, -- 总战力
			combo = {
				tokens = {40050,50160,40050,40010},	    --//合击技能列表，里面存放的是合击技能id
				attrs = {
					{
						type = 601,--//合击值
						value = 0,
					},	
					{
						type = 602,--//合击最大值
						value = 200,
					},
					{
						type = 603,--//合击值行动回复
						value = 2,
					},
					{
						type = 604,--//合击值技能额外回复
						value = 1,
					},	
					{
						type = 605,--//合击值回合回复
						value = 10,
					},
				},
			},
			units = {
				{
					pos = 1,
					id = 400110,
					star = 1,
					attrs = {
						{
							type = 1,--//生命
							value = 1000000,
						},	
						{
							type = 2,--//攻击
							value = 2000,
						},
						{
							type = 3,--//物防
							value = 400,
						},
						{
							type = 4,--//法防
							value = 100,
						},	
						{
							type = 102,--//闪避率
							value = 200,
						},
						{
							type = 103,--//暴击率
							value = 200,
						},
						{
							type = 105,--//格挡率
							value = 500,
						},
						{
							type = 401,--//怒气
							value = 4,
						},
						{
							type = 701,--//生命
							value = 1000000,
						},
					},
					skills = {}, -- 被动技能
				},
				{
					pos = 2,
					id = 500240,
					star = 1,
					attrs = {
						{
							type = 1,--//生命
							value = 1000000,
						},	
						{
							type = 2,--//攻击
							value = 2000,
						},
						{
							type = 3,--//物防
							value = 400,
						},
						{
							type = 4,--//法防
							value = 100,
						},	
						{
							type = 102,--//闪避率
							value = 200,
						},
						{
							type = 103,--//暴击率
							value = 200,
						},
						{
							type = 105,--//格挡率
							value = 500,
						},
						{
							type = 401,--//怒气
							value = 4,
						},
						{
							type = 701,--//生命
							value = 1000000,
						},
					},
					skills = {}, -- 被动技能
				},
				{
					pos = 3,
					id = 400130,
					star = 1,
					attrs = {
						{
							type = 1,--//生命
							value = 1000000,
						},	
						{
							type = 2,--//攻击
							value = 2000,
						},
						{
							type = 3,--//物防
							value = 400,
						},
						{
							type = 4,--//法防
							value = 100,
						},	
						{
							type = 102,--//闪避率
							value = 200,
						},
						{
							type = 103,--//暴击率
							value = 200,
						},
						{
							type = 105,--//格挡率
							value = 500,
						},
						{
							type = 401,--//怒气
							value = 4,
						},
						{
							type = 701,--//生命
							value = 1000000,
						},
					},
					skills = {}, -- 被动技能
				},
				{
					pos = 4,
					id = 400090,
					star = 1,
					attrs = {
						{
							type = 1,--//生命
							value = 1000000,
						},	
						{
							type = 2,--//攻击
							value = 2000,
						},
						{
							type = 3,--//物防
							value = 400,
						},
						{
							type = 4,--//法防
							value = 100,
						},	
						{
							type = 102,--//闪避率
							value = 200,
						},
						{
							type = 103,--//暴击率
							value = 200,
						},
						{
							type = 105,--//格挡率
							value = 500,
						},
						{
							type = 401,--//怒气
							value = 4,
						},
						{
							type = 701,--//生命
							value = 1000000,
						},
					},
					skills = {}, -- 被动技能
				},
				{
					pos = 5,
					id = 400060,
					star = 1,
					attrs = {
						{
							type = 1,--//生命
							value = 1000000,
						},	
						{
							type = 2,--//攻击
							value = 2000,
						},
						{
							type = 3,--//物防
							value = 400,
						},
						{
							type = 4,--//法防
							value = 100,
						},	
						{
							type = 102,--//闪避率
							value = 200,
						},
						{
							type = 103,--//暴击率
							value = 200,
						},
						{
							type = 105,--//格挡率
							value = 500,
						},
						{
							type = 401,--//怒气
							value = 4,
						},
						{
							type = 701,--//生命
							value = 1000000,
						},
					},
					skills = {}, -- 被动技能
				},
				{
					pos = 6,
					id = 400030,
					star = 1,
					attrs = {
						{
							type = 1,--//生命
							value = 1000000,
						},	
						{
							type = 2,--//攻击
							value = 2000,
						},
						{
							type = 3,--//物防
							value = 400,
						},
						{
							type = 4,--//法防
							value = 100,
						},	
						{
							type = 102,--//闪避率
							value = 200,
						},
						{
							type = 103,--//暴击率
							value = 200,
						},
						{
							type = 105,--//格挡率
							value = 500,
						},
						{
							type = 401,--//怒气
							value = 4,
						},
						{
							type = 701,--//生命
							value = 1000000,
						},
					},
					skills = {}, -- 被动技能
				},
			},
		},
	},
}

return testData