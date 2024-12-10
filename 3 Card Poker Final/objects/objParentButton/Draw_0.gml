/// @description Show button
//by William Grant 12/7/2024

draw_self();

if (!enabled)
{
	image_index = 2;
}

draw_set_font(fntButton);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_text(x, y, text);			//Buttons should have center origins if they need text