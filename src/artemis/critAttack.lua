-- File is to create the Artemis Deadly Strike Boon
-- TraitData_Artemis
-- Creating the boon functions itself
game.TraitData.ArtemisWeaponBoon = {
    InheritFrom = {"BaseTrait", "LegacyTrait", "EarthBoon"},
    Name = "ArtemisWeaponBoon",
    BoonInfoTitle = "ArtemisWeaponBoon",
    Icon = "Boon_Artemis_ArtemisWeaponBoon",
    Slot = "Melee",
    TraitOrderingValueCache = -1,
    BlockStacking = false,
    RarityLevels = {
        Common = {
            Multiplier = 1.00
        },
        Rare = {
            Multiplier = 1.25
        },
        Epic = {
            Multiplier = 1.50
        },
        Heroic = {
            Multiplier = 1.75
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

    -- PropertyChanges = {{
    --     WeaponName = "WeaponStaffSwing",
    --     WeaponProperty = "FireFx",
    --     ChangeValue = "StaffProjectileFireFx1_Aphrodite",
    --     ChangeType = "Absolute"
    -- }, {
    --     WeaponName = "WeaponStaffSwing",
    --     ProjectileName = "ProjectileStaffSwing1",
    --     ProjectileProperty = "Graphic",
    --     ChangeValue = "StaffComboAttack1_Aphrodite",
    --     ChangeType = "Absolute",
    --     ExcludeLinked = true
    -- }, {
    --     WeaponName = "WeaponStaffSwing",
    --     ProjectileName = "ProjectileStaffSwing1",
    --     ProjectileProperty = "DissipateFx",
    --     ChangeValue = "StaffComboAttack1Dissipate_Aphrodite",
    --     ChangeType = "Absolute",
    --     ExcludeLinked = true
    -- }, {
    --     WeaponName = "WeaponStaffSwing",
    --     ProjectileName = "ProjectileStaffSwing1",
    --     ProjectileProperty = "DeathFx",
    --     ChangeValue = "StaffComboAttack1Dissipate_Aphrodite",
    --     ChangeType = "Absolute",
    --     ExcludeLinked = true
    -- }, {
    --     WeaponName = "WeaponStaffSwing2",
    --     ProjectileName = "ProjectileStaffSwing2",
    --     ProjectileProperty = "Graphic",
    --     ChangeValue = "StaffComboAttack2_Aphrodite",
    --     ChangeType = "Absolute",
    --     ExcludeLinked = true
    -- }, {
    --     WeaponName = "WeaponStaffSwing2",
    --     ProjectileName = "ProjectileStaffSwing2",
    --     ProjectileProperty = "DissipateFx",
    --     ChangeValue = "StaffComboAttack2Dissipate_Aphrodite",
    --     ChangeType = "Absolute",
    --     ExcludeLinked = true
    -- }, {
    --     WeaponName = "WeaponStaffSwing2",
    --     ProjectileName = "ProjectileStaffSwing2",
    --     ProjectileProperty = "DeathFx",
    --     ChangeValue = "StaffComboAttack2Dissipate_Aphrodite",
    --     ChangeType = "Absolute",
    --     ExcludeLinked = true
    -- }, {
    --     WeaponName = "WeaponStaffSwing3",
    --     ProjectileName = "ProjectileStaffSwing3",
    --     ProjectileProperty = "Graphic",
    --     ChangeValue = "StaffComboAttack3_Aphrodite",
    --     ChangeType = "Absolute",
    --     ExcludeLinked = true
    -- }, {
    --     WeaponName = "WeaponStaffSwing3",
    --     ProjectileName = "ProjectileStaffSwing3",
    --     ProjectileProperty = "GroupName",
    --     ChangeValue = "FX_Standing_Add",
    --     ChangeType = "Absolute",
    --     ExcludeLinked = true
    -- }, {
    --     WeaponName = "WeaponStaffSwing3",
    --     ProjectileName = "ProjectileStaffSwing3",
    --     ProjectileProperty = "DissipateFx",
    --     ChangeValue = "StaffComboAttack3Dissipate_Aphrodite",
    --     ChangeType = "Absolute",
    --     ExcludeLinked = true
    -- }, {
    --     WeaponName = "WeaponStaffSwing3",
    --     ProjectileName = "ProjectileStaffSwing3",
    --     ProjectileProperty = "DeathFx",
    --     ChangeValue = "StaffComboAttack3Dissipate_Aphrodite",
    --     ChangeType = "Absolute",
    --     ExcludeLinked = true
    -- }, {
    --     WeaponName = "WeaponStaffDash",
    --     ProjectileName = "ProjectileStaffDash",
    --     ProjectileProperty = "Graphic",
    --     ChangeValue = "StaffComboAttack1Dash_Aphrodite",
    --     ChangeType = "Absolute",
    --     ExcludeLinked = true
    -- }, {
    --     WeaponName = "WeaponStaffSwing5",
    --     ProjectileName = "ProjectileSwing5Magic",
    --     ProjectileProperty = "DetonateFx",
    --     ChangeValue = "StaffChargedAttackFx_Aphrodite",
    --     ChangeType = "Absolute",
    --     ExcludeLinked = true
    -- }, {
    --     WeaponName = "WeaponDagger",
    --     WeaponProperty = "FireFx",
    --     ChangeValue = "DaggerSwipeFast_Aphrodite",
    --     ChangeType = "Absolute",
    --     ExcludeLinked = true
    -- }, {
    --     WeaponName = "WeaponDagger2",
    --     WeaponProperty = "FireFx",
    --     ChangeValue = "DaggerSwipeFastFlip_Aphrodite",
    --     ChangeType = "Absolute",
    --     ExcludeLinked = true
    -- }, {
    --     WeaponName = "WeaponDaggerMultiStab",
    --     ProjectileName = "ProjectileDagger",
    --     ProjectileProperty = "DetonateFx",
    --     ChangeValue = "DaggerJab_Aphrodite",
    --     ChangeType = "Absolute",
    --     ExcludeLinked = true
    -- }, {
    --     WeaponName = "WeaponDaggerDash",
    --     ProjectileName = "ProjectileDaggerDash",
    --     WeaponProperty = "FireFx",
    --     ChangeValue = "DaggerSwipeFastFlipDash_Aphrodite",
    --     ChangeType = "Absolute",
    --     ExcludeLinked = true
    -- }, {
    --     WeaponName = "WeaponDaggerDouble",
    --     ProjectileName = "ProjectileDaggerSliceDouble",
    --     ProjectileProperty = "DetonateFx",
    --     ChangeValue = "DaggerSwipeDouble_Aphrodite",
    --     ChangeType = "Absolute",
    --     ExcludeLinked = true
    -- }, {
    --     WeaponName = "WeaponDaggerDouble",
    --     WeaponProperty = "FireFx",
    --     ChangeValue = "null",
    --     ChangeType = "Absolute",
    --     ExcludeLinked = true
    -- }, {
    --     WeaponName = "WeaponDagger5",
    --     WeaponProperty = "FireFx",
    --     ChangeValue = "null",
    --     ChangeType = "Absolute",
    --     ExcludeLinked = true
    -- }, {
    --     WeaponName = "WeaponDagger5",
    --     WeaponProperty = "ChargeStartFx",
    --     ChangeValue = "DaggerCharge_Aphrodite",
    --     ChangeType = "Absolute",
    --     ExcludeLinked = true
    -- }, {
    --     WeaponName = "WeaponDagger5",
    --     ProjectileName = "ProjectileDaggerBackstab",
    --     ProjectileProperty = "StartFx",
    --     ChangeValue = "DaggerSwipe_Aphrodite",
    --     ChangeType = "Absolute",
    --     ExcludeLinked = true
    -- }, {
    --     WeaponName = "WeaponAxe",
    --     WeaponProperty = "FireFx",
    --     ChangeValue = "AxeSwipe1_Aphrodite",
    --     ChangeType = "Absolute",
    --     ExcludeLinked = true
    -- }, {
    --     WeaponName = "WeaponAxe2",
    --     WeaponProperty = "FireFx",
    --     ChangeValue = "AxeSwipe2_Aphrodite",
    --     ChangeType = "Absolute",
    --     ExcludeLinked = true
    -- }, {
    --     WeaponName = "WeaponAxe3",
    --     ProjectileName = "ProjectileAxeOverhead",
    --     ProjectileProperty = "DetonateFx",
    --     ChangeValue = "AxeNova_Aphrodite",
    --     ChangeType = "Absolute",
    --     ExcludeLinked = true
    -- }, {
    --     WeaponName = "WeaponAxeDash",
    --     WeaponProperty = "FireFx",
    --     ChangeValue = "AxeSwipeUpper_Aphrodite",
    --     ChangeType = "Absolute",
    --     ExcludeLinked = true
    -- }, {
    --     WeaponName = "WeaponAxeSpin",
    --     ProjectileName = "ProjectileAxeSpin",
    --     ProjectileProperty = "DetonateFx",
    --     ChangeValue = "AxeSwipe2Spin_Aphrodite",
    --     ChangeType = "Absolute",
    --     ExcludeLinked = true
    -- }, {
    --     WeaponName = "WeaponLob",
    --     ProjectileName = "ProjectileLob",
    --     ProjectileProperty = "Graphic",
    --     ChangeValue = "LobProjectile_Aphrodite",
    --     ChangeType = "Absolute",
    --     ExcludeLinked = true
    -- }, {
    --     WeaponName = "WeaponLob",
    --     ProjectileName = "ProjectileLob",
    --     ProjectileProperty = "BounceFx",
    --     ChangeValue = "LobProjectileBounceFx_Aphrodite",
    --     ChangeType = "Absolute",
    --     ExcludeLinked = true
    -- }, {
    --     WeaponName = "WeaponLob",
    --     ProjectileName = "ProjectileLob",
    --     ProjectileProperty = "StartFx",
    --     ChangeValue = "StaffProjectileFireFx2Close_Aphrodite",
    --     ChangeType = "Absolute",
    --     ExcludeLinked = true
    -- }, {
    --     WeaponName = "WeaponLob",
    --     ProjectileName = "ProjectileLob",
    --     ProjectileProperty = "DetonateFx",
    --     ChangeValue = "LobExplosion_Aphrodite",
    --     ChangeType = "Absolute",
    --     ExcludeLinked = true
    -- }, {
    --     WeaponName = "WeaponLob",
    --     ProjectileName = "ProjectileLobCharged",
    --     ProjectileProperty = "Graphic",
    --     ChangeValue = "LobProjectileCharged_Aphrodite",
    --     ChangeType = "Absolute",
    --     ExcludeLinked = true
    -- }, {
    --     WeaponName = "WeaponLob",
    --     ProjectileName = "ProjectileLobCharged",
    --     ProjectileProperty = "AttachedAnim",
    --     ChangeValue = "LobProjectileChargedSecondaryEmitter_Aphrodite",
    --     ChangeType = "Absolute",
    --     ExcludeLinked = true
    -- }, {
    --     WeaponName = "WeaponLob",
    --     ProjectileName = "ProjectileLobCharged",
    --     ProjectileProperty = "DescentStartFx",
    --     ChangeValue = "LobEXDescentStart_Aphrodite",
    --     ChangeType = "Absolute",
    --     ExcludeLinked = true
    -- }, {
    --     WeaponName = "WeaponLob",
    --     ProjectileName = "ProjectileLobCharged",
    --     ProjectileProperty = "StartFx",
    --     ChangeValue = "LobEXFireFx_Aphrodite",
    --     ChangeType = "Absolute",
    --     ExcludeLinked = true
    -- }, {
    --     WeaponName = "WeaponLob",
    --     ProjectileName = "ProjectileLobCharged",
    --     ProjectileProperty = "DetonateFx",
    --     ChangeValue = "LobExplosionCharged_Aphrodite",
    --     ChangeType = "Absolute",
    --     ExcludeLinked = true
    -- }, {
    --     WeaponName = "WeaponTorch",
    --     ProjectileName = "ProjectileTorchBall",
    --     ProjectileProperty = "Graphic",
    --     ChangeValue = "TorchProjectileSmallIn_Aphrodite",
    --     ChangeType = "Absolute",
    --     ExcludeLinked = true
    -- }, {
    --     WeaponName = "WeaponTorch",
    --     ProjectileName = "ProjectileTorchBallLarge",
    --     ProjectileProperty = "Graphic",
    --     ChangeValue = "TorchProjectileLargeIn_Aphrodite",
    --     ChangeType = "Absolute",
    --     ExcludeLinked = true
    -- }, {
    --     WeaponName = "WeaponTorch",
    --     ProjectileName = "ProjectileTorchBall",
    --     ProjectileProperty = "AttachedAnim",
    --     ChangeValue = "TorchProjectileShadow_Aphrodite",
    --     ChangeType = "Absolute",
    --     ExcludeLinked = true
    -- }, {
    --     WeaponName = "WeaponTorch",
    --     ProjectileName = "ProjectileTorchBallLarge",
    --     ProjectileProperty = "AttachedAnim",
    --     ChangeValue = "TorchProjectileShadowLarge_Aphrodite",
    --     ChangeType = "Absolute",
    --     ExcludeLinked = true
    -- }, {
    --     WeaponName = "WeaponTorch",
    --     ProjectileName = "ProjectileTorchBall",
    --     ProjectileProperty = "DissipateFx",
    --     ChangeValue = "TorchProjectileDissipate_Aphrodite",
    --     ChangeType = "Absolute",
    --     ExcludeLinked = true
    -- }, {
    --     WeaponName = "WeaponTorch",
    --     ProjectileName = "ProjectileTorchBallLarge",
    --     ProjectileProperty = "DissipateFx",
    --     ChangeValue = "TorchProjectileDissipate_Aphrodite",
    --     ChangeType = "Absolute",
    --     ExcludeLinked = true
    -- }, {
    --     WeaponName = "WeaponTorch",
    --     ProjectileName = "ProjectileTorchRepeatStrike",
    --     ProjectileProperty = "DetonateFx",
    --     ChangeValue = "RadialNovaPentagramCharged_Aphrodite",
    --     ChangeType = "Absolute",
    --     ExcludeLinked = true
    -- }, {
    --     WeaponName = "WeaponTorch",
    --     ProjectileName = "ProjectileTorchRepeatStrikeLarge",
    --     ProjectileProperty = "DetonateFx",
    --     ChangeValue = "RadialNovaPentagramCharged_Aphrodite",
    --     ChangeType = "Absolute",
    --     ExcludeLinked = true
    -- }}
}

-- Icon Data
zanncdwbl_BoonAdditions.Boon_Artemis_ArtemisWeaponBoon = sjson.to_object({
    Name = "Boon_Artemis_ArtemisWeaponBoon",
    InheritFrom = "BoonIcon",
    FilePath = rom.path.combine(_PLUGIN.guid, "GUI\\Screens\\BoonIcons\\Deadly_Strike")
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
