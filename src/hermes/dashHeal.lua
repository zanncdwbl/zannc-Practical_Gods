-- File is to create the Hermes Quick Recovery Boon -- Not adding yet.
-- LootData_Hermes, TraitData_Hermes
-- Insert into hermes trait table
table.insert(game.LootData.HermesUpgrade.Traits, "RushRallyBoon")

-- Creating the boon functions itself
game.TraitData.RushRallyBoon = {
    InheritFrom = {"BaseTrait", "AirBoon"},
    Elements = {"Air"}, -- Need to add this even if you inherit
    Name = "RushRallyBoon",
    Icon = "Boon_Hermes_RushRallyBoon",
    TraitOrderingValueCache = -1,
    BlockStacking = true, -- Not needed, but incase a mod comes along and fucks around

    RarityLevels = {
        Common = {
            Multiplier = 0.3
        },
        Rare = {
            Multiplier = 0.4
        },
        Epic = {
            Multiplier = 0.5
        },
        Heroic = {
            Multiplier = 0.6
        }
    },

    StatLines = {"BonusSpeedStatDisplay1"},

    -- Completely undone, need to do all the tables and stuff (I'm lazy.)
    PropertyChanges = {{
        LuaTable = "RallyHealth",
        LuaProperty = "RallyActive",
        ChangeValue = true,
        ChangeType = "Absolute"
    }, {
        LuaTable = "RallyHealth",
        LuaProperty = "RallyHealOnDash",
        ChangeValue = true,
        ChangeType = "Absolute"
    }, {
        LuaTable = "RallyHealth",
        LuaProperty = "HitsDrainRallyHealthMultiplier",
        ChangeValue = 0,
        ChangeType = "Absolute"
    }, {
        LuaTable = "RallyHealth",
        LuaProperty = "ConversionPercent",
        BaseValue = 1.0,
        ChangeType = "Absolute",
        ExtractValue = {
            ExtractAs = "TooltipHeal",
            Format = "Percent"
        }
    }, {
        LuaTable = "RallyHealth",
        LuaProperty = "RallyDecayRateSeconds",
        ChangeValue = 0.3,
        ChangeType = "Absolute"
    }},

    ExtractValues = {{
        Key = "ReportedSpeed",
        ExtractAs = "TooltipSpeed",
        Format = "PercentDelta"
    }}
}

-- Icon Data
zanncdwbl_BoonAdditions.Boon_Hermes_RushRallyBoon = sjson.to_object({
    Name = "Boon_Hermes_RushRallyBoon",
    InheritFrom = "BoonIcon",
    FilePath = rom.path.combine(_PLUGIN.guid, "BoonIcons\\Quick_Recovery")
}, zanncdwbl_BoonAdditions.IconOrder)

-- Boons Description/Display
zanncdwbl_BoonAdditions.RushRallyBoon = sjson.to_object({
    Id = "RushRallyBoon",
    InheritFrom = "BaseBoonMultiline",
    DisplayName = "Quick Recovery",
    Description = "After taking damage, quickly {$Keywords.Dash} to recover some {!Icons.Health_Small_Tooltip} you just lost."
}, zanncdwbl_BoonAdditions.Order)

zanncdwbl_BoonAdditions.RushRallyBoon_Text = sjson.to_object({
    Id = "BonusSpeedStatDisplay1",
    InheritFrom = "BaseStatLine",
    DisplayName = "{!Icons.Bullet}{#PropertyFormat}Life Recovered:",
    Description = "{#UpgradeFormat}{$TooltipData.ExtractData.TooltipHeal:F} {#Prev}{#ItalicFormat}of damage taken"
}, zanncdwbl_BoonAdditions.Order)
