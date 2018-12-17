-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('Scenario', {
	'name', "Expeditions",
	'file_name', "Expeditions",
	'singleton', false,
}, {
	PlaceObj('ScenarioSequence', {
		'name', "MechanicalBreakdown",
	}, {
		PlaceObj('SA_WaitMessage', {
			'title', T(5858, --[[Scenario Expeditions title]] "Expedition Disaster: Marooned In Space"),
			'text', T(5859, --[[Scenario Expeditions text]] "The RC Explorer is a robust, yet complex machine. Those unacquainted would be astonished when they see the mission reports where dozens of minor breakdowns happened during an expedition and were ignored by the operators. Expedition veterans know that a dead light bulb won't break down the vehicle and they ignore it with a wry smile.\n\nBut when something as serious as the motor system breaks down, it takes bravery not to panic. There is no time for desperation then, our drones have to repair the malfunction before it causes more harm.\n\n<effect>The RC Explorer suffered a malfunction. It has to be repaired by Drones"),
			'voiced_text', T(7184, --[[voice:narrator]] "As with everything made by the hands of man, the Explorer isn’t without its breakdowns and failures."),
			'log_entry', true,
			'text_param1', T(5845, --[[Scenario Expeditions text_param1]] "50"),
		}),
		PlaceObj('SA_Exec', {
			'expression', 'rover:SetCommand("Malfunction")',
		}),
		}),
	})