---@classdef record_awake_pendant_info
local record_awake_pendant_info = {}


record_awake_pendant_info.id = 0--id
record_awake_pendant_info.name =  ""--饰品名称
record_awake_pendant_info.icon = 0--饰品图标
record_awake_pendant_info.pendant_desc =  ""--技能描述
record_awake_pendant_info.pendant_skill = 0--饰品技能
record_awake_pendant_info.quality = 0--品质
record_awake_pendant_info.pendant_level_id = 0--升级属性

local awake_pendant_info = {
   _data = {   
    [1] = {110010,"苍龙短剑",1,"首次攻击时，增加自身15%暴击率，持续2回合",110010,7,1002,},  
    [2] = {110020,"风雷扳指",2,"首次攻击时，增加自身15%抗暴率，持续2回合",110020,7,1001,},  
    [3] = {110030,"朱雀佩玉",3,"己方武将阵亡时，我方随机1人回复10%生命上限血量（每场战斗只触发1次）",110030,7,1001,},  
    [4] = {110040,"玄武披风",4,"血量低于50%时，自身伤害减免提升10%",110040,7,1001,},  
    [5] = {110050,"白虎腰牌",5,"血量低于50%时，自身伤害加成提升10%",110050,7,1002,},  
    [6] = {110110,"苍龙短剑·鸣",11,"技能增强至：首次攻击时，增加自身25%暴击率，持续2回合",110110,8,1012,},  
    [7] = {110120,"风雷扳指·瞬",12,"技能增强至：首次攻击时，增加自身25%抗暴率，持续2回合",110120,8,1011,},  
    [8] = {110130,"朱雀佩玉·烈",13,"技能增强至：己方武将阵亡时，我方随机1人回复15%生命上限血量（每场战斗只触发1次）",110130,8,1011,},  
    [9] = {110140,"玄武披风·涌",14,"技能增强至：血量低于50%时，自身伤害减免提升15%",110140,8,1011,},  
    [10] = {110150,"白虎腰牌·啸",15,"技能增强至：血量低于50%时，自身伤害加成提升15%",110150,8,1012,},
    }
}

local __index_id = {   
    [110010] = 1,  
    [110020] = 2,  
    [110030] = 3,  
    [110040] = 4,  
    [110050] = 5,  
    [110110] = 6,  
    [110120] = 7,  
    [110130] = 8,  
    [110140] = 9,  
    [110150] = 10,
}

local __key_map = { 
    id = 1,
    name = 2,
    icon = 3,
    pendant_desc = 4,
    pendant_skill = 5,
    quality = 6,
    pendant_level_id = 7,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_awake_pendant_info")

        return t._raw[__key_map[k]]
    end
}


function awake_pendant_info.getLength()
    return #awake_pendant_info._data
end



function awake_pendant_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_awake_pendant_info
function awake_pendant_info.indexOf(index)
    if index == nil or not awake_pendant_info._data[index] then
        return nil
    end
    return setmetatable({_raw = awake_pendant_info._data[index]}, m)
end



---
--@return @class record_awake_pendant_info
function awake_pendant_info.get(id)
    
    return awake_pendant_info.indexOf(__index_id[ id ])
     
end



function awake_pendant_info.set(id, key, value)
    local record = awake_pendant_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function awake_pendant_info.get_index_data()
    return __index_id 
end

return  awake_pendant_info 