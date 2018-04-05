# Documentation for *SupplyGrid*

## SupplyGridAddConnection

Builds an actual connection in the connection grid between the provided hexes.<br>
<br>

bool success **SupplyGridAddConnection**(grid, point pt1, point pt2)
grid
: HSL::Grid compliant grid. This should be a SupplyGridConnection type of grid, SupplyGridConnections.water or SupplyGridConnections.electricity.

point pt1, point pt2
: Points in hex axial coordinates that determine the two adjacent hexes that should be connected.

_returns_ bool success
: True if the connection was built, false if the hexes are not adjacent and the connection failed.


## SupplyGridApplyBuilding

Supply grid setter that fills up all hexes fitting shape, offseted by obj's position and rotated by obj's rotation, with the connection potentials provided.<br>
<br>

table potential_connections **SupplyGridApplyBuilding**(grid, obj, shape, connections[, bool skip, bool is_construction])
grid
: HSL::Grid compliant grid. This should be a SupplyGridConnection type of grid, SupplyGridConnections.water or SupplyGridConnections.electricity.

obj
: An object whos position will determine the origin hex and whos rotation will be applied to the provided shape.

shape
: Bilding shape, an array of 2d points which represent hex axial offsets from the hex where obj's position would place it.

connection
: An array containing connection potentials for each hex of the provided shape. Should be same size as shape. Connection potentials determine in which direction, per hex, the applied obj can connect. Connection potentials are defined by the 8th through 13th bits, where 1 is potential and 0 is not. Large buildings (larger then one hex) have their internal hexes connected to eachother, that is represented in the connection array passed.

bool skip
: Optional. If passed nothing will be set on the grid, only potential neighbours will be returned.

bool is_construction
: Optional. If passed the construction flag will be up for all affected hexes.

_returns_ table potential_connections
: A Lua table that contains all potential connections in the grid for the applied shape and connection combo. Each two consecutive elements define the two hexes of the potential connection in hex axial coordinates.

_returns_ nil
: The function will return nil if no potential connections are found.


## SupplyGridExpand

Traverses an entire supply grid through it's connected hexes to determine it's integrity. Returns all unconnected potential connections for this supply grid. Results should be analyzed against a Lua SupplyGrid object to make sense.<br>
<br>

table potentials **SupplyGridExpand**(grid, table visited, starting_obj, starting_obj_shape[, int required_flags, int required_not_flags, bool get_potentials])
grid
: HSL::Grid compliant grid. This should be a SupplyGridConnection type of grid, SupplyGridConnections.water or SupplyGridConnections.electricity.

table visited
: A single bit hex grid with the dimentions of grid. Each hex reached from starting_obj through grid connections will be marked as 1.

starting_obj
: Where to start the flood fill. Starting_obj's rotation and position will be used to setup starting_obj_shape.

starting_obj_shape
: Building shape, an array of 2d points which represent hex axial offsets from the hex where obj's position would place it with no rotation.

required_flags
: Hexes without these flags cannot be visited this pass.

required_not_flags
: Hexes with these flags cannot be visisted this pass.

bool get_potentials
: Optional. If false, potential connections will not be analyzed and nothing will be returned.

_returns_ table potentials
: All possible unconnected potential connections for this supply grid.

_returns_ nil
: The function will return nil if no potentials are found or if get_potentials is false.


## SupplyGridRemoveBuilding

Supply grid setter that removes all data from the hex grid in the provided shape oriented by the obj's properties. Existing connections with the removed shape are destroyed. A table of all destroyed connections is returned.<br>
<br>

table destroyed_connections **SupplyGridRemoveBuilding**(grid, obj, shape[, skip])
grid
: HSL::Grid compliant grid. This should be a SupplyGridConnection type of grid, SupplyGridConnections.water or SupplyGridConnections.electricity.

obj
: An object whos position will determine the origin hex and whos rotation will be applied to the provided shape.

shape
: Building shape, an array of 2d points which represent hex axial offsets from the hex where obj's position would place it.

bool skip
: Optional. If passed no action will be taken, but rather only connections returned.

_returns_ table destroyed_connections
: A Lua table that contains all destroyed connections by the removal. Each two consecutive elements define the two hexes of a destroyed connection in hex axial coordinates.

_returns_ nil
: The function will return nil if no connections are destroyed by the removal.





(insert footer.md.html here)
<!-- Markdeep: --><style class="fallback">body{visibility:hidden;white-space:pre;font-family:monospace}</style>
<script src="markdeep.min.js"></script>
<script src="https://casual-effects.com/markdeep/latest/markdeep.min.js"></script>
<script>window.alreadyProcessedMarkdeep||(document.body.style.visibility="visible")</script>