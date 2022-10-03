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

function damage_player(player, damage, damage_type)
{
	with (player)
	{
		switch (damage_type)
		{	
			case "projectile": hp -= (def_p == 0) ? damage : ((100 * damage / def_p) * damage / 50) + 2;
			break;	
			
			case "explosion": hp -= (def_e == 0) ? damage : (1 - (def_e / (def_e + 200))) * 100;
			break;	
			
			case "toxicity": hp -= -1 * (damage * (1 - def_t));
			break;	
		}
	}
}