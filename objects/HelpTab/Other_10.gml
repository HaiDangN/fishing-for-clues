layer_set_visible("Help" + string(global.Hstep), true);
layer_set_visible("Background1", false);
// Hide Fish Survey
global.lakeSurvey = false;
instance_deactivate_object(LakeSurveyEntry);
instance_activate_object(LevelButton);

if (global.Hstep == 1 || global.Hstep == 1 || global.Hstep == 3) {
	LevelButton.visible = true;
	LevelButton.isActive = true;
}
if (global.Hstep == 2 || global.Hstep == 3 || global.Hstep == 4) {
	BackButton.visible = true;
	BackButton.isActive = true;
}
