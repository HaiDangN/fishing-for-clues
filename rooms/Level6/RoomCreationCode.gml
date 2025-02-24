// Initialize variables
// Scenario 1
global.fish_list = [
	FishId.Clownfish,
	FishId.Clownfish,
	FishId.Primefish,
	FishId.Goldfish,
	FishId.Empty,
	FishId.Goldfish,
	FishId.Clownfish,
	FishId.Clownfish,
	FishId.RedHerring,
	FishId.Empty,
	FishId.Primefish,
	FishId.Anglerfish
];

global.fish_shown_start = [
	false,
	true,
	false,
	false,
	false,
	false,
	true,
	false,
	true,
	false,
	false,
	false,
];

// Debug
//global.fish_shown_start = array_create(8, true);

// Time Set
global.hours = 12;

global.state = STATES.FREE;
global.Tstep = -1;
global.fishSelected = -1;
global.level = 6;
global.win = false;
global.lose = false;
global.actionList = [];

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
	var lakeSurveyEntry = instance_create_layer(178, 178 + i*(60+ 6), "LakeSurveyEntries", LakeSurveyEntry);
	lakeSurveyEntry.sprite_index = fishIdToSurveySprite(key);
	lakeSurveyEntry.label = string(value);
	lakeSurveyEntry.fishId = key;
	lakeSurveyEntry.visible = true;
	i += 1;
    key = ds_map_find_next(fish_count_map, key);
}

instance_activate_object(FindAnglerButton);
instance_activate_object(GoFishButton);
instance_activate_object(ScanButton);
instance_activate_object(SendDataButton);
			
FindAnglerButton.visible = true;
GoFishButton.visible = true;
ScanButton.visible = true;
SendDataButton.visible = true;

LakeSurveyEntry.visible = true;
LakeCreator.visible = true;
layer_set_visible("LakeSurveyEntries", true);