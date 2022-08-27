// Locked variables
for (var i = 0; i < array_length(locked_variables); i++)
{
	var variables = locked_variables[i];
	var values = locked_values[i];
	var from = locked_from[i];
	
	variable_instance_set(from, variables, values);
}

// Ranged values
for (var i = 0; i < array_length(max_variables); i++)
{
	var variables = max_variables[i];
	var values_max = max_max[i];
	var from = max_from[i];
	var value = variable_instance_get(from, variables);
	
	if (value > values_max) then variable_instance_set(from, variables, values_max);
}

// Aimbot check
var x_ = oPlayer.x;
var y_ = oPlayer.y;
var nearest = instance_nearest(x_,y_, ENEMIES);
var x_to = floor(nearest.x);
var y_to = floor(nearest.y);

if (oPlayer.x != oPlayer.xprevious || oPlayer.y != oPlayer.yprevious)
{
	if (oCrosshair.x == x_to && oCrosshair.y == y_to && warnings == 0)
	{
		warnings += 1;
		anticheat_aimbot_warning();
	}
	
	if (mouse_check_button(mb_left) || mouse_check_button_pressed(mb_left))
	{
		if (oCrosshair.x == previous_x && oCrosshair.y == previous_y)
		{
			warning_time += 1;
			
			if (warning_time == 60)
			{
				show_message("Aimbot was detected, game will be closed for prevention.");
				game_end();
			}
		}
	}
	
	if (previous_x != oCrosshair.x) then previous_x = oCrosshair.x;
	if (previous_y != oCrosshair.y) then previous_y = oCrosshair.y;
}

// Ammoes hack check
if (array_length(oPlayer.inventory) > 0)
{
	if (oPlayer.inventory[oPlayer.currently_equipped].magazine > oPlayer.inventory[oPlayer.currently_equipped].initial_m)
	{
		oPlayer.inventory[oPlayer.currently_equipped].magazine = oPlayer.inventory[oPlayer.currently_equipped].initial_m;
	}
}

// Speedhack check
if (window_has_focus())
{
	var timer = get_timer() / 1000000;
	
	if (timer > 10)
	{
		if (fps < 30)
		{
			show_message("A speedhack was detected, game will be closed for prevention.");
			game_end();
		}
	}
}