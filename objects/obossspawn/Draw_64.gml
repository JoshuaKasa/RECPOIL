if (boss_health > 0 && boss_text != "")
{
	if (boss_text == name)
	{
		if (a > 0) 
		{
			a -= 1/120;
			draw_set_alpha(a);
		}
		// Drawing healthbar
		var size = display_get_gui_size();
		var gw = size[0];
		var gh = size[1];
		var width = 500;
		
		if (bar_health < boss_health && don = false) 
		{
			bar_health += boss_health/60;
			
			if (bar_health >= boss_health) then don = true;
		}
		
		draw_set_alpha(1);
		var hea = bar_health;
		hea = map(hea, 0,boss_health, 0,100);
		
		draw_healthbar(gw/2 - width,50, gw/2 + width,100, hea, c_black,c_white,c_white, 0, true, false);
	}
	if (a != 0)
	{
		// Drawing name
		draw_set_alpha(a/2);
		draw_set_font(fFont);
		draw_set_color(c_black);
		draw_set_falign(fa_center,fa_middle);
	
		var size = display_get_gui_size();
		var gw = size[0];
		var gh = size[1];
		var width = string_width(name) * 1.2;
		var hwidth = width/2;
	
		draw_rectangle(gw/2 - hwidth,gh - 200, gw/2 + hwidth,gh - 100, false);
	
		draw_set_alpha(a);
		draw_set_color(c_white);
	
		draw_text(gw/2,gh - 150, boss_text);
	}
}