image_alpha -= 1/irandom_range(60,100);
if (image_alpha < 0) then instance_destroy();

shell_percent += 1/10;

position_x = animcurve_channel_evaluate(curve_shellx, shell_percent);
position_y = animcurve_channel_evaluate(curve_shelly, shell_percent);

x += position_x * irandom_range(2, 4) * oPlayer.image_xscale * -1;
y += position_y * irandom_range(2, 4);