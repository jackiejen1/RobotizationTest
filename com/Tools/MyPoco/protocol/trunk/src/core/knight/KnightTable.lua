local knight_info = loadCfg "cfg.knight_info"

local KnightTable = {
    indexByAdvIdStar = {},
    isInitIndex = false,
}

function KnightTable._initIndex()
    local indexByAdvIdStar = KnightTable.indexByAdvIdStar
    local len = knight_info.getLength()
    for i = 1, len do
        local knightCfg = knight_info.indexOf(i)
        if knightCfg.put == 1 then
            if not indexByAdvIdStar[knightCfg.advance_id] then
                indexByAdvIdStar[knightCfg.advance_id] = {}
            end
            indexByAdvIdStar[knightCfg.advance_id][knightCfg.star] = knightCfg
        end
    end
    KnightTable.isInitIndex = true
end

function KnightTable._checkInitIndex( ... )
    if not KnightTable.isInitIndex then
        KnightTable._initIndex()
    end
end

function KnightTable.getKnightByAdvIdStar(advanceId, star)
    KnightTable._checkInitIndex()
    local indexByAdvIdStar = KnightTable.indexByAdvIdStar
    if indexByAdvIdStar[advanceId] and indexByAdvIdStar[advanceId][star] then
        return indexByAdvIdStar[advanceId][star]
    end
    return nil
end

return KnightTable