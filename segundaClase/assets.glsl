#ifdef GL_ES
precision mediump float;
#endif

float square(float x)
{
    return step(.5,fract(x));
}

float sinus(float x)
{
    return sin(x);
}

float ramp(float x)
{
    return fract(x);
}

float triangular(float x){
    return abs((x-2.*floor(x/2.))-1.);
}

vec3 hsb2rgb(in vec3 c){
    vec3 rgb=clamp(abs(mod(c.x*6.+vec3(0.,4.,2.),6.)-3.)-1.,0.,1.);
    rgb=rgb*rgb*(3.-2.*rgb);
    return c.z*mix(vec3(1.),rgb,c.y);
}

vec3 pal(in float t,in vec3 a,in vec3 b,in vec3 c,in vec3 d)
{
    return a+b*cos(6.28318*(c*t+d));
}