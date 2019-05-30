[*Back to Index*](index.md.html)
Options
=======

A set of mod items that add easily modifiable options to your mods.
These are used primarily by Lua code and thus can achieve any type of effect.
When one or more options are added, your mod will appear in the `Mod Options` list inside the `Options` screen.
There the player can set how they prefer to use your mod.

Below is a list of all available option types.

Common to all options
=====================

Id
---
The identifier for the option. Used by Lua code to read the value of that option.

Display Name
------------
The name of the option as displayed to the player.

Default Value
-------------
The default value of the option.

Option (toggle)
===============

Adds an On/Off option to your mod.

Option (number)
===============

Adds a slider option to your mod.

Min
---
Left most value of the slider.

Max
---
Right most value of the slider.

Option (choice)
===============

Adds a choice option to your mod.

Choice List
-----------
A list of values (strings) that the player can choose from.

Notes
=====

Editing and testing mod options
-------------------------------
If you wish to edit your mod options and immediately see the changes inside the `Options` screen, you have to save your mod.
Saving a mod containing Option Mod Items will always trigger Lua reloading, which usually takes several seconds.

Using mod options in Lua
-----------------------------
To access the current options you can use the global table `CurrentModOptions` (see [Lua values](ModItemCode.md.html#luavalues)).
An empty table will be present, even if you don't have options.
Note that this variable will have a unique value, relevant only to the mod accessing it (similar to `CurrentModPath`).
Changing the option values using `CurrentModOptions` is discouraged.

Every time the player clicks "Apply" in the mod options screen, the `ApplyModOptions` message will be triggered (see [Messages](LuaFunctionDoc_Msg.md.html#applymodoptions)).
It will carry a mod ID, which can be used to identify which options have been modified.
You can filter out modifications to other mods using this ID and only react to changes to your mod.
Depending on your mod, you could just ignore the ID and always apply your options.

Options backward compatibility
------------------------------
You have to take care of backward compatibility yourself.
The options are stored inside an automatically generated class (which exists in `options.lua`).
Once the user changes their options, they will be saved as a raw table. The next time a normal constructor will be called to load the options:

~~~~ Lua
mod.options = options_class:new(options_data)
~~~~

Options not appearing
---------------------
Options that don't have assigned identifiers (`Id`) are invalid and will not be used.


(insert footer.md.html here)
<!-- Markdeep: --><style class="fallback">body{visibility:hidden;white-space:pre;font-family:monospace}</style>
<script src="markdeep.min.js"></script>
<script src="https://casual-effects.com/markdeep/latest/markdeep.min.js"></script>
<script>window.alreadyProcessedMarkdeep||(document.body.style.visibility="visible")</script>
