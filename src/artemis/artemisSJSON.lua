zanncdwbl_BoonAdditions.BoonInfoSymbolArtemisIcon = sjson.to_object({
    Name = "BoonInfoSymbolArtemisIcon",
    InheritFrom = "BoonInfoSymbolBase",
    FilePath = rom.path.combine(_PLUGIN.guid, "Items\\Loot\\Boon\\ArtemisIconSpin\\ArtemisIconSpin015")
}, zanncdwbl_BoonAdditions.IconOrder)

zanncdwbl_BoonAdditions.BoonDropArtemisPreview = sjson.to_object({
    Name = "BoonDropArtemisPreview",
    InheritFrom = "BoonDropRoomRewardIconPreviewBase",
    NumFrames = 1,
    FilePath = rom.path.combine(_PLUGIN.guid, "Items\\Loot\\Boon\\ArtemisIconSpin\\ArtemisIconSpin015"),
    OffsetZ = 0,
    Scale = 0,
    ColorFromOwner = "Maintain",
    AngleFromOwner = "Ignore"
}, zanncdwbl_BoonAdditions.FxMainOrder)

zanncdwbl_BoonAdditions.BoonDropArtemisUpgradedPreview = sjson.to_object({
    Name = "BoonDropArtemisUpgradedPreview",
    InheritFrom = "BoonDropArtemisPreview",
    ChildAnimation = "BoonUpgradedPreviewSparkles"
}, zanncdwbl_BoonAdditions.FxChildOrder)

zanncdwbl_BoonAdditions.BoonDropArtemis = sjson.to_object({
    Name = "BoonDropArtemis",
    InheritFrom = "BoonDropGold",
    ChildAnimation = "BoonDropA-Artemis"
}, zanncdwbl_BoonAdditions.FxChildOrder)


-- This is the error
zanncdwbl_BoonAdditions.BoonDropA_Artemis = sjson.to_object({
    Name = "BoonDropA-Artemis",
    InheritFrom = "BoonDropA",
    ChildAnimation = "BoonDropB-Artemis",
    CreateAnimations = [
        { Name = "BoonDropBackGlow" },
        { Name = "BoonDropFrontFlare" },
    ],
    Color = { Red = 1.0 Green = 0.78 Blue = 0.96 },
}, zanncdwbl_BoonAdditions.FxBoonDropOrder)

-- Changed sjsons to artemis
-- {
--   Name = "BoonDropA-Artemis"
--   InheritFrom = "BoonDropA"
--   ChildAnimation = "BoonDropB-Artemis"
--   CreateAnimations = [
--     { Name = "BoonDropBackGlow" }
--     { Name = "BoonDropFrontFlare" }
--   ]
--   Color = { Red = 1.0 Green = 0.78 Blue = 0.96 }
-- }

-- {
--   Name = "BoonDropB-Artemis"
--   InheritFrom = "BoonDropB"
--   ChildAnimation = "BoonDropC-Artemis"
--   CreateAnimations = [
--     { Name = "BoonDropBackGlow" }
--     { Name = "BoonDropFrontFlare" }
--   ]
--   Color = { Red = 0.98 Green = 0.35 Blue = 1.0 }
-- }

-- {
--   Name = "BoonDropC-Artemis"
--   InheritFrom = "BoonDropC"
--   ChildAnimation = "BoonDropArtemisIcon"
--   CreateAnimations = [
--     { Name = "BoonDropBackGlow" }
--     { Name = "BoonDropFrontFlare" }
--   ]
--   Color = { Red = 1.0 Green = 0.62 Blue = 0.48 }
-- }

-- {
--   Name = "BoonDropArtemisIcon"
--   InheritFrom = "BoonDropIcon"
-- }


-- aphro code, FxFile

    -- {
    --   Name = "BoonDropAphrodite"
    --   InheritFrom = "BoonDropGold"
    --   ChildAnimation = "BoonDropA-Aphrodite"
    -- }
    
    -- {
    --   Name = "BoonDropA-Aphrodite"
    --   InheritFrom = "BoonDropA"
    --   ChildAnimation = "BoonDropB-Aphrodite"
    --   CreateAnimations = [
    --     { Name = "BoonDropBackGlow" }
    --     { Name = "BoonDropFrontFlare" }
    --   ]
    --   Color = { Red = 1.0 Green = 0.78 Blue = 0.96 }
    -- }
    
    -- {
    --   Name = "BoonDropB-Aphrodite"
    --   InheritFrom = "BoonDropB"
    --   ChildAnimation = "BoonDropC-Aphrodite"
    --   CreateAnimations = [
    --     { Name = "BoonDropBackGlow" }
    --     { Name = "BoonDropFrontFlare" }
    --   ]
    --   Color = { Red = 0.98 Green = 0.35 Blue = 1.0 }
    -- }
    
    -- {
    --   Name = "BoonDropC-Aphrodite"
    --   InheritFrom = "BoonDropC"
    --   ChildAnimation = "BoonDropAphroditeIcon"
    --   CreateAnimations = [
    --     { Name = "BoonDropBackGlow" }
    --     { Name = "BoonDropFrontFlare" }
    --   ]
    --   Color = { Red = 1.0 Green = 0.62 Blue = 0.48 }
    -- }
    
    -- {
    --   Name = "BoonDropAphroditeIcon"
    --   InheritFrom = "BoonDropIcon"
    -- }
    -- {
    --   Name = "BoonDropAphroditePreview"
    --   InheritFrom = "BoonDropRoomRewardIconPreviewBase"
    --   NumFrames = 1
    --   FilePath = "Items\Loot\Boon\AphroditeIconSpin\AphroditeIconSpin0015"
    --   OffsetZ = 0
    --   Scale = 1.0
    --   ColorFromOwner = "Maintain"
    --   AngleFromOwner = "Ignore"
    -- }
    -- {
    --   Name = "BoonDropAphroditeUpgradedPreview"
    --   InheritFrom = "BoonDropAphroditePreview"
    --   ChildAnimation = "BoonUpgradedPreviewSparkles"
    -- }