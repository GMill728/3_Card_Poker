/// @description Insert description here
// You can write your code in this editor

/// @description Handles processing and parsing of user input into the BetInputBox.


if (enabled and focused) {
	
	//This variable will act as our input buffer
	var inp =  keyboard_lastchar;
	
	//Handle input
	if ( keyboard_check(vk_anykey) && !keyboard_check(vk_backspace) && string_length(text) < 8) {
		
		if ( string_length( string_digits(inp) ) || inp == "." && string_count(".", text) == 0) {
			text += inp;            //Add last input character to text
			keyboard_lastchar = ""; //Clear input buffer
		}//end if
		
	}//end if
	
	if ( keyboard_check_pressed(vk_backspace) && deleteTimer == 0) { //Handle single backspace
		text = string_delete(text, string_length(text), 1); //Delete the last character from the string
		keyboard_lastchar = "";
		deleteTimer = 6;                                    //Set Delete Timer to 6 frames
	}//end if
	
	if ( keyboard_check(vk_backspace) && !keyboard_check_pressed(vk_backspace) && deleteTimer == 0) { //Handle held backspace
		text = string_delete(text, string_length(text), 1); //Delete the last character from the string
		keyboard_lastchar = "";
		deleteTimer = 4;                                    //Set Delete Timer to 2 frames
	}//end if


	//Update timer
	if (deleteTimer != 0) {
		deleteTimer--;	
	}//end if
	
}//end if


