enum STATES {
	FREE,
	SCAN_PICK_ZONE,
	SCAN_PICK_FISH,
	FISH_PICK_ZONE,
	DATA_PICK_FISH,
	DATA_PICK_ZONE,
	ANGLERFISH_PICK_ZONE,
	MARK_PICK_FISH,
	MARK_PICK_ZONE
}

function isStatePickingFish() {
	return global.state == STATES.DATA_PICK_FISH or global.state == STATES.SCAN_PICK_FISH or global.state == STATES.MARK_PICK_FISH or global.state == STATES.MARK_PICK_ZONE;	
}
function isStateMarking() {
	return global.state == STATES.MARK_PICK_FISH or global.state == STATES.MARK_PICK_ZONE;	
}
function Action(_ability, _result, _zoneSelected, _fishSelected) constructor {
    ability = _ability;
    result = _result;
    zoneSelected = _zoneSelected;
    fishSelected = _fishSelected;
}