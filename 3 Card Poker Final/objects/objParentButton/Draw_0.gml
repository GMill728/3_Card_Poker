/// @description Insert description here
// You can write your code in this editor

if(enabled) {
	draw_self();

	if (image_index == 0)
	{
		draw_set_color(c_white);
	} 
	else 
	{
		draw_set_color(c_yellow);
	}

	draw_set_font(fntButton);
	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);
	draw_text(x, y, text);
}