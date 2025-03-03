enum FishId {
	Anglerfish,
	RedHerring,
	Clownfish,
	Primefish,
	Goldfish,
	Empty
}

function fishIdToString(fishId) {
	switch(fishId) {
		case FishId.Anglerfish:
			return "Anglerfish";
		case FishId.RedHerring:
			return "Red Herring";
		case FishId.Clownfish:
			return "Clownfish";
		case FishId.Primefish:
			return "Primefish";
		case FishId.Goldfish:
			return "Goldfish";
		case FishId.Empty:
			return "Empty";
		default:
			return "Kevin"; // This is the wrong case and if you see Kevin somewhere, it means something wrong with the given FishId
	
	}
}

function fishIdToInitial(fishId) {
	switch(fishId) {
		case FishId.Anglerfish:
			return "A";
		case FishId.RedHerring:
			return "R";
		case FishId.Clownfish:
			return "C";
		case FishId.Primefish:
			return "P";
		case FishId.Goldfish:
			return "G";
		case FishId.Empty:
			return "E";
		default:
			return "Kevin"; // This is the wrong case and if you see Kevin somewhere, it means something wrong with the given FishId
	
	}
}
function fishIdToSurveySprite(fishId) {
	switch(fishId) {
		case FishId.Anglerfish:
			return AnglerfishSurveySprite;
		case FishId.RedHerring:
			return RedHerringSurveySprite;
		case FishId.Clownfish:
			return ClownfishSurveySprite;
		case FishId.Primefish:
			return PrimefishSurveySprite;
		case FishId.Goldfish:
			return GoldfishSurveySprite;
		case FishId.Empty:
			return EmptyZoneSurveySprite;
		default:
			return "Kevin"; // This is the wrong case and if you see Kevin somewhere, it means something wrong with the given FishId
	}
}

function fishIdToIcon(fishId) {
	switch(fishId) {
		case FishId.Anglerfish:
			return SpriteAnglerFish;
		case FishId.RedHerring:
			return SpriteRedHerring;
		case FishId.Clownfish:
			return SpriteClownFish;
		case FishId.Primefish:
			return SpritePrimeFish;
		case FishId.Goldfish:
			return SpriteGoldFish;
		case FishId.Empty:
			return SpriteTrulyEmptyZone;
		default:
			return SpriteNextButton; // This is the wrong case and if you see Kevin somewhere, it means something wrong with the given FishId
	
	}
}

function isFishSelectable(fishId) {
	return fishId != FishId.Anglerfish and fishId != FishId.Empty;	
}
global.fishSelected = -1;

function revealedFish() {
	var count = 0;
	for (var i = 0; i < array_length(global.zone_list); i++) {
		if (global.zone_list[i].show_fish) {
			count += 1;
		}
	}
	return count;
}

// Reads fish list to see how many non-empty fish there are
function fishCount() {
	var count = 0;
	for (var i = 0; i < array_length(global.fish_list); i++) {
		if (global.fish_list[i] != FishId.Empty) {
			count += 1;
		}
	}
	return count;
}

// returns true if the zoneId given is of a zone adjacent to the given fish
// if requireRevealed is true, 
// even if the zone is adjacent to the given fish but the fish is not revealed,
// it returns false
function zoneAdjacentToFish(zoneId, fishId, requireRevealed=true) {
	var counterClockwiseZone = global.zone_list[(zoneId + array_length(global.zone_list) - 1) % array_length(global.zone_list)]
	var clockWiseZone =  global.zone_list[(zoneId + 1) % array_length(global.zone_list)]
	var counterClockwiseZoneHasFish = counterClockwiseZone.fishId == fishId;
	var clockWiseZoneHasFish = clockWiseZone.fishId == fishId;
	var isAdjacent = counterClockwiseZoneHasFish  or clockWiseZoneHasFish;
	var canReveal = !requireRevealed or ((clockWiseZoneHasFish and clockWiseZone.show_fish) or (counterClockwiseZoneHasFish and counterClockwiseZone.show_fish))
	return canReveal;
}