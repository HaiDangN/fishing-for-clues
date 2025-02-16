if (visible == true) {
	definitionCardInstance = instance_create_layer(x, y - 228, "FishDefinitionLayer", FishDefinitionTemplate);
	definitionCardInstance.fishId = fishId;
}