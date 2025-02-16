ini_open("savedata.ini")
global.userId = ini_read_string("userdata", "id", "-1");
if (global.userId == "-1") {
	global.userId = generate_uuid();
	ini_write_string("userdata", "id", global.userId);
}
ini_close();
