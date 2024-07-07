-- File is to create the Artemis Deadly Strike Boon
-- TraitData_Artemis
--
-- Creating the boon functions itself
game.TraitData.ArtemisWeaponBoon = {
    InheritFrom = {"BaseTrait", "EarthBoon"},
    Elements = {"Earth"}, -- Need to add this even if you inherit
    Name = "ArtemisWeaponBoon",
    BoonInfoTitle = "ArtemisWeaponBoon",
    Icon = "Boon_Artemis_ArtemisWeaponBoon",
    Slot = "Melee",
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

    AddOutgoingDamageModifiers = {
        ValidWeaponMultiplier = {
            BaseValue = 1.2,
            SourceIsMultiplier = true,
            -- Scaling thing with poms
            AbsoluteStackValues = {
                [1] = 1.20,
                [2] = 1.15,
                [3] = 1.10
            }
        },
        ValidWeapons = WeaponSets.HeroPrimaryWeapons,

        -- Don't really know if I need this, but it varies between melee/special etc
        ValidWeaponsLookup = {
            WeaponDagger2 = true,
            WeaponDagger5 = true,
            WeaponTorch = true,
            WeaponLob = true,
            WeaponAxe = true,
            WeaponStaffDash = true,
            WeaponStaffSwing5 = true,
            WeaponAxe2 = true,
            WeaponLobChargedPulse = true,
            WeaponAxe3 = true,
            WeaponLobPulse = true,
            WeaponDagger = true,
            WeaponStaffSwing2 = true,
            WeaponDaggerDash = true,
            WeaponAxeDash = true,
            WeaponDaggerDouble = true,
            WeaponDaggerMultiStab = true,
            WeaponStaffSwing3 = true,
            WeaponStaffSwing = true,
            WeaponAxeSpin = true
        },

        ReportValues = {
            ReportedValidWeaponMultiplier = "ValidWeaponMultiplier"
        }
    },

    AddOutgoingCritModifiers = {
        ValidWeapons = WeaponSets.HeroPrimaryWeapons,
        Chance = {
            BaseValue = 0.15,
            SourceIsMultiplier = false,
            IgnoreRarity = true
        },
        ReportValues = {
            ExtractCritChance = "Chance"
        }
    },

    StatLines = {"AttackBonusStatDisplay1"},

    ExtractValues = {{
        Key = "ExtractCritChance",
        ExtractAs = "TooltipCritChance",
        Format = "Percent"
    }, {
        Key = "ReportedValidWeaponMultiplier",
        ExtractAs = "TooltipDamage",
        Format = "PercentDelta"
    }}

    -- Add property changes here
}

-- Icon Data
zanncdwbl_BoonAdditions.Boon_Artemis_ArtemisWeaponBoon = sjson.to_object({
    Name = "Boon_Artemis_ArtemisWeaponBoon",
    InheritFrom = "BoonIcon",
    FilePath = rom.path.combine(_PLUGIN.guid, "BoonIcons\\Deadly_Strike")
}, zanncdwbl_BoonAdditions.IconOrder)

-- Boons Description/Display
zanncdwbl_BoonAdditions.ArtemisWeaponBoon = sjson.to_object({
    Id = "ArtemisWeaponBoon",
    InheritFrom = "BaseBoonMultiline",
    DisplayName = "Deadly Strike",
    Description = "Your {$Keywords.Attack} is stronger, with {#AltUpgradeFormat}{$TooltipData.ExtractData.TooltipCritChance:P} {#Prev} chance to deal {$Keywords.Crit} damage."
}, zanncdwbl_BoonAdditions.Order)

zanncdwbl_BoonAdditions.ArtemisWeaponBoon_Text = sjson.to_object({
    Id = "AttackBonusStatDisplay1",
    InheritFrom = "BaseStatLine",
    DisplayName = "{!Icons.Bullet}{#PropertyFormat}Attack Damage:",
    Description = "{#UpgradeFormat}{$TooltipData.ExtractData.TooltipDamage:F}"
}, zanncdwbl_BoonAdditions.Order)

-- Adding Boons to Default Artemis
table.insert(game.UnitSetData.NPC_Artemis.NPC_Artemis_Field_01.Traits, "ArtemisWeaponBoon")

-- Insert TraitIndex into BoonInfo or else it won't show up in codex since BoonInfo gets populated before traits are added by mods
-- Just adds the boon to the codex - aka the (Hidden) "TraitIndex"
game.ScreenData.BoonInfo.TraitDictionary.NPC_Artemis_Field_01["ArtemisWeaponBoon"] = true

-- Adding Traits to TraitData Table, and adding her as core, aka weapon, special, cast, etc
table.insert(game.LinkedTraitData.WeaponTraits, "ArtemisWeaponBoon")
table.insert(game.LinkedTraitData.SpecialTraits, "ArtemisWeaponBoon")
table.insert(game.LinkedTraitData.ArtemisCoreTraits, "ArtemisWeaponBoon")
