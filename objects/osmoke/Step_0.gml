y -= spd;

image_alpha -= 1/life_time;
if (image_alpha == 0) then instance_destroy();