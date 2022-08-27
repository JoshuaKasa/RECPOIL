draw_sprite_ext(sShadow, 1, x,y + 4, image_xscale,image_yscale, 0, image_blend, image_alpha);
draw_self();

var gun = instance_nearest(x,y, GUNS);

if (guns < max_guns && !array_exists(inventory, gun))
{
	if (distance_to_object(gun) < 10)
	{
		draw_sprite_ext(sEquip, 1, x, y - 10, oscillate(1,1.3, 60, 2), oscillate(1,1.3, 60, 4), 1, image_blend, image_alpha);
	}
}

if (distance_to_object(oJukebox) < 10)
{
	draw_sprite_ext(sEquip, 1, x - 5, y + 10, oscillate(1,1.3, 60, 2), oscillate(1,1.3, 60, 4), 1, image_blend, image_alpha);
	draw_sprite_ext(sStop, 1, x + 5, y + 10, oscillate(1,1.3, 60, 2), oscillate(1,1.3, 60, 4), 1, image_blend, image_alpha);
}