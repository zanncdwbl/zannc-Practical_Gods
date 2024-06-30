---@meta _
zanncdwbl_BoonAdditions = zanncdwbl_BoonAdditions or {}

---@diagnostic disable-next-line: undefined-global
local mods = rom.mods

---@diagnostic disable: lowercase-global
---@module "SGG_Modding-ENVY-auto"
mods["SGG_Modding-ENVY"].auto()

---@diagnostic disable-next-line: undefined-global
rom = rom
---@diagnostic disable-next-line: undefined-global
_PLUGIN = PLUGIN

---@module "SGG_Modding-Hades2GameDef-Globals"
game = rom.game

---@module "SGG_Modding-SJSON"
sjson = mods["SGG_Modding-SJSON"]

---@module "SGG_Modding-ModUtil"
modutil = mods["SGG_Modding-ModUtil"]

---@module "SGG_Modding-ReLoad"
reload = mods["SGG_Modding-ReLoad"]

local function on_ready()
    import_as_fallback(rom.game)

    import "ready.lua"
    import "sjson.lua"
    import "hermes/speedDamage.lua"
    import "hermes/moveSpeed.lua"
    -- import "hermes/dashHeal.lua" -- Not adding yet.
    import "hermes/bonusDash.lua"
end

local function on_reload()
    import_as_fallback(rom.game)
end

local loader = reload.auto_single()

modutil.once_loaded.game(function()
    loader.load(on_ready, on_reload)
end)
