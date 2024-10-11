void main () {
    vec2 uv = gl_FragCoord.xy / iResolution.xy;
    vec2 xy = 2.0 * (uv - 0.5);
    xy.x *= iResolution.x / iResolution.y;

    float d = length(xy);
    d = abs(d - 0.5);
    d = step(0.1, d);

    gl_FragColor = vec4(d, d, d, 1.0);
}