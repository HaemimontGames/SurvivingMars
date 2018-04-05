[*Back to Index*](index.md.html)
Terrain Grids
=============
The terrain in **Surviving Mars** is represented by two raster grids - type grid and height grid.

The materials used to texture the terrain are in the *TerrainTextures* table. Each material consists of several PBR textures similar to other materials in the game - base color, normal map, roughness/metallic, etc. 

The layout of these materials on the terrain is controlled by the terrain type grid, which describes what material to use for each pixel (1x1 meters in Surviving Mars). Each pixel can reference only one material. However, materials are blended along type pixel boundaries with a fairly wide blending border, to avoid obvious pixelation. The values in the pixels are 8-bit indices in the TerrainTextures table.

The geometry of the terrain is described by a dense height field, again with a 1x1 meters density. Each pixel indicates the height in this point, as a 16-bit number in game units (i.e. centimeters). The maximum height is thus 655.35 meters.

The map size in *Surviving Mars* is approximately 6 km x 6 km - or more precisely, 6144 m x 6144 m. Only the inner 4096 x 4096 m is playable, the exterior 1024 m zone exists and is fully renderable and modifiable, but the player can't move the camera or place buildings there.

Buildings and code can modify the terrain arbitrarily, and the entire terrain - both type and height grids - is stored as part of the savegame. When starting a game, the type and height grids are initialized by the random map generator; when loading a savegame, they are loaded directly.

Note that the interfaces of all the functions using or modifying these grids accept distances, coordinates etc. in game units, not type or height grid pixels - ideally, you shouldn't need to know the exact density of these grids, and they may change in the future.


Terrain Functions
============

terrain.IsPointInBounds(pos, [border])
-------
Returns **true** if the specified point is inside the terrain boundaries. 


terrain.IsVerticalTerrain(pos)
-------
Returns **true** if the specified point is considered vertical terrain depending on the terrain normal in it.
**pos** can be specified as either a **point** or integer (x, y) coordinates.


terrain.GetSurfaceNormal(pos)
-------
Returns the normal to the terrain surface, with all components multiplied by 100.


terrain.GetTerrainNormal(pos)
-------
Returns the normal to the terrain, with all components multiplied by 100.


terrain.GetTerrainSlope(pos)
-------
Returns the slope angle of the terrain at the given position, as determined by the terrain normal.


terrain.GetTerrainType(pos)
-------
Returns the terrain type at the given map position.


terrain.GetIntersection(pt1, pt2)
-------
Returns the intersection point of a ray with the terrain.


terrain.GetAreaHeight(pos, radius)
-------
Returns the average height of the area determined by the circle(pos, radius). If no parameters are specified, then the average for the whole map is computed.


terrain.GetMapWidth
-------
Returns the map width/sizex.


terrain.GetMapHeight
-------
Returns the map height/sizey.


terrain.GetMapSize
-------
Returns the size of the map (terrain) rectangle as two integers (sizex and sizey).


terrain.ClampPoint(pos, [border])
-------
Clamp a position with the map bounding box.


terrain.GetTerrainsCount
-------
Returns the number of available terrain types.


terrain.HeightTileSize
-------
Returns the size of the heightmap tile.


terrain.HeightMapSize
-------
Returns the x and y sizes of the heightmap grid.


terrain.SetHeight(pos, height)
-------
Sets the terrain height at the given position to the specified value.
**pos** can be passed as either a point or two integers (the x and y coordinates).


terrain.GetHeight(pos)
-------
Returns the terrain height at given position.

**pos** can be specified as either a point or two integers (x, y coordinates).


terrain.GetMaxHeight
-------
Returns the maximum possible height value.


terrain.GetSurfaceHeight
-------
Returns the surface height at given position. The surface height 

**pos** can be specified as either a point or two integers (x, y coordinates).


terrain.SetHeightCircle(pt, nInnerRadius, nOuterRadius, nHeight, [mode])
-------
Sets the height values in the given circle, smoothing the height in the outer ring toward the existing values.

If **mode** is omitted or is set to **const.hsDefault**, the target values are set directly.

If **mode** is **const.hsMin** the target is set to Min(original_heigth, new_height).

If **mode** is **const.hsMax**, the target is set to Max(original_height, new_height).


terrain.SmoothHeightCircle(ptCenter, nRadius)
-------
Smooths the terrain height in the given circle.


terrain.ChangeHeightCircle(pt, nInnerRadius, nOuterRadius, nHeightDiff)
-------
Calculates the average height in the given circle, then modifies it by **nHeightDiff**.


terrain.ScaleHeight(mul, div)
-------
Modifies all values in the height grid, multiplying them by **mul** and dividing the result by **div**.
		

terrain.ChangeHeight(nHeightDiff)
-------
Modifies all values in the height grid by adding **nHeightDiff** to them.


terrain.InvalidateHeight(area)
-------
Forces a recalculation of the height values in the specified area.
**area** is either an axis-aligned box or can be omitted, forcing a recalculation on the entire map.


terrain.TypeTileSize
-------
Returns the size of the typemap tile.


terrain.TypeMapSize
-------
Returns the x and y sizes of the terrain type grid.


terrain.SetTerrainType(pos, type)
-------
Sets the terrain type at the given position.
**pos** can be passed as either a point or two integers (the x and y coordinates).
type is the id/index of the terrain.


terrain.SetTypeCircle(ptCenter, nRadius, hType, [vType])
-------
Sets the terrain type in the specified circle.
If two type parameters are passed, **vType** terrain is applied for terrain areas considered vertical
and **hType** is applied otherwise.


terrain.InvalidateType(area)
-------
Forces a recalculation of the typemap in the specified area.
**area** is either an axis-aligned box or can be omitted, forcing a recalculation on the entire map.



(insert footer.md.html here)
<!-- Markdeep: --><style class="fallback">body{visibility:hidden;white-space:pre;font-family:monospace}</style>
<script src="markdeep.min.js"></script>
<script src="https://casual-effects.com/markdeep/latest/markdeep.min.js"></script>
<script>window.alreadyProcessedMarkdeep||(document.body.style.visibility="visible")</script>