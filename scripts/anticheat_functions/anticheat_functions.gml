function anticheat_value_warning()
{
	show_message("A locked variable was tried to be changed.");		
}

function anticheat_aimbot_warning()
{
	show_message("We think you might be using aimbot, stop any suspect activities or measures will be taken.");		
}

function anticheat_max(variable, maximum, from = id)
{
	array_push(max_variables, variable);
	array_push(max_max, maximum);
	array_push(max_from, from);
}

function anticheat_lock(variable, value, from = id)
{
	array_push(locked_variables, variable);
	array_push(locked_values, value);
	array_push(locked_from, from);
}

function anticheat_unlock(variable, value, from = id)
{
	var pos = array_find(locked_variables, variable);
	
	array_delete(locked_variables, pos, 1);
	array_delete(locked_values, pos, 1);
	array_delete(locked_from, pos, 1);
}

function anticheat_maxupdate(to_update, updated)
{
	var pos = array_find(max_variables, to_update);
	
	array_replace(max_max, pos - 1, updated);
}