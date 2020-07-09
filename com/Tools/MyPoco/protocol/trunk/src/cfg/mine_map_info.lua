---@classdef record_mine_map_info
local record_mine_map_info = {}


record_mine_map_info.id = 0--ID
record_mine_map_info.type = 0--城池类型
record_mine_map_info.name =  ""--城池名称
record_mine_map_info.quality = 0--城池品质
record_mine_map_info.city_pic =  ""--城池图标
record_mine_map_info.mine_pic =  ""--城内图标
record_mine_map_info.mine_flood =  ""--城内底图
record_mine_map_info.near_city_id1 = 0--相连城池ID1
record_mine_map_info.near_city_id2 = 0--相连城池ID2
record_mine_map_info.near_city_id3 = 0--相连城池ID3
record_mine_map_info.near_city_id4 = 0--相连城池ID4
record_mine_map_info.mine_parameter = 0--城池参数
record_mine_map_info.reborn_id = 0--复活城池ID

local mine_map_info = {
   _data = {   
    [1] = {1,1,"长安",3,"1","1","1",9,10,5,0,1,1,},  
    [2] = {2,1,"邺城",3,"1","1","1",11,12,13,0,1,2,},  
    [3] = {3,1,"建业",3,"1","1","1",18,19,20,0,1,3,},  
    [4] = {4,1,"成都",3,"1","1","1",26,27,28,0,1,4,},  
    [5] = {5,2,"渭南",4,"2","2","2",1,6,0,0,2,1,},  
    [6] = {6,2,"华阴",4,"2","2","2",5,29,0,0,2,1,},  
    [7] = {7,2,"弘农",4,"2","2","2",10,29,0,0,2,1,},  
    [8] = {8,2,"南乡",4,"2","2","2",9,36,0,0,2,1,},  
    [9] = {9,2,"蓝田",4,"2","2","2",1,8,0,0,2,1,},  
    [10] = {10,2,"武关",4,"2","2","2",1,7,0,0,2,1,},  
    [11] = {11,2,"朝歌",4,"2","2","2",2,16,0,0,2,2,},  
    [12] = {12,2,"牧野",4,"2","2","2",2,15,0,0,2,2,},  
    [13] = {13,2,"官渡",4,"2","2","2",2,14,0,0,2,2,},  
    [14] = {14,2,"乌巢",4,"2","2","2",13,31,0,0,2,2,},  
    [15] = {15,2,"延津",4,"2","2","2",12,31,0,0,2,2,},  
    [16] = {16,2,"黎阳",4,"2","2","2",11,30,0,0,2,2,},  
    [17] = {17,2,"小沛",4,"2","2","2",18,32,0,0,2,3,},  
    [18] = {18,2,"广陵",4,"2","2","2",3,17,0,0,2,3,},  
    [19] = {19,2,"合肥",4,"2","2","2",3,22,0,0,2,3,},  
    [20] = {20,2,"庐江",4,"2","2","2",3,21,0,0,2,3,},  
    [21] = {21,2,"安丰",4,"2","2","2",20,33,0,0,2,3,},  
    [22] = {22,2,"南阳",4,"2","2","2",19,33,0,0,2,3,},  
    [23] = {23,2,"江油",4,"2","2","2",28,35,0,0,2,4,},  
    [24] = {24,2,"涪县",4,"2","2","2",27,35,0,0,2,4,},  
    [25] = {25,2,"永安",4,"2","2","2",26,34,0,0,2,4,},  
    [26] = {26,2,"绵竹",4,"2","2","2",4,25,0,0,2,4,},  
    [27] = {27,2,"雒县",4,"2","2","2",4,24,0,0,2,4,},  
    [28] = {28,2,"阴平",4,"2","2","2",4,23,0,0,2,4,},  
    [29] = {29,3,"陈留",5,"3","3","3",6,7,37,30,3,1,},  
    [30] = {30,3,"魏郡",5,"3","3","3",29,16,38,0,3,2,},  
    [31] = {31,3,"下邳",5,"3","3","3",15,14,32,38,3,2,},  
    [32] = {32,3,"汝南",5,"3","3","3",39,31,17,0,3,3,},  
    [33] = {33,3,"樊城",5,"3","3","3",34,39,22,21,3,3,},  
    [34] = {34,3,"宛城",5,"3","3","3",40,33,25,0,3,4,},  
    [35] = {35,3,"上庸",5,"3","3","3",23,36,40,24,3,4,},  
    [36] = {36,3,"颍川",5,"3","3","3",8,37,35,0,3,1,},  
    [37] = {37,4,"洛阳",6,"4","4","4",36,29,38,40,4,1,},  
    [38] = {38,4,"徐州",6,"4","4","4",37,30,31,39,4,2,},  
    [39] = {39,4,"许昌",6,"4","4","4",40,38,32,33,4,3,},  
    [40] = {40,4,"襄阳",6,"4","4","4",35,37,39,34,4,4,},
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
    [35] = 35,  
    [36] = 36,  
    [37] = 37,  
    [38] = 38,  
    [39] = 39,  
    [40] = 40,
}

local __key_map = { 
    id = 1,
    type = 2,
    name = 3,
    quality = 4,
    city_pic = 5,
    mine_pic = 6,
    mine_flood = 7,
    near_city_id1 = 8,
    near_city_id2 = 9,
    near_city_id3 = 10,
    near_city_id4 = 11,
    mine_parameter = 12,
    reborn_id = 13,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_mine_map_info")

        return t._raw[__key_map[k]]
    end
}


function mine_map_info.getLength()
    return #mine_map_info._data
end



function mine_map_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_mine_map_info
function mine_map_info.indexOf(index)
    if index == nil or not mine_map_info._data[index] then
        return nil
    end
    return setmetatable({_raw = mine_map_info._data[index]}, m)
end



---
--@return @class record_mine_map_info
function mine_map_info.get(id)
    
    return mine_map_info.indexOf(__index_id[ id ])
     
end



function mine_map_info.set(id, key, value)
    local record = mine_map_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function mine_map_info.get_index_data()
    return __index_id 
end

return  mine_map_info 