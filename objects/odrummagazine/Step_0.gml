image_alpha -= 1/irandom_range(120,240);
speed *= fric;

if (image_alpha == 0) then instance_destroy();