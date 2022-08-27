/// @desc capitalize()
/// Capitalize the string you put in as an argument
/// FROM: Me
function capitalize(str)
{
	var returned = string_upper(string_char_at(str, 1)) + string_copy(str, 2, string_length);
	return returned;
}

/// @desc starts_with(string, letter)
/// Checks if the string starts with a certain character, if it does
/// it returns true else it returns false
/// FROM: Me
function starts_with(str, letter)
{
	var first_letter = string_char_at(str, 1);
	
	return letter == first_letter;
}
/// @desc ends_with(string, letter)
/// Same as the starts_with() function but check if the string
/// ends with the character you want
/// FROM: Me
function ends_with(str, letter)
{
	var last_letter = string_char_at(str, string_length(str));
	
	return letter == last_letter;
}

/// @desc string_join(string, letter)
/// Put the character you want at the end of a string
/// FROM: Me
function string_join(str, letter)
{
	return string_insert(letter, str, string_length(str) + 1);
}

/// @desc string_fill(string, substring, times, position)
/// Fills a string with another string you want at the position you want how many times you want.
/// FROM: Me
function string_fill(str, insert, times, pos)
{
	repeat(times)
	{
		str = string_insert(insert, str, pos);
	}
	return str;
}

/// @desc dices(number, sides)
/// Simulate rolling of a dice.
/// FROM: gmlscripts.com
function dices(n, sides)
{
    var sum = 0;
    repeat (n) sum += irandom(sides) + 1;
    return sum;
}

/// @desc string_random(string, world_length)
/// Randomize the position of the characters of a string.
/// FROM: Me
function string_random(str, word_length)
{
	var returned = "";
	var length = string_length(str);
	
	repeat (word_length)
	{
		returned = string_insert(string_char_at(str, irandom_range(1,length)), returned, 0);
	}
	
	return returned;
}

/// @desc in_range(from, to, value)
/// Returns true if the value you input is in the range you want
/// FROM: Me
function in_range(range1,range2, value)
{
	return value > range1 && value < range2;
}

/// @desc string_contains(string, substring)
/// Check if a string contains the character you want
/// FROM: Me
function string_contains(str, substr)
{
	return string_pos(substr, str) != 0;
}

/// @desc almost(value1,value2, buffer)
/// Returns true if the value you input is almost
/// the value you want, you can choose what almost is
/// (it can be any number)
/// EX: almost(10, 9, 1) ---> this will return true because 10 + 1 is 9 
/// FROM: Me
function almost(value, value2, almost_)
{
	return abs(value - value2) <= almost_;
}

/// @desc stay_in_room(object)
/// Make a object stay in a room
/// FROM: gmlscripts.com
function stay_in_room()
{
	x = clamp(x, 0,room_width);
	y = clamp(y, 0,room_width);
}

/// @desc draw_set_falign(halign,valign)
/// Set halign and valign
/// FROM: Me
function draw_set_falign(halign,valign)
{
	draw_set_halign(halign);
	draw_set_valign(valign);
}

/// @desc draw_set_ext(alpha, color, halign, valign, font)
/// Set every possible draw_set how you want
/// FROM: Me
function draw_set_ext(alpha, color, halign,valign, font)
{
	draw_set_alpha(alpha);
	draw_set_color(color);
	if (script_exists(draw_set_falign))
	{
		draw_set_falign(halign,valign);
	}
	else 
	{
		draw_set_halign(halign);	
		draw_set_valign(valign);	
	}
	draw_set_font(font);
}

/// @desc draw_reset()
/// Reset every draw option to default
/// FROM: gmlscripts.com
function draw_reset()
{
	draw_set_alpha(1);
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}

/// @desc percentage(value1, percentage, rounded)
/// Returns the percentage of a number in decimal
/// EX: percentage(1, 100, true) ----> this will return 1, because the 1% of 100 is 1
/// FROM: Me
function percentage(val1,max_percentage, rounded)
{
	if (rounded) return round((val1 * max_percentage)/100);
	else return (val1 * max_percentage)/100;
}

/// @desc music_change(to_change,music)
/// Change a music playing in the room
/// FROM: Me
function music_change(music1,music2)
{
	audio_stop_sound(music1);
	audio_play_sound(music2, 1, false);
}

/// @desc jump_to_mouse()
/// Set x and y to the mouse x and y
/// FROM: gmlscripts.com
function jump_to_mouse()
{
	x = mouse_x;
	y = mouse_y;
}

///@desc jump_to_point(x,y)
/// Set x and y to the x and y you want
/// FROM: Me (I think)
function jump_to_point(x_,y_)
{	
	x = x_;
	y = y_;
}

/// @desc healthbar(x,y, height, color, color2, health)
/// Draw a healthbar where you want with the height you want and the max health you want (you can make it shake too)
/// Color 1 2 are gonna be the 2 colors that are ginna mix together when loosing heath
/// FROM: Me
function healthbar(x,y, height, color,color2, hlth, shake)
{
	var shake_ = 0;
	if (shake = true)
	{
		shake_ = irandom_range(-1,1);	
	}
	else shake = 0;
	
	color = merge_color(color,color2, hlth);
	draw_set_color(color);
	draw_rectangle(x + irandom_range(shake_,-shake_),y + irandom_range(shake_,-shake_), hlth,height + irandom_range(shake_,-shake_), false);
}

/// @desc squared(number)
/// Square a number
/// FROM: Me
function squared(num)
{
	return num * num;
}

/// @desc draw_hearts(x,y,distance,sprite,health,max_health)
/// Draw how many hearts you want with the sprite you want
/// FROM: Me
function draw_hearts(x_,y_, distance, sprite, health_, healthmax_)
{
	var health_frac = frac(health_);
	health_ -= health_frac;
	
	for (var i = 1; i <= healthmax_; i++)
	{
		var imageindex = (i > health_)
		if (i = health_ + 1)
		{
			imageindex += (health_frac > 0);
		}
		draw_sprite(sprite, imageindex, x_ + (i-1) * (sprite_get_width(sprite) * distance),y_);	
	}
}

/// @desc draw_text_input(x,y)
/// Draw player's input
/// FROM: Me
function draw_text_input(x_,y_)
{
	var text = keyboard_string
	draw_text(x_,y_,  text);
	
	return text;
}

/// @desc draw_pyramd(x,y, width,height, layers)
/// Draw a pyramid with how many layers you want
/// FROM: Me
function draw_pyramid(x_,y_, width,height, layers, outline)
{
	for (var i = 0; i < layers; i++)
	{
		var shift_x = (i * width/layers)/2;
		
		draw_rectangle(
		x_ + shift_x - 1,
		(y_ - (i * height/layers)) + height,
		x_ + width - (i * width/layers) + shift_x,
		(y_ - ((i + 1) * (height/layers))) + height, 
		true
		);
	}
	
	if (outline)
	{
		draw_set_color(c_red);
		draw_rectangle(x_,y_, x_ + width, y_ + height, true);
		draw_set_color(c_white);
	}
}

/// @desc resize_game_window(aspcect_ratio, window_size)
/// Set the aspect ratio and then the window size.
/// The aspect ratio argument can go from 0 to 5.
/// FROM: Me
function resize_game_window(aspect_ratio, size)
{
	if (aspect_ratio = "16:9" || aspect_ratio = 16/9)
	{
		size = clamp(size, 0,5);
		switch (size)
		{
			default: show_debug_message("Size non valid for 16:9 aspect ratio");
				break;
			case 0: window_set_size(1024,576);
				break;
			case 1: window_set_size(1152,648);
				break;
			case 2: window_set_size(1280,720);
				break;
			case 3: window_set_size(1366,768);
				break;
			case 4: window_set_size(1600,900);
				break;
			case 5: window_set_size(1920,1080);
				break;
		}
	}
	else if (aspect_ratio = "4:3" || aspect_ratio = 4/3)
	{
		size = clamp(size, 0,5);
		switch (size)
		{
			default: show_debug_message("Size not valid for aspect ratio 4:3");
				break;
			case 0: window_set_size(640,480);
				break;
			case 1: window_set_size(800,600);
				break;
			case 3: window_set_size(1024,768);
				break;
			case 4: window_set_size(1280,960);
				break;
			case 5: window_set_size(1400,1050);
				break;
		}
	}
	else show_debug_message("Unkown aspect ratio");
}

/// @desc draw_hitbox()
/// Draw hitbox of every instance in the room
/// FROM: Me
function draw_hitbox()
{
	draw_rectangle(bbox_left,bbox_top, bbox_right,bbox_bottom, true);
}

/// @desc approach(start, end, shift)
/// This functions is like lerp but linear
/// FROM: Someone amazing
function approach(start, end_, shift)
{
	if (start < end_)
	{
		return min(start + shift, end_); 
	}
	else
	{
		return max(start - shift, end_);	
	}
}

/// @desc play_sequence(sequence)
/// This function plays a sequence as a transition
/// FROM: Me
function play_sequence(sequence)
{
	if (!layer_exists("transition"))
	{
		var lay = layer_create(-9999, "transition");
		layer_sequence_create(lay, 0,0, sequence);
	}
	else
	{
		layer_destroy("transition");
		var lay = layer_create(-9999, "transition");
		layer_sequence_create(lay, 0,0, sequence);
	}
}

/// @desc fib(number)
/// Returns an array with the fibonacci sequence 
/// of how many numbers you want.
/// EX: fib(4) ----> 1, 1, 2, 3 (first 4 numbers of the fibonacci sequence)
/// FROM: Me
function fib(number)
{
	var previous = 0;
	var current = 1;
	var arr;
	
	for (var i = 0; i <= number; i++)
	{
		var next = previous + current;
	
		previous = current;
		current = next;
		arr[i] = next;
	}
	
	return arr;
}

/// @desc string_split(str, divider)
/// Splits a string into an array (you can choose when to spli the string).
/// EX: string_split("Hello world!", " ") ----> this will split the string into [Hello], [world!]
/// because the divider is " " which is a space.
/// FROM: Me
function string_split(str, divider)
{
	var len = string_length(str);
	var sub_str = "";
	var index = 0;
	var arr = [];
	
	for (var i = 1; i <= len; i++)
	{
		var char = string_char_at(str, i);
		if (char != divider)
		{
			sub_str += char;
		}
		else
		{
			if(string_length(sub_str) > 0)
			{
				arr[index] = sub_str;
				index++;
				
				sub_str = "";
			}
		}
	}
	if(string_length(sub_str) > 0)
	{
		arr[index] = sub_str;
	}
		
	return arr;
}

/// @desc array_clear(array)
/// Remove every value from an array.
/// FROM: Me
function array_clear(array)
{
	var length = array_length(array);
	
	for (var i = 0; i < length; i++)
	{
		array_pop(array);	
	}
}

/// @desc array_exists(value, array)
/// Returns true if a value exists in an array.
/// FROM: Me
function array_exists(array, value)
{
	var length = array_length(array);
	
	for (var i = 0; i < length; i++)
	{
		if (value == array[i])
		{
			return true;
		}
	}
	return false;
}

/// @desc array_shit(array, value)
/// Shift a value at the beginning of an array
/// FROM: Me
function array_shift(array, value)
{
	array_insert(array, 0, value);	
}

/// @desc print
/// show_debug_message() but shorter.
/// FROM: Me
function print(str)
{
	show_debug_message(str);
}

/// @desc string_password
/// Creates a random password with a given length.
/// FROM: Me
function string_password(length)
{
	var result = "";
	var char = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvz1234567890_-.";
	var choosen_char;
	var len = string_length(char);
	
	for (var i = 0; i <= length; i++)
	{
		choosen_char = string_char_at(char, irandom_range(1,len));
		result += choosen_char;	
	}
	
	return result;
}

/// @desc string_space(string)
/// Spaces every character of a string.
/// FROM: Me
function string_space(str)
{
	var length = string_length(str);
	var result = "";
	var char;
	
	for (var i = 1; i <= length; i++)
	{
		char = string_char_at(str, i);
		result += char + " ";
	}
	
	return result;
}

/// @desc string_reverse(string)
/// Reverse a string.
/// FROM: Me
function string_reverse(str)
{
	var length = string_length(str);
	var result = "";
	var char;
	
	for (var i = length; i >= 1; i--)
	{
		char = string_char_at(str, i);
		result += char;
	}
	
	return result
}

/// @desc draw_grid(x,y, width,height, num_x,num_y)
/// Draws a grid with given cells, width, height, x and y.
/// FROM: Me
function draw_grid(x_,y_, width,height, cells_x,cells_y)
{	
	cells_x = abs(cells_x);
	cells_y = abs(cells_y);
	
	for (var i = 0; i <= cells_x; i++)
	{
		var offset_x = i * width/cells_x;
			
		draw_line(x_ + offset_x,y_, x_ + offset_x, y_ + height);	
	}
	for (var i = 0; i <= cells_y; i++)
	{
		var offset_y = i * height/cells_y;
		
		draw_line(x_,y_ + offset_y, x_ + width, y_ + offset_y);
	}	
}

/// @desc array_sort(array, ascending)
/// Sort an array.
/// FROM: Me
function array_sort(array, ascending)
{
	var list = ds_list_create();
	var length = array_length(array);
	
	for (var i = 0; i < length; i++)
	{
		list[| i] = array[i];
	}
	ds_list_sort(list, ascending);
	for (var i = 0; i < length; i++)
	{
		array[i] = list[| i];	
	}
	ds_list_destroy(list);
	
	return array;
}

/// @desc draw_crosshair()
/// Draw a crosshair and the center of the screen.
/// FROM: Me
function draw_crosshair()
{
	draw_line(room_width/2 - 5,room_height/2, room_width/2 + 5, room_height/2);	
	draw_line(room_width/2,room_height/2 - 5, room_width/2, room_height/2 + 5);	
}

/// @desc arrat_count(array, value)
/// Counts how many times a value is in an array.
/// FROM: Me
function array_count(array, value)
{
	var length = array_length(array);
	var count = 0;
	
	for (var i = 0; i < length; i++)
	{
		if (array[i] = value)
		{
			count++;	
		}
	}
	
	return count;
}

/// @desc array_add(array, array_to_add, position)
/// Add the values of an array into another array at
/// a given position
/// FROM: Me
function array_merge(array, second_array, pos)
{
	var length = array_length(second_array);
	
	for (var i = 0; i < length; i++)
	{
		array_insert(array, pos + i, second_array[i]);	
	}
}

/// @desc sprite_on_frame(frame, sprite)
/// Check if the sprite is on the specified frame
/// FROM: Cecil
function sprite_on_frame(frame, sprite)
{
	return image_index >= frame && image_index - image_speed * sprite_get_speed(sprite) / (sprite_get_speed(sprite) == spritespeed_framespergameframe ? 1 : game_set_speed(gamespeed_fps, gamsespeed_microseconds)) < frame;
}

/// @desc array_shuffle(array)
/// Shuffles the entires of an array
/// FROM: Me
function array_shuffle(array)
{
	var list = ds_list_create();
	var length = array_length(array);
	var arr = [];
	
	for (var i = 0; i < length; i++)
	{
		list[| i] = array[i];
	}
	ds_list_shuffle(list);
	var ds_size = ds_list_size(list);
	for (var i = 0; i < ds_size; i++)
	{
		array_push(arr, list[| i]);
	}
	ds_list_destroy(list);
	
	return arr;
}

/// @desc array_switch(array, switch1, switch2)
/// Switches the position of the 2 values of an array
/// FROM: Me
function array_switch(array, index1,index2)
{
	var temp = array[index1];
	
	index1 = index2;
	index2 = temp;
}

/// @desc probability(probability)
/// Returns a probability based on the argument
/// ex: if (probability(20)); will return true the 20% of the times
/// FROM: Someone, not me tho
function probability(prob)
{
	return prob > irandom(100);
}

/// @desc drink_create(color)
function drink_create(color, alpha)
{
	instance_create_layer(room_width/2,room_height/2 + 75, layer, oCup);
	instance_create_layer(oCup.x,oCup.y, layer, oDrink);
	
	oDrink.image_blend = color;
	oDrink.image_alpha = alpha;
}

/// @desc array_empty(array)
/// Check if an array is empty and return a boolean based on that
/// FROM: Me
function array_empty(array)
{
	var length = array_length(array);
	
	return sing(length);
}

/// @desc array_reverse(array)
/// Completely reverse an array
/// FROM: Me
function array_reverse(array)
{
	var length = array_length(array);
	var arr = array_create(length);
	
	array_clear(arr);
	
	for (var i = 0; i < length; i++)
	{
		array_shift(arr, array[i]);
	}
	
	return arr;
}

/// @desc array_first(array)
/// Returns the first value of an array
/// FROM: Me
function array_first(array)
{
	return array[0];
}

/// @desc array_last(array)
/// Returns the last value of an array
/// FROM: Me
function array_last(array)
{
	var length = array_length(array);
	
	return array[length - 1];
}

/// @desc array_sum(array)
/// Calculates the sum of all the elements in an array
/// FROM: Me
function array_sum(array)
{
	var sum = 0;
	var length = array_length(array);
	
	for (var i = 0; i < length; i++)
	{
		var element = array[i];
		
		if (is_real(element))
		{
			sum += element;	
		}
	}
	
	return sum;
}

/// @desc array_slice(array, start)
/// Extracts a section of the calling array and returns a new array
/// FROM: Me
function array_slice(array, start)
{
	var length = array_length(array);
	var arr = array_create(length - start);
	array_clear(arr);
	
	for (var i = start - 1; i < length; i++)
	{
		array_push(arr, array[i]);
	}
	
	return arr;
}

/// @desc array_find(array, value)
/// Finds a value into an array and returns its position
/// FROM: Me
function array_find(array, value)
{
	var length = array_length(array);
	var position = 0;
	
	for (var i = 0; i < length; i++)
	{
		position++;
		
		if (array[i] = value)
		{
			break;	
		}
	}
	
	return position;
}

/// @desc array_unique(array, value)
/// Check if a value is unique into an array and returns a bool
/// FROM: Me
function array_unique(array, value)
{
	var length = array_length(array);
	var exists = false;
	
	for (var i = 0; i < length; i++)
	{
		if (array[i] == value)
		{
			exists = true;
			break;	
		}
	}
	
	return exists;
}

/// @desc array_random(array)
/// Returns a random value inside an array
/// FROM: Me
function array_random(array)
{
	return array[irandom_range(0, array_length(array) - 1)];	
}

/// @desc array_string(array)
/// Transform every array value into a string
/// FROM: Me
function array_string(array)
{
	var length = array_length(array);
	var arr = array_create(length);
	
	array_clear(arr);
	
	for (var i = 0; i < length; i++)
	{
		var element = array[i];
		
		if (!is_string(element))
		{
			array_push(arr, string(element));	
		}
		else
		{
			array_push(arr, element);	
		}
	}
	
	return arr;
}

/// @desc array_replace(array, index, new_value)
/// Replace an index of an array
/// FROM: Me
function array_replace(array, index, new_value)
{
	array[index] = new_value;
}

/// @desc array_extend(array, extension)
/// Extend an array
/// FROM: Me
function array_extend(array, extend)
{
	var length = array_length(array);
	var arr = array_create(length + extend, noone);
	
	for (var i = 0; i < length; i++)
	{
		arr[i] = array[i];
	}
	
	return arr;
}

/// @desc string_array(string)
/// Turns a string into an array, dividing each letter
/// FROM: Me
function string_array(str)
{
	var len = string_length(str);
	var array;
	
	for (var i = 1; i < len; i++)
	{
		var character = string_char_at(str, i);
		
		array_push(array, character);
	}
	
	return array;
}

/// @desc string_center(string)
/// Center a string
/// FROM: Me
function string_center(str)
{
	string_join(str, "		");
	string_insert("		", str, 1);
}

/// @desc array_find_max(array)
/// Returns the biggest value in an array
/// FROM: Me
function array_find_max(array)
{
	var arr = array_sort(array, true);
	
	return arr[array_length(arr) - 1];
}

/// @desc array_range(from, to)
/// Creates an array with as values, numbers with the range
/// 'From' to 'To'
/// FROM: Me
function array_range(from, to)
{	
	arr = [];
	
	for (var i = from; i <= to; i++)
	{
		array_push(arr, from + i);	
	}
	
	return arr;
}

/// oscillate(from, to, duration)
/// Oscillate a value between the other 2 values
/// FROM: Me
function oscillate(from, to, duration, offset = 1)
{
	var dis = (to - from) / 2;
	duration /= 120;
	
	return from + dis + sin(((current_time / 1000) + to * TAU)/duration * offset) * dis;
}

/// wrap(value, min, max)
/// Wraps a value in a range
/// FROM: Me
function wrap(value, mi,ma)
{
	if (value > ma) then value = mi;
	else if (value < mi) then value = ma;
	
	return value;
}

/// map(value, old_min, old_max, new_min, new_max)
/// Maps a value
/// FROM: net8floz
function map(_value, _old_min, _old_max, _new_min, _new_max) 
{
    return lerp(_new_min, _new_max, (_value - _old_min) / (_old_max - _old_min));
}

/// display_get_gui_size()
/// Returns an array with gui width and height
/// FROM: Me
function display_get_gui_size()
{
	var w = display_get_gui_width();	
	var h = display_get_gui_height();	
	var a = [];
	
	array_push(a, w);
	array_push(a, h);
	
	return a;
}