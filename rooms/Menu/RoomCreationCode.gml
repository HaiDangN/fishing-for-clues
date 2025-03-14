ini_open("savedata.ini")
global.userId = ini_read_string("userdata", "id", "-kevin");
if (global.userId == "-kevin") {
	global.userId = generate_uuid();
	ini_write_string("userdata", "id", global.userId);
}
global.group = ini_read_string("userdata", "group", "Z");
if (global.group == "Z") {
	global.group = irandom(1) == 1 ? "A" : "B";
	ini_write_string("userdata", "group", global.group);
	
}
ini_close();

logStart();
