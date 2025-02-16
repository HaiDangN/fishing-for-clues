
// description and any other graphics
if (fishId == FishId.Anglerfish) {
	draw_sprite(AnglerfishDefinition, 0, x, y)
} else if (fishId == FishId.RedHerring) {
	draw_sprite(RedHerringDefinition, 0, x, y)
} else if (fishId == FishId.Empty) {
	draw_sprite(EmptyZoneDefinition, 0, x, y)
} else if (fishId == FishId.Clownfish) {
	draw_sprite(ClownfishDefinition, 0, x, y)
} else if (fishId == FishId.Primefish) {
	draw_sprite(PrimefishDefinition, 0, x, y)
} else if (fishId == FishId.Goldfish) {
	draw_sprite(GoldfishDefinition, 0, x, y)
}