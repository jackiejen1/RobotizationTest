---@classdef record_rebel_book_addition_info
local record_rebel_book_addition_info = {}


record_rebel_book_addition_info.id = 0--id
record_rebel_book_addition_info.min_score = 0--武神积分最小值
record_rebel_book_addition_info.max_score = 0--武神积分最大值
record_rebel_book_addition_info.talent_skill = 0--天赋技能

local rebel_book_addition_info = {
   _data = {   
    [1] = {1,100,199,90001,},  
    [2] = {2,200,299,90002,},  
    [3] = {3,300,399,90003,},  
    [4] = {4,400,499,90004,},  
    [5] = {5,500,599,90005,},  
    [6] = {6,600,699,90006,},  
    [7] = {7,700,799,90007,},  
    [8] = {8,800,899,90008,},  
    [9] = {9,900,999,90009,},  
    [10] = {10,1000,1199,90010,},  
    [11] = {11,1200,1399,90011,},  
    [12] = {12,1400,1599,90012,},  
    [13] = {13,1600,1799,90013,},  
    [14] = {14,1800,1999,90014,},  
    [15] = {15,2000,2299,90015,},  
    [16] = {16,2300,2599,90016,},  
    [17] = {17,2600,2899,90017,},  
    [18] = {18,2900,3199,90018,},  
    [19] = {19,3200,3499,90019,},  
    [20] = {20,3500,3899,90020,},  
    [21] = {21,3900,4299,90021,},  
    [22] = {22,4300,4699,90022,},  
    [23] = {23,4700,5099,90023,},  
    [24] = {24,5100,5499,90024,},  
    [25] = {25,5500,5899,90025,},  
    [26] = {26,5900,6299,90026,},  
    [27] = {27,6300,6699,90027,},  
    [28] = {28,6700,7099,90028,},  
    [29] = {29,7100,7499,90029,},  
    [30] = {30,7500,7999,90030,},  
    [31] = {31,8000,8499,90031,},  
    [32] = {32,8500,8999,90032,},  
    [33] = {33,9000,9499,90033,},  
    [34] = {34,9500,9999,90034,},  
    [35] = {35,10000,10499,90035,},  
    [36] = {36,10500,10999,90036,},  
    [37] = {37,11000,11499,90037,},  
    [38] = {38,11500,11999,90038,},  
    [39] = {39,12000,12499,90039,},  
    [40] = {40,12500,12999,90040,},  
    [41] = {41,13000,13499,90041,},  
    [42] = {42,13500,13999,90042,},  
    [43] = {43,14000,14499,90043,},  
    [44] = {44,14500,14999,90044,},  
    [45] = {45,15000,15499,90045,},  
    [46] = {46,15500,15999,90046,},  
    [47] = {47,16000,16499,90047,},  
    [48] = {48,16500,16999,90048,},  
    [49] = {49,17000,17999,90049,},  
    [50] = {50,18000,18999,90050,},  
    [51] = {51,19000,19999,90051,},  
    [52] = {52,20000,20999,90052,},  
    [53] = {53,21000,21999,90053,},  
    [54] = {54,22000,22999,90054,},  
    [55] = {55,23000,23999,90055,},  
    [56] = {56,24000,24999,90056,},  
    [57] = {57,25000,25999,90057,},  
    [58] = {58,26000,26999,90058,},  
    [59] = {59,27000,27999,90059,},  
    [60] = {60,28000,28999,90060,},  
    [61] = {61,29000,29999,90061,},  
    [62] = {62,30000,30999,90062,},  
    [63] = {63,31000,31999,90063,},  
    [64] = {64,32000,32999,90064,},  
    [65] = {65,33000,33999,90065,},  
    [66] = {66,34000,34999,90066,},  
    [67] = {67,35000,35999,90067,},  
    [68] = {68,36000,36999,90068,},  
    [69] = {69,37000,37999,90069,},  
    [70] = {70,38000,38999,90070,},  
    [71] = {71,39000,39999,90071,},  
    [72] = {72,40000,40999,90072,},  
    [73] = {73,41000,41999,90073,},  
    [74] = {74,42000,42999,90074,},  
    [75] = {75,43000,43999,90075,},  
    [76] = {76,44000,44999,90076,},  
    [77] = {77,45000,45999,90077,},  
    [78] = {78,46000,46999,90078,},  
    [79] = {79,47000,47999,90079,},  
    [80] = {80,48000,48999,90080,},  
    [81] = {81,49000,49999,90081,},  
    [82] = {82,50000,50999,90082,},  
    [83] = {83,51000,51999,90083,},  
    [84] = {84,52000,52999,90084,},  
    [85] = {85,53000,53999,90085,},  
    [86] = {86,54000,54999,90086,},  
    [87] = {87,55000,55999,90087,},  
    [88] = {88,56000,56999,90088,},  
    [89] = {89,57000,57999,90089,},  
    [90] = {90,58000,58999,90090,},  
    [91] = {91,59000,59999,90091,},  
    [92] = {92,60000,60999,90092,},  
    [93] = {93,61000,61999,90093,},  
    [94] = {94,62000,62999,90094,},  
    [95] = {95,63000,63999,90095,},  
    [96] = {96,64000,64999,90096,},  
    [97] = {97,65000,65999,90097,},  
    [98] = {98,66000,66999,90098,},  
    [99] = {99,67000,67999,90099,},  
    [100] = {100,68000,999999,90100,},
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
    [41] = 41,  
    [42] = 42,  
    [43] = 43,  
    [44] = 44,  
    [45] = 45,  
    [46] = 46,  
    [47] = 47,  
    [48] = 48,  
    [49] = 49,  
    [50] = 50,  
    [51] = 51,  
    [52] = 52,  
    [53] = 53,  
    [54] = 54,  
    [55] = 55,  
    [56] = 56,  
    [57] = 57,  
    [58] = 58,  
    [59] = 59,  
    [60] = 60,  
    [61] = 61,  
    [62] = 62,  
    [63] = 63,  
    [64] = 64,  
    [65] = 65,  
    [66] = 66,  
    [67] = 67,  
    [68] = 68,  
    [69] = 69,  
    [70] = 70,  
    [71] = 71,  
    [72] = 72,  
    [73] = 73,  
    [74] = 74,  
    [75] = 75,  
    [76] = 76,  
    [77] = 77,  
    [78] = 78,  
    [79] = 79,  
    [80] = 80,  
    [81] = 81,  
    [82] = 82,  
    [83] = 83,  
    [84] = 84,  
    [85] = 85,  
    [86] = 86,  
    [87] = 87,  
    [88] = 88,  
    [89] = 89,  
    [90] = 90,  
    [91] = 91,  
    [92] = 92,  
    [93] = 93,  
    [94] = 94,  
    [95] = 95,  
    [96] = 96,  
    [97] = 97,  
    [98] = 98,  
    [99] = 99,  
    [100] = 100,
}

local __key_map = { 
    id = 1,
    min_score = 2,
    max_score = 3,
    talent_skill = 4,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_rebel_book_addition_info")

        return t._raw[__key_map[k]]
    end
}


function rebel_book_addition_info.getLength()
    return #rebel_book_addition_info._data
end



function rebel_book_addition_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_rebel_book_addition_info
function rebel_book_addition_info.indexOf(index)
    if index == nil or not rebel_book_addition_info._data[index] then
        return nil
    end
    return setmetatable({_raw = rebel_book_addition_info._data[index]}, m)
end



---
--@return @class record_rebel_book_addition_info
function rebel_book_addition_info.get(id)
    
    return rebel_book_addition_info.indexOf(__index_id[ id ])
     
end



function rebel_book_addition_info.set(id, key, value)
    local record = rebel_book_addition_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function rebel_book_addition_info.get_index_data()
    return __index_id 
end

return  rebel_book_addition_info 