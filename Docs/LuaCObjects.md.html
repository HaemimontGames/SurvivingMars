CObject
=======

CObjects are objects, accessible to Lua, which have a counterpart in the C++ side of the engine.
They provide the following services and features:

  * they have a position, size, scale, orientation in the game world
  * they can be rendered as part of the world
  * they can play sounds
  * they can affect the world via their collision geometry
  * they can be attached to other CObjects, or have other CObjects attached to them


Some Lua objects have no CObject counterpart - for example, windows in the UI system, techs in the research system of the game, or game value modifiers.
On the other hand, some CObjects exist only on the C++ side, and have no permanent Lua counterpart - these are usually ligthweigth decorative objects of no interest to the game simulation, like rocks. Such objects can can be inspected by Lua: temporary Lua objects are created for this purpose, and garbage collected like all other Lua values when they are no longer referenced.

Most interesting objects in the game, like units and buildings, have both a Lua and a CObject.

Objects in the game which only have a permanent representation on the C++ side and only have temporary Lua counterparts inherit the CObject base class. For example, when a query enumerates all rocks in part of the map, the result is a list of CObject instances, some of them potentially created just for the purposes of this query; if you lose the reference to them and perform the query again, the same underlying object on the C++ side will get recreated as a new CObject instance.

Classes in Lua representing objects which have representations both on the C++ and the Lua side - for example an object such a building which needs to be rendered as part of the game world, but needs to have properties as members of a Lua class - inherit from the Object base class (which in turn inherits from CObject).

CObject Flags
-------------

All CObjects have three sets of flags associated with them - class flags, game flags and enum flags.
They are integers (32-bit for the class flags and enum flags, 64-bit for the game flags) holding one bit per flag, which can queried and set individually or in bunches via the following functions:

The *class flags* are read-only and shared between all instances of a class; they belong to the class, not the instance.

The *game flags* are per-instance and can be freely set or cleared to modify the in-game behavior of the CObject.

The *enum flags* are also per-instance, and can be freely manipulated; their additional benefit over game flags is that the data structures used in the game engine make it possible to find very quickly CObjects having a particular combination of enum flags in a particular area of the map. For example, the renderer uses the enum flag efVisible to quickly gather the visible objects on the map for rendering - every frame.

Anything that can be done with flags can be done with boolean Lua members of the corresponding Lua-side objects. The advantage of flags is compact storage on the C++ side, where they can be cheaply accessed by C++ code, and accelerated queries, for enum flags. There is no mechanism for mods to define their own flags, although mod authors are welcome to use the existing ones. The unassigned numeric values are reserved for future use - using them in your mods guarantees things will break when we decide to use them ourselves on the C++ side at some point in the future.

Here's a list of the existing class, game and enum flags with their meanings:

...


CObjects in the World
---------------------

The world where all CObjects live has an integer coordinate system; the smallest unit in - the precision with which game object positions are specified - is called a game unit. The constant *guim* in Lua (abbreviation from Game Units In Meter) should be used to convert between meters and game units where necessary, by multiplying meters by guim to get game units, or dividing game units per guim to get meters. It is good practice to not assume the exact value of guim, although it's highly unlikely it will change in a particular game.

All objects in the world have 3D coordinates in game units. However, many objects will have their Z coordinate set to the special value InvalidZ; such coordinates are displayed or stored in Lua files as 2D (the InvalidZ is not displayed), and coordinates initialized with only X and Y will assume Z = InvalidZ. InvalidZ, or 2D coordinates, means the object is positioned exactly on the terrain; if you move it around in XY, it will follow the changes of the terrain. This is very convenient for the common case of units walking on the terrain surface, or buildings constructed on the terrain. 3D coordinates are used e.g. for flying units such as transport shuttles, or when a particular large rock needs to be submerged in the terrain.
a
The position of objects in the world can be manipulated using the following functions:

...

Note that the SetPos function can receive an optional "time" parameter (in milliseconds). If the time is not specified, the object is instantly moved to the position specified; if a time is given, the object's position is smoothly visually interpolated between its current position and the specified position, over the interval of *time* milliseconds. This is an efficient way for the game simulation to update the unit position as infrequently as possible, while allowing the rendering subsystem to maintain the illusion of smooth movement. Note that GetPos() in this case will return the non-interpolated final position of the unit; GetVisualPos will return the properly interpolated position, and, if the object is on the terrain, will return a proper Z coordinate corresponding to the terrain elevation at that point, instead of InvalidZ.

In addition to position, you can set scale (100-based, meaning 100 is the original size of the object as exported from the art package), angle (in angular minutes, around the vertical axis, convenient for upright objects such as units or buildings), or full orientation (specified as an axis of rotation and angle around the axis)


Entities
--------

Entities are bundles of information necessary to render an object in the world. They are exported from an DCC package such as Blender and bind together meshes, animations, materials (textures + additional metadata), spots, states and surfaces. Entities are statically loaded on game startup, and referenced by all objects sharing the same visuals. Mods can add their own entities via the entity mod item, and reference them from other mod items to bring them into the game.

The following functions can be used to access the available entities:

...

An entity has one or several *states*. For animated entities, these are usually animations, such as walk, sit, interact; however, a building can also have several static states, e.g. normal and destroyed. The default state of each entity is called *idle*. An entity can have one or several static and/or several animated states; in fact, the terms "state" and "animation" are interchangeable in the engine and in some function names. The idle state might be either static or animated.

The following functions can be used to get information about an entity's states/animations:

...

Note that most functions can accept either an entity name (string) or a CObject as their first parameter; when a CObject is supplied, information is returned about its entity.

CObjects don't have a permanent entity; while the initial entity on creation is taken from the entity member of their Lua class, it can be subsequently changed using ChangeEntity.

Animation Playback
------------------

Spots
-----

Spots are positions specified relative to the entity origin (for static spots) or relative to particular bones of the entity skeleton (for bone-attach spots). They are identified by name and index. Names are string identifiers, and multiple spots with the same name are possible. Indices are unique integers; all indices for the particular spot name are consecutive.

Functions: get spot range, get random spot, has spot

...

Surfaces
--------

Surfaces are low-poly geometry associated with an entity state. Unlike visual geometry, which is only used for rendering, surfaces are accessible from the game logic, and can be used for collision detection and other purposes. The following functions can be used to work with surfaces:

The following types of surfaces are supported:

  * collision - represents the external surfaces of the object. Collision surfaces can be used for collision tests, and they are also used to build the grids used by the pathfinder to determine where units can pass
  * walkable - represents horizontal or nearly horizontal surfaces where units can walk, for example ramps on building entrances, elevated platforms etc. The part of the world accessible by pathfinding is 2D, either the terrain, or the topmost walkable surface at each XY position.


CObject Attach Hierarchy
------------------------

<!-- Markdeep: --><style class="fallback">body{visibility:hidden;white-space:pre;font-family:monospace}</style>
<script src="markdeep.min.js"></script>
<script src="https://casual-effects.com/markdeep/latest/markdeep.min.js"></script>
<script>window.alreadyProcessedMarkdeep||(document.body.style.visibility="visible")</script>




