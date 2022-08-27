shader_set(shRainbow);

var t = shader_get_uniform(shRainbow, "time");
var b = shader_get_uniform(shRainbow, "blackness");
shader_set_uniform_f(t, time);
shader_set_uniform_f(b, blackness);

draw_sprite_ext(sprite_index, image_index, x,y, image_xscale,image_yscale, image_angle, c_white, 1);

shader_reset();