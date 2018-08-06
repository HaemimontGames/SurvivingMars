[*Back to Index*](index.md.html)
# Research

## Overview
The Research [gameplay](LuaFunctionDoc_Gameplay.md.html) mechanic allows the player to discover new technologies (techs) which unlock new buildings and options or provide various passive bonuses to different elements of the colony.

Techs in the Research screen are arranged in 6 horizontal lists called fields. The first five fields represent different scientific branches. The sixth field is for Breakthrough techs which are randomized on each new game.

All techs can be queued for research in the chosen by the player order. The queue has 4 available slots (const.ResearchQueueSize = 4) aside from the currently researched tech which is not considered to be in a queue.

The [Technology](ModItemTechnology.md.html) mod item allows you to define a new technology.

## Unlocking Technologies
At the start of a new game most techs are locked and only 1 or 2 starting techs are revealed as available for research per scientific field. The number can be defined from the [Mission Sponsor](ModItemMissionSponsor.md.html). The player could unlock new techs in two ways:

 - Researching a tech will unlock the next locked in the same field;
 - Some anomalies unlock new techs in some or all fields.
 
There are no required precursors for research - players can skip techs they don't want or need at the moment and select any of the available unlocked ones.

## Research Points & Tech Costs
To research a tech the player needs to generate a certain number of research points (RP). This resource is generated via buildings (Research Lab, Science Institute), anomalies or provided by the Mission Sponsor. Certain techs may add additional sources of RP (for example a Breakthrough turns excess power into RP). The player may also choose to give money in return for RP from the outsourcing option in the research screen.
The RP cost of a tech is determined by its position within its field. The positions of techs change and are shuffled on every new game. Each field has a table of defined research costs. Breakthrough techs are in general twice as expensive as base techs in terms of RP.

Here is an example of how to redefine the research cost of all fields with a Code Effect 

~~~~~~~~~ Lua
function OnApplyEffect(self, city, parent)
	for filed_id, list in sorted_pairs(UICity.tech_field) do
		if TechFields[filed_id].discoverable then
			for _, tech_id in ipairs(list) do
				local status = UICity.tech_status[tech_id]
				status.cost = status.cost + parent.param1
			end
		end
	end
end
~~~~~~~~~

## Breakthroughs
Breakthroughs are special techs that provide a powerful bonus but not all of them are available to the player on each playthrough. At the start of a new game 13 Breakthrough (const.BreakthroughTechsPerGame = 13) techs are chosen from all available and added to the Breakthrough field (all of them are locked).
To unlock the next Breakthrough for research in the field - the player has to analyse a specific anomaly (Breakthrough anomaly). At the start of the game exactly 13 such anomalies are spread throughout the map.
Techs provided by mysteries are also added to the Breakthrough field although they are internally categorized as a separate "Mystery" field.

## Randomization of Techs
Technologies in the 5 scientific fields which are present in each game may be placed on different positions within that field. Each tech has a parameter (Unlock Position) which determines the range of positions within the tech field that a tech can take (for example from 5th to 9th position). However a tech can be positioned outside of this range if another tech bumps it further down the list (for example if there are 6 techs defined from 5 to 9 - one of these will be bumped outside of the range).

The randomization of the 5 scientific tech fields is done at the start of each new game.

## Anomalies
Anomalies are objects that the player finds by exploring the map. They can be analysed using the Explorer rover. Most anomalies interact with the research mechanic in some way:
 - Unlock from 1 to several new base techs for research;
 - Unlock Breakthrough techs for research;
 - Grant 1000, 1500 or 2000 RP when analysed.

 Here is an example of how to define an anomaly and place it on one of the explored sectors on the map on game start
 
~~~~~~~~~ Lua
 function OnMsg.MapSectorsReady()
	local UnbuildableZ = buildUnbuildableZ()
	
	local marker = PlaceObject("SubsurfaceAnomalyMarker")
	marker.sequence = "Static Dust Charge" --in the "Anomalies" file a wide variety of sequences can be found
	marker.sequence_list = "Anomalies"
	marker.tech_action = "complete"

	local city = UICity
	local sector_x = city:Random(1, 10)
	local sector_y = city:Random(1, 10)
	local scanned_sector = g_MapSectors[sector_x][sector_y]
	
	--get a scanned sector
	local sectors = g_MapSectors
	for x = 1, const.SectorCount do
		local sectors = sectors[x]
		for y = 1, const.SectorCount do
			local sector = sectors[y]
			if sector.status == "scanned" then
				scanned_sector = g_MapSectors[sector.col][sector.row]
			end
		end
	end
	
	--find an available position within the scanned sector 
	for i = 1, 50 do
		local minx, miny = scanned_sector.area:minxyz()		
		local maxx, maxy = scanned_sector.area:maxxyz()
		
		local x = city:Random(minx, maxx)
		local y = city:Random(miny, maxy)
		
		local q, r = WorldToHex(x, y)
		local pt = point(x, y)
		if GetBuildableZ(q, r) ~= UnbuildableZ and terrain.IsPassable(pt) then
			marker:SetPos(pt)
			break
		end
	end
	
	--put the anomaly on the map
	if marker:IsValidPos() then
		marker.revealed = true
		marker:PlaceDeposit()
	else
		printf("couldn't find position to place %s deposit", resource)
		DoneObject(marker)
	end
end
~~~~~~~~~

 ## Repeatable Techs
Techs have a "repeatable" property (false by default). If set to true this tech can be researched over and over. Each time the tech is researched, it applies its effects.



(insert footer.md.html here)
<!-- Markdeep: --><style class="fallback">body{visibility:hidden;white-space:pre;font-family:monospace}</style>
<script src="markdeep.min.js"></script>
<script src="https://casual-effects.com/markdeep/latest/markdeep.min.js"></script>
<script>window.alreadyProcessedMarkdeep||(document.body.style.visibility="visible")</script>