#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

#define PI 3.1415926535

#include "./assets.glsl"

void main() {
    
    
	vec2 uv = gl_FragCoord.xy/u_resolution;

	float color1 = sin((uv.y) * 10.) + sin(5. * 0.05) ;
	float color2 = triangular((uv.x + 0.25) * pow(uv.x * 100.0, 0.4));
    float color = mix(color2, color1, cos(5. * PI/9.) / uv.y);

    vec3 colorPal = pal(color, vec3(0.062, 0.218, 0.438), vec3(1.073, 0.114, 0.278), vec3(2.385, 3.138, 0.485), vec3(1.672, 0.502, 1.332));

	gl_FragColor = vec4(colorPal , 1.); 
}
