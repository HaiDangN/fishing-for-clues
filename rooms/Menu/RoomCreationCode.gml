ini_open("savedata.ini")
global.userId = ini_read_string("userdata", "id", "-kevin");
if (global.userId == "-kevin") {
	global.userId = generate_uuid();
	ini_write_string("userdata", "id", global.userId);
}
ini_close();

logStart();
