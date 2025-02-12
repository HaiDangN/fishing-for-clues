if (global.state == STATES.FREE) {
    global.state = STATES.FISH_PICK_ZONE;
} else if (global.state == STATES.FISH_PICK_ZONE) {
    global.state = STATES.FREE;
}