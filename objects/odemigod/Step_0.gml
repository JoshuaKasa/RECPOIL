event_inherited();

stay_in_room();

if (place_meeting(x,y, oWall)) then direction += 180;
if (oBossSpawn.bar_health <= 0 && oBossSpawn.don == true) then state = states.dead;

if (state == states.idle)
{
	hsp = 0;
	vsp = 0;
	
	state_timer -= 1;
	
	if (state_timer == 0 || (almost(x,dest_x, 1) && almost(y,dest_y, 1))) then choose_state();
}
else if (state == states.lightning)
{
	move_towards_point(dest_x,dest_y, 1);
	
	state_timer -= 1;
	
	if (state_timer == 0 || (almost(x,dest_x, 1) && almost(y,dest_y, 1))) then choose_state();
}
else if (state == states.invisible)
{
	move_towards_point(dest_x,dest_y, 1);
	
	state_timer -= 1;
	
	if (state_timer == 0 || (almost(x,dest_x, 1) && almost(y,dest_y, 1))) then choose_state();
}
else if (state == states.earthquake)
{
	move_towards_point(dest_x,dest_y, 1);

	if (oBossSpawn.bar_health < oBossSpawn.boss_health/2) then mult = 2;
	
	state_timer -= 1;
	target_timer -= 1;
	
	if (target_timer == 0) 
	{
		target_timer = (timer + irandom_range(15,30)) / mult;
		
		target_x = oPlayer.x;
		target_y = oPlayer.y;
		
		instance_create_layer(target_x,target_y, "Instances", oTarget);
	}
	if (instance_exists(oTarget)) then hit_timer += 1;

	if (hit_timer == 119) 
	{
		hit_timer = 0;
		instance_create_layer(target_x,target_y, "Instances", oCrack);
	}
	
	if (state_timer == 0 || (almost(x,dest_x, 1) && almost(y,dest_y, 1))) then choose_state();
}
else if (state = states.dead)
{
	speed = 0;
	
	dead_timer += 1/300;

	if (dead_timer < 1)
	{
		x += irandom_range(-1,1);		
		y += irandom_range(-1,1);
	}
	else
	{
		if (scale > 0)
		{
			scale -= 1/30;
			
			image_xscale = scale;
			image_yscale = scale;
			
		}
	}
}
if (scale <= 0) then instance_destroy();

print(state);