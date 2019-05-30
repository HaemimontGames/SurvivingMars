Map Enumeration
===============

The Haemimont Games Engine keeps 3D coordinates of objects, but due to the focus on strategy and outdoors games the underlying map structures are optimized for 2D queries in the XY plane - XY being the plane of the terrain, and Z being "up". The family of map query functions accept a 2D area and enumerate all objects with XY coordinates falling within that area.

If you need 3D enumeration, you'll need to perform an additional pass over the objects.

Only objects of classes inheriting from *CObject* exist as part of the C++ map structure, and thus can be returned by the enumeration functions.

Map Enumeration Functions
-------------------------

All map enumeration functions take a list of *query* parameters specified in a predefined order and separated by comma. Each parameter "narrows down" the list of objects enumerated, e.g. if you set area property to "map", all objects on the map will be enumerated; if you don't specify a class, objects of all classes will be enumerated, etc.

Note that while map enumeration is in general very fast, creating a list of objects to return to Lua is less so, so try to always use the most specific function doing as much as possible of the job in C++ - e.g. if you only need the number of objects satisfying certain criteria, use *MapCount(...)*, instead of using *MapGet(...)* and taking the size of the returned array in Lua.

For enumerating objects in collections and performing flag related actions there is a list of more efficient, dedicated to the purpose functions, which do the job faster than the general case *MapGet(...)* and *MapForEach(...)* functions(see sections below). 

list = MapGet(*query*, ...)
:	Returns a Lua table with a list of objects which match *query*. Any additional parameters are passed to the function specified in *query* parameters, if supplied(see section below).

count = MapCount(*query*, ...)
:	Returns the number of objects which match *query*. Any additional parameters are passed to the function specified in *query* parameters. *MapCount(...)* is equivalent to *#MapGet(...)*, but potentially more efficient.

count = MapForEach(*query*, ...)
:	Runs the function specified in *query* for all objects that match *query*. Any additional parameters are passed to the function. Returns the number of objects which has been processed by the function.

obj, eval = MapFindMin(*query*, ...)
:	Of all objects that match *query*, returns the one for which the function specified in *query* parameters returns the lowest number, and the number itself. Any additional parameters are passed to the function.

obj, distance = MapFindNearest(pt, *query*, ...)
:	Of all objects that match *query*, returns the one nearest to the point or object *pt*, and the distance (or nil, 0 if no objects match *query*). Any additional parameters are passed to the function.

obj = MapFindShortestPath(pt, *query*, ...)
:	*query* needs to specify a circular area by center and radius. Of all objects that match *query*, returns the object which is closest by pathfinding distance to the point or object *pt* (or to the center of the area, if *pt* is false). Any additional parameters are passed to the function specified in *query* parameters.

filtered_list = MapFilter(*list*, *query*, ...)
:	Does not actually do any map enumeration, but filters the objects in the array *list* according to the same rules used in *MapGet(...)* query function.

count = MapDelete(*query*, ...)
:	Deletes all objects that match the criteria specified in *query*. Returns the number of objects which has been deleted.

Enum Set/Clear Flag Functions 
-------------------------

The flag functions are used to efficiently set or clear specified flag on each object that matches the *query* criteria. Each function, except *MapDelete(...)*, takes *flag* number as first argument, followed by the usual *query* list:  

count = MapSetEnumFlags(flag, *query*, ...)
:	Sets specified enum flag for every object that matches *query*. Any additional parameters are passed to the function provided in *query* parameters, if supplied. Returns the number of objects which has been modified.

count = MapClearEnumFlags(flag, *query*, ...)
:	Clears specified enum flag for every object that matches *query*.Any additional parameters are passed to the function provided in *query* parameters, if supplied. Returns the number of objects which has been modified.

count = MapSetGameFlags(flag, *query*, ...)
:	Sets specified game flag for every object that matches *query*. Any additional parameters are passed to the function provided in *query* parameters, if supplied. Returns the number of objects which has been modified.

count = MapClearGameFlags(flag, *query*, ...)
:	Clears specified game flag for every object that matches *query*. Any additional parameters are passed to the function provided in *query* parameters, if supplied. Returns the number of objects which has been modified.

count = MapSetHierarchyEnumFlags(flag, *query*, ...)
:	Sets specified hierarchy flag for every object that matches *query*. Any additional parameters are passed to the function provided in *query* parameters, if supplied. Returns the number of objects which has been modified.

count = MapClearHierarchyEnumFlags(flag, *query*, ...)
:	Clears specified hierarchy flag for every object that matches *query*. Any additional parameters are passed to the function provided in *query* parameters, if supplied. Returns the number of objects which has been modified.


Enum Collection Functions
-------------------------

Enum collection functions are similar to the map enum functions except they deal specifically with collections. First two function arguements, *collection* and *recursive*, specify which objects will be enumerated. The *collection* arguement could be either of type number or boolean:
if *collection* is a number, then it is considered as collection index; if boolean, then it specifies whether to enum objects which are part of collection or not. *recursive* arguement is set to true when object's subcollections need to be enumerated as well.

list = MapGetCollection(collection, recursive, *query*, ...)
:	Returns a Lua table with a list of objects that match *query* and are either in the specified collection or with "collected" property set.

count = MapForEachInCollection(collection, recursive, *query*, ...)
:	Runs the function supplied in *query* for all objects that match the criteria and are either in the specified collection or with "collected" property set. Returns the number of objects which has been processed by the function.

count = MapDeleteCollection(collection, recursive, *query*, ...)
:	Deletes all objects that match *query* and are either in the specified collection or with "collected" property set. Returns the number of deleted objects. 

count = MapCountCollection(collection, recursive, *query*, ...)
:	Counts objects that match *query* and are either in the specified collection or with "collected" property set.

count = MapSetCollectionIndex(collection_index, *query*, ...)
:	Sets specified collection index for every object that matches *query*. Any additional parameters are passed to the function specified in *query* parameters, if supplied. Returns the number of objects which has been modified.


Query Parameters
----------------------

The *query* supplied to the enumeration function contains a list of parameters which will be used to enumerated objects. All parameters in the list should be provided in a predifined order. If parameter is set to nil, false or skipped then it will not be considered during the enumeration process.
All of the *query* parameters, except for *area*, are optional. 

### Area

The enumerated area of the map can be specified in one of the following ways.
 
Note that *area* parameter is *not* optional and must be provided. All parameters that represent a point can also be passed as objects, in which case the object positions are used.

object or point, radius 
:	If the object provided is GameObject or Point, the function will enumerate all objects within the given *radius* around *point*.

object or point, "hex" radius 	
:	If the object provided is GameObject or Point, the function will enumerate all objects within the given *radius* in a hex around *point*.

object1 or point1, object2 or point2, radius
:	Enumerates all objects in a 2D capsule, i.e. at a distance of less than or equal to the given *radius* from segment defined by *point1* and *point2*.

box
:	If the object specified is a Box, the function will enumerate all objects in a 2D box. 

"detached"
:	Enumerates all objects that are in the world, but logically at no valid position.

"outsiders"
:	Enumerates all objects that are outside the boundaries of the map, but still on valid positions.
  
"map"
:	Entire map is enumerated.

*true*
:	Entire realm is enumerated.
  
### Object Circles

"object_circles", *extension_radius*
:	Extends the original area by the *extension_radius* and enumerates only these objects which radius intersects with the original area. Note: if the original area is a rectangle, the extended area will be of an extended rectangle, not a circle. 
  
### Attached

"attached", *true/false*
:	**True** means only attached objects are enumerated; **false** means only non-attached objects are enumerated. Leave out to enumerate both attached and unattached objects.
  
### Classes

If no classes are specified, objects of all classes are enumerated. Only objects inheriting from one of the classes provided as a comma-separated list of class names or table will be enumerated:

{"*class1*", "*class2*", "*class3*"}
:	Comma-separated list of class names in table.

"*class1*", "*class2*", "*class3*" 
:	Comma-separated list of class names.

### Flags

To check an object for just one of the flag properties, set the flag to appropriate numeric value and the rest of the flags to nil/false. If all flag parameters are skipped, the object's flags are not considered.
The flags are set in the following order:

enum_flags_all
:	Only objects having all of the specified enum flags set are enumerated.

enum_flags_any
:	Only objects having at least one of the specified enum flags set are enumerated.
  
game_flags_all
:	Only objects having all of the specified game flags set are enumerated.
  
game_flags_any
:	Only objects having at least one of the specified game flags set are enumerated.
  
class_flags_all
:	Only objects having all of the specified class flags set are enumerated.
  
class_flags_any
:	Only objects having at least one of the specified class flags set are enumerated.

### Random

"rand", random_percent, random_seed
:	Only enumerates a certain random % of the objects that would be enumerated otherwise. Use *seed* for seeding the random generator.

### Functions

All of the enumeration functions accept a *query* list which may contain a parameter - function that is run for each enumerated object. These functions can be Lua closures defined in-place, Lua functions defined elsewhere, or even C functions, as long as they accept the appropriate parameters.

function(obj, ...) end
:	Accepted by *MapForEach* and *MapForEachInCollection*. Called once for each object as a first parameter and any additional parameters supplied to *MapForEach* and *MapForEachInCollection*. If it returns **"break"**, the enumeration is interrupted.

:	Accepted by *MapGet*, *MapFilter*, *MapCount*, *MapFindNearest*, *MapFindShortestPath*, *MapGetCollection*, *MapCountCollection*. Called once for each object as a first parameter and any additional parameters supplied to the enumeration function after that. Must return **true** if the object should be included in the enumeration, **false** otherwise, or **"break"** if the enumeration should stop.

:	Accepted by *MapFindMin*. Called once for each object as a first parameter and any additional parameters supplied to *MapFindMin* after that. Must return a number - the object for which this number is the lowest, is returned from *MapFindMin*. If it returns **"break"**, the enumeration is interrupted.
  

## Sample Code

Gather all objects of class Tree (and descendants) 100 m around the cursor:
~~~~~~~~~~ Lua
local trees = MapGet( GetTerrainCursor(), 100*guim, "Tree" )
~~~~~~~~~~

Make all trees invisible:
~~~~~~~~~~ Lua
MapForEach ( "map", "Tree", function(obj) obj:ClearEnumFlags(const.efVisible) end )
~~~~~~~~~~

More efficient version: 
~~~~~~~~~~ Lua
MapClearEnumFlags(const.efVisible, "map" , "Tree" )
~~~~~~~~~~

Delete all non-attached objects of class Resource on the map:
~~~~~~~~~~ Lua
MapDelete("map", "attached", false, "Resource")
~~~~~~~~~~

Calculate total amount of resources of a particular kind in a circle around a building:
~~~~~~~~~~ Lua
function GetTotalResourcesAroundBuilding(building, radius, resource_member)
  local total = 0
  MapForEach (building, radius, "ResourceDeposit ",
    function(obj) 
      total = total + obj[resource_member]
  end )
  return total
end
~~~~~~~~~~



(insert footer.md.html here)
<!-- Markdeep: --><style class="fallback">body{visibility:hidden;white-space:pre;font-family:monospace}</style>
<script src="markdeep.min.js"></script>
<script src="https://casual-effects.com/markdeep/latest/markdeep.min.js"></script>
<script>window.alreadyProcessedMarkdeep||(document.body.style.visibility="visible")</script>