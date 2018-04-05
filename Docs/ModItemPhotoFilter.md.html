[*Back to Index*](index.md.html)
Photo Filter
============

This mod item type allows you to create new filters, that can be used in screenshots taken while in the Photo Mode.
New filters will automatically appear in the Photo Filters field in the Photo Mode. 

Filter Properties
============

Name
-------
The ID of this filter.

Display Name
-------
The name of the filter, as shown to the users.

Shader Filename
-------
The shader you want to use for the filter. Press the "..." button and select the shaders.
If you want to pass a define to your shader this is the place to do it - use the following syntax
ShaderName.fx|MY_DEFINE. This will come to your shader as the following define - PASS_MY_DEFINE.

The shader you create must use the HLSL syntax sprinkled with some of our macros that can be seen from the samples.

Texture1
-------
The first texture your shader can use. Press the "..." button and select the texture.
This field is optional, if your filter does not need it just leave it empty. The format must be tga.

Texture2
-------
The second texture your shader can use. Press the "..." button and select the texture.
This field is optional, if your filter does not need it just leave it empty. The format must be tga.

Run on activation
-----------------
**Run on activation** (filter, data)

Lua code that will be run when the filter is activated. Use it to e.g. hide certain objects from view, place more objects, tweak renderer settings etc.

filter
: the Photo Filter object, for which this function is called.

table data
: an empty table. Use it to store data needed on deactivate.

Run on deactivation
-----------------
**Run on deactivation** (filter, data)

Lua code that will be run when the filter is deactivated. Use it to restore whatever "Run on activation" did.

filter
: the Photo Filter object, for which this function is called.

table data
: the data table, created on activation.

Texture Input
-------
The following textures can be accessed by the shader: 
    * Screen is tex0
    * Depth buffer is tex1
    * GBuffers are tex2, tex3 and tex4
    * Your first custom texture will be tex5
    * Your second custom texture will be tex6 (if you have exported only the second, it will go in tex5)
	
If you use custom textures you will need to define them in the shader with the following syntax:
~~~~
	// <filter-type> is one of Nearest, Bilinear, Trilinear, Anisotropic
	// <wrap-type> is one of Clamp or Repeat
    DefineTextureAndSampler(tex5, FILTER = <filter-type>; WRAP_S = <wrap-type>; WRAP_T = <wrap-type>; );
~~~~	

Apart from the two textures you can add to the shader you have access to the following ones:
    * Screen texture - this is the image before the photo filter, post-tonemapping
    * Depth buffer
    * GBuffers that contain information about the pixel:
        * Normal
        * Base color
        * Special (used for the snow)
        * Roughness
        * Metallic
        * Self illumination (a.k.a. emissive strength)
        * Ambient occlusion
        * Is this pixel terrain

Do not access the GBuffers directly as their format and layout may change in the future - instead, use the following function to decode them:
~~~~
DecodeGBuffers(
	in float4 GBuffer0, in float4 GBuffer1, in float4 GBuffer2, 
	out float3 normal, 
	out float4 basecolor, 
	out float special, 
	out float roughness, 
	out float metallic, 
	out float self_illum, 
	out float ambient_occlusion, 
	out bool is_terrain)
~~~~~

To access the depth buffer, use the following:
~~~~
float texcoords = INTERP(tc).xy; // current pixel
float depth = LinearizeDepth(GetDepth(tex1, texcoords).x, DepthLinearization); // returns world coordinates, i.e. meters
~~~~

(insert footer.md.html here)
<!-- Markdeep: --><style class="fallback">body{visibility:hidden;white-space:pre;font-family:monospace}</style>
<script src="markdeep.min.js"></script>
<script src="https://casual-effects.com/markdeep/latest/markdeep.min.js"></script>
<script>window.alreadyProcessedMarkdeep||(document.body.style.visibility="visible")</script>