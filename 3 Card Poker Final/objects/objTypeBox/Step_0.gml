/// @description Handles text input
//by William Grant 12/7/2024

if (enabled and focused) //Usable and clicked
{
	var inp =  keyboard_lastchar; //Buffer
	
	//Input
	if (keyboard_check(vk_anykey) && !keyboard_check(vk_backspace) && string_length(text) < 8) 
	{
		if (string_length(string_digits(inp) ) || inp == "." && string_count(".", text) == 0) 
		{
			text += inp;			//Add last input to text
			keyboard_lastchar = "";	//Clear buffer
		}
		
	}
	
	//Single backspace
	if (keyboard_check_pressed(vk_backspace) && deleteTimer == 0) 
	{
		text = string_delete(text, string_length(text), 1);
		keyboard_lastchar = "";
		deleteTimer = 6;
	}
	
	//Holding backspace
	if (keyboard_check(vk_backspace) && !keyboard_check_pressed(vk_backspace) && deleteTimer == 0) 
	{
		text = string_delete(text, string_length(text), 1);
		keyboard_lastchar = "";
		deleteTimer = 4;
	}

	if (deleteTimer != 0) {
		deleteTimer--;	
	}	
}


