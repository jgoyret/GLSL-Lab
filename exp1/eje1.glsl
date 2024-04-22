#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;
uniform sampler2D u_buffer0;

#define PI 3.1415926535

#include "../assets.glsl"
#include "../lygia/generative/cnoise.glsl"
#include "../lygia/morphological/pyramid/downscale.glsl"

void main(){
    
    vec2 uv=gl_FragCoord.xy/u_resolution;
    
    float color1=distance(sin((uv.x)*fract(uv.x)),u_time*uv.x);
    
    float noise1=cnoise(vec2(color1)*20.*sin(u_time));
    
    float color2=distance(sin((uv.y)*fract(uv.y)),u_time*uv.x);
    
    float noise2=cnoise(vec2(color2)*20.*cos(u_time));
    
    float color=mix(noise1,noise2,sin(u_time));
    
    vec4 color_=pyramidDownscale(u_buffer0,vec2(color)*2.,vec2(color)*3.);
    
    gl_FragColor=vec4(color_);
}

