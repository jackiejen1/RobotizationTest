

__G__TRACKBACK__ = __G__TRACKBACK__ or function(errorMessage)

end

local string = string
local sub = string.sub
local slen = string.len

local require = require

local MODULE_PATH = ...

-- 这个文件配置名字必须是init
local prefix = sub(MODULE_PATH, 1, slen(MODULE_PATH) - 4)

load = function(name)
	return require(prefix..name)
end
loadCfg = load

G_battleLog = "Log:\n"

B_Log = function ( str )
	G_battleLog = G_battleLog..str.."\n"
end

load "config"
load "foundation.init"

-- 客户端的读取表的地方特殊
if BATTLE_PLATFORM == CLIENT then
	-- loadCfg = function(name)
	-- 	return require("app."..name)
	-- end
else
	-- random = require("libpcg32")
end

-- test
-- random = {}

-- random.createPRNG = function()
-- 	return {}
-- end

-- random.srand = function()

-- end

-- random.boundedrand = function(_, randBounded)
-- 	return math.random(randBounded)
-- end