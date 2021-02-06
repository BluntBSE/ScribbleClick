/// @description Insert description here
// You can write your code in this editor

active_dialogue = obj_dialoguemanager.room_dialogue[? "openingscreen"];
active_dialogue_choices = active_dialogue[1];
diag = string(active_dialogue[0][0]);

locating_targets = active_dialogue[0][2];

screen_conditions();

//Shader

Color = function (r, g, b) constructor {
	red = r;
	green = g;
	blue = b;
	
	static toShaderValue = function (value) {
		return value / 255;
	}
};

colorMatch = new Color(255, 255, 255);
colorReplace = new Color(234, 48, 255);

sh_handle_range = shader_get_uniform(shd_color_replace, "range");
sh_handle_match = shader_get_uniform(shd_color_replace, "colorMatch");
sh_handle_replace = shader_get_uniform(shd_color_replace, "colorReplace");