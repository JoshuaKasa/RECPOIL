draw_sprite_ext(sShadow, 1, x,y + 3, image_xscale,image_yscale, 0, image_blend, image_alpha);
draw_self();

if (time > 0) 
{
	time -= 0.05;
	
	shader_set(shWhite);
	draw_sprite_ext(sprite_index, image_index, x,y, image_xscale,image_yscale, image_angle, c_white, time);
	shader_reset();
}