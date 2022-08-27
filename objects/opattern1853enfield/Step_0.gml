is_sniper(1.1);

// Creating smoke
if (reload_time < initial_r && reload_time > initial_r - irandom_range(120,180))
{
	instance_create_layer(x + lengthdir_x(22,image_angle) + irandom_range(-3,3),y + lengthdir_y(22,image_angle), "Instances", oSmoke)
}