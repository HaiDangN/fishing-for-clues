
function unix_timestamp(datetime = date_current_datetime())
{
    var epoch = floor(date_create_datetime(1970, 1, 1, 0, 0, 0));
    return floor(date_second_span(epoch, datetime));
}

function generate_uuid() {
	random_set_seed(date_datetime_string(date_current_datetime()));
    var timestamp = date_datetime_string(date_current_datetime()); // Get the current time
    var rand1 = irandom(999999); // Random number
    var rand2 = irandom(999999);
    return sha1_string_unicode(string(timestamp) + string(rand1) + string(rand2));
}

function logAction(action, action_num) {
	var _data = {
		level : room_get_name(room),
		action_number: action_num,
		ability: action.ability,
		zone_selected: action.zoneSelected,
		result: action.result,
		hours_left: global.hours
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
