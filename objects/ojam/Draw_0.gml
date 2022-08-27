if (x_ != 0 && y_ != 0) 
{
	draw_set_font(fJam);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_alpha(a);
	
	draw_text_transformed(x_,y_, text, jamscale_position - 0.6,jamscale_position - 0.6, angle);
}
draw_set_alpha(1);