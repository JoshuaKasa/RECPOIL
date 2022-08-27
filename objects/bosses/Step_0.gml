ai_hit();

image_xscale = hit_position_x;
image_yscale = hit_position_y;

if (oBossSpawn.boss_health == 0)
{
	with (oBossSpawn) 
	{
		boss_health = other.bh;
		name = other.n;
	}	
}