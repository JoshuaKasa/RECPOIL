percent_grenade += 1/60;
if (speed > 0) 
{
	speed -= 1/80;
	image_angle += 5;
}

position_grenade = animcurve_channel_evaluate(curve_grenade, percent_grenade);

y = start_y + position_grenade * 5;