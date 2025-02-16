// Initialize variables
global.fish_list = [
	FishId.Empty,
	FishId.Clownfish,
	FishId.Clownfish,
	FishId.Anglerfish,
	FishId.Empty,
	FishId.RedHerring
];

global.fish_shown_start = [
	false,
	true,
	false,
	false,
	false,
	false
];
global.hours = infinity;
global.state = STATES.FREE;
global.Tstep = 0;
global.fishSelected = -1;
global.level = 2;
global.win = false;
global.lose = false;
global.lakeSurvey = false;
global.actionList = [];

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
	var lakeSurveyEntry = instance_create_layer(170, 145 + i*(sprite_get_height(SpriteLakeSurveyEntryCollisionMask)-34), "LakeSurveyEntries", LakeSurveyEntry);
	lakeSurveyEntry.sprite_index = fishIdToSurveySprite(key);
	lakeSurveyEntry.label = string(value);
	lakeSurveyEntry.fishId = key;
	i += 1;
    key = ds_map_find_next(fish_count_map, key);
}