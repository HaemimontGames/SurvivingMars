[*Back to Index*](index.md.html)
MarsHexGrids
============

Surviving Mars uses hex grids to define the building space in the game, keep track of grid object spatial positioning, adjacency, object connectedness and construction obstruction among other things. For general information on hex grids and helpful insights on how they are represented in code please consult [Red Blob Games' wonderful hex grid reference](https://www.redblobgames.com/grids/hexagons/).

The game loads up three hex grids per map which fall in one of two types - ObjectGrid and SupplyGridConnection.

Building Shapes
-------------

Building shapes are hexagon maps that represents a game object in hex grid space. Building shapes are not rotated, object rotation should be taken into account when applying to grids. Whenever an object is applied to a hex grid, it is applied in all tiles that it's building shape defines. Codewise, shapes are arrays of 2d offsets from the object's origin in hex axial coordinates. For example, a building that takes up one hex would have the following shape:
~~~~~~~~~ Lua
{ point(0, 0) }
~~~~~~~~~
A building that extends one hex to the left from it's origin would have:
~~~~~~~~~ Lua
{ point(-1, 0), point(0, 0) }
~~~~~~~~~
And so on and so forth.

Building shapes are generally pre built on game launch from entity surfaces called "HexShape" and "Build". However, there is no restriction on using any Lua array that conforms to the above specification for a building shape. Further, there is a FallbackOutline in the Lua _G scope that defines a single hex hex shape.

There are several types of building shapes:
  * Outline - "HexShape" - by far the most common type, most buildings only have this one. In most cases it defines the entirety of the building in hex grid space.
  * Interior - "HexShape" - currently only used by domes, defines the inside part of the dome. In those cases the outline shape defines the edge of the dome.
  * Combined - n/a - both outline and interior combined in one shape, or outline if interior is not present.
  * Peripheral - n/a - a shape that fully encompasses the combined shape of the object. Used for positional lookups when seeking adjacent hexes.
  * Build - "Build" - a shape that defines the buildable part of the interior shape.
  * InverseBuild - n/a - defines the unbuildable part of the interior shape.
  * Other - n/a - there are other unnamed shapes for special purposes. For example the excavation part of the Regolith Extractor is defined by a unique shape.

ObjectGrid
----------

The ObjectGrid, also referred to as BuildGrid, is a hex grid spanning the entire buildable area of the map. All buildings in game are marked in this grid and it is heavily utilized for object lookup. This grid is special in the sense that multiple objects may inhabit the same hex. Whether or not that is allowed is left to higher game logic to decide. This grid type has it's own family of methods for applying/removing objects that handle object co-habitation.

The Lua class GridObject implements ObjectGrid handling. Objects of this type will automatically apply their outline shapes in the ObjectGrid at the beginning of their lifetime and remove themselves before they die.

The ObjectGrid can be found in the global Lua variable "ObjectGrid".

SupplyGridConnection
---------------

There are two supply grids in game - one for electricity and one for air and water. Supply grids mimic the ObjectGrid in their dimensions. They do not hold objects but rather define how objects in corresponding ObjectGrid hexes are connected within their respective supply resource grids. Object application in supply grids is again done with the help of building shapes. Each hex in those grids defines the following properties for their corresponding objects:
  * Connection Potentials - defined for each hex edge, determines whether the object in this hex may connect in the given direction. Potential in the corresponding hex in the direction of the given hex is required for actual connection.
  * Connections - defines actual connections per hex edge.
  * Connector - non connectors may connect only to connectors, while connectors may connect to all other objects.
  * Construction - while connections under construction would visually connect with their constructed counterparts, they are considered a different supply grid. Thus resources do not "flow" through connections under construction.
  * Switch - determines whether the object in this hex is a supply grid switch. Switches split and merge supply networks on user demand.
  * Tunnel - determines whether the object in this hex is a tunnel. Tunnels define hex adjacency for hexes that are otherwise non-adjacent.

The Lua classes SupplyGridObject, LifeSupportGridObject and ElectricityGridObject implement supply grid handling.

The connection grids can be found in the global Lua table "SupplyGridConnections". It contains the members "electricity", the electricity connection grid, and "water", the water and air connection grid.



(insert footer.md.html here)
<!-- Markdeep: --><style class="fallback">body{visibility:hidden;white-space:pre;font-family:monospace}</style>
<script src="markdeep.min.js"></script>
<script src="https://casual-effects.com/markdeep/latest/markdeep.min.js"></script>
<script>window.alreadyProcessedMarkdeep||(document.body.style.visibility="visible")</script>