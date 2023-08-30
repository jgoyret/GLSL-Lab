#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

#define PI 3.1415926535

#include "../assets.glsl"
#include "../lygia/draw/hex.glsl"
#include "../lygia/distort/grain.glsl"
#include "../lygia/simulate/fluidSolver.glsl"

void main() {
    
    
	vec2 uv = gl_FragCoord.xy/u_resolution;

    float color = hex(uv, 0.5);

    float color_ = grain(vec2(color * u_time), uv * u_time, 1.);

 
	gl_FragColor = vec4(vec3(color_), 1.); 
}
