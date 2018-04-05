# Pathfinding

This module allows units (movable agents such as humans, monsters, tanks, etc.) to navigate the game environment.

Units are considered cylindrical objects with position and radius.


## A*

Paths are found by a modified A* algorithm. The modification is that the heuristic function is not correct (it's too aggressive) 
resulting in the algorithm finding longer paths in some rare cases but typically finding paths significantly faster.

The A* uses a square "passability" bit grid over the game map which specifies which cells can be occupied by units. Typical resolution of this grid is 50cm.
In some cases there is more than one such grid for different type of units. For example tanks are larger and they cannot pass where smaller units can.
These grids are built using data from the terrain (water, inclination, etc.) as well as objects (buildings with impassable areas). (See SuspendPassEdits/ResumePassEdits functions)

Not all terrain is equal when it comes to movement. Another (lower resolution) grid specifies the relative cost of walking over the terrain so that units prefer paths with lower cost.

After a path through the passability grid is found we convert it into a sequence of segments which the unit will walk through. This process is called linearization and 
involves testing for passability a straight line between various points on the path.

## Destination locking

To avoid having units stand on top of each other they place a special invisible object called Destlock at the unit's destination which keeps the space "reserved". 
The path finding checks the potential destinations for Destlocks (or standing units) and does not return paths to occupied destinations.

Standing units have the flag *efResting* to keep their position occupied. Walking units do not have *efResting* but may have a Destlock object
to keep their destination occupied. This behavior is controlled with the *pfmDestlock* flag.

To avoid units occupying remote locations while still being very far the unit places its Destlock 
when it reaches certain distance from its destination. If the unit cannot place its Destlock it tries to find another path. 
This behavior is controlled with the *pfmDestlockSmart* flag.

Finally, a unit trying to occupy target destination may remove (or "invalidate") the Destlock of another unit which is farther from that destination. 
This is another mechanism to allow units to behave more naturally.

## Movement (path execution)

To follow its path (which is a sequence of segments) a unit continuously jumps (a step) to the next point from the path. 
These points are limited in distance in order to avoid collisions and allow the unit to be found near its visual position. 
The maximum allowed step distance is project specific compile constant.

The visual continuity of the movement is provided through position interpolation. (GetVisualPos)
For purposes of enumeration (GetObjects, etc.) the unit jumps directly to its next step in the path.

While walking the units may cross their paths and try to walk on top of each other. 
For a more natural movement behavior these situations are detected and handled by offsetting the unit from its path (without finding a new path). 
This behavior is controlled by the *pfmCollisionAvoidance* flag.

## Usage

Units should inherit the *Movable* class which is implemented in *Movable.lua*.

The low-level interface (used in rare cases were flexibility is required) if the pf.Step function:
~~~~ Lua
	int status = pf.Step(Movable unit, point destination)
	int status = pf.Step(Movable unit, point destination, "sl") // go in straight line
	int status = pf.Step(Movable unit, point destination, int max_radius, int min_radius)
	int status = pf.Step(Movable unit, Object target, int max_radius, int min_radius)
	int status = pf.Step(Movable unit, point[] destination_list)
~~~~
An easier to use function which sleeps internally if necessary is Movable:Step:
~~~~ Lua
	int status = Movable:Step(...) -- the function sleeps internally
~~~~
The high-level interface which is more convenient and efficient is Movable:Goto:
~~~~ Lua
	int status = Movable:Goto(...) -- the function makes steps repeatedly and returns pfFailed or pfFinished (never a positive value)
~~~~
The value returned as status can be one of the following:

* >0 - the unit is walking towards the destination, call the Step function after this much time
* 0 - this is an invalid status which is never returned
* *pfFinished* (-1) - the unit is at the destination
* *pfFailed* (-2) - the unit cannot find path to its destination







(insert footer.md.html here)
<!-- Markdeep: --><style class="fallback">body{visibility:hidden;white-space:pre;font-family:monospace}</style>
<script src="markdeep.min.js"></script>
<script src="https://casual-effects.com/markdeep/latest/markdeep.min.js"></script>
<script>window.alreadyProcessedMarkdeep||(document.body.style.visibility="visible")</script>