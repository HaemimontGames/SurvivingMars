Overview
========

The Lua loading procedure consists of setting up the Lua environment and loading all available code.
It happens once early in the program startup and multiple times during runtime when reloading the Lua is required.
Reloading the Lua will not drop the previous Lua state, but instead reuse it and overwrite it.

The startup procedure mostly boils down to running the [autorun.lua](#autorun.lua) file.

First startup
=============

The intial Lua startup is different from the rest, in that it is one of the very first things the program does.
Everything begins with the creation of the Lua environment. This consists of binding base Lua functions and setting up the `Platform` table.
After that, the program begins exporting engine functions to Lua: platform specifics, threads, input, sounds, rendering, game objects, UI library and more ...

Then the [autorun.lua](#autorun.lua) file is loaded.
If `autorun.lua` fails to load, it will lead to a crash (due to the programs invalid state).

Note: There is a global variable which can be used to recognize this stage - `FirstLoad` will be set to true only during this first Lua loading.

Lua reloading
=============

This can happen in many different circumstances, but most commonly when DLCs are being loaded or when mod items get reloaded.
Lua reloading is triggered by calling `ReloadLua()`.
Infinite loop detection is disabled while inside `ReloadLua`.

Sequence of events when reloading:
1. Mount Lua folders.
2. Trigger the `ReloadLua` message (see [Msg](LuaMessages.md.html#reference)).
3. Run `autorun.lua`.
4. Trigger the `Autorun` message.
5. Unmount Lua folders.

During reloading the `FirstLoad` global will be false.

Note: Exporting engine functions to Lua only happens on the first Lua startup. Reloading will not cause reexporting.

autorun.lua
===========

This file is the core of the operation.
Some unique rules apply while inside it:
1. The global variable `Loading` will be set to true.
2. Creating new members in `_G` will not cause errors.
3. Classes don't exist yet. They get built later in the `Autorun` message.

The stages of `autorun.lua` are as follows:

Msg
---
The first thing to initialize is the [Message](LuaMessages.md.html) system.
After this step, anyone can fully utilize it, by registering to and receiving messages.
When initializing it, any previously registered message handler will be dropped

Core library
------------
Here are definitions of functions considered Core to the Lua.
These involve printing, loading Lua files, serialization, managing Lua threads, dealing with tables, iteration, strings and more ...
Also a few basic data types are introduced here: number ranges and sets.

The `const` table, math functions, classes and other parts of the core are loaded after that.

Common Lua
----------
Common Lua code loading happens in this order:
1. Basic code directly inside the `CommonLua` folder is loaded.
2. Common classes inside the `CommonLua/Classes` folder are defined.
3. Lua UI systems are defined.
4. Platform specific functions are defined.

Game Lua
--------
Everything inside the `Lua` folder is executed recursively.
This is where the Game logic exists.

DLC Lua
-------
Every DLC exists inside a .hpk file. This file must contain a `Code` folder.
Lua files inside it will be executed in the same fashion as the Game Lua code.

Mod Lua
-------
Mod code reloading happens in the same order as the mod items will be loaded.
This order will obey all dependencies between mods.

Loading the code for a single mod consists of:
1. Running the `options.lua` file.
2. Running all files listed in the `code` table of the mod metadata.

!!! WARNING
    Note: Mod items reloading can cause Lua reloading.
    In that case, Mod Lua will be loaded before items loading.
    This means that Mod code cannot reliably access any mod items at this stage.

!!! WARNING
    Note: There are no circumstances under which Mod Lua will be loaded while `FirstLoad` is true.

Post load
---------
Most Lua files get executed inside the `autorun.lua` file.
After all that is finished, the `Autorun` message is triggerd.
Many systems rely on it to complete their initialization:
1. Classes get built. Listen for the `ClassesBuilt` message - all classes are final and functional after it.
2. Localization languages get registered.
3. Options get initialized.
4. Only on first load, the global `FirstLoad` will be set to false, and immediately after that, the `Start` message is triggered.

Finally, and only on first load:
1. Presets and other data will be loaded, followed by the `DataLoaded` message.
 - Run every file inside `CommonLua/Data` recursively.
 - Run every file inside `Data` recursively.
 - Recursively run every file inside the `Presets` folder of each DLC.
2. Account storage will be loaded.
3. The mod localization tables will be loaded. Those are the files listed in `loctables` of each mod metadata.

(insert footer.md.html here)
<!-- Markdeep: --><style class="fallback">body{visibility:hidden;white-space:pre;font-family:monospace}</style>
<script src="markdeep.min.js"></script>
<script src="https://casual-effects.com/markdeep/latest/markdeep.min.js"></script>
<script>window.alreadyProcessedMarkdeep||(document.body.style.visibility="visible")</script>
