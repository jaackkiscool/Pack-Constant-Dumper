

local old_env = getfenv or _ENV
local bkey = {
-- Blacklisted constants, if you want you could edit them.
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
function GETFENV()
    if _VERSION == "Lua 5.1" or _VERSION == "Luau" then
        return getfenv
    else
        return _ENV
end
end
_ENV = {["old_env"]=GETFENV(),["bkey"]=bkey}
function GETFENV()
    if _VERSION == "Lua 5.1" or _VERSION == "Luau" then
        return getfenv
    else
        return _ENV
end
end
who = GETFENV()
old_env["setmetatable"](who,{
    __index = function(t,i)
        local isfound = false
        for _,v in old_env["pairs"](bkey) do
            if v == i then isfound = true end
        end
        if not isfound then 
        old_env["print"](i)
        end
        return old_env[i]
    end
})

old_env['pcall'](function()
print("yo")
end)
