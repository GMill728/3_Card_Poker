/// @description Handles drawing text
//by William Grant 12/7/2024

draw_self();				//Draw text box

draw_set_font(fntButton); 
draw_set_valign(fa_middle);
draw_set_halign(fa_left);

draw_text(x, y, objAnteBox.text);