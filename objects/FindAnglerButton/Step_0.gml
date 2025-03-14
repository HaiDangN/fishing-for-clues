
if (revealedFish()	> fishCount()/2 or (global.level == 1 and revealedFish() == 1)) {
	visible = true;	
	if (revealedFish() == fishCount() - 1 and variable_global_exists("group") and global.group == "A") {
		instance_deactivate_object(GoFishButton)
		instance_deactivate_object(ScanButton)
		instance_deactivate_object(SendDataButton) 
	}
} else {
	visible = false;
}
