repeat (irandom_range(4,7))
{
	var part = instance_create_layer(x,y, "Bullets", oDebrie);
	with (part) motion_add(other.image_angle + irandom_range(-60,60),random_range(-1,-4));
}
repeat (choose(3))
{
	var part = instance_create_layer(x,y, "Bullets", oSpark);
	with (part) 
	{
		motion_add(other.image_angle + irandom_range(-90,90),random_range(-3,-5));
		image_angle = direction;
	}
}
instance_destroy();