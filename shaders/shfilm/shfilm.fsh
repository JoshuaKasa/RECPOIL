//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	gl_FragColor = texture2D(gm_BaseTexture, v_vTexcoord);
	gl_FragColor -= clamp(mod(floor(gl_FragCoord.y), 2.0), 0.0, 1.0);
}
