-- File is to create the Artemis Clean Kill Boon
-- TraitData_Artemis
--
-- Creating the boon functions itself
game.TraitData.ArtemisCriticalBoon = {
    InheritFrom = {"BaseTrait", "EarthBoon"},
    Elements = {"Earth"}, -- Need to add this even if you inherit
    Name = "ArtemisCriticalBoon",
    BoonInfoTitle = "ArtemisCriticalBoon",
    Icon = "Boon_Artemis_ArtemisCriticalBoon",
    TraitOrderingValueCache = 50,
    BlockStacking = false,
    RarityLevels = {
        Common = {
            Multiplier = 1.00
        },
        Rare = {
            Multiplier = 1.50
        },
        Epic = {
            Multiplier = 2.00
        },
        Heroic = {
            Multiplier = 2.50
        }
    },

    PropertyChanges = {{
        UnitProperty = "CritMultiplierAddition",
        BaseValue = 0.15,
        AbsoluteStackValues = {
            [1] = 1.20,
            [2] = 1.15,
            [3] = 1.10
        },

        ChangeType = "Add",
        ReportValues = {
            ReportedCriticalDamageBonus = "BaseValue"
        }
    }},

    StatLines = {"CriticalDamageBonusStatDisplay1"},

    ExtractValues = {{
        Key = "ExtractCritChance",
        ExtractAs = "TooltipCritChance",
        Format = "Percent"
    }, {
        Key = "ReportedCriticalDamageBonus",
        ExtractAs = "TooltipDamage",
        Format = "PercentDelta"
    }}

}

-- Icon Data
zanncdwbl_BoonAdditions.Boon_Artemis_ArtemisCriticalBoon = sjson.to_object({
    Name = "Boon_Artemis_ArtemisCriticalBoon",
    InheritFrom = "BoonIcon",
    FilePath = rom.path.combine(_PLUGIN.guid, "GUI\\Screens\\BoonIcons\\Clean_Kill")
}, zanncdwbl_BoonAdditions.IconOrder)

-- Boons Description/Display
zanncdwbl_BoonAdditions.ArtemisCriticalBoon = sjson.to_object({
    Id = "ArtemisCriticalBoon",
    InheritFrom = "BaseBoonMultiline",
    DisplayName = "Deadly Flourish",
    Description = "Your {$Keywords.Special} is stronger, with {#AltUpgradeFormat}{$TooltipData.ExtractData.TooltipCritChance:P} {#Prev} chance to deal {$Keywords.Crit} damage."
}, zanncdwbl_BoonAdditions.Order)

zanncdwbl_BoonAdditions.ArtemisCriticalBoon_Text = sjson.to_object({
    Id = "CriticalDamageBonusStatDisplay1",
    InheritFrom = "BaseStatLine",
    DisplayName = "{!Icons.Bullet}{#PropertyFormat}Critical Damage:",
    Description = "{#UpgradeFormat}{$TooltipData.ExtractData.TooltipDamage:F}"
}, zanncdwbl_BoonAdditions.Order)

-- Adding Boons to Default Artemis
table.insert(game.UnitSetData.NPC_Artemis.NPC_Artemis_Field_01.Traits, "ArtemisCriticalBoon")

-- Insert TraitIndex into BoonInfo or else it won't show up in codex since BoonInfo gets populated before traits are added by mods
-- Just adds the boon to the codex - aka the (Hidden) "TraitIndex"
game.ScreenData.BoonInfo.TraitDictionary.NPC_Artemis_Field_01["ArtemisCriticalBoon"] = true

-- Adding Traits to TraitData Table, and adding her as core, aka weapon, special, cast, etc
table.insert(game.LinkedTraitData.WeaponTraits, "ArtemisCriticalBoon")
table.insert(game.LinkedTraitData.SpecialTraits, "ArtemisCriticalBoon")
table.insert(game.LinkedTraitData.ArtemisCoreTraits, "ArtemisCriticalBoon")
