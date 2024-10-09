void main () {
    vec2 uv = gl_FragCoord.xy / iResolution.xy;
    vec2 xy = 2.0 * (uv - 0.5);
    xy.x *= iResolution.x / iResolution.y;

    float d = length(xy);

    gl_FragColor = vec4(d, d, d, 1.0);
}