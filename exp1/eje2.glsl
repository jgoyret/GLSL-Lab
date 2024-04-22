#ifdef GL_ES
precision mediump float;
#endif

uniform sampler2D u_buffer0;

uniform float redCircleSize;
uniform float greenCircleSize;
uniform float blueCircleSize;

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

#include "../lygia/space/rotate.glsl"
#include "../lygia/generative/curl.glsl"

#define PI 3.1415926535

void _main(){
    vec2 uv=gl_FragCoord.xy/u_resolution;
    
    float n=snoise(uv*2.-sin(1.*u_time));
    
    vec2 desplazamiento1=vec2(sin(u_time),cos(u_time));
    vec2 desplazamiento2=vec2(sin(u_time*4.),cos(u_time*4.));
    vec2 desplazamiento3=vec2(sin(u_time*2.),cos(u_time*2.));
    
    float c1=step(redCircleSize-n*.05,distance(uv-.2*desplazamiento1,vec2(.5-n*.01*sin(uv*rotate(uv,u_time)*150.))));
    
    float c2=step(greenCircleSize-n*.01,distance(uv-.1*desplazamiento2,vec2(.5-n*.01*sin(uv*rotate(uv,u_time)*150.))));
    
    float c3=step(blueCircleSize-n*.02,distance(uv-.2*desplazamiento3,vec2(.5-n*.1-n*.01*sin(uv*rotate(uv,u_time)*150.))));
    
    gl_FragColor=vec4(vec3(1.-c1,1.-c2,1.-c3),1.);
}

#ifdef BUFFER_0
void main(){
    _main();
}
#else
void main(){
    _main();
}
#endif
