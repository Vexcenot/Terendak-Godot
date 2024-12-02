shader_type canvas_item;

uniform float feather_size = 0.2; // Feather width
uniform vec4 edge_color = vec4(0.0, 0.0, 0.0, 0.0); // Fade color
uniform bool affect_left_side = true; // If true, affects the left side; otherwise, the right side.

void fragment() {
    // Get the UV coordinates
    vec2 uv = UV;

    // Calculate distance from the edge (left or right)
    float edge_distance = affect_left_side ? uv.x : (1.0 - uv.x);

    // Create a fade effect based on the selected side's distance
    float alpha = smoothstep(0.0, feather_size, edge_distance);

    // Mix the edge color with the sprite's color
    vec4 base_color = texture(TEXTURE, uv);
    COLOR = mix(edge_color, base_color, alpha);
}
