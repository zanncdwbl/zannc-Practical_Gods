zanncdwbl_Practical_Gods.GUIFlameGlow = { "Name", "InheritFrom", "Color" }
zanncdwbl_Practical_Gods.GUISymbol = { "Name", "InheritFrom", "ChildAnimation", "Scale", "CreateAnimations", "Color" }
zanncdwbl_Practical_Gods.GUIBackingB = { "Name", "InheritFrom", "ChildAnimation", "Scale", "Color" }
zanncdwbl_Practical_Gods.GUIBackingC = { "Name", "InheritFrom", "ChildAnimation", "Color" }
zanncdwbl_Practical_Gods.GUIIcon = { "Name", "InheritFrom", "EndFrame", "StartFrame", "FilePath" }
--
-- GUiAnimations.sjson
zanncdwbl_Practical_Gods.BoonSymbolGlow_Artemis = sjson.to_object({
	Name = "BoonSymbolGlow_Artemis",
	InheritFrom = "BoonSymbolGlow",
	Color = {
		Red = 1.000,
		Green = 0.329,
		Blue = 0.173,
	},
}, zanncdwbl_Practical_Gods.GUIFlameGlow)

zanncdwbl_Practical_Gods.BoonSymbolFlare_Artemis = sjson.to_object({
	Name = "BoonSymbolFlare_Artemis",
	InheritFrom = "BoonSymbolFlare",
	Color = {
		Red = 1.000,
		Green = 0.235,
		Blue = 0.000,
	},
}, zanncdwbl_Practical_Gods.GUIFlameGlow)

zanncdwbl_Practical_Gods.BoonSymbolArtemis = sjson.to_object({
	Name = "BoonSymbolArtemis",
	InheritFrom = "BoonBackingA",
	ChildAnimation = "BoonBackingB_Artemis",
	Scale = 0.5,
	CreateAnimations = { {
		Name = "BoonSymbolGlow_Artemis",
	}, {
		Name = "BoonSymbolFlare_Artemis",
	} },
	Color = {
		Red = 1.000,
		Green = 0.800,
		Blue = 0.000,
	},
}, zanncdwbl_Practical_Gods.GUISymbol)

zanncdwbl_Practical_Gods.BoonBackingB_Artemis = sjson.to_object({
	Name = "BoonBackingB_Artemis",
	InheritFrom = "BoonBackingB",
	ChildAnimation = "BoonBackingC_Artemis",
	Scale = 0.5,
	Color = {
		Red = 1.000,
		Green = 0.953,
		Blue = 0.631,
	},
}, zanncdwbl_Practical_Gods.GUIBackingB)

zanncdwbl_Practical_Gods.BoonBackingC_Artemis = sjson.to_object({
	Name = "BoonBackingC_Artemis",
	InheritFrom = "BoonBackingC",
	ChildAnimation = "BoonSymbolArtemisIcon",
	Color = {
		Red = 1.000,
		Green = 0.392,
		Blue = 0.749,
	},
}, zanncdwbl_Practical_Gods.GUIBackingC)

zanncdwbl_Practical_Gods.BoonSymbolArtemisIcon = sjson.to_object({
	Name = "BoonSymbolArtemisIcon",
	InheritFrom = "BoonSymbolBase",
	EndFrame = 1,
	StartFrame = 1,
	FilePath = "GUI\\Screens\\BoonSelectSymbols\\Artemis2",
}, zanncdwbl_Practical_Gods.GUIIcon)

-- GUI Hook
table.insert(data.Animations, zanncdwbl_Practical_Gods.BoonSymbolGlow_Artemis)
table.insert(data.Animations, zanncdwbl_Practical_Gods.BoonSymbolFlare_Artemis)
table.insert(data.Animations, zanncdwbl_Practical_Gods.BoonSymbolArtemis)
table.insert(data.Animations, zanncdwbl_Practical_Gods.BoonBackingB_Artemis)
-- Game already has these 2
table.insert(data.Animations, zanncdwbl_Practical_Gods.BoonBackingC_Artemis)
table.insert(data.Animations, zanncdwbl_Practical_Gods.BoonSymbolArtemisIcon)

-- Stat Line Stuff - TraitTextFile
table.insert(data.Texts, zanncdwbl_Practical_Gods.ArtemisWeaponBoon_Text)
table.insert(data.Texts, zanncdwbl_Practical_Gods.ArtemisSpecialBoon_Text)

zanncdwbl_Practical_Gods.ArtemisWeaponBoon_Text = sjson.to_object({
	Id = "AttackBonusStatDisplay1",
	InheritFrom = "BaseStatLine",
	DisplayName = "{!Icons.Bullet}{#PropertyFormat}Attack Damage:",
	Description = "{#UpgradeFormat}{$TooltipData.ExtractData.TooltipDamage:F}",
}, zanncdwbl_Practical_Gods.Order)

zanncdwbl_Practical_Gods.ArtemisSpecialBoon_Text = sjson.to_object({
	Id = "SpecialBonusStatDisplay1",
	InheritFrom = "BaseStatLine",
	DisplayName = "{!Icons.Bullet}{#PropertyFormat}Special Damage:",
	Description = "{#UpgradeFormat}{$TooltipData.ExtractData.TooltipDamage:F}",
}, zanncdwbl_Practical_Gods.Order)

-- Alternative SJSON hook used while trying to troubleshoot artemis arrows being broken
sjson.hook(zanncdwbl_Practical_Gods.ProjectileDataFile, function(data)
	local order = {}
	local projectile = {}
	for _, v in ipairs(data.Projectiles) do
		if v.Name == "ArtemisSupportingFire" then
			projectile = game.DeepCopyTable(v)
			order = sjson.get_order(v)
		end
	end

	projectile.Name = "ArtemisSupportingFireSprint"
	local projectileEntry = sjson.to_object(projectile, order)

	table.insert(data.Projectiles, projectileEntry)
end)

-- Jowday Messing arround with other projectiles
sjson.hook(zanncdwbl_Practical_Gods.ProjectileDataFile, function(data)
	local order = {}
	local projectile = {}
	for _, v in ipairs(data.Projectiles) do
		if v.Name == "ArtemisSupportingFire" then
			--v.Thing.Graphic = "ArtemisRangedArrowheadLegendary"
			projectile = game.DeepCopyTable(v)
			order = sjson.get_order(v)
		end
	end

	projectile.Name = "ArtemisSupportingFireSprint"
	projectile.Thing.Graphic = "HecatePolymorphProjectile"
	projectile.Thing.Color = { Red = 0.78, Green = 1.0, Blue = 0.11, Opacity = 1.0 }
	projectile.Thing.Scale = 0.33
	local projectileEntry = sjson.to_object(projectile, order)

	table.insert(data.Projectiles, projectileEntry)
	--table.insert(data.Projectiles, zanncdwbl_Practical_Gods.ArtemisSupportingFireSprint)
end)

-- Non-working dart copy, looked cool tho
zanncdwbl_Practical_Gods.ArtemisDart = sjson.to_object({
	Name = "ArtemisDart",
	ChildAnimation = "DartTrapWeaponGlow",
	FilePath = "Particles\\particle_cone_spike",
	GroupName = "FX_Standing_Add",
	VisualFx = "DartTrapTrail",
	AddColor = true,
	EndFrame = 1,
	NumFrames = 1,
	StartFrame = 1,
	OriginX = 63.0,
	OriginY = 10.0,
	Scale = 1.66,
	Ambient = 0.0,
	VisualFxDistanceMax = 90.0,
	VisualFxDistanceMin = 80.0,
	Color = { Red = 0.78, Green = 1.0, Blue = 0.11 },
}, { "Name", "ChildAnimation", "FilePath", "GroupName", "VisualFx", "AddColor", "EndFrame", "NumFrames", "StartFrame", "OriginX", "OriginY", "Scale", "Ambient", "VisualFxDistanceMax", "VisualFxDistanceMin", "Color" })

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
