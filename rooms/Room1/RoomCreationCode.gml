global.fish_list = [FishId.RedHerring, FishId.Empty, FishId.Anglerfish, FishId.Empty]
global.state = STATES.FREE;


// Eventually change to be 1 entry per type of fish with the count
for (var i = 0; i < array_length(global.fish_list); i++) {
	var lakeSurveyEntry = instance_create_layer(103, 128 + i*50, "Instances", LakeSurveyEntry);
	lakeSurveyEntry.mask_index = SpriteLakeSurveyEntryCollisionMask;
	lakeSurveyEntry.sprite_index = fishIdToIcon(global.fish_list[i]);
	lakeSurveyEntry.label = fishIdToString(global.fish_list[i]);
}