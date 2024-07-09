zanncdwbl_BoonAdditions.GUIFlameGlow = {"Name", "InheritFrom", "Color"}
zanncdwbl_BoonAdditions.GUISymbol = {"Name", "InheritFrom", "ChildAnimation", "Scale", "CreateAnimations", "Color"}
zanncdwbl_BoonAdditions.GUIBackingB = {"Name", "InheritFrom", "ChildAnimation", "Scale", "Color"}
zanncdwbl_BoonAdditions.GUIBackingC = {"Name", "InheritFrom", "ChildAnimation", "Color"}
zanncdwbl_BoonAdditions.GUIIcon = {"Name", "InheritFrom", "EndFrame", "StartFrame", "FilePath"}
--
-- GUiAnimations.sjson
zanncdwbl_BoonAdditions.BoonSymbolGlow_Artemis = sjson.to_object({
    Name = "BoonSymbolGlow_Artemis",
    InheritFrom = "BoonSymbolGlow",
    Color = {
        Red = 1.000,
        Green = 0.329,
        Blue = 0.173
    }
}, zanncdwbl_BoonAdditions.GUIFlameGlow)

zanncdwbl_BoonAdditions.BoonSymbolFlare_Artemis = sjson.to_object({
    Name = "BoonSymbolFlare_Artemis",
    InheritFrom = "BoonSymbolFlare",
    Color = {
        Red = 1.000,
        Green = 0.235,
        Blue = 0.000
    }
}, zanncdwbl_BoonAdditions.GUIFlameGlow)

zanncdwbl_BoonAdditions.BoonSymbolArtemis = sjson.to_object({
    Name = "BoonSymbolArtemis",
    InheritFrom = "BoonBackingA",
    ChildAnimation = "BoonBackingB_Artemis",
    Scale = 0.5,
    CreateAnimations = {{
        Name = "BoonSymbolGlow_Artemis"
    }, {
        Name = "BoonSymbolFlare_Artemis"
    }},
    Color = {
        Red = 1.000,
        Green = 0.800,
        Blue = 0.000
    }
}, zanncdwbl_BoonAdditions.GUISymbol)

zanncdwbl_BoonAdditions.BoonBackingB_Artemis = sjson.to_object({
    Name = "BoonBackingB_Artemis",
    InheritFrom = "BoonBackingB",
    ChildAnimation = "BoonBackingC_Artemis",
    Scale = 0.5,
    Color = {
        Red = 1.000,
        Green = 0.953,
        Blue = 0.631
    }
}, zanncdwbl_BoonAdditions.GUIBackingB)

zanncdwbl_BoonAdditions.BoonBackingC_Artemis = sjson.to_object({
    Name = "BoonBackingC_Artemis",
    InheritFrom = "BoonBackingC",
    ChildAnimation = "BoonSymbolArtemisIcon",
    Color = {
        Red = 1.000,
        Green = 0.392,
        Blue = 0.749
    }
}, zanncdwbl_BoonAdditions.GUIBackingC)

zanncdwbl_BoonAdditions.BoonSymbolArtemisIcon = sjson.to_object({
    Name = "BoonSymbolArtemisIcon",
    InheritFrom = "BoonSymbolBase",
    EndFrame = 1,
    StartFrame = 1,
    FilePath = "GUI\\Screens\\BoonSelectSymbols\\Artemis2"
}, zanncdwbl_BoonAdditions.GUIIcon)

-- GUI Hook
table.insert(data.Animations, zanncdwbl_BoonAdditions.BoonSymbolGlow_Artemis)
table.insert(data.Animations, zanncdwbl_BoonAdditions.BoonSymbolFlare_Artemis)
table.insert(data.Animations, zanncdwbl_BoonAdditions.BoonSymbolArtemis)
table.insert(data.Animations, zanncdwbl_BoonAdditions.BoonBackingB_Artemis)
-- Game already has these 2
table.insert(data.Animations, zanncdwbl_BoonAdditions.BoonBackingC_Artemis)
table.insert(data.Animations, zanncdwbl_BoonAdditions.BoonSymbolArtemisIcon)

-- Stat Line Stuff - TraitTextFile 
table.insert(data.Texts, zanncdwbl_BoonAdditions.ArtemisWeaponBoon_Text)
table.insert(data.Texts, zanncdwbl_BoonAdditions.ArtemisSpecialBoon_Text)

zanncdwbl_BoonAdditions.ArtemisWeaponBoon_Text = sjson.to_object({
    Id = "AttackBonusStatDisplay1",
    InheritFrom = "BaseStatLine",
    DisplayName = "{!Icons.Bullet}{#PropertyFormat}Attack Damage:",
    Description = "{#UpgradeFormat}{$TooltipData.ExtractData.TooltipDamage:F}"
}, zanncdwbl_BoonAdditions.Order)

zanncdwbl_BoonAdditions.ArtemisSpecialBoon_Text = sjson.to_object({
    Id = "SpecialBonusStatDisplay1",
    InheritFrom = "BaseStatLine",
    DisplayName = "{!Icons.Bullet}{#PropertyFormat}Special Damage:",
    Description = "{#UpgradeFormat}{$TooltipData.ExtractData.TooltipDamage:F}"
}, zanncdwbl_BoonAdditions.Order)

-- Artemis Dialogue Stuff
-- InteractTextLineSets = {
--     -- ArtemisFirstMeeting = {
--     --     PlayOnce = true,
--     --     GameStateRequirements = {{}},
--     --     {
--     --         Cue = "/VO/Melinoe_0630",
--     --         UsePlayerSource = true,
--     --         PreLineThreadedFunctionName = "PlayEmoteAnimFromSource",
--     --         PreLineThreadedFunctionArgs = {
--     --             Emote = "None",
--     --             Portrait = "Portrait_Mel_Intense_01",
--     --             WaitTime = 4.9,
--     --             PowerWordPresentation = true,
--     --             PowerWordWaitTime = 6.35
--     --         },
--     --         -- PostLineAnim = "MelinoeInteractEquip", PostLineAnimTarget = "Hero",
--     --         PostLineFunctionName = "BoonInteractPresentation",
--     --         BoxAnimation = "DialogueSpeechBubble",
--     --         BoxExitAnimation = "DialogueSpeechBubbleOut",
--     --         NarrativeContextArt = "DialogueBackground_Erebus",
--     --         PostLineRemoveContextArt = true,
--     --         TextColor = Color.DialogueText,
--     --         Text = "Just a spell, it's just another spell. Ten words.... {#Emph}In the name of Hades! Olympus, I accept this message!"
--     --     },
--     --     {
--     --         Cue = "/VO/Apollo_0088",
--     --         PortraitExitWait = 1.25,
--     --         NarrativeContextArt = "DialogueBackground_Olympus",
--     --         PreContentSound = "/Leftovers/Menu Sounds/TextReveal2",
--     --         Text = "Greetings from Olympus and well met, there, sunshine! Look, we can't get to the Titan, but if you truly mean to stop him, then the least I can do is light your way down."
--     --     }
--     -- },
--     ArtemisFirstMeeting = {
--         PlayOnce = true,
--         GameStateRequirements = {{}},
--         {
--             Cue = "/VO/Artemis_0167",
--             PreLineThreadedFunctionName = "PlayEmoteAnimFromSource",
--             PostLineFunctionName = "BoonInteractPresentation",
--             BoxAnimation = "DialogueSpeechBubble",
--             BoxExitAnimation = "DialogueSpeechBubbleOut",
--             NarrativeContextArt = "DialogueBackground_Erebus",
--             PreContentSound = "/Leftovers/Menu Sounds/TextReveal2",
--             PostLineRemoveContextArt = true,
--             TextColor = Color.DialogueText,
--             Text = "It's been too long, Sister. Look at you, on your great hunt! Not ideal circumstances but you've finally begun. Know that the family has your back, surprised as they are about this."
--         },
--         {
--             Cue = "/VO/Melinoe_1179",
--             UsePlayerSource = true,
--             Portrait = "Portrait_Mel_Pleased_01",
--             PreLineAnim = "MelTalkExplaining01",
--             PreLineAnimTarget = "Hero",
--             PostLineAnim = "MelinoeIdleWeaponless",
--             PostLineAnimTarget = "Hero",
--             Text = "No shortage lately of surprises on Olympus or below. It's good to see you, Artemis. But, I must be off. Time's against us, and all that."
--         },
--         {
--             Cue = "/VO/Artemis_0168",
--             PortraitExitWait = 1.25,
--             Text = "{#Emph}Time{#Prev}'s an old fool too busy besieging the mountain of the gods to sense the threat headed his way. Go get him."
--         }
--     }
-- }
