--[========================[

	玩家操作组件

	负责记录和保存玩家操作的数据

]========================]

local PlayerFactory = {}

function PlayerFactory.createPlayerCommand(command)

	-- local command = {id = xxx,identity = xxx, attackCount = xxx}

	local skillId = command.skillId
	if not skillId then
		skillId = loadCfg("cfg.unite_token_info").get(command.id).skill_id
	end
	local identity = command.identity
	local comboData = command.battleData:getComboInfo(command.identity)

	local playerCommand = {
		-- 玩家请求释放的技能
		skillCfg = loadCfg("cfg.skill_info").get(skillId),
		-- 玩家请求释放的回合数
		attackCount = command.attack_count,
		identity = identity,
		opIdentity = 3 - identity,
		serialId = (identity - 1) * 10 + 7 ,
		id = command.id, -- 对应的兵符id
		comboData = comboData,
		multiple = command.battleData.multiples[command.identity],
		isPlayer = true,
		isDead = false,
		originInfo = {pos = 1},
		baseInfo = comboData.baseInfo,
		advanceInfo = comboData.advanceInfo,
		isPet = command.isPet,
		isSpaceTime = command.isSpaceTime,
		skillId = skillId,
	}

    playerCommand.pack = function ( self )
        local oper = {}
        oper.identity = self.identity
        oper.id = self.id
        oper.attack_count = self.attackCount
        return oper
    end

	return playerCommand

end

return PlayerFactory