// Later change to put in an if statement
// whether they found the correct fish or not
global.hours -= 1;
global.hours +=1;

if (global.hours <= 0) {
	global.hours = 0; // this is so that display shows 0 before game restarts
	show_message("You failed to complete it in time");
}
