y += oscillate(-2 / 60,2 / 60, 60);

if (distance_to_object(oPlayer) < 10)
{
	var x_ = oPlayer.x;
	var y_ = oPlayer.y;
	
	move_towards_point(x_,y_, 0.1);		
}
else speed  = 0;