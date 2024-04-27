#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

#define PI 3.1415926535;

#include "../assets.glsl"
#include "../lygia/distort/grain.glsl"

float plot(vec2 st,float pct){
    return smoothstep(pct-.02,pct,st.y)-
    smoothstep(pct,pct+.02,st.y);
}

void main(){
    
    vec2 uv=gl_FragCoord.xy/u_resolution;
    
    float y=smoothstep(.1,.9,uv.x);
    float x=smoothstep(.1,.9,uv.y);
    
    vec3 color1=vec3(y);
    vec3 color2=vec3(x);
    
    float pct1=plot(uv,y);
    float pct2=abs(sin(u_time));
    
    color1=(1.-pct1)*color1+pct1*vec3(0.,1.,0.)*sin(u_time)*.1;
    color2=(1.-pct2)*color2+pct2*vec3(1.,0.,0.)*sin(u_time)*.1;
    
    vec3 color=mix(color1,color2,tan(u_time*.1));
    
    gl_FragColor=vec4(fract(color),1.);
}
