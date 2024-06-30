-- File is to create the Hermes Rush Delivery Boon
-- LootData_Hermes, TraitData_Hermes
-- Insert into hermes trait table
table.insert(game.LootData.HermesUpgrade.Traits, "SpeedDamageBoon")

-- Creating the boon functions itself
game.TraitData.SpeedDamageBoon = {
    InheritFrom = {"BaseTrait", "LegacyTrait", "AirBoon"},
    Name = "SpeedDamageBoon",
    Icon = "Boon_Hermes_SpeedDamageBoon",
    TraitOrderingValueCache = -1,
    BlockStacking = true, -- Not needed, but incase a mod comes along and fucks around

    RarityLevels = {
        Common = {
            Multiplier = 1.0
        },
        Rare = {
            Multiplier = 1.5
        },
        Epic = {
            Multiplier = 2.0
        },
        Heroic = {
            Multiplier = 2.5
        }
    },

    StatLines = {"SpeedDamageStatDisplay1"},

    AddOutgoingDamageModifiers = {
        SpeedDamageMultiplier = {
            BaseValue = 0.5,
            SourceIsMultiplier = true
        },
        ReportValues = {
            ReportedSpeedDamageMultiplier = "SpeedDamageMultiplier"
        }
    },

    ExtractValues = {{
        Key = "ReportedSpeedDamageMultiplier",
        ExtractAs = "TooltipBonus",
        Format = "PercentDelta"
    }}
}

-- Icon Data
zanncdwbl_BoonAdditions.Boon_Hermes_SpeedDamageBoon = sjson.to_object({
    Name = "Boon_Hermes_SpeedDamageBoon",
    InheritFrom = "BoonIcon",
    FilePath = rom.path.combine(_PLUGIN.guid, "GUI\\Screens\\BoonIcons\\Rush_Delivery")
}, zanncdwbl_BoonAdditions.IconOrder)

-- Boons Description/Display
zanncdwbl_BoonAdditions.SpeedDamageBoon = sjson.to_object({
    Id = "SpeedDamageBoon",
    InheritFrom = "BaseBoonMultiline",
    DisplayName = "Rush Delivery",
    Description = "You deal bonus damage based on any bonus move speed."
}, zanncdwbl_BoonAdditions.Order)

zanncdwbl_BoonAdditions.SpeedDamageBoon_Text = sjson.to_object({
    Id = "SpeedDamageStatDisplay1",
    InheritFrom = "BaseStatLine",
    DisplayName = "{!Icons.Bullet}{#PropertyFormat}Bonus Damage From Bonus Speed:",
    Description = "{#UpgradeFormat}{$TooltipData.ExtractData.TooltipBonus:F}"
}, zanncdwbl_BoonAdditions.Order)

-- Just so the boon isn't useless, have some movespeed upgrade lol, directly in TraitData.lua
game.TraitRequirements = {
    SpeedDamageBoon = {
        OneOf = {"MoveSpeedTrait", "FastClearDodgeBonusKeepsake"}
    }
}
