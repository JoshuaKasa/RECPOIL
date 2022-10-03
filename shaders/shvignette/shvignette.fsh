uniform vec3 iResolution; 
varying vec2 fragCoord; 
//Vignette parameters:

//Inner radius
#define inner .5
//Outer radius
#define outer 1.2
//Vignette strength/intensity
#define strength .8
//Vignette roundness, higher = smoother, lower = sharper
#define curvature .5

void main( void )
{
    vec2 uv = fragCoord/iResolution.xy;
    vec4 tex = texture2D(gm_BaseTexture,uv);
    
    //Calculate edge curvature
    vec2 curve = pow(abs(uv*2.-1.),vec2(1./curvature));
    //Compute distance to edge
    float edge = pow(abs(length(curve)),curvature);
    //Compute vignette gradient and intensity
    float vignette = 1.-strength*smoothstep(inner,outer,edge);
    
    //Add vignette to the resulting texture2D
    tex.rgb *= vignette;
    gl_FragColor = tex;
}