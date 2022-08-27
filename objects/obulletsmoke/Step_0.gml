y -= increment;

image_xscale -= 1/30;
image_yscale -= 1/30;
image_angle -= 0.3 * angle;
image_alpha -= 1/30;
if (image_alpha <= 0) then instance_destroy();