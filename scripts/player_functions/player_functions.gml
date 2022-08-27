function ai_hit()
{
	hit_percent += 1/18;

	hit_position_x = animcurve_channel_evaluate(curve_hitx, hit_percent);
	hit_position_y = animcurve_channel_evaluate(curve_hity, hit_percent);
}

function screen_shake(time, pow)
{
	with (oCamera)
	{
		shake_time = time;
		shake_remain = shake_time;
		shake_power = pow;
		scale_percent = 0;
		scale = choose(-1,1);
	}
}