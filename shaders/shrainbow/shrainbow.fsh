varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float time;
uniform float blackness;

vec3 hsv2rgb(vec3 c) 
{
    vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
    vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
    return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
}

void main() 
{
    vec3 col = hsv2rgb(vec3(v_vTexcoord.y + (time * 0.1 * -1.0), 1.0, 1.0)) * blackness;
    gl_FragColor = vec4(col, 1.0) * texture2D(gm_BaseTexture, v_vTexcoord);
}