

local AutoComponent = {}

AutoComponent.auto = {false,false}
AutoComponent.lastId = 0

function AutoComponent:init()
    self.auto = {false,false}
    self.lastId = 0
end

function AutoComponent:setAuto(identity,auto)
    self.auto[identity] = auto
end

function AutoComponent:checkAuto(battleData)
    local firstIdentity = battleData.firstAttackId
    local nextId = self.lastId == 0 and firstIdentity or 3 - self.lastId
    local ret = self:checkMyAuto(battleData,nextId)
    if not ret then
        nextId = 3 - nextId
        ret = self:checkMyAuto(battleData,nextId)
    end
    if ret then
        self.lastId = nextId
    end
    return ret
end

function AutoComponent:checkMyAuto(battleData,identity)
    if not self.auto[identity] then
        return
    end
    local comboData = battleData:getComboInfo(identity)
    local skills = comboData:getAvailableSkills()
    if #skills > 0 then
        local bestSkill = skills[1]
        for i = 2 , #skills do
            if skills[i].count < bestSkill.count then
                bestSkill = skills[i]
            end
        end
        return {id = bestSkill.id,identity = identity}
    end
end

return AutoComponent
