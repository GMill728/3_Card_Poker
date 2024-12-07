/// @description Handles focusing on typing
//by William Grant 12/7/2024

//If exists and clicks on bounding box
if (enabled && point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom))
{
	focused = true;   
	image_index = 2; //Typing state
	text = "";       
} 
else //If clicking out of bounding box or it un-enables
{
	focused = false;
	image_index = 0; //Unhighlighted state
	
	//Cleanses to number - breaks if text is empty, unsure how to fix as of writing.
	text = real(text);
	text = string_format(text, 1, 2);
}