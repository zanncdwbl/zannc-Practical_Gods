zanncdwbl_BoonAdditions.AxeSwipe1_Artemis = sjson.to_object({
    Name = "AxeSwipe1_Artemis",
    InheritFrom = "AxeSwipe1",
    ClearCreateAnimations = true,
    StartRed = 1.0,
    StartGreen = 0.6,
    StartBlue = 0.8,
    EndRed = 0.99,
    EndGreen = 0.05,
    EndBlue = 0.99,
    VisualFx = "AxeSwipeArtemisParticle", -- BASE DONE
    VisualFxRadialOffsetScaleY = 0.66,
    VisualFxRadialOffsetStartAngle = 40,
    VisualFxRadialOffsetIncrementAngle = -25,
    CreateAnimations = {{
        Name = "AxeSwipe1Dark"
    }, {
        Name = "AxeSwipe1ArtemisFx" -- BASE DONE
    }, {
        Name = "AxeSwipe1ArtemisFxDisplace" -- BASE DONE
    }, {
        Name = "AxeSwipe1Spectral_Artemis" -- BASE DONE
    }, {
        Name = "AxeSwipe1Displacement"
    }, {
        Name = "AxeSwipeLight_Artemis"
    }}
}, zanncdwbl_BoonAdditions.Order)

zanncdwbl_BoonAdditions.AxeSwipe2_Artemis = sjson.to_object({
    Name = "AxeSwipe2_Artemis",
    InheritFrom = "AxeSwipe2",
    ClearCreateAnimations = true,
    StartRed = 1.0,
    StartGreen = 0.6,
    StartBlue = 0.8,
    EndRed = 0.99,
    EndGreen = 0.05,
    EndBlue = 0.99,
    FlipVertical = true,
    VisualFx = "AxeSwipeArtemisParticleFlip",
    VisualFxRadialOffsetScaleY = 0.66,
    VisualFxRadialOffsetStartAngle = -40,
    VisualFxRadialOffsetIncrementAngle = 25,
    CreateAnimations = {{
        Name = "AxeSwipe2Dark"
    }, {
        Name = "AxeSwipe2Spectral_Artemis"
    }, {
        Name = "AxeSwipe1ArtemisFxDisplaceFlip"
    }, {
        Name = "AxeSwipe2Displacement"
    }, {
        Name = "AxeSwipeLight2_Artemis"
    }, {
        Name = "AxeSwipe1ArtemisFxFlip"
    }}
}, zanncdwbl_BoonAdditions.Order)

zanncdwbl_BoonAdditions.AxeNova_Artemis = sjson.to_object({
    Name = "AxeNova_Artemis",
    InheritFrom = "AxeNova",
    StartRed = 1.0,
    StartGreen = 0.6,
    StartBlue = 0.8,
    EndRed = 0.99,
    EndGreen = 0.05,
    EndBlue = 0.99,
    VisualFx = "AxeNovaParticles_Artemis",
    VisualFxCap = 24,
    VisualFxIntervalMin = 0.01,
    VisualFxIntervalMax = 0.011,
    TimeModifierFraction = 0.33,
    Sound = "/SFX/Player Sounds/ArtemisLoveShotgunBlast",
    CreateAnimations = {{
        Name = "AxeNovaDark"
    }, {
        Name = "AxeNovaLight_Artemis"
    }, {
        Name = "AxeNovaDisplacement"
    }, {
        Name = "AxeNovaFlare_Artemis"
    }, {
        Name = "AxeGroundCrack"
    }, {
        Name = "AxeNovaArtemisCircle"
    }}
}, zanncdwbl_BoonAdditions.Order)

zanncdwbl_BoonAdditions.AxeSwipeUpper_Artemis = sjson.to_object({
    Name = "AxeSwipeUpper_Artemis",
    InheritFrom = "AxeSwipeUpper",
    ClearCreateAnimations = true,
    StartRed = 1.0,
    StartGreen = 0.6,
    StartBlue = 0.8,
    EndRed = 0.99,
    EndGreen = 0.05,
    EndBlue = 0.99,
    VisualFx = "AxeSwipeUpperParticles_Artemis",
    VisualFxIntervalMin = 0.01,
    VisualFxIntervalMax = 0.01,
    VisualFxCap = 10,
    Sound = "/SFX/Player Sounds/ArtemisLoveSwipe",
    CreateAnimations = {{
        Name = "AxeSwipeUpperDark"
    }, {
        Name = "AxeSwipeUpperSpectral_Artemis"
    }, {
        Name = "AxeSwipeUpperDisplacement"
    }, {
        Name = "AxeSwipeUpperLight_Artemis"
    }, {
        Name = "AxeSwipeUpper_ArtemisFx"
    }}
}, zanncdwbl_BoonAdditions.Order)

zanncdwbl_BoonAdditions.AxeSwipe2Spin_Artemis = sjson.to_object({
    Name = "AxeSwipe2Spin_Artemis",
    InheritFrom = "AxeSwipe1_Artemis",
    LocationZFromOwner = "Take",
    FlipVertical = true,
    ClearCreateAnimations = true,
    StartAngle = 0,
    EndAngle = 359,
    AngleMin = 0,
    AngleMax = 180,
    RandomPlaySpeedMin = 40,
    RandomPlaySpeedMax = 50,
    ScaleRadius = 256,
    StartRed = 1.0,
    StartGreen = 0.7,
    StartBlue = 0.9,
    EndRed = 0.9,
    EndGreen = 0.2,
    EndBlue = 0.999,
    Sound = "/SFX/Player Sounds/ArtemisLoveSwipe",
    VisualFx = "AxeSpinArtemisSparkle",
    VisualFxRadialOffsetScaleY = 0.66,
    VisualFxRadialOffsetStartAngle = 0,
    VisualFxRadialOffsetIncrementAngle = 40,
    VisualFxCap = 8,
    VisualFxIntervalMin = 0.01,
    VisualFxIntervalMax = 0.01,
    UseAttachedTipLocation = true,
    AttachedTipLocationScaleY = 0.6,
    VisualFxRadialOffsetLength = 350,
    CreateAnimations = {{
        Name = "AxeSwipe2SpinDark"
    }, {
        Name = "AxeSwipeSpinArtemisFx"
    }, {
        Name = "AxeSwipeLightSpin_Artemis"
    }, {
        Name = "AxeSwipe2SpinSpectral_Artemis"
    }, {
        Name = "AxeSwipe2SpinDisplacement"
    }}
}, zanncdwbl_BoonAdditions.Order)

zanncdwbl_BoonAdditions.AxeSwipe1ArtemisFx = sjson.to_object({
    Name = "AxeSwipe1ArtemisFx",
    FilePath = "Fx\\Artemis\\ArtemisSwipe\\ArtemisSwipe", -- ADD
    NumFrames = 23,
    PostRotateScaleY = 0.6,
    Material = "Unlit",
    LocationZFromOwner = "Take",
    LocationFromOwner = "Maintain",
    AngleFromOwner = "Take",
    SortMode = "FromParent",
    SortFromOwner = "Maintain",
    GroupName = "FX_Standing_Add",
    Scale = 2.0,
    StartRed = 1.0,
    StartGreen = 0.7,
    StartBlue = 0.9,
    EndRed = 0.9,
    EndGreen = 0.6,
    EndBlue = 0.999,
    EaseIn = 0.99,
    EaseOut = 1.00,
    StartScale = 1.0,
    EndScale = 1.05
}, zanncdwbl_BoonAdditions.Order)

zanncdwbl_BoonAdditions.AxeSwipe1ArtemisFxDisplace = sjson.to_object({
    Name = "AxeSwipe1ArtemisFxDisplace",
    InheritFrom = "AxeSwipe1ArtemisFx",
    GroupName = "FX_Displacement",
    Scale = 3,
    PlaySpeed = 45,
    Alpha = 0.25
}, zanncdwbl_BoonAdditions.Order)

zanncdwbl_BoonAdditions.AxeSwipe1ArtemisFxDisplaceFlip = sjson.to_object({
    Name = "AxeSwipe1ArtemisFxDisplaceFlip",
    InheritFrom = "AxeSwipe1ArtemisFxDisplace",
    FlipVertical = true
}, zanncdwbl_BoonAdditions.Order)

zanncdwbl_BoonAdditions.AxeSwipeArtemisParticle = sjson.to_object({
    Name = "AxeSwipeArtemisParticle",
    FilePath = "Fx\\Artemis\\ArtemisAxeHeartParticle\\ArtemisAxeHeartParticle", -- ADD
    RandomPlaySpeedMin = 45,
    RandomPlaySpeedMax = 60,
    NumFrames = 19,
    Material = "Unlit",
    AngleFromOwner = "Take",
    VelocityMin = 400,
    VelocityMax = 500,
    Acceleration = -600,
    LocationFromOwner = "Ignore",
    LocationZFromOwner = "Ignore",
    GroupName = "FX_Standing_Add",
    EaseIn = 0.95,
    EaseOut = 1.0,
    RandomFlipVertical = true,
    StartScale = 0.5,
    EndScale = 1.0,
    AngleMin = -90,
    AngleMax = -90.1,
    PostRotateScaleY = 0.5,
    TransferAngle = true,
    VisualFx = "AxeSwipeArtemisSparkle",
    VisualFxCap = 2,
    VisualFxIntervalMin = 0.01,
    VisualFxIntervalMax = 0.1,
    VisualFxUse3DAngle = true
}, zanncdwbl_BoonAdditions.Order)

zanncdwbl_BoonAdditions.AxeSwipe1Spectral_Artemis = sjson.to_object({
    Name = "AxeSwipe1Spectral_Artemis",
    InheritFrom = "AxeSwipe1Spectral",
    Scale = 3.0,
    PlaySpeed = 45,
    Hue = 0.75,
    Red = 1,
    Green = 1,
    Blue = 0.5,
    Saturation = -0.3
}, zanncdwbl_BoonAdditions.Order)

zanncdwbl_BoonAdditions.AxeSwipeLight_Artemis = sjson.to_object({
    Name = "AxeSwipeLight_Artemis",
    InheritFrom = "AxeSwipeLight",
    StartRed = 1.0,
    StartGreen = 0.9,
    StartBlue = 0.7,
    EndRed = 0.999,
    EndGreen = 0.85,
    EndBlue = 0.05,
    Duration = 0.25,
    Scale = 3.5,
    RotationSpeed = 360
}, zanncdwbl_BoonAdditions.Order)

