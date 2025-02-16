switch (global.level)
{
    case 0: room_goto(Level1); break;
    case 1: room_goto(Level2); break;
    case 2: room_goto(Level3); break;
	case 3: room_goto(Level4); break;
	
	// Change this to level 5 when we implement it.
	case 4: room_goto(Level4); break;
}