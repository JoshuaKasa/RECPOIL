ai_hit();

image_xscale = hit_position_x;
image_yscale = hit_position_y;
if (hsp != 0) then image_xscale *= sign(hsp);

if (state == mstates.idle)
{
	hsp = 0;
	vsp = 0;
	
	state_wait -= 1;
	
	if (check_wait()) 
	{
		to_travel = irandom_range(20,50);
		
		state_wait = irandom_range(120,300);	
		state = mstates.wandering;

		dir = point_direction(x,y, xstart,ystart) + irandom_range(-50,50);
		
		dest_x = x + lengthdir_x(to_travel, dir);
		dest_y = y + lengthdir_y(to_travel, dir);
	}
}
else if (state == mstates.wandering)
{
	hsp = walkspd;
	vsp = walkspd;
	
	state_wait -= 1;

	dir = point_direction(x,y, dest_x,dest_y);
	
	hsp = lengthdir_x(walkspd, dir);
	vsp = lengthdir_y(walkspd, dir);
	
	if (check_wait() || (almost(x,dest_x, 1) && almost(y,dest_y, 1))) 
	{
		state_wait = irandom_range(220,350);
		state = mstates.idle;
	}
}

x += hsp;
y += vsp;