---@classdef record_gvg_text
local record_gvg_text = {}


record_gvg_text.id = 0--ID
record_gvg_text.type = 0--触发类型
record_gvg_text.trigger_value = 0--触发值
record_gvg_text.text =  ""--文本

local gvg_text = {
   _data = {   
    [1] = {1,1,1,"#name#击败1人",},  
    [2] = {2,1,2,"#name#击败2人，势不可挡！",},  
    [3] = {3,1,3,"#name#击败3人，勇冠三军！",},  
    [4] = {4,1,4,"#name#击败4人，所向披靡！",},  
    [5] = {5,2,0,"[color=#sd3f14]#name#[/color]占领了炮塔，可以获得大量积分！",},  
    [6] = {6,3,0,"[color=#sd3f14]#name#[/color]被摧毁！",},
    }
}

local __index_id = {   
    [1] = 1,  
    [2] = 2,  
    [3] = 3,  
    [4] = 4,  
    [5] = 5,  
    [6] = 6,
}

local __key_map = { 
    id = 1,
    type = 2,
    trigger_value = 3,
    text = 4,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_gvg_text")

        return t._raw[__key_map[k]]
    end
}


function gvg_text.getLength()
    return #gvg_text._data
end



function gvg_text.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_gvg_text
function gvg_text.indexOf(index)
    if index == nil or not gvg_text._data[index] then
        return nil
    end
    return setmetatable({_raw = gvg_text._data[index]}, m)
end



---
--@return @class record_gvg_text
function gvg_text.get(id)
    
    return gvg_text.indexOf(__index_id[ id ])
     
end



function gvg_text.set(id, key, value)
    local record = gvg_text.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function gvg_text.get_index_data()
    return __index_id 
end

return  gvg_text 