x += irandom_range(-1,1);
y += irandom_range(-1,1);

image_alpha -= 1/60;
if (image_alpha <= 0) then instance_destroy();