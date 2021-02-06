/// @description Insert description here
// BLank draw events prevent draw_self

dialoguebox_width = sprite_get_width(dialoguebox);
dialoguebox_height = sprite_get_height(dialoguebox);
choicebox_width = sprite_get_width(choicebox);
choicebox_height = sprite_get_height(choicebox);
tallbox_width = sprite_get_width(tallbox);
tallbox_height = sprite_get_height(tallbox);
portrait_width = sprite_get_width(portrait);
portrait_height = sprite_get_height(portrait);
x_padding = 30;


dialo_x = (global.game_width-dialoguebox_width)*0.3;
dialo_y = (global.game_height-dialoguebox_height-100)*0.5;
//text_x_offset = dialo_x+40;

draw_sprite(dialoguebox,0,dialo_x,dialo_y);

draw_sprite(textbox_tab,0,dialo_x,dialo_y);

scribble("Welcome to ScribbleClick")
.starting_format("Font1",11417598)
.draw(dialo_x+40,dialo_y-30);

//Draw Portrait

port_x = 710;
port_y = 180;



draw_sprite_ext(portrait,0,port_x,port_y, 0.6, 0.6, 0, c_white, 1);



//Draw Choicebox
/*
choiceb_x = (global.game_width-choicebox_width)*0.5;
choiceb_y = (global.game_width-choicebox_height-100)*0.5;
draw_sprite(choicebox,0,choiceb_x,choiceb_y);
*/


//We create surfaces andset GPU_set_colorwriteeneable because 
//what we're doing is creating a text-highlight effect.
//This works by drawing the text to a totally transparent surface.
//Then, on that same surface, we draw a colored rectangle however. This time, though, we don't let the GPU
//Write to "Alpha", so only pixels that already have nonzero alpha get the new color.

if (!surface_exists(srf_text_transparency)){ srf_text_transparency = surface_create(global.game_width,global.game_height)};
surface_set_target(srf_text_transparency);
draw_clear_alpha(c_white,0);

//FIGURE OUT YOUR LINE HEIGHT SHIT BRO. WRAPS ETC ALL NEED TO BE A BIG VARIABLE NOW
texttodraw = scribble(diag)
.wrap(450)
.starting_format("Font1",11417598)
.draw(text_x_offset,text_y_offset);


gpu_set_colorwriteenable(true,true,true,false);
//If you want to see the rectangles, undoes the above.
if (global.debughitbox == true){gpu_set_colorwriteenable(true,true,true,true)};

//For every word in locating_targets, defined in create, execute locate_substring on that word.
//Has to happen on the transparent surface as well, because locate_substring is what drops
//Our colored rectangles over the text.
//PS: Be careful using \n linebreaks near substrings. 
//They can mess up the rectangles in some circumstances

	for (var i = 0; i < array_length(locating_targets); i++)
		{
		locate_substring(diag, locating_targets[i], false);
		}
		
		

//Text to transparent surface
surface_reset_target();
gpu_set_colorwriteenable(true,true,true,true);

//Draw our transparent surface, containing the text and the color replacement box, to the screen at the top left.

draw_surface(srf_text_transparency, 0, 0);

//Draw choices.
show_debug_message(true_choice_text);
var m;
for (m = 0; m < ds_list_size(true_choice_text); m++){
show_debug_message(true_choice_text[| m])

}


var i;
for (i = 0; i < ds_list_size(true_choice_text); i ++){
	//draw_text(text_x_offset,400+(20*i),string(i+1)+": " + true_choice_text[| i]);
	scribble(string(i+1)+": " + true_choice_text[| i])
	.starting_format("Font1",c_white)
	.draw(text_x_offset,400+(20*i));
	
}




text_width = string_width(diag)
text_height = string_height(diag)
