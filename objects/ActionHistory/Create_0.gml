list_items = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 6"]; 
item_height = 100;
view_width = 300;
view_height = 600;
scroll_offset = 0;
scroll_speed = 10;
max_scroll = max(0, array_length(list_items) * item_height - view_height);
surf = -1; // Surface for rendering