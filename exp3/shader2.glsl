#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

#define PI 3.1415926535

#include "../assets.glsl"

void main(){
	
	vec2 uv=gl_FragCoord.xy/u_resolution;
	
	float color1=sin(uv.x*9.)+sin(u_time);
	float color2=triangular(uv.y*pow(9.,tan(u_time/2.)));
	float color3=square(uv.x*9.);
	float colorR=mix(color3,color1,cos(u_time*PI/9.)/uv.x);
	float colorG=mix(color2,color1,cos(u_time*PI/9.)/uv.x);
	float colorB=mix(color3,color2,cos(u_time*PI/9.)/uv.x);
	
	vec3 color=vec3(colorR,colorG,colorB);
	
	gl_FragColor=vec4(color,1.);
}
