/// @description Insert description here
// You can write your code in this editor

if (enabled and focused)
{
	var inp =  keyboard_lastchar;
	
	if ( keyboard_check(vk_anykey) && !keyboard_check(vk_backspace) && string_length(text) < 8) 
	{
		if ( string_length( string_digits(inp) ) || inp == "." && string_count(".", text) == 0) 
		{
			text += inp;
			keyboard_lastchar = "";
		}
		
	}
	
	if ( keyboard_check_pressed(vk_backspace) && deleteTimer == 0) 
	{
		text = string_delete(text, string_length(text), 1);
		keyboard_lastchar = "";
		deleteTimer = 6;
	}
	
	if ( keyboard_check(vk_backspace) && !keyboard_check_pressed(vk_backspace) && deleteTimer == 0) 
	{
		text = string_delete(text, string_length(text), 1);
		keyboard_lastchar = "";
		deleteTimer = 4;
	}

	if (deleteTimer != 0) {
		deleteTimer--;	
	}	
}


