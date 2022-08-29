// Traveling
fall_time += 1/60;
fall_speed = (power(fall_time, 2) * grv) / 2;

x += xspd;
y += fall_speed;

//x_travel = round(xspd * round(fall_time * 60));
//y_travel = round(y - ystart);
//x_travel = clamp(x_travel, 0,max_travel);
//y_travel = clamp(y_travel, 0,max_travel);

// Facing ground
var dif = angle_difference(dir, image_angle);
image_angle += dif * (fall_time/500);

// Getting final position
var final_time = 3;

if (fall_time == final_time) 
{
	var final_x = xstart + (xspd * (final_time * 60));
	var final_y = 0;

	instance_destroy();
}