draw_self();

if (distance_to_object(oPlayer) < 10) 
{
	if (keyboard_check_pressed(ord("P")))
	{
		var click = instance_create_layer(x,y, "Instances", oJam);
		with (click)
		{
			x_ = x + 2;	
			y_ = y - 5;	
			text = "Click!";
		}
	
		if (playingv == true) 
		{
			playingv = false;
			video_close();
		}
		else
		{
			playingv = true;	
			video_open(videos[cursorv]);
		}
	}
	
	if (keyboard_check_pressed(vk_right))
	{
		video_close();
		playingv = false;
		cursorv = wrap(cursorv + 1, 0,array_length(videos) - 1);
		video_open(videos[cursorv]);
	}
	else if (keyboard_check_pressed(vk_left)) 
	{
		video_close();
		playingv = false;
		cursorv = wrap(cursorv - 1, 0,array_length(videos) - 1);
		video_open(videos[cursorv]);
	}
}

var vdata = video_draw();
var vstatus = vdata[0];
var vsurface = vdata[1];

if (vstatus == 0) 
{
	shader_set(shFilm);
	draw_surface_stretched(vsurface, x,y, sprite_width,sprite_height);
	shader_reset();
}