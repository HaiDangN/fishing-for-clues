switch (global.level)
{
    case 0: room_goto(Level1); break;
    case 1: room_goto(Level2); break;
    case 2: room_goto(Level3); break;
	case 3: room_goto(Level4); break;
	case 4: room_goto(Level5); break;
	case 5: room_goto(Level6); break;
	case 6: room_goto(Level7); break;
	case 7: room_goto(Level8); break;
	case 8: room_goto(Level9); break;
	// Replace with level 8 later.
	case 9: room_goto(EndOfLevels); break;
	
	default: GenericTextbox.label = ("Either we're out of levels or the game broke. Report to the Devs");
}