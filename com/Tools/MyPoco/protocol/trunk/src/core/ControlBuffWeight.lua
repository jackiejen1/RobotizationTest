-- 控制类buff权重
local buff_control_info = loadCfg("cfg.buff_control_info")
local Parameters = load("core.Parameters")

local ControlBuffWeight = {
    _map = {},
}

local weightMap = ControlBuffWeight._map
for i = 1, buff_control_info.getLength() do
    local info = buff_control_info.indexOf(i)
    weightMap[info.buff_type_id.. "_" .. info.buff_effect_type] = info.eliminate_weight
end

function ControlBuffWeight.getWeight(buffCfg)
    local key = buffCfg.buff_type .. "_" .. buffCfg.buff_effect_type
    return weightMap[key] or Parameters.CONTROL_BUFF_DEFAULT_WEIGHT
end

return ControlBuffWeight
