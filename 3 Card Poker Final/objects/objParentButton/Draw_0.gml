/// @description Show button
//by William Grant 12/7/2024

if(enabled) {
	draw_self();

	if (image_index == 0)
	{
		draw_set_color(c_white);	//Color text white if unhovered
	} 
	else 
	{
		draw_set_color(c_yellow);	//Color text yellow otherwise
	}

	draw_set_font(fntButton);
	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);
	draw_text(x, y, text);			//Buttons should have center origins if they need text
}