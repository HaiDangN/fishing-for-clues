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