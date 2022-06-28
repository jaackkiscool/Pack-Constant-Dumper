--[[
   _____           _          _____                _              _       _____                                  
 |  __ \         | |        / ____|              | |            | |     |  __ \                                 
 | |__) |_ _  ___| | __    | |     ___  _ __  ___| |_ __ _ _ __ | |_    | |  | |_   _ _ __ ___  _ __   ___ _ __ 
 |  ___/ _` |/ __| |/ /    | |    / _ \| '_ \/ __| __/ _` | '_ \| __|   | |  | | | | | '_ ` _ \| '_ \ / _ \ '__|
 | |  | (_| | (__|   <     | |___| (_) | | | \__ \ || (_| | | | | |_    | |__| | |_| | | | | | | |_) |  __/ |   
 |_|   \__,_|\___|_|\_\     \_____\___/|_| |_|___/\__\__,_|_| |_|\__|   |_____/ \__,_|_| |_| |_| .__/ \___|_|   
                                                                                               | |              
                                                                                               |_|              
]]
local bconsts = {
-- Blacklisted constants, feel free to add or edit more
    "getfenv",
    "string",
    "bit32",
    "pairs",
    "select",
    "math",
    "rawset",
    "rawequal",
    "rawget",
    "pairs",
    "next",
    "setfenv",
    "error",
    "assert",
    "pcall",
    "getmetatable",
    "debug",
    "unpack",
    "setmetatable",
    "tonumber",
    "math",
    "type",
    "bit32",
    "table",
    "tostring",
    "bit"
}
local _ENV = {["old_env"]=(getfenv)or(_ENV), ["bconsts"]=bconsts}
old_env["setmetatable"](_ENV, {
    __index = function(table, key)
        local found 
        for index, value in old_env["pairs"](bconsts) do
            if old_env["rawequal"](value, key) then found = true end
        end
        if not found then 
        old_env["print"](key)
        end
        return old_env[key]
    end
})

old_env['pcall'](function()
-- Script here
end)
