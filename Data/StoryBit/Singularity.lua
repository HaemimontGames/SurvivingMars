-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "Tick_FounderStageDone",
	Effects = {
		PlaceObj('KillColonist', nil),
		PlaceObj('SpawnColonist', {
			'Count', 10,
			'Trait1', "Android",
		}),
	},
	Enabled = true,
	Image = "UI/Messages/Events/05_mysterious_stranger.tga",
	Prerequisites = {
		PlaceObj('PickWorker', {
			'ParentBuildingLabel', "BioroboticsWorkshop",
			'WorkerConditions', {},
		}),
		PlaceObj('CheckTechStatus', {
			'Field', "Breakthroughs",
			'TechId', "ThePositronicBrain",
			'Status', "unknown",
		}),
	},
	ScriptDone = true,
	Text = T(413997903019, --[[StoryBit Singularity Text]] "It turns out that <DisplayName> were secretly looking for a way to transfer their consciousness into an artificial body.\n\nAt least ten attempts were made to do so, ironically with the last attempt causing the death of the Colonist. While they couldn’t transfer their own consciousness into a better body they somehow managed to imprint both intelligence and self-awareness in the artificial hosts.\n\nUnfortunately, <DisplayName> most probably thought their work was taboo and had all of their research destroyed before the attempts were made. We are currently not capable to replicate this result.\n\n<effect>Receive 10 biorobot colonists in the dome. <DisplayName> has died."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(803372150996, --[[StoryBit Singularity Title]] "Vessel"),
	VoicedText = T(427837021415, --[[voice:narrator]] "You have received a report about the demise of one of the workers in our Biorobotic Workshops. "),
	group = "Buildings",
	id = "Singularity",
})

