[*Back to Index*](index.md.html)
Labels
======

Labels, in the context of Surviving Mars, are Lua integer array containers of objects that share some arbitrary trait. The arrays themselves exist in Lua tables with string keys and array values. Support for labels is provided by the LabelContainer Lua class. There are two label containers in the game - the city, or global labels, and domes. Any Lua object may be added to any label container with any label name. If no such label exists, it will be created. The way to do that is by using the AddToLabel method implemented by the LabelContainer class.
~~~~~~~~~ Lua
function Foo:GameInit()
	UICity:AddToLabel("AllFooObjectsLabel", self)
end
~~~~~~~~~

The example above will add any newly created object of the class Foo to the label AllFooObjectsLabel located in the global label container. This label can then be iterated as a normal Lua array if the need arises.
~~~~~~~~~ Lua
function FindFooWhosBarIsFive()
	local container = UICity.labels.AllFooObjectsLabel
	for i = 1, #(container or "") do
		local foo = container[i]
		if foo.bar == 5 then return foo end
	end
end
~~~~~~~~~

Note that the len operation is shielded against nil - #(container or ""). This is because if no Foo object has been created yet the label does not exist. This can be prevented by using the LabelContainer:InitEmptyLabel(label) method, which will init the label as an empty table and prevent the need for further shields.

City Labels
-----------

City labels are defined as such because their container is the game's city object. They are also called global labels because the city object is accessible in the Lua global scope, hence so are its label containers. The following labels may exist during gameplay (I might've missed some due to their numerousness):

 * Consts - The g_Consts table can be found in UICity.labels.Consts[1].
 * Colonist - All colonists.
 * Unemployed - All currently unemployed colonists.
 * Homeless - All currently homeless colonists.
 * DeadColonist - all colonists currently dying.
 * Arrivals - all colonists that just arrived with a rocket. They are removed from this label when they find a dome or die due to no dome around.
 * Drone - All drones.
 * Frozen - All currently frozen objects may be found in this label.
 * OrbitalProbe - All orbital probe objects are in this label.
 * Unit - Contains all drones and rovers.
 * Rover - Contains all rovers.
 * OutsideBuildings - All buildings that are built outside of domes are in this label.
 * InsideBuildings - All buildings that are built inside of domes are in this label.
 * Building - All buildings.
 * BuildingNoDomes - All buildings except domes.
 * Suspended - All buildings currently suspended by dust storms.
 * ResourceExploiter - All mines.
 * ResourceProducer - All factories and farms.
 * DroneControl - All drone controllers - rockets, hubs, and rovers.
 * BaseFarm - All farms.
 * CargoShuttle - All shuttles.
 * ShiftsBuilding - all buildings with shifts.
 * TrainingBuilding - All training buildings.
 * ResearchLab - All research labs.
 * Workplace - All workplaces.
 * AlienDiggers - All dredgers.
 * SupplyRocket - All rockets.
 * MirrorSpheres - All mirror spheres.
 * HostileAttackRovers - All enemy rovers.
 * ConstructionSite - All construction sites.
 * ResourceStockpile - All resource stockpiles.
 
In addition to the ones listed above, every building exists in a label named after its class, a label named after its template name, and a label named after its build menu category. All rovers exists in labels named after their class - RCTransport, RCRover, ExplorerRover. All deposits as well - SurfaceDepositMetals, SurfaceDepositPolymers, TerrainDepositConcrete, SubsurfaceDepositMetals, SubsurfaceDepositWater, SubsurfaceDepositPreciousMetals, and SubsurfaceAnomaly (there's probably more of those). All colonists, in turn, exists in labels named after their gender and specialty.

On top of all that, custom labels per building type may be set in the building editor. All buildings of this type will exist in their custom labels. The OutsideBuildings label is a custom label.

Construction sites are somewhat special as they exist in all labels that their building would end up in and an additional set of labels that end with the "_Construction" suffix. So, for example, an OutsideBuildings construction site would be in both the OutsideBuildings label and OutsideBuildings_Construction label. The main purpose of the second set of labels is to properly modify construction costs of those buildings. Note that them being in both labels means that setting up [modifiers](ModItemGameValue.md.html) in both would affect them twice.

Dome Labels
-----------

Less numerous then their city cousins, these labels exist on per dome basis. So each dome in the game has its own labels filled with its own buildings and nearby objects of interest. As of the time of writing the following dome labels may exist:

 * SupplyGridBuildings - All buildings in the dome that use up or create electricity, water or air.
 * Buildings - All buildings in the dome.
 * Spire - All spires in the dome.
 * ExternalFoodDepots - All nearby food storages.
 * Residence - All buildings capable of housing colonists.
 * ResourceStockpile - All resource stockpiles in the dome.
 * TrainingBuilding - All training buildings in the dome.
 * WaterReclamationSpires - All water reclamation spires in the dome.
 * Workplaces - All workplaces in the given dome.
 * Colonist - All colonists living in the dome.
 * DeadColonist - All dead colonists in the dome.
 * Unemployed - All unemployed colonists in the dome.
 * Homeless - All homeless in the dome.
 * Service - All services in the dome.
 
 When a building provides a specific service, it adds itself in "interest" + ServiceName labels. For example, the playground provides the Playing service, so all playgrounds in a dome can be found in the interestPlaying dome label.
 
 All colonists exist in labels named after their [traits](ModItemTrait.md.html). E.g., all colonists with the [trait](ModItemTrait.md.html) Coward can be found in the Coward dome label.
 
Label Modifiers
---------------

Label [modifiers](ModItemGameValue.md.html) are, in fact, regular [modifiers](ModItemGameValue.md.html), composed of an amount and percent parts which are applied to the base value of a modifiable value along with all other [modifiers](ModItemGameValue.md.html) affecting it. The amount part is applied as is, while the percent part is a fraction of the base, where 10 means 10% and so on. Label [modifiers](ModItemGameValue.md.html) work together with regular [modifiers](ModItemGameValue.md.html) as expected - they will be applied together. Label [modifiers](ModItemGameValue.md.html) affect all objects in a label array and can be applied through the LabelContainer interface. So, for instance, if you'd like to boost the performance of all buildings in a dome you'd need to do this:

~~~~~~~~~ Lua
	local m = LabelModifier:new{
		container = self.parent_dome, --affected label container
		label = "Buildings", --affected label
		id =  "MyMod", --modifier id, can be any value that can be a Lua table key
		prop = "performance", --the affected modifiable value
		amount = 10, --flat amount to add/rem
		percent = 10, --percent amount to add/rem,
		display_text = T{"This text is displayed on the affected prop mouse over when the modifier is active."},
	}
	--add
	my_dome:SetLabelModifier(m.label, m.id, m)
~~~~~~~~~

Calling SetLabelModifier with an id but without an actual modifier will remove the modifier, like so:

~~~~~~~~~ Lua
	--remove
	my_dome:SetLabelModifier(m.label, m.id)
~~~~~~~~~

Once added/removed, all objects in the label will be immediately affected. All objects that are added to the label afterwards will automatically receive the modification as well, while objects removed from it will have the modification removed.

(insert footer.md.html here)
<!-- Markdeep: --><style class="fallback">body{visibility:hidden;white-space:pre;font-family:monospace}</style>
<script src="markdeep.min.js"></script>
<script src="https://casual-effects.com/markdeep/latest/markdeep.min.js"></script>
<script>window.alreadyProcessedMarkdeep||(document.body.style.visibility="visible")</script>