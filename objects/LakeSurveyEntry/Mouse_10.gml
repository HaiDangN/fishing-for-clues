if (visible == true) {
	definitionCardInstance = instance_create_layer(x, max(y - 228, 0), "FishDefinitionLayer", FishDefinitionTemplate);
	definitionCardInstance.fishId = fishId;
}