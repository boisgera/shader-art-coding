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
    vec2 xy0 = xy;
    vec3 finalColor = vec3(0.0);

    for (float j=0.0; j<3.0; j++) {
        xy = fract(2.0*xy) - 0.5;
        float d = length(xy);
        const float k = 8.0;
        float i = 0.02 / abs(sin(k*d + iTime) / k);
        
        finalColor += i * palette(length(xy0) + 0.4*iTime);
    }

    gl_FragColor = vec4(finalColor, 1.0);
}