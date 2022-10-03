y += oscillate(-2 / 60,2 / 60, 60);

if (distance_to_object(PLAYER) < 10)
{
	var x_ = PLAYER.x;
	var y_ = PLAYER.y;
	
	move_towards_point(x_,y_, 0.1);		
}
else speed  = 0;