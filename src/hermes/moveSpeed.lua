-- File is to create the Hermes Greater Haste Boon
-- LootData_Hermes, TraitData_Hermes
--
-- Creating the boon functions itself
game.TraitData.MoveSpeedBoon = {
    InheritFrom = {"BaseTrait", "AirBoon"},
    Elements = {"Air"}, -- Need to add this even if you inherit
    Name = "MoveSpeedBoon",
    Icon = "Boon_Hermes_MoveSpeedBoon",
    TraitOrderingValueCache = -1,
    BlockStacking = true, -- Not needed, but incase a mod comes along and fucks around

    RarityLevels = {
        Common = {
            Multiplier = 1.0
        },
        Rare = {
            Multiplier = 1.08
        },
        Epic = {
            Multiplier = 1.17
        },
        Heroic = {
            Multiplier = 1.25
        }
    },

    StatLines = {"BonusSpeedStatDisplay1"},

    PropertyChanges = {{
        UnitProperty = "Speed",
        ChangeType = "Multiply",
        BaseValue = 1.2,
        SourceIsMultiplier = true,
        ReportValues = {
            ReportedSpeed = "ChangeValue"
        }
    }},

    ExtractValues = {{
        Key = "ReportedSpeed",
        ExtractAs = "TooltipSpeed",
        Format = "PercentDelta"
    }}
}

-- Icon Data
zanncdwbl_BoonAdditions.Boon_Hermes_MoveSpeedBoon = sjson.to_object({
    Name = "Boon_Hermes_MoveSpeedBoon",
    InheritFrom = "BoonIcon",
    FilePath = rom.path.combine(_PLUGIN.guid, "BoonIcons\\Greater_Haste")
}, zanncdwbl_BoonAdditions.IconOrder)

-- Boons Description/Display
zanncdwbl_BoonAdditions.MoveSpeedBoon = sjson.to_object({
    Id = "MoveSpeedBoon",
    InheritFrom = "BaseBoonMultiline",
    DisplayName = "Greater Haste",
    Description = "You move faster."
}, zanncdwbl_BoonAdditions.Order)

zanncdwbl_BoonAdditions.MoveSpeedBoon_Text = sjson.to_object({
    Id = "BonusSpeedStatDisplay1",
    InheritFrom = "BaseStatLine",
    DisplayName = "{!Icons.Bullet}{#PropertyFormat}Move Speed:",
    Description = "{#UpgradeFormat}{$TooltipData.ExtractData.TooltipSpeed:F}"
}, zanncdwbl_BoonAdditions.Order)

-- Insert into hermes trait table
table.insert(game.LootData.HermesUpgrade.Traits, "MoveSpeedBoon")
game.LootData.HermesUpgrade.TraitIndex["MoveSpeedBoon"] = true
-- Insert TraitIndex into BoonInfo or else it won't show up in codex since BoonInfo gets populated before traits are added by mods
-- Just adds the boon to the codex - aka the (Hidden) "TraitIndex"
game.ScreenData.BoonInfo.TraitDictionary.HermesUpgrade["MoveSpeedBoon"] = true
