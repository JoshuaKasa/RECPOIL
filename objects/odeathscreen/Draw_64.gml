var w = display_get_gui_width();
var h = display_get_gui_height();

draw_set_color(c_black);
draw_set_alpha(1);
draw_rectangle(0,0, w,h, false);

// Drawing death text
draw_set_color(c_white);
draw_set_alpha(alpha);
draw_set_font(fDeath);
draw_set_falign(fa_middle, fa_center);

timer += 1;

if (timer > 300)
{
	draw_text(w/2,h/2, text);
	
	if (timer > 360) then text = player_dead + " you died";
	if (timer > 460) then text = player_dead + " you died\nPress R to restart";
	if (timer > 560) then alpha -= 1/120;
}