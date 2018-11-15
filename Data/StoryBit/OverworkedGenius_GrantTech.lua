-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Comment = "should check if tech is not researched",
	Delay = 7200000,
	Effects = {
		PlaceObj('DiscoverTech', {
			'Field', "Physics",
			'Tech', "MicroFusion",
		}),
		PlaceObj('RewardTechBoost', {
			'Field', "Physics",
			'Research', "MicroFusion",
			'Amount', 50,
		}),
	},
	Prerequisites = {
		PlaceObj('CheckTechStatus', {
			'Field', "Physics",
			'TechId', "MicroFusion",
			'Negate', true,
		}),
	},
	ScriptDone = true,
	Text = T{574513689394, --[[StoryBit OverworkedGenius_GrantTech Text]] "Short on breath and visibly excited, <DisplayName> explains their radical idea about an entirely new way to generate the power required by the Colony's growing need. The preliminary math checks out, but their is much research to be done before the concept is put in practice.\n\nYou remember that the Genius <DisplayName> had your special dispensation to stay out of the colony's work force. Perhaps this was exactly what they needed to come up with this brilliant idea.\n\n<effect>Micro Fusion tech has been unlocked and its cost has been reduced by 50%."},
	TextReadyForValidation = true,
	TextsDone = true,
	VoicedText = T{494786709599, --[[voice:narrator]] 'A colonist bursts into your office. "Eureka! I\'ve got it!"'},
	group = "Colonists",
	id = "OverworkedGenius_GrantTech",
	PlaceObj('StoryBitParamNumber', {
		'Name', "techboost",
		'Value', 50,
	}),
})

