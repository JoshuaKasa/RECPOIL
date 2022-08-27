time += delta_time/1000000;
if (oJukebox.playing == false)
{
	if (time % 10 == 0)
	{
		state = stateb.changing_black;	
	}
	if (state == stateb.black || state == stateb.white) then state_timer += 1;
	if (state_timer == 30) 
	{
		state_timer = 0;
		if (state == stateb.white) then state = stateb.changing_black;
		if (state == stateb.black) then state = stateb.changing_white;
	}

	if (state == stateb.changing_white)
	{
		blackness = lerp(blackness,0.6, 0.01);
		if (blackness == 0.6) then state = stateb.white;	
	}
	else if (state == stateb.changing_black)
	{
		blackness = lerp(blackness,0, 0.01);
		if (blackness < 0.05) then state = stateb.black;
	}

	if (oJukebox.playing == true) then image_alpha = lerp(image_alpha, 1, 0.05);
	else image_alpha = lerp(image_alpha, 0, 0.05);
}
else
{
	blackness = lerp(blackness, 1, 0.01);
}