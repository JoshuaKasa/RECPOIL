//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	vec4 pixel = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
	float gray = 0.7;
	gl_FragColor = vec4(vec3(gray), pixel.a);
}
