shader_type canvas_item;

// Uniforms for customization
uniform float border_width = 1.0; // Width of the border
uniform vec4 border_color = vec4(1.0, 0.0, 0.0, 1.0); // Initial color (red)
uniform float time_speed = 1.0; // Speed of color change

void fragment() {
    // Simple animation for the border color based on time
    vec4 animated_color = vec4(
        abs(sin(TIME * time_speed)), // Red channel
        abs(cos(TIME * time_speed)), // Green channel
        abs(sin(TIME * time_speed * 0.5)), // Blue channel
        1.0 // Alpha channel
    );

    // Set the border color as animated
    COLOR = animated_color;
}
