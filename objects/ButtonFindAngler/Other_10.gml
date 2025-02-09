global.hours -= 4;
global.selecting_fish = true; // Enables fish selection mode

if (global.hours <= 0) {
	global.hours = 0; // this is so that display shows 0 before game restarts
	show_message("You failed to complete it in time");
}
