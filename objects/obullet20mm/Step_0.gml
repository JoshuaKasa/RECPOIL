if (y > oPlayer.y) 
{
	repeat (irandom_range(4,8)) instance_create_layer(x + irandom_range(-2,2),y + irandom_range(-2,2), "Weapons", oBulletSmoke);
	screen_shake(3, 1.5);
	instance_destroy();
}