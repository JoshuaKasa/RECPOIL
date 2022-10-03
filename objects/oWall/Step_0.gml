var distance = 1 - distance_to_object(PLAYER)/75;

if state == "dis" then image_alpha = distance;
else if state == "hit" 
{
	alpha = lerp(alpha, 0, 0.1);
	image_alpha = alpha;
	
	if (image_alpha == 0 )
	{
		state = "dis";
		alpha = 1;
	}
}