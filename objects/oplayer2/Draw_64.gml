// Draw hp
draw_set_font(fFont);
draw_set_halign(fa_right);
draw_set_alpha(1);

var g_width = display_get_gui_width();
var g_height = display_get_gui_height();	

if (can_move == true && drawing == false)
{
	// Draw health
	if (UI_on == true)
	{
		draw_sprite_ext(sHP, 1, UI_x_start,85, 1,1, 0,c_white, 0.5);
		draw_set_color(c_ltgray);
		draw_text(UI_x_start,80, string(ceil(hp)) + " / " + string(max_hp));
	}

	// Draw ammoe
	if (hand != -1)
	{
		with (inventory[hand])
		{
			draw_weapon_ammoes();
		}
	}

	// Draw inventory weapons
	draw_set_halign(fa_right);

	var len = array_length(inventory);

	if (len > 0)
	{
		for (var i = 0; i < len; i++)
		{
			var mult = 5;
			var shader = (i == hand) ? shGrey : shLightGrey;
			var spr = inventory[i].sprite_index;
			var width = inventory[i].sprite_width * mult;
		
			shader_set(shader);
			draw_sprite_ext(spr, 1, 25 + ((width / 2) + (i * (inventory[0].sprite_width * mult + 50))),GH - 60, mult,mult, 0, c_dkgray, 1);
			shader_reset();
		}
	}

	// Draw reload
	if (len > 0)
	{
		var current_weapon = inventory[currently_equipped];
	
		if (current_weapon.reload_time == current_weapon.initial_r) 
		{
			oPlayer.percent_reload_start = 0;
			oPlayer.alpha_reload = 1;	
		}
	
		if (current_weapon.reloading == true)
		{
			if (percent_reload_start < 60) then percent_reload_start += 1/60;
			position_reload_start = animcurve_channel_evaluate(curve_start, percent_reload_start);
		
			if (current_weapon.reload_time < 10) then alpha_reload -= 1/10;

			draw_set_color(c_ltgray);
			draw_set_halign(fa_middle);
			draw_sprite_ext(sReload, 1, g_width/2, g_height - 40 - position_reload_start * 50, 1,1, 0,c_white, alpha_reload/2);
			draw_set_alpha(alpha_reload);
			draw_text(g_width/2, g_height - 35 - position_reload_start * 50, "Reloading...");
			draw_set_alpha(1);	
		}	
	}
}


if (drawing == true)
{
	draw_set_alpha(0.6);
	draw_set_color(c_black);
	
	draw_rectangle(0,0, g_width,g_height, false);
	
	var line_height = 100;
	var lines = g_height div line_height;
	var cursor = (((g_height - GUI_Y) div line_height) - lines + 1) * -1;
	
	for (var i = 1; i <= lines; i++)
	{
		draw_line(0,i * line_height, g_width,i * line_height);
	}
	
	draw_set_color(c_grey);
	
	draw_rectangle(0,cursor * line_height, g_width,(cursor + 1) * line_height, false);
	
	draw_set_alpha(1);

	for (var i = 0; i < array_length(music_discs); i++)
	{
		draw_sprite_ext(music_discs[i].sprite_index, 1, 10,music_discs[i].sprite_height/2 * 25 + i * line_height, 25,25, 0, c_white, 1);
		
		draw_set_falign(fa_right,fa_middle);
		draw_set_color(c_white);
		
		draw_text(g_width - 10,line_height/2 + i * line_height, music_discs[i].song_name);
	}
	
	if (mouse_check_button_pressed(mb_left) && cursor < array_length(music_discs))
	{
		audio_play_sound_on(oJukeboxLight.emit, music_discs[cursor].song, false, 1);	
		
		oJukebox.music = music_discs[cursor];
		oJukebox.playing = true;
	}
	if (mouse_check_button_pressed(mb_right)) 
	{
		audio_stop_sound(oJukebox.music);
		
		oJukebox.playing = false;
	}
}