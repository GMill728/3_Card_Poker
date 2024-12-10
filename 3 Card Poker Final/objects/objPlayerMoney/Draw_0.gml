/// @description Display chips
//by William Grant 12/7/2024

draw_self();
draw_set_font(fntButton);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_set_color(c_white);
draw_text(x, y, "Player Chips\n" + string(global.game.getPlayerMoney() ) ); 