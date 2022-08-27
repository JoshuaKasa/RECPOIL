if (drawing_d == false) then exit;

var gwidth = display_get_gui_width();
var gheight = display_get_gui_height();
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);
var width = 300;
var height = 100;
var startx = 100;
var starty = 100;
var endx = startx + width;
var endy = starty + height;
var length = array_length(ams);
var max_draw = 6;
var ammo_number = 4;
var discs_number = 3;
var scale = 5;

draw_set_color(c_black);
draw_set_alpha(0.3);
draw_rectangle(0,0, gwidth,gheight, false);
draw_rectangle(startx,starty, endx,endy, false);
draw_rectangle(gwidth/2 - width/2,starty, gwidth/2 + width/2,endy, false);
draw_rectangle(gwidth - startx - width,starty, gwidth - startx,endy, false);

draw_set_alpha(1);
draw_set_color(c_white);
draw_set_falign(fa_center,fa_middle);
draw_set_font(fFont);
draw_text(startx + width/2,starty + height/2, "Select gun");
draw_text(gwidth/2,starty + height/2, "Select ammoe");

if (rectangle_hover(startx,starty, endx,endy)) 
{
	if (mouse_check_button_pressed(mb_left))
	{
		drawing_g = !drawing_g;	
	}
}
if (rectangle_hover(gwidth/2 - width/2,starty, gwidth/2 + width/2,endy)) 
{
	if (mouse_check_button_pressed(mb_left))
	{
		drawing_a = !drawing_a;	
	}
}
if (rectangle_hover(gwidth - width * 2,starty + height, gwidth - width,endy + height + height * discs_number)) 
{
	if (mouse_check_button_pressed(mb_left))
	{
		drawing_d = !drawing_d;	
	}
}

// Drawing gun chooser
if (drawing_g == true)
{
	draw_set_alpha(0.3);
	draw_set_color(c_black);
	draw_rectangle(startx,starty + height, endx,starty + height + height * max_draw, false);

	draw_set_alpha(1);
	draw_rectangle(startx,starty, endx,starty + height + height * max_draw, true);
		
	var cursorg = 0;
	
	for (var i = wheel_cursor; i < max_draw + wheel_cursor; i++)
	{
		if (rectangle_hover(startx,starty + height, endx,starty + height + height * max_draw))
		{
			cursorg = (((endy - my) div height) * -1) + wheel_cursor;
		}
		else cursorg = -1;
		
		var shader = (i == cursorg) ? shGrey : shLightGrey;
		var sprite = (sprite_exists(object_get_sprite(wps[i]))) ? object_get_sprite(wps[i]) : sBlank;
		var out_i = i - wheel_cursor;
		
		draw_line(startx,starty + height * 2 + (height * out_i), endx,starty + height * 2 + (height * out_i));
	
		shader_set(shader);
		draw_sprite_ext(sprite, 1, startx + width/2, starty + height * 1.5 + (height * out_i), scale,scale, 0, c_white, 1);
		shader_reset();
	}
	
	if (mouse_check_button_pressed(mb_left) && rectangle_hover(startx,starty + height, endx,starty + height + height * max_draw))
	{
		drawing_g = false;
		instance_create_layer(x, y + 10, "Weapons", wps[cursorg]);
	}
}

// Drawing ammoe chooser
if (drawing_a == true)
{
	draw_set_alpha(0.3);
	draw_set_color(c_black);
	draw_rectangle(gwidth/2 - width/2,starty + height, gwidth/2 + width/2,endy + height + height * ammo_number, false);

	draw_set_alpha(1);
	draw_rectangle(gwidth/2 - width/2,starty, gwidth/2 + width/2,endy + height + height * ammo_number, true);
	
	var cursora = 0;
	
	for (var i = 0; i < length; i++)
	{
		if (rectangle_hover(gwidth/2 - width/2,starty + height, gwidth/2 + width/2,starty + height + height * ammo_number))
		{
			cursora = ((endy - my) div height) * -1;
		}	
		else cursora = -1;
		
		var shader = (i == cursora) ? shGrey : shLightGrey;
		var sprite = (sprite_exists(object_get_sprite(ams[i]))) ? object_get_sprite(ams[i]) : sBlank;
		
		draw_line(gwidth/2 - width/2,starty + height * 2 + height * i, gwidth/2 + width/2,starty + height * 2 + height * i);
	
		shader_set(shader);
		draw_sprite_ext(sprite, 1, gwidth/2, starty + height * 1.5 + height * i, scale,scale, 0, c_white, 1);
		shader_reset();
	}
	
	if (mouse_check_button_pressed(mb_left) && rectangle_hover(gwidth/2 - width/2,starty + height, gwidth/2 + width/2,starty + height + height * ammo_number))
	{
		drawing_a = false;
		instance_create_layer(x, y + 15, "Weapons", ams[cursora]);
	}
}