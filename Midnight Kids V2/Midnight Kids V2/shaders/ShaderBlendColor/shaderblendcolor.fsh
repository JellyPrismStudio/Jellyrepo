//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float colorR;
uniform float colorG;
uniform float colorB;

void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord ) * vec4(colorR,colorG,colorB,1.0);
}
