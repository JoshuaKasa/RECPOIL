function is_on()
{
	if (equi == true)
	{
		x = oPlayer.x;
		y = oPlayer.y;

		image_xscale = oPlayer.image_xscale;
		image_yscale = oPlayer.image_yscale;
			
		image_angle = oPlayer.image_angle;
		
		depth = oPlayer.depth - 1;		
	}
	else
	{
		image_angle = oscillate(-10,10, 120);
		image_xscale = oscillate(1,1.1, 120, 2);
		image_yscale = oscillate(1,1.1, 120, 4);	
	}
}