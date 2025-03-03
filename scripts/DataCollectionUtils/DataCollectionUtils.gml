
function unix_timestamp(datetime = date_current_datetime())
{
    var epoch = floor(date_create_datetime(1970, 1, 1, 0, 0, 0));
    return floor(date_second_span(epoch, datetime));
}

function generate_uuid() {
	random_set_seed(unix_timestamp());
    var timestamp = date_datetime_string(date_current_datetime()); // Get the current time
    var rand1 = irandom(999999); // Random number
    var rand2 = irandom(999999);
    return sha1_string_unicode(string(timestamp) + string(rand1) + string(rand2));
}

function logAction(action, action_num) {
	if (variable_global_exists("userId")) {
		
		var _data = {
			level : room_get_name(room),
			action_number: action_num,
			ability: action.ability,
			zone_selected: action.zoneSelected,
			result: action.result,
			hours_left: global.hours,
			fish_revealed: revealedFish()
		};
		if (_data.ability == "Data" or _data.ability == "Scan") {
			_data.fishSelected = fishIdToString(action.fishSelected);
		}
		var _json = json_stringify(_data);
		date_set_timezone(timezone_utc);
		show_debug_message(string(unix_timestamp()));
		var path = string("users/{0}/actions/{1}", global.userId, string(unix_timestamp()));
		FirebaseFirestore(path).Set(_json);
	}
}

function logIdle(timeSinceStart) {
	var _data = {
		idle_start: timeSinceStart	
	}
	
	var _json = json_stringify(_data);
	var path = string("users/{0}", global.userId);
	FirebaseFirestore(path).Update(_json);
}

function logCloseGame(timeSinceStart) {
	var _data = {
		game_closed_time: timeSinceStart	
	}
	
	var _json = json_stringify(_data);
	var path = string("users/{0}", global.userId);
	FirebaseFirestore(path).Update(_json);
}

function logStart() {
	if (variable_global_exists("userId")) {
		var _data = {
			game_start_timestamp: unix_timestamp()
		}
		if (os_type == os_gxgames) {
			
			var _info = os_get_info();   
				show_debug_message("Checking mobile")
		        _data.mobile = _info[? "mobile"] == 1.0;
		 
		}
		var _json = json_stringify(_data);
		var path = string("users/{0}", global.userId);
		FirebaseFirestore(path).Update(_json);
	}
}

function logMark(action, action_num) {
	if (variable_global_exists("userId")) {
		
		var _data = {
			level : room_get_name(room),
			action_number: action_num,
			ability: action.ability,
			zone_selected: action.zoneSelected,
			result: string(action.result),
			hours_left: global.hours,
			fish_revealed: revealedFish(),
			fishSelected: fishIdToString(action.fishSelected)
		};
		
		var _json = json_stringify(_data);
		date_set_timezone(timezone_utc);
		show_debug_message(string(unix_timestamp()));
		var path = string("users/{0}/marks/{1}", global.userId, string(unix_timestamp()));
		FirebaseFirestore(path).Set(_json);
	}
}