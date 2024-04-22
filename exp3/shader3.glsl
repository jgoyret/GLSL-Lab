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
	
	float color1=sin((uv.y)*10.)+sin(u_time*.05);
	float color2=triangular(uv.x*sin(pow(uv.x*100.,sin(u_time/10.))));
	float color3=square(uv.y/sin(u_time*.02)+.2);
	
	float color_=mix(color2,color1,cos(u_time*PI/9.)/uv.y);
	vec3 colorPal=pal(color_,vec3(.062,.218,.438),vec3(1.073,.114,.278),vec3(2.385,3.138,.485),vec3(1.672,.502,1.332));
	
	gl_FragColor=vec4(colorPal,1.);
}

//orange-blue
//vec3(0.500, 0.500, 0.500), vec3(0.500, 0.500, 0.500), vec3(0.800, 0.800, 0.500), vec3(0.000, 0.200, 0.500)

//custom
//vec3(0.062, 0.218, 0.438), vec3(1.073, 0.114, 0.278), vec3(2.385, 3.138, 0.485), vec3(1.672, 0.502, 1.332)
