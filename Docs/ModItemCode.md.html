[*Back to Index*](index.md.html)
Code
====

This mod item allows you to load a single file of Lua code in the Lua environment of the game. The code can then directly affect the game, or be used by some other mod items.

- Check the [Lua Startup](LuaStartup.md.html) page for more information on when and how your code gets loaded.
- Check the [Lua Environment](index.md.html#luaenvironment) section for more information on systems and objects you can utilize.

Lua values
==========

**CurrentModPath**
: Path to the root folder of your mod. Useful for addressing mod imported resources (like UI images).

**CurrentModOptions**
: Table containing the options of your mod.
: The table will always be present, even if your mod doesn't have any options.
: Example usage: `CurrentModOptions.MyOptionId`.
: For more information see the [Options Mod Item](ModItemOption.md.html) section.

**SharedModEnv**
: A Lua table intended for sharing information between mods.
: This table is initialized as empty at startup and is never cleared, saved, loaded or modified in any way by the game.
: All mods have unlimited access ot this table (read, write, clear, etc.).
: For some purposes, instead of defining global variables, `SharedModEnv` can be used. It can even have values added and removed from at runtime, unlike `_G`, where only file scope variables can be defined at startup.

Tips and tricks
===============

Checking if another mod is currently loaded
-------------------------------------------

Checking if another mod is currently loaded can be done by searching the `ModsLoaded` table:
~~~lua
function IsModLoaded(mod_id)
	return ModsLoaded and table.find(ModsLoaded, "id", mod_id)
end
~~~

Handling and triggering messages
--------------------------------

You can register for and trigger messages using Lua code - see [Msg documentation](LuaMessages.md.html).
Such messages are not restricted between mods and the game - a message emitted from any place (this being the current mod, another mod or the game) can be handled at any other place. This also means that two mods can have collisions between message names.
If you are afraid this can happen, to avoid it you can always prefix a unique phrase before you message names - instead of `Msg("MyEvent")`, use `Msg("MyMod_MyEvent")`.

GlobalVars
--------------------------------
GlobalVars are variables, which are initialized on map load and cleared when changing the map. They are also saved in savegame files. When working with a mod, which has a GlobalVar definition, 
loading the mod from the mod editor does not initialize the GlobalVars, which have a table value (since no map change occurs). In order to force their initialization, you can restart the mod editor map after loading the selected mod.

Avoiding class name collisions
------------------------------

Similar to messages, class names can collide between mods. If another mod or the game defines the class `MyObject`, but your mod also defines a class with the same name, a collision will occur and only the last definition will be used (which is not predictable). To avoid this, you can, similar to messages (see above), prefix you class names with a unique phrase - instead of `DefineClass.MyObject = { ... }`, do `DefineClass.MyMod_MyObject = { ... }`. For more information see the [Classes documentation](LuaClasses.md.html).

Persising data between saving and loading a game
------------------------------------------------

If you have generated some data that is relevant only to the current savegame state (should be saved and loaded with it), then it must be stored in an `GlobalVar`. They are global variables that will be saved and loaded by the game automatically and can hold arbitrary values. Such variables can be declared from any mod and can be accessed by any other mod. For more information see the [Savegame documentation](LuaSavegame.md.html).

Working with DLCs
-----------------

If your mod depends on a DLC, but can run without it, your code can test if that DLC is available to the player or not.
This can be done using the [IsDlcAvailable](LuaFunctionDoc__G.md.html#documentationfor_g/isdlcavailable) function.
The function receives a single argument - a string that identifies a DLC.
DLCs are `.hpk` files in the `DLC` folder, found in the game installation folder. The names of those files match their IDs.

It is always guaranteed that all game Lua code and all DLC Lua code will be loaded before your mod Lua code items.

To test if your mod works properly without a specific DLC you can move the corresponding `.hpk` file outside the `DLC` folder (or delete it) and restart the game.
If your mod doesn't depend on any DLCs, you should check if it works properly with no `.hpk` files in the `DLC` folder.



(insert footer.md.html here)
<!-- Markdeep: --><style class="fallback">body{visibility:hidden;white-space:pre;font-family:monospace}</style>
<script src="markdeep.min.js"></script>
<script src="https://casual-effects.com/markdeep/latest/markdeep.min.js"></script>
<script>window.alreadyProcessedMarkdeep||(document.body.style.visibility="visible")</script>
