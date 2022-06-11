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

old_env = _ENV or getfenv
local _ENV = {["old_env"]=old_env}
local who = getfenv or _ENV
old_env["setmetatable"](who, {
    __index = function(table, key)
        old_env["print"](key)
        return old_env[key]
    end
})

old_env['pcall'](function()
-- Script here
end)
