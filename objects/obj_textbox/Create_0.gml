/// @Initalize local and global variables


diag = "";
text_x_offset = 170;
text_y_offset = 178;


locating = false;
//Surfaces hae to be initiated with some kind of value at create.
srf_text_transparency = -1;


//List of strings to check for if you are adding options after word swaps.
//Not necessary for locate_substring.
//Lists are added to in the step event.
choice_exits = ds_list_create();
true_choice_text = ds_list_create();
no_condition = "";


//Assets for textbox itself

dialoguebox = spr_dialoguebox1;
choicebox = spr_choicebox;
tallbox = spr_tallbox;
portrait=spr_vladimir;


//Shader
