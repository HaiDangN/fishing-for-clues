// Initialize variables
global.fish_list = [
	FishId.RedHerring,
	FishId.Empty,
	FishId.Anglerfish,
	FishId.Empty
];
global.hours = infinity;
global.state = STATES.FREE;
global.Tstep = 1;
global.tutDone = false;
global.lakeSurvey = false;
global.Hstep = 4;
global.level = 1;
global.win = false;
global.lose = false;
global.actionList = [];

BackButton.isActive = false
BackButton.visible = false

draw_set_font(PixelFont);

var fish_count_map = ds_map_create();
// Eventually change to be 1 entry per type of fish with the count
for (var i = 0; i < array_length(global.fish_list); i++) {
//for (var i = 0; i < 1; i++) {	
	if (ds_map_exists(fish_count_map, global.fish_list[i])) {
		fish_count_map[? global.fish_list[i]] += 1;
	} else {
		fish_count_map[? global.fish_list[i]] = 1;
	}
}

var i = 0; 

// We could potentially iterate over the enums to get a consistent order
// Right now, order might be related to where they first appear in the fish_list
var key = ds_map_find_first(fish_count_map);
while (key != undefined) {
    var value = fish_count_map[? key];
	var lakeSurveyEntry = instance_create_layer(177, 408 + i*66, "LakeSurveyEntries", LakeSurveyEntry);
	lakeSurveyEntry.sprite_index = fishIdToSurveySprite(key);
	lakeSurveyEntry.label = string(value);
	lakeSurveyEntry.fishId = key;
	
	i += 1;
    key = ds_map_find_next(fish_count_map, key);
}