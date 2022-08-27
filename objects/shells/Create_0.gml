image_angle = irandom(360);

curve_shellx = animcurve_get_channel(cShells, "x");
curve_shelly = animcurve_get_channel(cShells, "y");
shell_percent = 0;

depth = oPlayer.depth - 1;