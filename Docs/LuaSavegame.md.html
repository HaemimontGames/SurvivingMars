Savegames
=========

Savegames in *Surviving Mars* work by serializing the entire state of the game world. 

  * All [CObjects](LuaCObject.md.html) (the C++ side of the simulation) are serialized; large parts of the Lua state are also automatically serialized.
  * All Lua objects which inherit from Object are also automatically serialized, with their members.
  * Game time [Lua threads](LuaThreads.md.html) are assumed to be part of the simulation, and are automatically serialized.
  * Real time [Lua threads](LuaThreads.md.html) are assumed to be NOT part of the simulation, and are thus NOT serialized.
  * Global variables are NOT serialized by default. 
  * Special *GlobalVar* variables are serialized.

GlobalVars
----------

Global vars are specially declared global variables with two properties:

  * they are initialized with a default value every time a new map is loaded (i.e. when starting a new game, or when restarting on the same map)
  * they are automatically included in the savegame state, i.e. they will preserve their value after saving and loading a game

A GlobalVar is declared with the GlobalVar function at file scope:

~~~~ Lua
	GlobalVar("g_SeniorsCanWork", false)
~~~~

The first parameter is a string; the name of the global variable.
The second parameter is the default value - it can be any "simple" Lua value, or a function, in which case on GlobalVar initialization the function is called and its return value is used to initialize the GlobalVar.
If you need nested tables, you must use a function initializer to avoid leaking state across map changes:

~~~~ Lua
	GlobalVar("g_Grids", function() return { electricity = {}, water = {} } end)
~~~~


Additional Ways to Save/Load
----------------------------

In most cases, adding new [*Object*](LuaClasses.md.html#toc1.4.4) descendant classes and using GlobalVars is all that's necessary to have savegames working. For the rare cases when something more is needed, the following messages can be used:

function OnMsg.PersistSave(data)
: This message is sent during the savegame creation process. *data* is a table, which will be serialized as part of the savegame - add anything you need saved to it.

function OnMsg.PersistLoad(data)
: This message is sent during the savegame loading process. *data* is the deserialized table that was built during saving by the *PersistSave* message handlers - get anything you have placed in it.

function OnMsg.LoadGame(metadata)
: This message is sent after the load game process has finished, everything is deserialized, but the game time hasn't yet started running. Use it to fix savegame compatibility issues. *metadata.lua_revision* contains the version of the game which created the savegame.

Code Serialization
------------------

Any [Lua threads](LuaThreads.md.html) sleeping when a savegame is triggered will be serialized as part of the savegame. This include any local variables anywhere in the call stack, any upvalues, and even the bytecode of the functions themselves, to allow loading the savegame even when a game update has changed the Lua code. This means that after loading, pieces of "old" Lua code (coming from the savegame, not from the potentially updated game) will be running. New invocations of these functions, however, will use their new versions.





(insert footer.md.html here)
<!-- Markdeep: --><style class="fallback">body{visibility:hidden;white-space:pre;font-family:monospace}</style>
<script src="markdeep.min.js"></script>
<script src="https://casual-effects.com/markdeep/latest/markdeep.min.js"></script>
<script>window.alreadyProcessedMarkdeep||(document.body.style.visibility="visible")</script>