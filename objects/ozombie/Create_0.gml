enum mstates {
	idle,
	chasing,
	wandering
};
state = mstates.idle;

state_timer = 0;
state_wait = irandom_range(30,80);

walkspd = 0.3;
run_mult = 1;

to_travel = 30;

dir = 1;
dest_x = xstart;
dest_y = ystart;

hsp = 0;
vsp = 0;

function check_wait()
{
	return state_wait <= 0;	
}

curve_hitx = animcurve_get_channel(cHit, "x"); 
curve_hity = animcurve_get_channel(cHit, "y"); 
hit_percent = 1;
time = 0;