Class System
============

An object is a Lua table with metatable corresponding to the object class.

The Haemimont Game Engine uses a custom class system built on top of Lua metatables. It supports multiple inheritance, out-of-order declaration, binding of Lua objects with C++-side game objects, and hot reloading.

Here is how a basic class declaration looks like:

~~~~~~~~~~ Lua
DefineClass.Building = {
	__parents = { "BaseBuilding", "Constructable" },

	construction_cost = 200,
	entity = "Building_Placeholder",

	entrances = { "Entrance1", "Entrance2", "Entrance3" },

	Update = function(self)
	end,
}

function Building:DailyUpdate()
end
~~~~~~~~~~	

Members
-------

The **__parents** key specifies a list of class names that the declared class will inherit from.
These classes need not be declared before the current class - the inheritance structure will be built and inheritance links will be resolved after all Lua files are loaded and all declarations processed.

**construction_cost** and **entity** are members. Until written to, they are *class members* and have the same value for all objects of the class. When written, they become *object members* and each object can have its own, different value. 

Members are looked up in the object, then in the parent classes, then in the parent classes' parent classes, etc. 

~~~~~~~~~~ Lua
local a = Building:new()
local b = Building:new()
print(a.construction_cost)  -- 200
print(b.construction_cost)  -- 200
a.construction_cost = 100
print(a.construction_cost)  -- 100
print(b.construction_cost)  -- 200
~~~~~~~~~~

Note that table members behave in the same way, but changing the _contents_ of the table doesn't count as writing to the member itself, and still keeps the table as a class value, shared between all objects.

~~~~~~~~~~ Lua
local a = Building:new()
local b = Building:new()
print(a.entrances) -- { "Entrance1", "Entrance2", "Entrance3" }
print(b.entrances) -- { "Entrance1", "Entrance2", "Entrance3" }
a.entrances[4] = "Entrance4"
print(a.entrances) -- { "Entrance1", "Entrance2", "Entrance3", "Entrance4" }
print(b.entrances) -- { "Entrance1", "Entrance2", "Entrance3", "Entrance4" }
~~~~~~~~~~

To avoid surprises with this behaviour, it is recommended to set table members to false in the class declaration, and initialize them properly in the object's Init methods:

~~~~~~~~~~ Lua
DefineClass.Building = {
	entrances = false
}

function Building:Init()
	self.entrances = { "Entrance1", "Entrance2", "Entrance3" }
end

local a = Building:new()
local b = Building:new()
print(a.entrances) -- { "Entrance1", "Entrance2", "Entrance3" }
print(b.entrances) -- { "Entrance1", "Entrance2", "Entrance3" }
a.entrances[4] = "Entrance4"
print(a.entrances) -- { "Entrance1", "Entrance2", "Entrance3", "Entrance4" }
print(b.entrances) -- { "Entrance1", "Entrance2", "Entrance3" }
~~~~~~~~~~

Creation and destruction
------------------------

Objects of most classes can be created and destroyed using the **new** and **delete** methods. The new method accepts a table with initial values for some of the object members. These values are not copied into a new object, but rather the table itself is "turned" into an object of the desired class; bear this in mind if e.g. trying to use the same table to create several objects.

~~~~~~~~~~ Lua
local a = Building:new()
print(a.construction_cost) -- 200
local b = Building:new({construction_cost = 300})
local c = Building:new{construction_cost = 300} -- same as above, using Lua syntax sugar
print(c.construction_cost) -- 300
a:delete()
b:delete()
c:delete()
~~~~~~~~~~

Methods
-------

Methods are member values just like any others, but they are of the *function* type. They can be declared both inside and outside the class, as shown in the example above. For readability reasons, it is heavily recommended to keep non-trivial members outside of the class.

Methods can be called using the usual Lua syntax sugar, using **:** instead of **.**:

~~~~~~~~~~ Lua
function Building:Update(time)
	...
end

local a = Building:new()
Building.Update(a, 10)  -- call method Update on object a with parameter time = 10
a:Update(10)  -- same as above
~~~~~~~~~~

To call methods on parent classes, you need to use the normal, dot-syntax and specify the exact class:

~~~~~~~~~~ Lua
function Building:Update(time)
	BaseBuilding.Update(self, time) -- call the Update method of first parent on self
	Constructable.Update(self, time) -- call the Update method of second parent on self
end

local a = Building:new()
BaseBuilding.Update(a, 10)  -- call directly the parent-class method on a
~~~~~~~~~~

There are three types of member methods for lua classes, regarding the way they are called and how they need to be implemented.

* Regular methods - these work as described above, when calling an overriden method it would call the method associated with the object's type (like c++ non virtual). It's up to the programmer to determine whether he wants his override to call the super's implementation. If necassery it can be done as shown above.
* Recursive call methods - the method must be marked as a recursive call so that hierarchical data can be gathered on init that is needed to perform the call. Recursive calls call each implementation of the said method through the class inheritence hierarchy in order specified by the caller (parents first or children first). So calling the super's implementation for such methods is in fact an error and will cause that code to execute twice, once due to the recursive call itself and once due to the overide call. GameInit, Init, and Done are such methods.
* Auto resolve methods - methods can be marked in the _G["AutoResolveMethods"] table (key is name of method, value is auto resolve type) to become auto resolve methods. This system combats cases where multiple parents implement the same method. In regular circumstance, if the inheritor does not implement the method a lua error will occur due to the class system not knowing which one to use for the child class. This forces the user to create their own method of the same name in the child class and call each of the parent methods (as shown above). For auto resolve methods, this is done automatically and the child class does not need to implement the method excplicitly. It's important to note that if the child class implements the method, it does need to call each parent manually, as in regular methods. The auto resolve type provided when marking a method as such determines the way results are combined from multiple call, for example "or" means that all results will be combined with the logical or operator.

Base classes: PropertyObject, InitDone, Object, CObject
-------------------------------------------------------

The class system doesn't force you to inherit a specific root base class in all of your classes, and many classes in our games don't have any parents.
However, the four base classes described in this section package useful functionality needed by many classes, and they are frequently inherited from.

### PropertyObject

The base class of these is **PropertyObject**. It doesn't inherit from anything. It provides support for *properties* - enhanced members that describe the type of values they can hold, permissible ranges for the values, provide a way to inspect these values in visual editors, to serialize them to a variety of formats, etc. The property system is described below.

### InitDone

The class **InitDone** inherits from **PropertyObject**. It provides a pair of methods that are called when an object is created (**Init**), and when it is destroyed (**Done**). Unlike ordinary methods, when implementing an Init method, you don't need to explicitly call the corresponding Init methods of all your base classes - this is automatically handled by inheriting **InitDone**. Ditto for Done. The Init of the base classes is called before the Init of the child classes.

Note that unlike in C++, where destructors are called automatically when an object goes out of scope, you have to manually call *obj:delete()* on your objects in order to have their Done() methods invoked.

### CObject

The class **CObject** inherits from **PropertyObject** and provides a bidirectional link between game objects maintained by the C++ side of the engine, and Lua objects. Such objects have a position on the game map and are automatically destroyed when the game map is changed.

Note that classes inheriting CObject will get their Lua object table garbage collected when all references to it are lost. This is useful for small, passive objects such as rocks and trees. This means that any modified object members will be removed when the corresponding Lua object table gets garbage collected. When such objects are returned to Lua code their corresponding object tables are re-created which can have performance implications due to the creation and garbage collection of many Lua tables.

CObjects can also be created and destroyed with the PlaceObject/DoneObject pair.

~~~~~~~~~~ Lua
local a = PlaceObject("Building")
DoneObject(a)
~~~~~~~~~~

A rich set of functions for modifying game objects - moving them around, scaling them, animating them - is provided as member functions of CObject, and is described in a separate document.

### Object

The class **Object** inherits from **InitDone** and **CObject** and provides several additional services on top of it. 

First, it has a **GameInit** method, which, similarly to **Init** is called automatically for all base classes; the difference with **Init** is that while Init() is called very early after the object is created, GameInit() is called after the object, and all objects place simultaneously with it, have been properly initialized, placed in the world and can see each other. As a rule of thumb, if a piece of object initialization code needs to know anything outside of the object itself, it should probably go in GameInit.

The second service provided by the **Object** class is a member called **handle**. It is an integer generated automatically, guaranteed unique for the object. The object can be found under this handle in a global table called HandleToObject.

Unlike CObject, classes inheriting Object keep their Lua object table alive until the object is destroyed. (see above).

### Properties

Classes inheriting from PropertyObject have a special member **properties** declaring a table of properties.

Properties are class members with the following additional features:

  * for a property called *XXX*, if corresponding member functions SetXXX and GetXXX exist, they are called as appropriate when working with the property
  * they can be edited via the external property editor, _Ged_
  * they can be serialized to text-based Lua format
  * they, and the associated metadata, can be enumerated and manipulated by code

Properties are inherited just like normal members, with properties in derived classes hiding and overriding properties in the base classes.

Here is a sample properties declaration:

~~~~~~~~~~ Lua
properties = {
	{ id = "construction_cost", name = T{"Construction Cost"}, default = 200, editor = "number" },
	{ id = "main_entrance", name = T{"Main Entrance"}, default = "Entrance1", editor = "dropdownlist", items = {"Entrance1", "Entrance2", "Entrance3"} },
}
~~~~~~~~~~

Each entry in the properties table is called *metadata* for one property. The property id is the only mandatory field in the metadata - it corresponds to the member name in the object. Some other useful metadata fields are:

name
:	The user-visible name of the property, displayed in the external property editor. (The T{""} syntax is for localized strings, as described in another document.)
default
:	The default value for the property; when an object is created, the property has this value.
editor
:	The type of editor used when editing or displaying the object in the external property editor. Some useful types of editors are *text*, *number*, *bool*, *combo*, *dropdownlist*, *color* etc.
help
:	Additional text describing the property; used e.g. for rollover help in the external property editor Hedgehog.
items
:	Lists the permitted values for displaying in combination with a *combo* or *dropdownlist* editor type; note that the property itself can take on other values if set from the code.
modifiable
:	Modifiers (see separate document) can be attached to instances of the object.





(insert footer.md.html here)
<!-- Markdeep: --><style class="fallback">body{visibility:hidden;white-space:pre;font-family:monospace}</style>
<script src="markdeep.min.js"></script>
<script src="https://casual-effects.com/markdeep/latest/markdeep.min.js"></script>
<script>window.alreadyProcessedMarkdeep||(document.body.style.visibility="visible")</script>