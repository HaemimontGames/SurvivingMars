# Documentation for *BaseBuilding*

## Overview

class overview...<br>
## Parent classes

* [CObject](LuaFunctionDoc_CObject.md.html) 
* ColorizableObject
* FXObject
* Holder
* InitDone
* [Object](LuaFunctionDoc_Object.md.html) 
* PropertyObject
* SyncObject
* WaypointsObj

## CanWork

Returns wether work for this building is both possible and permitted. It uses GetWorkNotPossibleReason and GetWorkNotPermittedReason functions to determine this. Therefore, it is critical, if a new building class has unique reasons for not working, for it to implement these functions.<br>
<br>

bool **CanWork**()
_returns_ bool
: Result.


## GetNotWorkingReason

Returns nil if the building can work, otherwise it returns a humanly readable non localized string representing the reason it cannot.<br>
<br>

string/nil **GetNotWorkingReason**()
_returns_ string/nil
: Humanly readable string representing the reason a buildig is not working or nil if there is nothing preventing the building from working.


## GetWorkNotPermittedReason

Returns the reason the building is not permitted to work. For example if the user turned it off with the infopanel button this func will return "TurnedOff". This is an [auto resolve](LuaClasses.md.html#toc1.3) method. This needs to be implemented for building classes that have unique reasons for not working.<br>
<br>

string/nil **GetWorkNotPermittedReason**()
_returns_ string/nil
: The reason the building is not permitted to work or nil if it is.


## GetWorkNotPossibleReason

Returns a reason which makes it impossible (in terms of game rules) for the building to work. For example if the building requires workers but has none "NotEnoughWorkers" should be returned. This is an [auto resolve](LuaClasses.md.html#toc1.3) method. This needs to be implemented for building classes that have unique reasons for not working.<br>
<br>

string/nil **GetWorkNotPossibleReason**()
_returns_ string/nil
: The reason because of work is impossible for this building or nil if it is.


## IsWorkPermitted

Returns whether the building is allowed to work by the user.<br>
<br>

bool **IsWorkPermitted**()
_returns_ bool
: Wether the building is permitted to work by the user.


## IsWorkPossible

Returns whether work is possible in terms of game rules for this building.<br>
<br>

bool **IsWorkPossible**()
_returns_ bool
: Whether it is possible for the building to work in its current state according to the game rules.


## OnSetWorking

Building event called when the working state of a building changes. This is an [auto resolve](LuaClasses.md.html#toc1.3) method.<br>
<br>

void **OnSetWorking**(bool working)
bool working
: The value of the new state of working ( it is == to self.working, but faster to access ).


## SetWorking

Working state setter. Will set the new working state of the building directly. Use this only if you are absolutely certain what the new sate will be. For example, a factory lacking input materials cannot work therefore it is safe to call SetWorking(false) (unless some research says otherwise) for it to immidiately update its working state. Generally though, it is safer to call the UpdateWorking(working) method. This function will do work even if the new state is the same as the old one. OnSetWorking will only get called if the new state is different from the old one.<br>
<br>

void **SetWorking**(bool work)
bool work
: The new working state.


## UpdateWorking

Will set the working state of the building with whatever CanWork returns. This means that if GetWorkNotPossibleReason and GetWorkNotPermittedReason are implemented correctly the building will automatically pick the correct state. This function needs to be called on state change.<br>
<br>

void **UpdateWorking**([bool expected_state])
bool expected_state
: Optional. The expected state by the caller. If the actual state is different the function will helpfully assert.





(insert footer.md.html here)
<!-- Markdeep: --><style class="fallback">body{visibility:hidden;white-space:pre;font-family:monospace}</style>
<script src="markdeep.min.js"></script>
<script src="https://casual-effects.com/markdeep/latest/markdeep.min.js"></script>
<script>window.alreadyProcessedMarkdeep||(document.body.style.visibility="visible")</script>