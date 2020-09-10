//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.	
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//-------------------------------------------------------------------
// BLUR Fragment Shader:
// 2-PASS with DISCRETE samples
//-------------------------------------------------------------------
// - Vertex Shader is a pass-though shader
// - blur_vector:  (1.0, 0.0) for horizontal blur
//                 (0.0, 1.0) for vertical blur
// - texel_size:   (image uv width) / (image pixel width)
//                 where image uv width is 1 if image is on a
//                 seperate texture page or is a surface
// - clamp:        add clamp() if image is a sprite not on its own
//                 texture page:
//                 clamp(v_vTexcoord [...] * blur_vector, 0, 1)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 blur_vector;
uniform vec2 texel_size;

void main()
{
   highp vec4 blurred_col;
   vec2 offset_factor = texel_size * blur_vector;

   blurred_col += texture2D(gm_BaseTexture, v_vTexcoord - 4.0 * offset_factor) * 0.0544095;
   blurred_col += texture2D(gm_BaseTexture, v_vTexcoord - 3.0 * offset_factor) * 0.0879394;
   blurred_col += texture2D(gm_BaseTexture, v_vTexcoord - 2.0 * offset_factor) * 0.1239135;
   blurred_col += texture2D(gm_BaseTexture, v_vTexcoord - 1.0 * offset_factor) * 0.1522228;

   blurred_col += texture2D(gm_BaseTexture, v_vTexcoord) * 0.1630297;

   blurred_col += texture2D(gm_BaseTexture, v_vTexcoord + 1.0 * offset_factor) * 0.1522228;
   blurred_col += texture2D(gm_BaseTexture, v_vTexcoord + 2.0 * offset_factor) * 0.1239135;
   blurred_col += texture2D(gm_BaseTexture, v_vTexcoord + 3.0 * offset_factor) * 0.0879394;
   blurred_col += texture2D(gm_BaseTexture, v_vTexcoord + 4.0 * offset_factor) * 0.0544095;

   gl_FragColor = v_vColour * blurred_col;
}

