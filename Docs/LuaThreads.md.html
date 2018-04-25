Cooperative Threads in Lua
==========================

Gameplay code in the Haemimont game engine heavily relies on cooperative multi-threading, built on top of Lua coroutines. *Cooperative* here means that all threads run conceptually in parallel, but actually only one thread is executed at any given moment in time; control is yielded to other threads only when the current thread allows it by calling a yielding function (such as **Sleep**, **WaitWakup** or **WaitMsg**).

The cooperative multitasking model greatly reduces the typical multitasking complexities. 
The thread logic is executed as if there are no other running threads until 
an yield function is called when other threads are allowed to execute. 
Only after calling an yield function the logic can expect unpredictable changes to 
its environment (introduced by other threads).

The cooperative multitasking has its disadvantages. A single thread can run 
an endless loop resulting in all threads being prevented from execution. 
Some logic, which takes significant amount of time to execute, might make 
the entire program unresponsive or might introduce visual glitches and hiccups.

No thread should run for a substantial amount of time before yielding control for a while. 
Thread switching is an expensive operation, so it should not be done too often as well. 
In the rare case of a computationally intensive task, it should be carefully split into chunks 
that yield control at regular intervals.

Game Time and Real Time
-----------------------

Threads run in one of two time domains - **game time** and **real time**.

**Real Time** is close to wall-clock time - it never stops and advances with constant speed. It starts at 0 when the application is started and runs until it is closed, regardless of game state, menu traversal, loading screens, saving/loading games etc. Real time threads survive all of these events.

**Game Time** starts at 0 when gameplay starts on a map and advances only when the game is running. Pausing the game stops game time; changing the game speed makes game time advance faster or slower. When a game is saved, the game time is stored as part of the savegame, and continues from where it left off when the game is loaded. Game time does not exist when the game is outside of a map (e.g. on the main menu, or on loading screens). When the current map is changed due to loading a new map, loading a savegame, or quitting to the main menu, all game time threads are deleted.

As a rule of thumb, game logic should go into game time threads, while user interface logic should go into real time threads.

Reference
---------

***thread* = CreateRealTimeThread(*func*, ...)**
:	Creates a real time thread which is scheduled immediately to run the provided function. The thread will end when the function finishes execution. The additional parameters supplied as ... will be passed to the thread function.

***thread* = CreateGameTimeThread(*func*, ...)**
:	Creates a game time thread which is scheduled immediately to run the provided function. The thread will end when the function finishes execution. The additional parameters supplied as ... will be passed to the thread function.

**DeleteThread(*thread, bCanDeleteCurrent*)**
:	Deletes the provided thread. The thread is never executed again. If the current thread is deleted, the code after the DeleteThread call is never executed. In that case the function asserts if bCanDeleteCurrent is not true.

**Sleep(*time*)**
:	Can be called only within a thread. Suspends the execution of the current thread for *time* milliseconds.

***timeout_left, ...* = WaitWakeup(*timeout*)**
:	Suspends the calling thread until Wakeup is called for it. Returns the remaining time (or true if no timeout) and the arguments passed to *Wakeup*. In case of a timeout returns nothing.

***success* = Wakeup(*thread*, *...*)**
:	If awaiting wakeup, *thread* is scheduled to execute as soon as possible and the function returns true. If the thread is invalid or not awaiting wakeup the function returns nothing.

***timeout_left, ...* = WaitMsg(*message*, *timeout*)**
:	Suspends the calling thread until the specified message is sent. Returns the remaining time (or true if no timeout) followed by the parameters passed to the *Msg* function (see [Messages](LuaMessages.md.html)) which led to the thread being scheduled. In case of a timeout returns nothing.

***time* = now()**
:	Can be called only within a thread. Returns the time of the current thread (either game time or real time).

***time* = RealTime()**
:	Returns the current real time.

***time* = GameTime()**
:	Returns the current game time.

***thread* = CurrentThread()**
:	Returns the current thread (the one calling the function) or nil if there is no current thread.

**Halt()**
:	Stops permanently the execution of the current thread. Equivalent to DeleteThread(CurrentThread()).

***test* = IsRealTimeThread(*thread*)**
:	Returns positive value if *thread* is a real time thread.

***test* = IsGameTimeThread(*thread*)**
:	Returns positive value if *thread* is a game time thread.

***status* = GetThreadStatus(*thread*)**
:	Returns the time of the next thread execution, or "WaitMsg" if the thread is waiting for a message, or "WaitWakeup" if awaiting wakeup, "done" if execution is over or nil if *thread* is invalid.

***test* = IsValidThread(*thread*)**
:	Returns true if *thread* is a valid thread.

Notes
-----

The threads scheduled for the same time get executed in the order of scheduling - from oldest to newest.

Samples
-------

Execute a function once every second in game time:
~~~~~~~~~~ Lua
CreateGameTimeThread(function()
	while true do
		Sleep(1000)
		UpdateEverySecond() 
	end
end)
~~~~~~~~~~

Execute a function at most once per frame:
~~~~~~~~~~
CreateRealTimeThread(function()
	while true do
		WaitMsg("OnRender") -- OnRender is sent once every frame
		TransparentObjs() -- call no more often than once per frame
	end
end)

~~~~~~~~~~


Execute a delayed update function 500ms after the last call to Change():
~~~~~~~~~~ Lua
function Change(value)
	-- update value here
	delayed_update_time = RealTime() + 500
	delayed_update_thread = delayed_update_thread or CreateRealTimeThread(function()
		while delayed_update_time > now() do
			Sleep(delayed_update_time - now())
		end
		DelayedChangeUpdate() -- called 500ms after the last update of value
		delayed_update_thread = false -- allow a new update thread to be created (and the old one to be garbage collected)
	end)
end
~~~~~~~~~~





(insert footer.md.html here)
<!-- Markdeep: --><style class="fallback">body{visibility:hidden;white-space:pre;font-family:monospace}</style>
<script src="markdeep.min.js"></script>
<script src="https://casual-effects.com/markdeep/latest/markdeep.min.js"></script>
<script>window.alreadyProcessedMarkdeep||(document.body.style.visibility="visible")</script>