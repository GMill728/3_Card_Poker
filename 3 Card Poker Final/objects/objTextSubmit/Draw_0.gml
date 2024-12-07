/// @description Insert description here
// You can write your code in this editor

draw_self();                 //Draw default sprite assigned to this object

draw_set_font(fntButton); 
draw_set_valign(fa_middle);
draw_set_halign(fa_left);

draw_text(x + 3 * sprite_width / 8, y, text); //Draw text offset to right