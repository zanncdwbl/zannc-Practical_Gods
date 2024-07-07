-- File is to create the Artemis Hide Breaker Boon
-- TraitData_Artemis, Combat Logic 1390
-- ```
-- if damageEventArgs.IsCrit then
--     healthBufferDamageMultiplier = healthBufferDamageMultiplier +
--                                        GetTotalHeroTraitValue("CriticalHealthBufferMultiplier", {
--             IsMultiplier = true
--         }) - 1
-- end
-- ```
--
-- Creating the boon functions itself
game.TraitData.ArtemisArmourBoon = {
    InheritFrom = {"BaseTrait", "EarthBoon"},
    Elements = {"Earth"}, -- Need to add this even if you inherit
    Name = "ArtemisArmourBoon",
    BoonInfoTitle = "ArtemisArmourBoon",
    Icon = "Boon_Artemis_ArtemisArmourBoon",
    TraitOrderingValueCache = 50,
    BlockStacking = false,
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

    CriticalHealthBufferMultiplier = {
        BaseValue = 3, -- Have to set to 3? or else the display is wrong?
        SourceIsMultiplier = true,
        -- Scaling thing with pom
        AbsoluteStackValues = {
            [1] = 1.20,
            [2] = 1.15,
            [3] = 1.10
        }
        -- ReportValues = {
        --     ReportedArmourDamage = "BaseValue"
        -- }
    },

    StatLines = {"ArmourDamageStatDisplay1"},

    ExtractValues = {{
        Key = "CriticalHealthBufferMultiplier",
        ExtractAs = "TooltipDamageBonus",
        Format = "PercentDelta"
    }}
}

-- Icon Data
zanncdwbl_BoonAdditions.Boon_Artemis_ArtemisArmourBoon = sjson.to_object({
    Name = "Boon_Artemis_ArtemisArmourBoon",
    InheritFrom = "BoonIcon",
    FilePath = rom.path.combine(_PLUGIN.guid, "BoonIcons\\Hide_Breaker")
}, zanncdwbl_BoonAdditions.IconOrder)

-- Boons Description/Display
zanncdwbl_BoonAdditions.ArtemisArmourBoon = sjson.to_object({
    Id = "ArtemisArmourBoon",
    InheritFrom = "BaseBoonMultiline",
    DisplayName = "Hide Breaker",
    Description = "Your {$Keywords.Crit} effects deal even more damage to {$Keywords.Armor}."
}, zanncdwbl_BoonAdditions.Order)

zanncdwbl_BoonAdditions.ArtemisArmourBoon_Text = sjson.to_object({
    Id = "ArmourDamageStatDisplay1",
    InheritFrom = "BaseStatLine",
    DisplayName = "{!Icons.Bullet}{#PropertyFormat}Bonus vs Armour:",
    Description = "{#UpgradeFormat}{$TooltipData.ExtractData.TooltipDamageBonus:F}"
}, zanncdwbl_BoonAdditions.Order)

-- Adding Boons to Default Artemis
table.insert(game.UnitSetData.NPC_Artemis.NPC_Artemis_Field_01.Traits, "ArtemisArmourBoon")

-- Insert TraitIndex into BoonInfo or else it won't show up in codex since BoonInfo gets populated before traits are added by mods
-- Just adds the boon to the codex - aka the (Hidden) "TraitIndex"
game.ScreenData.BoonInfo.TraitDictionary.NPC_Artemis_Field_01["ArtemisArmourBoon"] = true

-- Adding Traits to TraitData Table, and adding her as core, aka weapon, special, cast, etc
table.insert(game.LinkedTraitData.WeaponTraits, "ArtemisArmourBoon")
table.insert(game.LinkedTraitData.SpecialTraits, "ArtemisArmourBoon")
table.insert(game.LinkedTraitData.ArtemisCoreTraits, "ArtemisArmourBoon")
