x += xspeed * dir;

bombing_timer -= 1;
if (bombing_timer == 0) then instance_destroy();

shooting_time -= 1;
if (shooting_time == -1) 
{
	audio_play_sound(sndF16Fire, 1, false);
	pointx = oPlayer.x;
	pointy = oPlayer.y;
}
if (shooting_time < 0)
{
	if (bullets > 0)
	{
		bullets -= 1;
		
		var px = irandom_range(pointx - 20,pointx + 20);
		var py = irandom_range(pointy - 20,pointy + 20);
		var bul = instance_create_layer(x,y, "Weapons", oBullet30mm);
		
		with (bul)
		{
			direction = point_direction(x,y, px,py);
			image_angle = direction;
		}
	}
}
if (bullets == 0 && fire_speed > -1)
{
	fire_speed -= 1;
	if (fire_speed == 0)
	{
		audio_play_sound(sndF16Rotatory, 1, false);
	}	
}