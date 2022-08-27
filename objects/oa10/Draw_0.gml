draw_self();

shader_set(shShadow);

draw_set_alpha(0.7);
draw_sprite_ext(sprite_index, 0, x,y + 200, image_xscale * 1.15,image_yscale * 1.15, image_angle, image_blend, image_alpha);
draw_set_alpha(1);

shader_reset();