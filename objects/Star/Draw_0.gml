if (t > 0.2 and !isDark) {
	image_speed = 1
} else {
	image_speed = 0	
}
if (isDark) {
	image_blend = c_black
}
draw_self()