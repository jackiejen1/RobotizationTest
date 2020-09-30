---@classdef record_transformation_compose_info
local record_transformation_compose_info = {}


record_transformation_compose_info.id = 0--id
record_transformation_compose_info.name =  ""--图鉴组合名称
record_transformation_compose_info.quality = 0--品质
record_transformation_compose_info.sign = 0--页签
record_transformation_compose_info.card_1 = 0--化身卡id1
record_transformation_compose_info.card_2 = 0--化身卡id2
record_transformation_compose_info.card_3 = 0--化身卡id3
record_transformation_compose_info.attribute_type_1 = 0--属性类型1
record_transformation_compose_info.attribute_value_1 = 0--属性值1
record_transformation_compose_info.attribute_type_2 = 0--属性类型2
record_transformation_compose_info.attribute_value_2 = 0--属性值2
record_transformation_compose_info.attribute_type_3 = 0--属性类型3
record_transformation_compose_info.attribute_value_3 = 0--属性值3
record_transformation_compose_info.attribute_type_4 = 0--属性类型4
record_transformation_compose_info.attribute_value_4 = 0--属性值4

local transformation_compose_info = {
   _data = {   
    [1] = {1,"蜀之后援",4,1,400060,400070,400130,1,140000,11,30,0,0,0,0,},  
    [2] = {2,"樊城之援",5,1,400010,400040,0,2,12000,12,50,0,0,0,0,},  
    [3] = {3,"乱世谋臣",5,1,400160,400080,0,4,6000,14,50,0,0,0,0,},  
    [4] = {4,"东吴老将",5,1,400110,400090,0,3,6000,13,50,0,0,0,0,},  
    [5] = {5,"勇往无前",5,1,400030,400120,0,1,233000,11,50,0,0,0,0,},  
    [6] = {6,"河北名将",5,2,400140,400150,0,1,233000,13,50,0,0,0,0,},  
    [7] = {7,"魏吴相抗",5,2,400020,400100,400050,2,18000,14,80,0,0,0,0,},  
    [8] = {8,"邺城相逢",6,2,500030,500010,0,1,1867000,11,100,206,100,0,0,},  
    [9] = {9,"曹魏臂膀",6,2,500040,500050,0,3,49000,13,100,205,100,0,0,},  
    [10] = {10,"魏之良将",6,2,500020,500060,0,2,98000,12,100,205,100,0,0,},  
    [11] = {11,"兵发巴蜀",6,2,500080,500070,0,1,1867000,11,100,206,100,0,0,},  
    [12] = {12,"枪出如龙",6,3,510040,500120,0,2,98000,12,100,205,100,0,0,},  
    [13] = {13,"南郡归蜀",6,3,500090,500100,0,3,49000,13,100,206,100,0,0,},  
    [14] = {14,"江东之畔",6,3,500180,500130,0,1,1867000,11,100,206,100,0,0,},  
    [15] = {15,"凌云之志",6,4,500160,500170,0,4,49000,14,100,205,100,0,0,},  
    [16] = {16,"孙家霸业",6,4,500150,500140,0,2,98000,12,100,205,100,0,0,},  
    [17] = {17,"西凉恶鬼",6,4,500230,500220,0,4,49000,14,100,206,100,0,0,},  
    [18] = {18,"乱世枭雄",6,4,500200,500240,0,3,49000,13,100,205,100,0,0,},  
    [19] = {19,"医道同归",6,4,500210,500190,0,4,49000,14,100,206,100,0,0,},  
    [20] = {20,"神勇无双",7,4,510020,500110,0,2,180000,4,160000,14,250,207,150,},  
    [21] = {21,"千娇百媚",7,4,510080,510060,0,1,3330000,3,160000,11,250,208,150,},  
    [22] = {22,"神机妙算",7,4,510070,510010,0,1,3330000,3,160000,12,250,208,150,},  
    [23] = {23,"火烧连营",7,4,510030,510050,0,2,180000,4,160000,13,250,207,150,},  
    [24] = {24,"机关鬼谋",7,4,600020,600090,0,1,3330000,3,160000,14,250,207,150,},  
    [25] = {25,"雷电伏波",7,4,600100,600080,0,2,180000,4,160000,13,250,208,150,},  
    [26] = {26,"理想天下",7,4,600110,600030,0,1,3330000,3,160000,12,250,208,150,},  
    [27] = {27,"恩怨难解",7,4,600120,600050,0,2,180000,4,160000,11,250,207,150,},  
    [28] = {28,"英雄相惜",7,4,600010,600040,0,1,3330000,3,160000,12,250,208,150,},  
    [29] = {29,"文韬武略",7,4,600060,600070,0,2,180000,4,160000,11,250,207,150,},  
    [30] = {30,"神武鬼谋",8,4,700030,700040,0,1,8330000,3,390000,12,350,208,150,},  
    [31] = {31,"仙鹤灵凰",8,4,700010,700020,0,2,440000,4,390000,11,350,207,150,},  
    [32] = {32,"雄主帅才",8,4,700050,700080,0,1,8330000,3,390000,13,350,208,150,},  
    [33] = {33,"赤胆忠魂",8,4,700060,700070,0,2,440000,4,390000,14,350,207,150,},  
    [34] = {34,"一战封神",8,4,700130,0,0,2,220000,4,200000,12,150,208,100,},
    }
}

local __index_id = {   
    [1] = 1,  
    [2] = 2,  
    [3] = 3,  
    [4] = 4,  
    [5] = 5,  
    [6] = 6,  
    [7] = 7,  
    [8] = 8,  
    [9] = 9,  
    [10] = 10,  
    [11] = 11,  
    [12] = 12,  
    [13] = 13,  
    [14] = 14,  
    [15] = 15,  
    [16] = 16,  
    [17] = 17,  
    [18] = 18,  
    [19] = 19,  
    [20] = 20,  
    [21] = 21,  
    [22] = 22,  
    [23] = 23,  
    [24] = 24,  
    [25] = 25,  
    [26] = 26,  
    [27] = 27,  
    [28] = 28,  
    [29] = 29,  
    [30] = 30,  
    [31] = 31,  
    [32] = 32,  
    [33] = 33,  
    [34] = 34,
}

local __key_map = { 
    id = 1,
    name = 2,
    quality = 3,
    sign = 4,
    card_1 = 5,
    card_2 = 6,
    card_3 = 7,
    attribute_type_1 = 8,
    attribute_value_1 = 9,
    attribute_type_2 = 10,
    attribute_value_2 = 11,
    attribute_type_3 = 12,
    attribute_value_3 = 13,
    attribute_type_4 = 14,
    attribute_value_4 = 15,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_transformation_compose_info")

        return t._raw[__key_map[k]]
    end
}


function transformation_compose_info.getLength()
    return #transformation_compose_info._data
end



function transformation_compose_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_transformation_compose_info
function transformation_compose_info.indexOf(index)
    if index == nil or not transformation_compose_info._data[index] then
        return nil
    end
    return setmetatable({_raw = transformation_compose_info._data[index]}, m)
end



---
--@return @class record_transformation_compose_info
function transformation_compose_info.get(id)
    
    return transformation_compose_info.indexOf(__index_id[ id ])
     
end



function transformation_compose_info.set(id, key, value)
    local record = transformation_compose_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function transformation_compose_info.get_index_data()
    return __index_id 
end

return  transformation_compose_info 