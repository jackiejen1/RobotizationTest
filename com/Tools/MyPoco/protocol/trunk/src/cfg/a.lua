local patch = {}

function patch:onFetchConfigFinish(version)
    local LoginLayer = require("app.view.login.LoginLayer")
    local oldFunc = LoginLayer._onUpgradeEvent
    LoginLayer._onUpgradeEvent = function ( self, needLogin )
        oldFunc(self,needLogin)
        self:getChild("Txt_law"):setVisible(false)
        self:getChild("ComBtnCheck"):setVisible(false)
    end

    if version >= 11459 then
        local task_route_info = require("app.cfg.task_route_info")
        task_route_info._data[179] = {206,1107,208,"神兽秘境中消耗#num#次挑战次数",}
        local index_data =  task_route_info.get_index_data()
        index_data[206] = 179
    end
end

return patch