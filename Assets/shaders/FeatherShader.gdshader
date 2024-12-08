shader_type canvas_item;

uniform float feather_size = 0.2; // Feather width
uniform vec4 edge_color = vec4(0.0, 0.0, 0.0, 0.0); // Fade color

void fragment() {
    // Get the UV coordinates
    vec2 uv = UV;

    // Calculate distance from both edges (left and right)
    float left_distance = uv.x;
    float right_distance = 1.0 - uv.x;

    // Use the minimum distance to create a fade effect on both sides
    float edge_distance = min(left_distance, right_distance);

    // Create a smooth fade effect based on the edge distance
    float alpha = smoothstep(0.0, feather_size, edge_distance);

    // Mix the edge color with the sprite's color
    vec4 base_color = texture(TEXTURE, uv);
    COLOR = mix(edge_color, base_color, alpha);
}
