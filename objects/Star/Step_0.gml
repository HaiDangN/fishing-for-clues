t += speed;
if (t > 1) t = 1;

// Spiral equation (shrinking radius)
radius *= 0.95; // Shrink over time
angle_offset += spiral_tightness; // Rotate inward

// Convert polar to Cartesian
x = x1 + cos(degtorad(angle_offset)) * radius;
y = y1 + sin(degtorad(angle_offset)) * radius;
