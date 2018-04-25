CObject
=======

CObjects are objects, accessible to Lua, which have a counterpart in the C++ side of the engine.
They provide the following services and features:

  * they have a position, size, scale, orientation in the game world;
  * they can be rendered as part of the world;
  * they can play sounds;
  * they can affect the world via their collision geometry;
  * they can be attached to other CObjects, or have other CObjects attached to them.


Some Lua objects have no CObject counterpart - for example, windows in the UI system, Techs in the Research system of the game, or game value modifiers.
On the other hand, some CObjects exist only on the C++ side and have no permanent Lua counterpart - these are usually lightweight decorative objects of no interest to the game simulation, like rocks. Such objects can can be inspected by Lua - temporary Lua objects are created for this purpose and garbage is collected like all other Lua values when they are no longer referenced.

Most interesting objects in the game, like units and buildings, have both a Lua and a CObject.

Objects in the game which only have a permanent representation on the C++ side and only have temporary Lua counterparts inherit the CObject base class. For example, when a query enumerates all rocks in a part of the map, the result is a list of CObject instances, some of them potentially created just for the purposes of this query; if you lose the reference to them and perform the query again, the same underlying object on the C++ side will get recreated as a new CObject instance.

Classes in Lua representing objects which have representations both on the C++ and the Lua side - for example, an object such as a building which needs to be rendered as part of the game world, but also needs to have properties as members of a Lua class - inherit from the Object base class (which in turn inherits from CObject).

CObject Flags
-------------

All CObjects have three sets of flags associated with them: class flags, game flags and enum flags.
They are integers (32-bit for the class flags and enum flags, 64-bit for the game flags) holding one bit per flag, which can be queried and set individually or in bunches.

The *class flags* are read-only and shared between all instances of a class; they belong to the class, not to the instance.

The *game flags* are per-instance and can be freely set or cleared to modify the in-game behaviour of the CObject.

The *enum flags* are also per-instance, and can be freely manipulated; their additional benefit over game flags is that the data structures used in the game engine make it possible to find very quickly CObjects having a particular combination of enum flags in a particular area of the map. For example, the renderer uses the enum flag efVisible to quickly gather the visible objects on the map for rendering - every frame.

The following functions can be used to check and change flags:

obj:GetGameFlags(mask)
:	Returns the game flags of the object, ANDed with the mask. To check for a specific flag, use obj:GetGameFlags(flag) == flag. Remember that 0 is *true* in Lua, so *if obj:GetGameFlags(flag) then ... end* will always test true.

obj:SetGameFlags(flags), obj:SetHierarchyGameFlags(flags)
:	Sets one or several game flags in the object by ORing them with the object's game flags; the *hierarchy* version sets the same game flags recursively to all the objects' attaches.

obj:ClearGameFlags(flags), obj:ClearHierarchyGameFlags(flags)
:	Clears one or several game flags in the object by ANDing their complement with the object's game flags; the *hierarchy* version sets the same game flags recursively to all the objects' attaches.

obj:GetEnumFlags(mask)
:	Returns the enum flags of the object, ANDed with the mask. To check for a specific flag, use obj:GetEnumFlags(flag) == flag. Remember that 0 is *true* in Lua, so *if obj:GetEnumFlags(flag) then ... end* will always test true.

obj:SetEnumFlags(flags), obj:SetHierarchyEnumFlags(flags)
:	Sets one or several enum flags in the object by ORing them with the object's enum flags; the *hierarchy* version sets the same enum flags recursively to all the objects' attaches.

obj:ClearEnumFlags(flags), obj:ClearHierarchyEnumFlags(flags)
:	Clears one or several enum flags in the object by ANDing their complement with the object's enum flags; the *hierarchy* version sets the same enum flags recursively to all the objects' attaches.

obj:GetClassFlags(flags)
:	Returns the class flags of the object. Note that there is no corresponding Set- function, as class flags are immutable (they belong to the class, not to the object).

Anything that can be done with flags can be done with boolean Lua members of the corresponding Lua-side objects. The advantage of flags is compact storage on the C++ side, where they can be cheaply accessed by C++ code, and accelerated queries for enum flags. There is no mechanism for mods to define their own flags, although mod authors are welcome to use the existing ones. The unassigned numeric values are reserved for future use - using them in your mods guarantees things will break when we decide to use them ourselves on the C++ side at some point in the future.

Here's a list of some of the existing class, game and enum flags with their meanings. The exact numeric values of flags may change - don't count on them, and always use flags via their names shown below.

### Class Flags

const.cfConstructible
:	Set for objects for which the special construction visualization is applied.

const.cfLuaObject
:	Set for CObject which have a corresponding Lua object.

const.cfDecal
:	Set for decals - objects rendered on the surface of other objects or the terrain, such as the mission logos on buildings, or the "streets" on the Dome's floor.

### Enum Flags

const.efVisible
:	Set for visible objects; clear to make object invisible.

const.efBuilding
:	Set for descendants of the Building class.

const.efUnit
:	Set for descendants of the Unit class - Colonists and Drones.

const.efBakedTerrainDecal
:	Set for decals rendered in the terrain texture (they don't apply to objects, only to terrain); only seen from a moderate distance.

const.efBakedTerrainDecalLarge
:	Set for decals rendered in the terrain texture even when it is viewed from a large distance.

const.efCollision
:	If set, the object's collision surfaces are used for collision queries and as blockers for pathfinding; if cleared, the object is transparent for both collision and pathfinding.


### Game Flags

const.gofAlwaysRenderable
:	Set for objects which are rendered even when they are outside the camera frustum.

const.gofNightLightsEnabled
:	Set for objects for which the night lighting can be turned on, e.g. operating buildings; clear for e.g. demolished buildings.

const.gofRealTimeAnim
:	Set for objects which are animated in real time (not game time), i.e. they keep animating when the game is paused.

const.gofSyncState
:	If set, the object automatically plays the same animation as its attach parent (see CObject Attach Hierarchy section).

const.gofOnGround
:	If set, the object's Z coordinate is ignored, and it is considered to be directly on the terrain surface.

const.gofTerrainDistortedMesh
:	If set, the vertices of the object are deformed to follow the terrain (e.g. used for cables).

const.gofZClip
:	If set, the object is rendered partially, cut off with a plane perpendicular to the Z axis in object (model) space; use **obj:SetZClip(distance)** to set where the plane is.

const.gofFrameAnimatedTexture
:	If set, the object's texture is treated as a matrix of separate frames, like a spritesheet in a 2D game. Use **obj:SetFrameAnimationSpeed(scale)** and **obj:SetFrameAnimationForcedFrame(n)** to control how it is played.

const.gofMirrored
:	If set, the object is flipped (mirrored) along the X axis.

const.gofDeposition
:	If set, the object is rendered with a deposition material overlaid on its normal texture.

const.gofIsBoneAttach
:	Set for objects which are attached to an animated spot (see CObject Attach Hierarchy section).

const.gofSpecialOrientMode
:	If set, the object is rendered with a special orientation mode, taken from the orient_mode of the object's class. It must be one of the following strings:
  * "facing" - the object is always facing the camera;
  * "facing_vertical" - the object is facing the camera, but constrained to only turn around the vertical axis;
  * "terrain" - the object's vertical axis is set to the normal of the terrain at that point;
  * "terrain_large" - similar to "terrain", but the terrain normal is taken in a larger area around the point;
  * "velocity" - the X axis of the object is set to face its movement vector.

const.gofNoDepthTest
:	If set, the object is rendered without a depth test (Z-test).

const.gofUIAttach
:	Set for objects which are not logically part of their attach parent, but rather UI decorations like warning signs, Colonist icons, selection particles, etc.

CObjects in the World
---------------------

The world where all CObjects live has an integer coordinate system; the smallest unit in - the precision with which game object positions are specified - is called a game unit. The constant *guim* in Lua (abbreviation from Game Units In Meter) should be used to convert between meters and game units where necessary, by multiplying meters by guim to get game units, or dividing game units per guim to get meters. It is good practice to not assume the exact value of guim, although it's highly unlikely it will change in a particular game.

All objects in the world have 3D coordinates in game units. However, many objects will have their Z coordinate set to the special value InvalidZ; such coordinates are displayed or stored in Lua files as 2D (the InvalidZ is not displayed) and coordinates initialized with only X and Y will assume Z = InvalidZ. InvalidZ, or 2D coordinates, means that the object is positioned exactly on the terrain; if you move it around in XY, it will follow the changes of the terrain. This is very convenient for the common case of units walking on the terrain surface, or buildings constructed on the terrain. 3D coordinates are used e.g., for flying units, such as transport Shuttles, or when a particularly large rock needs to be submerged into the terrain.

The position of objects in the world can be manipulated using the following functions:

~~~~~~~~~ Lua
obj:GetPos() -- returns point
obj:GetVisualPos() -- returns point
obj:GetVisualPosXYZ() -- returns x, y, z
obj:SetPos(x, y, z)
obj:SetPos(x, y, z, time)
obj:SetPos(pt)  -- pt is a point value, e.g. created via point(x, y, z)
obj:SetPos(pt, time)
~~~~~~~~~

Note that the SetPos function can receive an optional "time" parameter (in milliseconds). If the time is not specified, the object is instantly moved to the position specified; if a time is given, the object's position is smoothly visually interpolated between its current position and the specified position over the interval of *time* milliseconds. This is an efficient way for the game simulation to update the unit position as infrequently as possible, while allowing the rendering subsystem to maintain the illusion of smooth movement. Note that GetPos() in this case will return the non-interpolated final position of the unit; GetVisualPos will return the properly interpolated position and, if the object is on the terrain, will return a proper Z coordinate corresponding to the terrain elevation at that point, instead of InvalidZ.

In addition to position, you can set scale (100-based, meaning 100 is the original size of the object as exported from the art package), angle (in angular minutes, around the vertical axis) convenient for upright objects such as units or buildings), or full orientation (specified as an axis of rotation and angle around the axis).


~~~~~~~~~ Lua
obj:GetScale() -- returns object scale 
obj:GetWorldScale() -- returns object scale accumulated through the attach hierarchy
obj:SetScale(scale) -- in percent, e.g. 100 is default object scale
obj:GetAngle() -- returns angle in minutes
obj:GetVisualAngle() -- returns interpolated angle for current time
obj:SetAngle(angle, time) -- interpolate angle for *time* ms
obj:Face(target, time) -- rotate object to face target is a point or another object; time is optional
~~~~~~~~~

For a more complete list of CObject-related functions, see the [CObject function reference].


Entities
--------

Entities are bundles of information necessary to render an object in the world. They are exported from an DCC package such as Blender and bind together meshes, animations, materials (textures + additional metadata), spots, states and surfaces. Entities are statically loaded on game startup, and referenced by all objects sharing the same visuals. Mods can add their own entities via the entity mod item, and reference them from other mod items to bring them into the game.

The following functions can be used to access the available entities:

~~~~~~~~~ Lua
GetAllEntities() -- returns array of strings with all valid entity names
IsValidEntity(ent) -- tests if string corresponds to valid entity name
~~~~~~~~~

An entity has one or several *states*. For animated entities, these are usually animations, such as walk, sit, interact; however, a building can also have several static states, e.g. normal and destroyed. The default state of each entity is called *idle*. An entity can have one or several static and/or several animated states; in fact, the terms "state" and "animation" are interchangeable in the engine and in some function names. The idle state might be either static or animated.

States can be identified either by name (e.g. "idle") or by a state index (a number). 

~~~~~~~~~ Lua
obj:GetState()  -- returns state index (number)
obj:GetStateName() -- returns state name (string)
obj:SetState(state) -- sets object state; state can be either name or index
GetStateName(idx) -- returns the state name corresponding to the specified state index
GetStateIndex(name) -- returns the state index corresponding to the specified state name
obj:HasState(name) -- returns true/false; state can be either name or index
HasState(entity_name, name) -- returns true/false; state can be either name or index
~~~~~~~~~

Note that most functions can accept either an entity name (string) or a CObject as their first parameter; when a CObject is supplied, information is returned about its entity.
For a more complete list of CObject-related functions, see the [CObject function reference].

CObjects don't have a permanent entity; while the initial entity on creation is taken from the entity member of their Lua class, it can be subsequently changed using *ChangeEntity*.

States and Animations
---------------------

!!! 
   *Animation* and *state* are for most intents and purposes interchangeable in the CObject-related functions and documentation.

Entities can have one or more *states*, or *animations*. For e.g. a building, these can be fully static - an intact state, and a destroyed state. For animated objects such as colonists and drones, some of them can be animated (e.g. walk, run, etc.).

The default state each entity has is called *idle*. It is typically the "normal" static state of the entity, e.g. standing still for colonists, or non-destroyed state for buildings. Note that it may be animated - idle states for human characters, for example, usually have some small natural movements, to avoid looking frozen like statues.

States/animations are authored with string names. The functions in Lua can reference them either by these string names, or by numeric indices for a slight performance benefit.

There is a set of simpler functions allowing playing of one state/animation at a time - SetState, PlayState, etc.; and a more complex but powerful one allowing for blending several animations with weights.

For a list of functions, see the [CObject functions reference](LuaFunctionDoc_CObject.md.html).

Spots
-----

Spots are positions specified relative to the entity origin or relative to particular bones of the entity skeleton (e.g. to attach a weapon to the hand of a character in an action game). They are identified by name and index. Names are string identifiers, and multiple spots with the same name are possible. Indices are unique integers; all indices for the particular spot name are consecutive.
All entities automatically have a *Origin* spot corresponding to the center as authored by the artist.

~~~~ Lua
  local first_index, last_index = obj:GetSpotRange(spot_name)
~~~~

Attaching CObjects
------------------

CObjects can be attached to each other. Attachment binds together position, orientation, scale and even lifetime: attached objects not only move/rotate/scale as if they were a part of the parent object, they are also automatically destroyed when the parent is destroyed.

Attachment happens at [*spots*] of the parent object's entity, relative positions specified when the entity is authored. An additional offset can be specified if a different position is required.

When an object is detached from its parent, it remains at the same position/orientation it was at the moment of attachment.

Here are some of the related functions; for a more complete list, see [CObject functions reference](LuaFunctionDoc_CObject.md.html).
~~~~ Lua
  parent:Attach(child, spot_index)
  child:Detach()
  parent:GetAttaches(child_class)
  child:SetAttachOffset(offset)
  parent:ForEachAttach([child_class,] func)
~~~~

Surfaces
--------

Surfaces are low-poly geometry associated with an entity state. Unlike visual geometry, which is only used for rendering, surfaces are accessible from the game logic and can be used for collision detection and other purposes.

The following types of surfaces are supported:

collision
:	Represents the external surfaces of the object. Collision surfaces can be used for collision tests and they are also used to build the grids used by the pathfinder to determine where units can pass.
  
walkable
:	Represents horizontal or nearly horizontal surfaces where units can walk, for example ramps on building entrances, elevated platforms, etc. The part of the world, accessible by pathfinding, is 2D - either the terrain or the topmost walkable surface at each XY position.

selection
: Represents the outline that will be drawn to visualize the selection when the object is selected by the user.

hex_shape
: Marks the tiles in the hex grid that will be taken by the building.





(insert footer.md.html here)
<!-- Markdeep: --><style class="fallback">body{visibility:hidden;white-space:pre;font-family:monospace}</style>
<script src="markdeep.min.js"></script>
<script src="https://casual-effects.com/markdeep/latest/markdeep.min.js"></script>
<script>window.alreadyProcessedMarkdeep||(document.body.style.visibility="visible")</script>