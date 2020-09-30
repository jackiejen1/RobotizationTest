local RoundComponent = {}

function RoundComponent.roundStart( battleData )
    local component = {}
    -- 回复合击值
    component.comboValue = {}
    for identity = 1 , 2 do
        local info = battleData:getComboInfo(identity)
        local value = info.baseInfo.COMBO_RECOVER_ROUND
        value = battleData:updateComboValue(value,identity)
        component.comboValue[identity] = value
    end
    --合击cd结算
    local list = battleData:updateComboSkills()
    component.cdList = list
    battleData:setRoundFinish(false)

    local sceneRemoveList = battleData:doSceneRound()
    component.sceneRemoveList = sceneRemoveList

    return component
end

return RoundComponent
