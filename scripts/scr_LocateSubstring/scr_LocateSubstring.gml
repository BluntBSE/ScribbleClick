

function locate_substring(origstring, substring, debugmode){


//Finds position of a given substring in the array of targets, locating_targets the given screen provides

var q;
for (q = 0; q < array_length(obj_textbox.locating_targets); q++){
	
	if obj_textbox.locating_targets[q] = substring{
		
	var substring_index=q;
	break;

	}

}

//If there's only one thing in locating_targets, the index is 0.

if(array_length(obj_textbox.locating_targets) = 1){
substring_index=0;
}


//VARIABLES


iterating_string = "";
final_x_offset=0;
striptest = "";
stripping=false;
scrib_diag = obj_textbox.diag;
substring_charpos = string_pos(substring, origstring)
linebreak_check = 1;
lookahead_string="";
lookahead_test="";
stripped_dialogue = "";
stripped_test="";
breaktest=true;
line_increment = 1;
stripping_preceding=false;
text_x_offset = obj_textbox.text_x_offset;
text_y_offset = obj_textbox.text_y_offset;
preceding_string_test = "";

string_preceding_target = string_copy(origstring, 1, substring_charpos);

strip_count = 0;
stringstorage1="";
stringstorage2="";


//This loop takes out all the command tags from the original string. Filters out brackets.
var i;
for ( i = 1; i <= string_length(scrib_diag); i++){

striptest = string_copy(scrib_diag,i,1);
striptest_ahead = string_copy(scrib_diag,i+1,1);


	

if (striptest = "["){
	
		stripping = true;
	};
	
	if(striptest = "]")&(striptest_ahead != "["){
		i++;
		stripping=false
	};

	if (stripping=false){
		
		stripped_dialogue += string_copy(diag,i,1);
	

	}
	
	


}  

//Get a count of all stripped characters before the substring

var o;
for ( o = 1; o <= string_length(string_preceding_target); o++){

if debugmode = true{
// show_debug_message("Preceding string is" + string_preceding_target);
}	


striptest_preceding = string_copy(scrib_diag,o,1);
striptest_preceding_ahead = string_copy(scrib_diag,o+1,1);


	

if (striptest_preceding = "["){
	
	stripping_preceding = true;
	};
	//+=1 here is because we WANT to include the right bracket in the list of stripped characters we count, unlike earlier loop, which just passes over them.
	if(striptest_preceding = "]")&(striptest_preceding_ahead != "["){
		o++;
		strip_count += 1;
		stripping_preceding=false
	};


	
	if (stripping_preceding=true){
	preceding_string_test += string_copy(scrib_diag,o,1);
	strip_count += 1;

	}

	


}  





if debugmode = true{
//if(string_preceding_target = ""){show_debug_message("Cojones! String preceding target is empty")};
}


endat= string_pos(substring,scrib_diag)-strip_count;

if debugmode = true{
	//show_debug_message("Ending at" + string(endat));
	//show_debug_message("Text you've stripped includes" + string(preceding_string_test));
	//show_debug_message("You have stripped" + string(strip_count) + " Out of the preceding string");
};
	

//This iterates through a version of the text with no [command tags] and calculates if a word break would occur after a certain point
var j;
	for ( j = 1; j <= endat; j++){
	stripped_test = string_copy(stripped_dialogue,j,1);
	iterating_string += string_copy(stripped_dialogue,j,1);
	breaktest = true;
		if (stripped_test = " ") {
			if(breaktest = true){
				
				for(var u = 1; breaktest=true; u+= 1){
					lookahead_string += string_copy(stripped_dialogue,j+u,1);
				
				lookahead_test = string_copy(stripped_dialogue,j+u+1,1);
				
					if(lookahead_test == " " || lookahead_test == undefined || lookahead_test==""){
					
					
					breaktest = false;
			
			
					old_linebreak_check = linebreak_check;
					linebreak_check = scribble(iterating_string+lookahead_string, "linebreakcheck").wrap(450).get_line_count();
								if(linebreak_check > old_linebreak_check){
								line_increment += 1;
									if debugmode = true{	
						//show_debug_message("Iterating before linebreak: " + iterating_string);
						}			
							
							
								iterating_string = "";
								};
						if debugmode = true{	
							
						
					//	show_debug_message("TOTAL STRING TO DEFINE X OFFSET : " + iterating_string);
						}
					lookahead_string = "";
					//iterating string i contaning the target for some reason.
					final_x_offset = scribble(iterating_string).get_width();
					
				//	show_debug_message(text_y_offset);
					
		
					}
				}
			
			
			}
		

	
		}
	
	}	
	



//To do: Maybe don't call this function 60 times a second. Parse once, set variable to true, then draw the rectangle 60 times a second.

//Draws the rectangle, highlights if clickable, stores clicked word in a global variable.
if point_in_rectangle(mouse_x, mouse_y,
		text_x_offset+final_x_offset,//x1
		text_y_offset+(scribble(substring).get_height() * (line_increment-1)),//y
		text_x_offset+final_x_offset+scribble(substring).get_width(),//x2
		text_y_offset+(scribble(substring).get_height() * (line_increment))//y2
	
		)
			{
			hovering = true;
			color=781040;
			//Make sure this line height matches your textbox!!! Font too?
			draw_rectangle_color(text_x_offset+final_x_offset,text_y_offset+(scribble(substring).starting_format("Font1",11417598).get_height() * (line_increment-1)),text_x_offset+final_x_offset+scribble(substring).starting_format("Font1",11417598).get_width(),text_y_offset+(scribble(substring).starting_format("Font1",11417598).get_height() * (line_increment)),color,color,color,color,global.debughitbox);

				}else{
				hovering = false;
				color = c_white;
				draw_rectangle_color(text_x_offset+final_x_offset,text_y_offset+(scribble(substring).starting_format("Font1",11417598).get_height() * (line_increment-1)),text_x_offset+final_x_offset+scribble(substring).starting_format("Font1",11417598).get_width(),text_y_offset+(scribble(substring).starting_format("Font1",11417598).get_height() * (line_increment)),color,color,color,color,global.debughitbox);
				}

			if (hovering == true) & device_mouse_check_button_released(0, mb_left){
				
			//Todo: Reset global heldword on screen change as well.
			//Todo: On textbox, do a loop for number of args in the array of dialogue manager. Function locate_substring must be called with each option passed as an arg
			if(global.held_word_1 = ""){
			global.held_word_1 = substring;
			global.swap_index_1 = substring_index;
		//	show_debug_message("Will insert at index " + string(substring_index));
		//	show_debug_message("GOT " + global.held_word_1);
			global.swapallowed = false;
			
			}
			//We say "if the first word is not equal to substring because every word is using this function.
			//Once a word uses this function, we don't want THAT instance of it to fire again.
			if(global.held_word_1 != "")&(global.held_word_2 = "")&(global.held_word_1 != substring){
			global.swap_index_2 = substring_index;
			global.held_word_2 = substring;
		//	show_debug_message("GOT " + global.held_word_2);
		//		show_debug_message("STILL HOLDING " + global.held_word_1);
		//	show_debug_message("Will insert at index " + string(global.swap_index_2));
			}
		
			if(global.held_word_1 != "")&(global.held_word_2 != ""){
			//show_debug_message("WOULD SWAP " + string(global.held_word_1) + "AND " + string(global.held_word_2)); 
			stringstorage1 = global.held_word_1;
			stringstorage2 = global.held_word_2;
			
			global.swapallowed = true;
			
			
			
			
			}
				
			if (global.swapallowed = true) {
				
				if (debugmode == true){
				show_debug_message("LOCATING TARGETS BEFORE = " + string(obj_textbox.locating_targets));
				}
				
			//"Replaceme" is used here because otherwise you'll only be able to switch the second word into the first word.
			obj_textbox.diag = string_replace(obj_textbox.diag,global.held_word_1,"[REPLACEME]");
			
	
		
			
			obj_textbox.diag = string_replace(obj_textbox.diag,global.held_word_2,global.held_word_1);
			
			
			obj_textbox.diag = string_replace(obj_textbox.diag,"[REPLACEME]",global.held_word_2);
		
			
			obj_textbox.locating_targets[global.swap_index_1] = string(global.held_word_2);
			obj_textbox.locating_targets[global.swap_index_2] = string(global.held_word_1);
		
			global.held_word_1 = "";
			global.held_word_2 = "";
			if (debugmode == true){
		//	show_debug_message("Should see nothing after this if globals reset: " + global.held_word_1);
			//show_debug_message("Should see nothing after this if global reset: " + global.held_word_2);
			}
			global.swap_index_1 = 0;
			global.swap_index_2 = 0;
			
			
			if (debugmode == true) {
			//	show_debug_message("LOCATING TARGETS AFTER = " + string(obj_textbox.locating_targets));
			}
			}

			if (debugmode == true) {
			//show_debug_message("YA DONE CLICKED");
		
			
			}
			
			}



//Check screen for new dialogue options
	screen_conditions();
	}
	

