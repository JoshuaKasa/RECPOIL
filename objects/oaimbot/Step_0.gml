if (active)
{
	var nearest = instance_nearest(oPlayer.x,oPlayer.y, ENEMIES);
	var x_to = nearest.x;
	var y_to = nearest.y;

	oCrosshair.x = x_to;
	oCrosshair.y = y_to;
}