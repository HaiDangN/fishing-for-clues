
image_xscale = 6;
image_yscale = 6;
t = 0; // Progress (0 to 1)
speed = 0.001; // Adjust speed

// Starting position
x0 = x;
y0 = y;

// Destination (final point in center)
x1 = target_x;
y1 = target_y;

// Convert to polar coordinates
angle_offset = angle_offset; // Different starting angles
radius = 500; // Initial radius
spiral_tightness = 3; // Adjusts the spiral curve