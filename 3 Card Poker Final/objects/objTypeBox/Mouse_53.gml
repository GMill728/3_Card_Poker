/// @description Insert description here
// You can write your code in this editor

if (enabled && point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom))
{
	focused = true;   
	image_index = 2;
	text = "";       
} 
else 
{
	focused = false;
	image_index = 0;
	
	text = real(text);
	text = string_format(text, 1, 2);
}