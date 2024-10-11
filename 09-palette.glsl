const float PI = 3.14159265;

vec3 palette(float t) {
    vec3 a = vec3(0.5, 0.5, 0.5);
    vec3 b = vec3(0.5, 0.5, 0.5);
    vec3 c = vec3(1.0, 1.0, 1.0);
    vec3 d = vec3(0.263, 0.416, 0.557);

    return a + b * cos(2.0*PI*(c*t+d));
}

void main () {
    vec2 uv = gl_FragCoord.xy / iResolution.xy;
    vec2 xy = 2.0 * (uv - 0.5);
    xy.x *= iResolution.x / iResolution.y;

    float d = length(xy);
    const float k = 8.0;
    float i = 0.02 / abs(sin(k*d + iTime) / k);
    
    vec3 col = i * palette(d);

    gl_FragColor = vec4(col, 1.0);
}