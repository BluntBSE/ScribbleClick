// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function screen_conditions(){
	no_condition="";
ds_list_clear(obj_textbox.choice_exits);
ds_list_clear(obj_textbox.true_choice_text);

//Clearing and calling this 60 times a second? dumbo.
var i;	

for (i = 0; i <  array_length(obj_textbox.active_dialogue_choices); i++){
	if (obj_textbox.active_dialogue_choices[i][1] == true){
		ds_list_add(obj_textbox.choice_exits,obj_textbox.active_dialogue_choices[i][2]);
		ds_list_add(obj_textbox.true_choice_text,obj_textbox.active_dialogue_choices[i][0]);
	}
	//See if any 'true' conditions are tripped
	if (obj_textbox.active_dialogue_choices[i][3] != no_condition) {
		if (string_pos(obj_textbox.active_dialogue_choices[i][3],diag)!= 0){
		obj_textbox.active_dialogue_choices[i][1] = true;
		}else{
		obj_textbox.active_dialogue_choices[i][1]=false;
		};
	
	
	}
	//Remove falsehoods from the ears of the innocent
	
	if (obj_textbox.active_dialogue_choices[i][1] = false){
	//Loop thru true_choice_text and choice_exits
	
		var b;
		for (b = 0; b < ds_list_size(obj_textbox.true_choice_text); b++){
			if obj_textbox.true_choice_text[| b] = obj_textbox.active_dialogue_choices[i][0]{
			
			
			ds_list_delete(obj_textbox.true_choice_text, b);
		
		
			b--;
			};
		
		}
	
	
	
	};
	
	
	
}
}