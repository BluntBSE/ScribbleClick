/// @description Insert description here
// You can write your code in this editor

/*In this project, scr_ChangeRoom sets the strings to look for and options to display
based on text entered in obj_dialoguemanager. Not needed for locate_substring(), but maybe a nice way to organize
branching dialogue.
*/

var u;

for (u = 0; u < ds_list_size(choice_exits); u++){


if keyboard_check_released(ord(string(u+1))){
//+1 prevents you from having to use 0! This allows 1-9. Don't have more choices than 9
change_room(choice_exits[| u]);

};

};



//Enable word swap mechanic
if keyboard_check_released(ord("0")) {
	

if global.debughitbox == false{ global.debughitbox = true}
else{global.debughitbox = false}

}



//Acquire targets to locate





