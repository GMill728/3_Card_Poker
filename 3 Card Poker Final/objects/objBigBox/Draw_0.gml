/// @description Draws objBigBox and text inside.

draw_self();

for(var i = 0; i < currIdx; i++)					//While message exists
{	
	draw_set_font(fntButton);
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);						//Parameters for message and position to be placed.
	draw_text(x, y + string_height("A") * (i) - 12, messageList[i]);
}//end for