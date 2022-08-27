event_inherited();

enum states {
	idle,
	lightning,
	earthquake,
	invisible,
	dead
}

state = states.idle;
state_timer = 120;

hsp = 0;
vsp = 0;
dir = 0;

dest_x = 0;
dest_y = 0;

target_timer = 60;
timer = target_timer;
target_x = 0;
target_y = 0;
hit_timer = 0;

dead_timer = 0;
scale = 1;

mult = 0;

function choose_timer()
{
	if (state == states.idle) then return irandom_range(60,80);
	else return irandom_range(120,240);
}
function choose_state()
{
	state = choose(states.earthquake, states.invisible, states.lightning, states.idle);
	state_timer = choose_timer();
	
	dest_x = x + irandom_range(-60,60);
	dest_y = y + irandom_range(-60,60);
}
function choose_destination()
{
	dest_x = x + irandom_range(-30,30);
	dest_y = y + irandom_range(-30,30);
}