open_key = vk_f10;
opened = false;

menu_color = c_black;
menu_color2 = c_teal;
highligth_color = c_yellow;
outline_color = make_color_rgb(51,51,51);
amount = 0;

width = display_get_gui_width();
height = display_get_gui_height();

start_x = 0 + 10;
end_x = width - 10;
start_y = 0 + 10;
end_y = height - 10;

cursor = 0;
value_cursor = 0;

// Options
options = [
	new Option("Health", "change", [-10, +10], 
	function()
	{
		oPlayer.hp += options[0].value[value_cursor];	
	}),
	
	new Option("Max guns", "click", ["+1"],
	function()
	{
		oPlayer.max_guns += 1;
	}),
	
	new Option("Add ammoes", "click", ["+10"],
	function()
	{
		if (array_length(oPlayer.inventory) > 0) then oPlayer.inventory[oPlayer.currently_equipped].magazine += 10;
	}),
	
	new Option("Aimbot", "click", ["Activate"],
	function()
	{
		oAimbot.active = !oAimbot.active;
	}),
	
	new Option("Anticheat", "click", ["Activate"],
	function()
	{
		if (instance_exists(oAnticheat)) then instance_destroy(oAnticheat);	
		else instance_create_layer(0,0, "Instances", oAnticheat);
	}),
	
	new Option("Kill", "click", ["-100"],
	function()
	{
		oPlayer.hp = 0;
	}),
	
	new Option("Restart", "click", ["Restart game"],
	function()
	{
		game_restart();
	}),
];
length = array_length(options);