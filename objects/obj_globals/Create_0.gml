global.game_width = 1024;
global.game_height = 576;
display_set_gui_size(global.game_width,global.game_height);
scribble_font_add_all();
scribble_font_set_default("Font1");


/*
These global variables are modified by locate_substring() to track the first and second words clicked,
and to track their position in the array of arguments as they move around.
Not necessary to use locate_substring().
*/
global.held_word_1 = "";
global.held_word_2 = "";
global.swap_index_1 = 0;
global.swap_index_2 = 0
global.swapallowed = false;

//This turns false when you activate debugging. It's just so I can pass it into the 'outline' part of the hitboxes.
global.debughitbox = false;
