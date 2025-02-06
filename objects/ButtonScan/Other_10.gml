global.hours -= 2;

if (global.hours <= 0) {
	global.hours = 0; // this is so that display shows 0 before game restarts
	show_message("You failed to complete it in time");
}
