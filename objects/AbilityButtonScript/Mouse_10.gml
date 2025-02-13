image_xscale = 1.2;
image_yscale = 1.2;

var ability_definition_width = 600;
var pop_up_x = x <= ability_definition_width/2 ? ability_definition_width/2 + 150 : x;
definitionInstance = instance_create_layer(pop_up_x, y - 300, "FishDefinitionLayer", AbilityDefinitionTemplate);
definitionInstance.action = action;