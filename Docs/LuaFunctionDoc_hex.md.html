# Documentation for *hex*

## CheckHexSurfaces

Checks whether or not shape_to_test is a subset of shape or, depending on the operation param, shape_to_test is a subset of shape + it's periphery.<br>
<br>

bool ret **CheckHexSurfaces**(shape_to_test, shape, string operation[, point offset, int shape_to_test_rot_override, int shape_rot_override)
shape_to_test
: The building shape to test. An array of 2d points which represent hex axial offsets in the objects local space.

shape
: The building shape to test against.

string operation
: The type of operation. If this is "subset" the check is against shape. Any other string will test for shape and it's periphery.

point offset
: Optional. The origin hex for shape_to_test for the purposes of this test. Should be in hex axial coordinates.

int shape_to_test_rot_override
: Optional. Use to override shape_to_test's rotation. This is a hex direction. Hex direction is a 0-5 value, each representing a hex edge or a hex grid axial direction. To obtain a hex direction from an angle use HexAngleToDirection.

int shape_rot_override
: Optional. Use to override shape's rotation. This is a hex direction. Hex direction is a 0-5 value, each representing a hex edge or a hex grid axial direction. To obtain a hex direction from an angle use HexAngleToDirection.

_returns_ bool ret
: Whether or not shape_to_test is a subset of shape or, depending on the operation param, shape_to_test is a subset of shape + it's periphery.


## GetPeripheralHexShape

Provided an outline building shape and an optional interior building shape, this function will compute the periphery building shape.<br>
<br>

table periphery **GetPeripheralHexShape**(outline[, interior])
outline
: An outline building shape. An array of 2d points which represent hex axial offsets in object's local space.

interior
: An interior building shape. An array of 2d points which represent hex axial offsets in object's local space.

_returns_ table periphery
: The peripherial building shape, all hexes that "touch" the outline + interior shapes and are not included in them. This function can return nil if empty shapes are passed. 


## GetSurfaceHexShapes

This function will generate the outline and interior shapes for an entity in a provided state defined by a given surface.<br>
<br>

table outline, table interior, int hash **GetSurfaceHexShapes**(string entity, int stateId[, int surfaceType])
string entity
: The name of the entity.

int stateId
: Surfaces will be analyzed in this state of the entity.

int surfaceType
: Optional. The surface type that defines the shapes we want to get. If omitted, "HexShape" surfaces will be used.

_returns_ table outline
: The outline shape defined by this entity's surfaces. An array of 2d points which represent hex axial offsets in object's local space.

_returns_ table interior
: The interior shape defined by this entity's surfaces. An array of 2d points which represent hex axial offsets in object's local space. 

_returns_ int hash
: Hash of the outline shape for quick equality tests.


## HexAngleToDirection

If we assume that the directions toward all hex edges from the hex center are enummed 0 - 5, where 0 is the 330 - 30 degree range of the angle growing clockwise from the x+ axis, this method returns the enum value for a given such angle.<br>
<br>

int ret **HexAngleToDirection**(int angle)

int ret **HexAngleToDirection**(obj)
int angle
: Angle in minutes, measured clockwise from the x+ axis.

obj
: Object whos angle will be used.

_returns_ int ret
: Hex direction enum value for provided angle.


## HexAxialDistance

Provides hex axial distance, number of hexes, between two points/hexes/objects. Distance measured is zero based and inclusive, so adjacent hexes would return distance of 1.<br>
<br>

int ret **HexAxialDistance**(int q1, int r1, int q2, int r2)

int ret **HexAxialDistance**(obj1, obj2)

int ret **HexAxialDistance**(point pt, obj)

int ret **HexAxialDistance**(obj, point pt)

int ret **HexAxialDistance**(point pt1, point pt2)
int q1, int r1, int q2, int r2
: Distance will be measured between q1, r1 and q2, r2, which are hex axial coordinates of two hexes.

obj, point pt
: Distance will be measured between the provided obj and point. The point must be in world coordinates.

obj1, obj2
: Distance will be measured between the provided objects.

point pt1, point pt2
: Distance will be measured between the provided points. Both points must be in world coordinates.

_returns_ int ret
: The hex axial distance between the provided params.


## HexClampToAxis

Given a line defined by pt1 and pt2, this method will return a point, ret, where pt1 and ret define a new line which is clamped to the nearest hex axis originating at pt1. If pt1 == ret, then the points provided are already clamped.<br>
<br>

point ret **HexClampToAxis**(point pt1, point pt2)
point pt1
: The origin point of the provided line.

point pt2
: The end point of the provided line.

_returns_ point ret
: A point, where pt1 and ret define a line that lies within one of the three hex axes. The returned point may be equal to pt2 if the line provided is already within an axis.


## HexGetDirection

Provided two axis aligned hexes, returns the hex direction from hex1 to hex2 and the hex axial distance between them.<br>
<br>

int dir, int len **HexGetDirection**(point pt1, point pt2)

int dir, int len **HexGetDirection**(int q1, int r1, int q2, int r2)
point pt1, point pt2
: Points that hold axis aligned hexes in hex axial coordinates in their x and y members for which hex direction and distance will be calculated.

int q1, int r1, int q2, int r2
: The hex axial coordinates of the two hexes for which hex direction and axial distance will be calculated.

_returns_ int dir
: The hex direction from the first provided hex to the second. Hex direction is a 0-5 value, each representing a hex edge or a hex grid axial direction.

_returns_ int len
: The hex axial distance between the provided hexes. This distance is 0 based and inclusive, so adjacent hexes will have a distance of 1.

_returns_ nil
: If non axis aligned hexes are provided the function will return nil.


## HexGetHeight

Returns the distance (cm a.k.a. game units) between any two opposite hex vertices for hexes used by the game hex grids. Hex height is == hex size * 2.<br>
<br>

int ret **HexGetHeight**()
_returns_ int ret
: Distance, in cm, between any two opposite hex vertices.


## HexGetNearestCenter

Provided a point in world coordinates will return the world coordinates of the nearest hex center.<br>
<br>

point ret **HexGetNearestCenter**(point pt)
point pt
: A point in world coordinates.

_returns_ point ret
: Game world coordinates coresponding to the center of the hex in which pt is located.


## HexGetSize

Returns the distance (cm a.k.a. game units) betwheen a hex center and any of it's vertices for hexes in the game grids. Hex size is == hex height / 2.<br>
<br>

int ret **HexGetSize**()
_returns_ int ret
: Distance, in cm, between the center of a hex and any vertex.


## HexGetVerticalSpacing

Vertical spacing is the distance in game units (cm) between two hex centers on adjacent rows on the y axis in any hex grid used by the game.<br>
<br>

int ret **HexGetVerticalSpacing**()
_returns_ int ret
: Distance, in cm, between two hex centers on adjacent rows on the y axis.


## HexGridGet

Generic hex grid getter, will return whatever value is stored in the provided grid at the provided hex axial coordinates.<br>
<br>

int ret **HexGridGet**(grid, int q, int r)

int ret **HexGridGet**(grid, obj)

int ret **HexGridGet**(grid, point pt)
grid
: HSL::Grid compliant grid.

int q, int r
: Hex axial coordinates that will determine where to poll the grid.

obj
: Given an object, it's position will determine where to poll the grid.

point pt
: A point that has hex axial coordinates in it's x and y members that will determine where to poll the grid.

_returns_ int ret
: The value stored in the provided grid at the provided coordinates.


## HexGridSet

Generic hex grid setter, will set the provided value in the provided grid at the provided hex axial coordinates.<br>
<br>

int ret **HexGridSet**(grid, int q, int r, int value)

int ret **HexGridSet**(grid, obj, int value)

int ret **HexGridSet**(grid, point pt, int value)
grid
: HSL::Grid compliant grid.

int q, int r
: Hex axial coordinates that will determine where to set the provided value in the grid.

obj
: Given an object, it's position will determine where to set the provided value in the grid.

point pt
: A point that has hex axial coordinates in it's x and y members that will determine where to set the provided value in the grid.

int value
: The value to set in the grid.

_returns_ int ret
: This function always returns the passed value.


## HexGridShapeSetValue

A hex grid setter that will populate all hexes in the provided grid that match the provided shape and origin hex with the passed value.<br>
<br>

int ret **HexGridShapeSetValue**(grid, obj, shape, int value[, int q, int r])
grid
: HSL::Grid compliant grid.

obj
: An object whos position will determine the origin hex and whos rotation will be applied to the provided shape.

shape
: Bilding shape that defines offsets from the provided origin hex where the provided value will be applied. An array of 2d points which represent hex axial offsets from the hex where the object's position would place it.

int value
: The value to set in the grid.

int q, int r
: Optional. Can be used to override obj's position as the origin hex. In hex axial coordinates.

_returns_ int ret
: The first overriden value or nil if no data was present.


## HexRotate

Provided a hex direction (see HexAngleToDirection) and a hex defined in hex axial coordinates, will return hex axial coordinates for the clockwise rotated hex in that direction around the q == 0 and r == 0 hex.<br>
<br>

int rq, int rr **HexRotate**(int q, int r, int dir)

int rq, int rr **HexRotate**(point pt, int dir)
int q, int r
: Hex axial coordinates of the hex to be rotated.

point pt
: A point which contains the hex axial coordinates of the hex to be rotated in it's x and y members.

int dir
: The hex direction in which to rotate the provided hex. Hex direction is a 0-5 value, each representing a hex edge or a hex grid axial direction. To obtain a hex direction from an angle use HexAngleToDirection.

_returns_ int rq, int rr
: Hex axial coordinates of the clockwise rotated hex, in direction dir, around the (0, 0) hex.


## HexToWorld

Converts hex axial coordinates to game world coordinates.<br>
<br>

int x, int y **HexToWorld**(int q, int r)
int q, int r
: Hex axial coordinates to be converted.

_returns_ int x, int y
: Game world coordinates coresponding to the center of the hex at q, r.


## WorldToHex

Converts game world coordinates to hex axial coordinates.<br>
<br>

int q, int r **WorldToHex**(int x, int y)

int q, int r **WorldToHex**(obj)

int q, int r **WorldToHex**(point pt)
int x, int y
: Game world coordinates to be converted.

obj
: Lua Object whos position will be converted to hex axial coordinates.

point pt
: Point which contains world coordinates in it's x and y members.

_returns_ int q, int r
: Hex axial coordinates.





(insert footer.md.html here)
<!-- Markdeep: --><style class="fallback">body{visibility:hidden;white-space:pre;font-family:monospace}</style>
<script src="markdeep.min.js"></script>
<script src="https://casual-effects.com/markdeep/latest/markdeep.min.js"></script>
<script>window.alreadyProcessedMarkdeep||(document.body.style.visibility="visible")</script>