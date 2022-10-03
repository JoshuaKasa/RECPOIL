function is_on()
{
	if (equi == true)
	{
		x = owner.x;
		y = owner.y;

		image_xscale = owner.image_xscale;
		image_yscale = owner.image_yscale;
			
		image_angle = owner.image_angle;
		
		depth = owner.depth - 1;		
	}
	else
	{
		image_angle = oscillate(-10,10, 120);
		image_xscale = oscillate(1,1.1, 120, 2);
		image_yscale = oscillate(1,1.1, 120, 4);	
	}
}