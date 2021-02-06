/// @description Insert description here
// You can write your code in this editor
no_condition = "";
no_changes = "";
no_scripts = "";
/*
TEMPLATE ROOM
Using \n linebreaks near target words may cause issues
If you are using this dialogue manger system, I reccommend splitting it into files based
on chapter & character, and just adding to the same ds_list as you see here.
Using tags will help you here.

room_dialogue = ds_map_create();

ds_map_add(room_dialogue,"openingscreen",
[
	["We are arbitrarily making this text very long and annoying so Blunt's code will be pressed Choose Dialogue Option. \n4: Enable Word Swapping",0,["Dialogue","Option"]],

	[
	["Continue", true, "day1_0", no_condition, no_changes, no_scripts],
	["FUCK YOU GOD I SWEAR ILL GNAW YOUR FACE OFF!", false, "day2_0", "Option Dialogue", no_changes, no_scripts],

	],
	
	
]

);


/////////TEMPLATE ROOM BREAKDOWN

room_dialogue = ds_map_create();

ds_map_add(room_dialogue,"ROOM KEY USED BY SCR_CHANGEROOM()",

[

	["TEXT TO DISPLAY IN ROOM",UNUSED SLOT YOU COULD USE FOR SPEAKER PORTRAIT SPRITE,["LocateTargetWord1","LocateTargetWord2"]],

/////ARRAY OF OPTIONS. EACH OPTION IS AN ARRAY CONTAINING TEXT TO DISPLAY, WHETHER IT IS ACTIVE,
/////THE KEY IT GOES TO IF CHOSEN (E.G: NEXT TEXT TO LOAD), THE STRING THAT MUST BE ON THE SCREEN TO DISPLAY THE OPTION
/////(Unique to word swapping mechanic), and some unused slots where you could variable swappers or scripts.
	[
	["Continue", true, "day1_0", no_condition, no_changes, no_scripts],
	["FUCK YOU GOD I SWEAR ILL GNAW YOUR FACE OFF!", false, "day2_0", "Option Dialogue", no_changes, no_scripts],
	
	
	
	],
	
	
]

);

*/

room_dialogue = ds_map_create();

ds_map_add(room_dialogue,"openingscreen",

[

	["This project demonstrates a system for clickable text in Scribble. It also includes a basic demonstration of substring manipulation with this system. Controls: 1-9: Choose Option. 0: Activate hitbox viewer. Click two words to swap position.",0,["clickable","system","Scribble"]],


	[
	["Explain the substring finder", true, "explainthestringlocator", no_condition, no_changes, no_scripts],
	["Stress test the substring finder", true, "stringstresstest", no_condition, no_changes, no_scripts],
	["Play with word swapping and branching options", true, "adventure_00", no_condition, no_changes, no_scripts],
	],
	
	
]

);

ds_map_add(room_dialogue,"explainthestringlocator",

[

	["The script you are probably looking for is scr_LocateSubstring. It takes a substring [jitter](Including Command Tags[/] and a string to search through. It then creates a version of the original string after removing the command tags and checks the X coordinate of where your substring WOULD appear. At spaces it looks ahead, adds the next word to the string used for measurement, and checks if the line would break.",0,["substring", "original"]],


	[
	["Back", true, "openingscreen", no_condition, no_changes, no_scripts],
	["What limitations does it have?", true, "stringlimitations", no_condition, no_changes, no_scripts],
	["Stress test the substring finder", true, "stringstresstest", no_condition, no_changes, no_scripts],
	],
	
	
]

);





ds_map_add(room_dialogue,"stringlimitations",

//Try to keep \ns from magic words. Should be fine though.

[

	["Left brackets are stripped out of text, and scale tags in a string with line breaks will throw this program off because it relies on scribble's get_width() and get_height(), which are not modified by these tags. In-string line breaks can throw it off if they are close to target words. If you want to find no string, use empty quotes. If you want to make multiple substrings with the same text clickable, wrap them in unique command tags.",0,["modified","you will"]],


	[
	["Back to explanation", true, "explainthestringlocator", no_condition, change_variable(), run_script()],
	["Back to menu", false, "openingscreen", no_condition, change_variable(), run_script()]
	
	
	
	],
	
	
]

);

ds_map_add(room_dialogue,"explainthestringlocator",

[

	["The script you are probably looking for is scr_LocateSubstring. It takes a substring [jitter](Including Command Tags[/] and a string to search through. It then creates a version of the original string after removing the command tags and checks the X coordinate of where your substring WOULD appear. At spaces it looks ahead, adds the next word to the string used for measurement, and checks if the line would break.",0,["substring", "original"]],


	[
	["Back", true, "openingscreen", no_condition, no_changes, no_scripts],
	["What limitations does this have?", true, "stringlimitations", no_condition, no_changes, no_scripts],
	["Stress test the substring finder", true, "stringstresstest", no_condition, no_changes, no_scripts],
	],
	
	
]

);

ds_map_add(room_dialogue,"stringstresstest",

[

	["[rainbow][wheel][jitter]This string is designed[/] to provide [jitter][#ff22ee]annoying[/] edge cases. It also [#00FF00][wheel]demonstrates[/] that you can copy [#22ff11]formatting[/] between targets if you include command tags in the string you want to [rainbow]find[/]. Press 0 to activate hitbox mode and see the colored text.",0,["[#22ff11]formatting[/]", "[rainbow]find[/]", "[#00FF00][wheel]demonstrates[/]","[rainbow][wheel][jitter]This string is designed[/]"]],


	[
	["Back to [rainbow]main[/] [wheel]menu[/]", true, "openingscreen", no_condition, no_changes, no_scripts],
	["What limitations does this have?", true, "stringlimitations", no_condition, no_changes, no_scripts],
	],
	
	
]

);


ds_map_add(room_dialogue,"adventure_00",

[

	["You are in a dark, damp alleyway sandwiched between a failed deli and St. Jude's School for Blind Girls. Here the smell of votive incense mingles with weeks-old sauerkraut and, recently, the smell of blood. You are dead here. Your killer is feeling awfully smug. \nIf only there was something you could do about it.",0,["dead", "feeling awfully smug",]],


	[
	["Back", true, "stringstresstest", "You are dead", no_changes, no_scripts],
	["Of course",false, "adventure_01", "You are feeling", no_changes, no_scripts],
	],
	
	
]

);

ds_map_add(room_dialogue,"adventure_01",

[

	["Just a quick swap.",0,[""]],


	[
	["Continue", true, "adventure_02", no_condition, no_changes, no_scripts],
	["Exit demo", true, "openingscreen", no_condition, no_changes, no_scripts],
	],
	
	
]

);


ds_map_add(room_dialogue,"adventure_02",

[

	["You wring the blood out of your shirt and return to the task at hand. Specifically, the burglary at hand. Robbing a crumbling school full of blind adolescent girls is a straightforward task in theory, but most schools - even the ones for the able-sighted - are not guarded by men with rifles.",0,[""]],


	[
	["Inspect the school", true, "adventure_03", no_condition, no_changes, no_scripts],
	["Exit demo", true, "openingscreen", no_condition, no_changes, no_scripts],
	],
	
	
]

);


ds_map_add(room_dialogue,"adventure_03",

[

	["The south wall of St. Jude's Chapel runs the whole length of the alley where you're standing. It is punctuated by windows crossed with hard iron bars. Thickets of overgrown weeds huddle where the wall meets the soft ground. Ropes of dead ivy run up the wall towards the roof",0,["dead","overgrown","soft","hard"]],


	[
	["Bend the iron bars", false, "adventure_030", "soft iron", no_changes, no_scripts],
	["Climb the ivy", false, "adventure_031", "overgrown ivy", no_changes, no_scripts],
	["Exit demo", true, "openingscreen", no_condition, no_changes, no_scripts],
	],
	
	
]

);

ds_map_add(room_dialogue,"adventure_030",

[

	["The bars feel like butter in your hands. You pull them apart, and end the demo.",0,[""]],


	[
	["Exit demo", true, "openingscreen", no_condition, no_changes, no_scripts],
	],
	
	
]

);

ds_map_add(room_dialogue,"adventure_031",

[

	["With a great effort you climb the ivy and onto the roof. From here, you can end the demo.",0,[""]],


	[
	["Exit demo", true, "openingscreen", no_condition, no_changes, no_scripts],
	],
	
	
]

);

