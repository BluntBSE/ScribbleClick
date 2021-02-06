// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function change_room(key){
	obj_textbox.active_dialogue = obj_dialoguemanager.room_dialogue[? key];
	obj_textbox.diag  = obj_dialoguemanager.room_dialogue[? key][0][0];
	obj_textbox.active_dialogue_choices = obj_dialoguemanager.room_dialogue[? key][1];
	locating_targets = obj_dialoguemanager.room_dialogue[? key][0][2];
	
	//Flush global held words. If you don't do this, you'll copy words from prior frames.
	global.held_word_1 = "";
	global.held_word_2 = "";
	//Flush dialogue options
	ds_list_clear(obj_textbox.true_choice_text);
	ds_list_clear(obj_textbox.choice_exits);
};
