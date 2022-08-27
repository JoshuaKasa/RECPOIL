if (oPlayer.hand == -1)
{
	x = lerp(x, mouse_x, 0.5);
	y = lerp(y, mouse_y, 0.5);
}

// Changing size
percent += 1/15;
position_size = animcurve_channel_evaluate(curve_size, percent);

image_xscale = position_size;
image_yscale = position_size;

// Lerping angle
if (image_angle > 360) then image_angle = 0;
if (lerp_angle == true) then image_angle = lerp(image_angle,0, 0.1);

if (mouse_check_button_pressed(mb_middle)) then instance_create_layer(mouse_x,mouse_y, "Instances", oUnguidedBomb);
