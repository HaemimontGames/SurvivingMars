
# Class System #  
The Haemimont Game Engine uses a custom class system. It's similar to the class systems in popular OOP languages, but there are some unique features, which will be explained now.

**Here are some basic specifications:**  

* There's multiple inheritance.  
* All data and methods are **public**.  
* Everything is **duck typed** (i.e. you can call any method of any class on any object).  
* There are several reserved namespaces in which special data is kept. Do not touch them, please.  

## Creating a new class ##
This is the way to create a class called **Mуclass** that can immediately be used in the game:
~~~~ Lua
	DefineClass.Myclass = {
	}
~~~~
The class can now be referenced by the global variable **MyClass**.  
**Note:**  
In previous games, g_ClassDefs was used instead of DefineClass and a class was referenced by g_Classes.MyClass. There are some subtle differences, but for the given examples, they are almost interchangeable.


Of course, for our class to be actually useful, it should have some variables and methods:  

~~~~ Lua
	DefineClass.Myclass = {  
		-- note the commas after everything  
		variable = 123,  
		method1 = function(self)  
			-- this is a method  
		end,  
		variable2 = 234,  
	}

	function Myclass:method2()
		-- this is also a method.  
		-- note that it still takes "self" as an argument(it's in the ":" on the first line)  
	end

	function Myclass.method3()
		-- this is a class method(doesn't take "self")  
	end
~~~~

There are three ways to define a class.

~~~~ Lua
	-- The first one was already discussed  
	DefineClass.< class name > = < classdef >  

	-- The second one is very similar  
	DefineClass(< class name >, < classdef >)  

	-- The third one is used for simple composition  
	DefineClass(< class name >, parent1, parent2, ...)  
~~~~

**Examples:**  
~~~~ Lua
	DefineClass.Myclass = {
		__parents = {"Building", "DefenceTower"}
	}  
	DefineClass("Myclass", {__parents = {"Building", "DefenceTower"})  
	DefineClass("Myclass", "Building", "DefenceTower")  
~~~~

## Inheritance ##
Most often a class will inherit from some base class. This is accomplished through setting the *__parents* attribute:  
~~~~ Lua
	DefineClass.Myclass = {
		__parents = {"Building"}
	}
~~~~

The language and the system support multiple inheritance:  
~~~~ Lua
	DefineClass.Building = {
		__parents = { "CommandObject", "ResourceObject", "Visitable", "Colorizable", "AutoDecorationObject", "MsgObj"},
~~~~

The methods of a class are really just records in a table (the class table), so we can call any method of any class for any object(table). The class table for **MyClass** can be referenced with **g_Classes.MyClass**.
Of course, most of the time it will fail, but idioms like the following one are perfectly acceptable:  
~~~~ Lua
	function Myclass:IsWorking()
		-- MyClass inherits from Building
		-- note that on the following line it's .IsWorking, not :IsWorking
		return g_Classes.Building.IsWorking(self) and self.workers
	end
~~~~

### Creating an object of a class:   ###
~~~~ Lua
	MyClass:New
~~~~
In the game world an object is usually initialized with **PlaceObject**   
~~~~ Lua
	obj = PlaceObject("MyClass")
~~~~
After that, there's only a few things left to take care of – like the object's position:  
~~~~ Lua
	obj:SetPos(someCoordinates)
~~~~
Note: even though in pure Lua it's no problem to access and set non-existing variables, here HGE will signal an error.

While it's valid to do this: 
~~~~ Lua
	-- obj.variable already exists
	obj.variable = 5  
~~~~

It's not valid to do this:  
~~~~ Lua
	-- Access of missing class/object member CObject.new_variable
	obj.new_variable = 5  
~~~~

This is only a soft limitation – with enough effort and knowledge of the engine, it is possible to set new variables after an object’s initialization. It is, however, considered bad style.

### Constructors and destructors  ###
When an object is created in memory its Init method is called. That may be long before it can actually affect the environment and there should be no game logic in there. It's usually used for initalizing variables.  
When an object is created in the world, its GameInit method is called. Game logic should be put there(for example, the object may announce its presence to others around it).  
When an object is destroyed, its Done method is called.  

## Entities: ##
Every class has an entity. That's what the user actually sees when playing the game. It's a full 3d model complete with states, animations and everything else you might expect. The entities are first created by the artists, then programmers attach them to classes and add game logic to those classes.
If you want to change all the teachers to look like, say, strippers - it's as simple as:  
~~~~ Lua
	DefineClass.Teacher = {
		...
		entity = "Stripper",
	}  
~~~~
Also, eww.  
One thing worth noting is that not every object in the world needs to have its own class. If an entity exists, but there's no class with the same name, the game automatically generates a Dummy class for it. It can then be used with PlaceObject - just like any other thing in the world. That's useful for things that don’t have any logic.

## Basic Classes:  ##
**PropertyObject**  
This is a class that is meant to be used internally. It doesn’t handle any game logic, but provides utility functions.  

* The **IsKindOf** and **IsKindOfClasses** methods are defined here.  
* It can send a recursive call to all parents of a class(for example, **Init**).  
* It can set, get and list properties of an object(GetProperty , SetProperty, GetProperties).   
For comparison, in many popular languages(e.g. Python, Ruby, Java) such a class is called **Object** and is the base of the class hierarchy.  

**InitDone**  
This is a thin wrapper for **PropertyObject**. The only difference is that objects of classes inheriting from **InitDone** have their constructors and destructors called when created/destroyed(once for each parent, parents first on **Init**, parents last on **Done**).  
Almost all game objects will have InitDone as a base class.  

**CObject**  
This is the basic class that all **world** objects should inherit. This includes all game objects(people, buildings), but also objects which have no logic associated to them(trees).  
**Note:**  
Many things in the world don’t have a CObject until they actually need it. For example, if trees are Enum-ed, the result would be an ObjList of trees(**CObjects**). But the trees didn’t have their own CObjects before – they were created when the enum was requested. They will also be destroyed when the enum is no longer being used. This saves a substantial amount of memory. The net effect is that writing to a **CObject** for anything that is not also an **Object** will only have a temporary effect(until the CObject is destroyed).  

**Object**  
This is the basic class that all game objects should inherit. It itself inherits **CObject**.  
It gets properly persisted(i.e. it implements **MsgPersistSave/MsgPersistLoad**).  
It gets properly destroyed on a map change.  
It automatically calls **constructors**(**Init**, **GameInit**) and **destructors**(**Done**) for the object’s class and all of its parent classes.  

**Caveats:**  
There's a difference between **obj.method** and **obj:method**.  
There is, however, no difference between **obj.method(self)** and **obj:method**.  

**Class variables** can only ever be set inside the class definition(and there's only one of them for the entire class).  
**Object variables** can only be created in an object's **Init** method(and there's one for every object of that class).  
Object variables can be set, but **cannot** be created inside a method other than **Init**!  
To initialize an empty variable in **Init**, simply set it to **false**(but not **nil**).  

 
# Command System #

## Commands ##
It is often necessary to ensure that an object is doing one thing – and one thing only. The command system is used to accomplish just that. Every "command object" has an active command and if anyone wants to make it do something else, the active command must first finish(or be canceled).

**Example:**  
For example, imagine a "Citizen"(Hulio) who is walking to work and gets spontaneously murdered by the military. We'd like to have Hulio fall on the ground – dead – and not do anything else. Having him fall on the ground – dead – and then get up and walk toward a hard day at the farm would be completely unacceptable. And yes, that was an actual bug.   
The desired effect can be achieved by the following code:  

~~~~ Lua
	-- This sets Hulio's command to "GoWork"
	function Citizen:FindWork()
		...
		SetCommand("GoWork", workplace)
	end

	-- This is called by the soldier who will kill Hulio
	function Soldier:DoKill(obj)
		…
		if not IsDead(obj) then
			-- This cancels Hulio's "GoWork" command
			obj:SetCommand("GoDie","Eliminated")
		end
	end
~~~~
## Destructors ##
Often a command changes its object in a non-permanent way that needs to be rolled back before the command exits. But a command can be terminated from outside, so it is important that any changes are rolled back in that case as well. It isn't easy to add sanity checks for every line of code at which a command may be canceled, so a way is needed to make sure a rollback _always_ occurs.  
The Destructors System is used to to that.  

**Example:**  
A citizen(Jose) is ordered to go to jail - he gets handcuffed and escorted to the prison building. But, if for some unforseen reason the prison is destroyed in the mean time(for example, by rebels), Jose no longer has a prison to go to. Moreover, even if he goes to the spot where the building was, he'll try to enter it(and there's nothing to enter, resulting in a crash). The following code prevents that.  

~~~~ Lua
	function Citizen:GoPrisoner(prison,time)
		self.prison = prison or false
		self:PushDestructor(function()
			-- the citizen is no longer a prisoner(this prevents a crash).
			-- what to do with him now – that's another question.
			self.prison = false
			...
		end)
		...
	end
~~~~

### Methods:###  

Those are the methods defined in **CommandObject**, which are used to handle destructors.
They all take **self** as an argument.  

**PushDestructor** – a member function that takes one extra parameter – a function, which will be called when the command has forcefully exited(or when PopAndCallDestructor is called).  
**PopAndCallDestructor** – pops the last pushed destructor and calls the function it held. This is usually used at the end of a method to call all pushed destructors. Once a destructor has been popped, it is no longer called if the command exits forcefully.  
**PopDestructor** – simply pops a destructor  

### Caveats:###  
Destructors are "pushed" because they act as a **stack** – note the following code:  
~~~~ Lua
	function Class:Method()
		self:PushDestructor(function()
			print "Destructor 1"
		end)
		self:PushDestructor(function()			
			print "Destructor 2"
		end)

		-- this prints "Destructor 2"
		self:PopAndCallDestructor()
		-- this prints "Destructor 1"
		self:PopAndCallDestructor()
	end
~~~~
"Pushed" destructors are not automatically "Popped" if a command exits normally – you must manually call "Pop(AndCall)Destructor" at the end of a method(you'll get an error that not all destructors have been popped).  

# Message System: #  
The Msg system is a way to pass events to objects without disturbing their normal behaviour.  
It includes a way to send a message(received by ny object hooked to listen for it) and ways to handle an message.

## Sending messages ##
Messages can be sent from any part of the code with the **Msg** function.  
It takes one argument, the **message name**.  
Extra parameters may be added to the **Msg** call – they will all be passed to each object handling the call.  

**Examples:**  
~~~~ Lua
	Msg("NewMap")
	Msg("BuildingDone", self)  
~~~~
## Receiving messages ##
There are two ways to handle messages – with a global handling function and with a per-object handling function. The second one is preferred.  

### Per-object message handlers###
Any class that inherits from **MsgObj** can utilize the Msg system and receive messages.  
The way this is done is by declaring special member functions with names after the name of the message.  
Any function named **MsgSomething** will act as a handler for a message called **Something**.  
The first parameter sent to it is the **self** for the current object.  
Any subsequent parameter are the ones sent with the **Msg** call.  

**Example:**  
If objects of the class **Workplace** need to listen to the **BuildingDone** message, this code should be used:  
~~~~ Lua
	DefineClass.Workplace
		__parents = {"MsgObj", … }
		…
		
		--  this handler will be called once for each "Workplace" object
		MsgBuildingDone = function(self, building) 
			… 
		end,
	end
~~~~

### Global message handlers###
Here’s a way to define a message handler that’s not attached to any particular object.  
~~~~ Lua
	function OnMsg.BuildingDone()
		print "A building has been destroyed somewhere"
	end
~~~~
### Caveats:###
A "message" has no special meaning – it is merely a string being passed from one part of the program to another. Any special conventions or preconditions are on a per-message basis. For example, the messages "PreNewMap", "NewMap" and "NewMapLoaded" are always executed one after the other, but that's solely because the messages are sent that way in the code.  

Most messages are immediate, but this is not always the case. Some very CPU intensive messages will have their handlers delayed. Such is the case with Tropico 3's MsgNewMonth – the handlers are not all called within the same millisecond, but are spread throughout the whole "game month".  
This is not being done automatically for all messages - to avoid problems, just be sure not to assume everything is instantaneous and double-check.  
 
# Notification System #
A notification is an easy way for an object to communicate with other objects around it. It's similar to the Message system in that way.  
Also, it is a way to optimize the game and avoid redundant computations.  

The Notification System is heavily used internally to properly initialize multiply inherited objects(it solves the “diamond problem”).  
Externally it's most useful as a way to communicate.  

When an object is “notified” to call a function, it waits for a while(say, a milisecond or two) and executes the function. During that time, if a second notification is sent to the same object with the same function, it is discarded.  

Obviously, it should only ever be used on functions that do not need to be recalculated too often.  


**Example:**  
_UpdateUpkeepBonus_ is a rather heavy function which should be called when the conditions for an upkeep bonus change(for example, a nearby bonus-giving building has started/stopped working). If many conditions change the bonus at the same time, all but the last call to _UpdateUpkeepBonus_ will be useless, so the update should be scheduled through “Notify”. This will almost always happen when a new map is loaded.

## Sending Notifications ##
~~~~ Lua
	self:Notify(method)  
~~~~
Will call **method** on **self**.  
~~~~ Lua
	self:AreaNotify(classes, method, range)  
~~~~
Will call **method** on every object that's a kind of **classes** in **range**. _range_ may be omitted – then a default(and sane) value will be used.  

## Receiving Notifications ##
No special code should be written for an object to receive notifications.  
Of course, care should be taken to only send **Notify** for methods for which it is suited.  
 
## Persisting data ##

Generally, no work needs to be done to ensure proper persistence of game objects – “It just works”.
Most things are automatically persisted on a save/load. This includes most game objects(buildings, people, etc.) and threads.  

Whenever there's any special logic for saving / loading an object, the game offers the following functionality:  

### Save/Load messages###
There are several messages that relate to saving/loading a game.  

**PersistSave** – a message that sends an extra parameter – a table that will be persisted.  
If there's any special data that cannot be automatically saved within an object – it should be written in the "data" table sent to PersistSave.  
**PersistLoad** – a message that sends an extra parameter – the same table that was persisted in PersistSave. The data that was manually saved must be manually loaded from the table.  
**PersistPreLoad** – a hook that is executed when a game is loaded, but before **Msg("PersistLoad", data)**. It doesn't send any parameters.    
**PersistPostLoad** – a hook that is executed immediately after all game data has been loaded. It's useful for save/load logic that doesn't include persistence. For example, in Civitas 3 a Squad's MsgPersistPostLoad makes sure that every squad has an animated flag attached to it.  
**Example:**  
~~~~ Lua
	OnMsg("PersistSave", "Diplomacy", function(data)
		data["Diplomacy.count"] = Diplomacy.count
		data["Diplomacy.sides"] = Diplomacy.sides
	end)

	OnMsg("PersistLoad", "Diplomacy", function(data)
		Diplomacy.count = data["Diplomacy.count"]
		Diplomacy.sides = data["Diplomacy.sides"]
	end)  
~~~~
### Global variables:###
All global variables are automatically persisted, unless otherwise stated.  
A global variable can be declared with one of the three functions:  
~~~~ Lua
	GlobalObj(...)
	GlobalVar(...)
	GlobalGameTimeThread(...)  
~~~~
If a global should not be persisted, that must be stated using the PersistableGlobals table:  
~~~~ Lua
	GlobalVar("MyVar")
	PersistableGlobals.MyVar = false  
~~~~
This should be done in **persist.lua**  

**Caveats:**  
When writing to the table in **PersistSave**, be careful! All savegame data is easily accessible in that table and if you overwrite a name that has already been used, this will break the game!  
 
# Threads: #
In HGE, everything is thread-safe. Technically, it is possible to make a deadlock using only Lua, but it really takes an effort.

## Creating a thread: ##
HGE benefits greatly from a very easy to use micro-threading system. In order to execute any piece of code concurrently, no more than a single line is required:  
~~~~ Lua
	local myThread = CreateGameTimeThread(function()
		-- write anything you want here
	end)  
~~~~
Now myThread holds a handle to the newly created thread.  
**Note:**  
The result of CreateGameTimeThread doesn't require to be held in a variable – the thread is executed either way.  

## Deleting a thread: ##
~~~~ Lua
	DeleteThread(thread)
	thread = false  
~~~~
This is useful when there's something that should only exist once – for example, a bonus that gives $300 per month for three years but doesn't stack. One way to do it would be to create a thread that gives the money, sleeps for a (GameTime)month and repeats 36 times. If the bonus is to be applied again, kill the old thread(if it exists) and make a new one in its place.  

## Signals, pausing a thread: ##
~~~~ Lua
	CreateRealTimeThread(function()
		Sleep(1000)
		Msg("MainMenuOpened")
	end)
	WaitMsg("MainMenuOpened", 5000)
	-- The main menu is guaranteed to be opened here  
~~~~

**WaitSignal(signal, timeout)** suspends the current thread until signal is raised(from anywhere else in the code) or until timeout miliseconds have passed. After that, it resumes work. If timeout isn't provided, it waits forever.  
**RaiseSignal(signal)** simply sends a global notification to any thread that might be waiting for it.  

## Unique characteristics of Lua/HGE threads. ##
### Time:###
There are actually two ways of keeping time in a game – **GameTime** and **RealTime.**    

**GameTime** starts at 0 at the beginning of a game, gets persisted on a savegame and continues from the same point in a loadgame. It can be sped up or slowed down. It doesn't run during pause(indeed, that's the definition of *pause* in our games).  

**RealTime** increases with the system clock. It isn't guaranteed to start at 0, or even at the same number every time. RealTime is active during pause, may be active in menus, doesn't reset on map change.  

Consequently, there are two types of threads – **GameTimeThread** and **RealTimeThread**. They calculate time differently(so, Sleep has different effect inside each of them).  
Any GameTimeThread will automatically terminate when the game finishes(i.e. when a mission ends or the player quits), so there's no need to specifically check for that.  

GameTime is used more often than RealTime.  
Most game objects are animated in GameTime(usually only particles are RealTime).  
All game objects should have their logic in GameTime.  

### Concurrency:###
Lua has a very easy to use implementation of concurrent programming.  
Essentially, only one thread(also called a “coroutine”) is running at any given time. Lua threads are “green”.  

This **yields** an important property:  
Any variables you use in a function that's being executed in a thread are valid and unchanged for the duration of the function's execution. Everything is thread-safe, always.  
Also, any Lua function should not be too computationally expensive, because it may lock up the entire game. A visible effect of such a behaviour is any Tropico 3 island that is inhabited by too many people(more than 800).  

Lua will switch from one thread to another only on:  

* The end of the thread's function* A Sleep statement  

Here's the official tutorial on [Lua coroutines](http://lua-users.org/wiki/CoroutinesTutorial).   
### Caveats:###
There's a very special function with regards to concurrent programming: _IsValid_. It returns true when an object can logically be used in the game(i.e. _DoneObject_ hasn't been called for it yet). There may be variants/wrappers of this function - for example _IsDead_ in Tropico 3.  
It is imperative that _IsValid_ or an equivalent is called **after every Sleep for every object used**. At any given time only one game thread is working, so there's no need for overzealous thread-safety code. But when a Sleep statement is executed - control shifts to another thread and anything can happen.  
It's really not pretty when the dead get up and walk the Earth once more because of a threading error.  

You'll probably see the function _DetectInfiniteLoop_ sooner or later. Then you'll probably laugh, knowing from Computer Science Class that this is not only extremely difficult to do, but also impossible. Then it will detect an infinite loop in your code. And you will be enlightened.  








(insert footer.md.html here)
<!-- Markdeep: --><style class="fallback">body{visibility:hidden;white-space:pre;font-family:monospace}</style>
<script src="markdeep.min.js"></script>
<script src="https://casual-effects.com/markdeep/latest/markdeep.min.js"></script>
<script>window.alreadyProcessedMarkdeep||(document.body.style.visibility="visible")</script>