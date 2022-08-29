// Movement
var move_x = (RIGHT - LEFT) * SPEED;
var move_y = (DOWN - UP) * SPEED;
	
if (can_move == true)
{
	x += move_x * spd;
	y += move_y * spd;

	x = clamp(x, 0, LIMITX);
	y = clamp(y, 0, LIMITY);
	
	// Recoil
	percent += 1/20;

	position_x = animcurve_channel_evaluate(curve_x, percent);
	position_y = animcurve_channel_evaluate(curve_y, percent);

	image_xscale = position_x * sign(x - MOUSE_X) * -1;
	image_yscale = position_y;
	
	// Showing UI
	if (move_x == 0 && move_y == 0)
	{
		UI_timer += 1;
		
		if (UI_timer == 30) then UI_on = true;
	}
	if (UI_on == true) 
	{
		UI_x_start = lerp(UI_x_start,UI_x_end, 0.2);
		UI_ammo_start = lerp(UI_ammo_start,UI_ammo_end, 0.2);
	}
	else 
	{
		UI_x_start = lerp(UI_x_start,UI_default_x, 0.2);
		UI_ammo_start = lerp(UI_ammo_start,UI_default_ammo, 0.2);
	}
	
	// Creating dust
	if (move_x != 0 || move_y != 0)
	{
		var inst = instance_create_layer(x,y + 1, "Instances", oDust);	
		
		// Hiding UI
		UI_on = false;
		UI_timer = 0;
		
		// Animating
		hop_percent += 1/15;
		hop_percent = wrap(hop_percent, 0, 1);
		
		hop_position = animcurve_channel_evaluate(hop_curve, hop_percent);
		
		y += hop_position / 2;
	
		repeat (3)
		{
			with (inst)
			{
				image_angle = irandom(360);
				motion_add(other.image_xscale + irandom_range(-5,5), irandom_range(-1,-2) * other.image_xscale);	
			}	
		}
	}
	else image_angle = lerp(image_angle, 0, 0.3);
}

// Equip gun
var gun = instance_nearest(x,y, GUNS);
var len = array_length(inventory); 

if (guns < max_guns && !array_exists(inventory, gun))
{
	if (distance_to_object(gun) < 10)
	{
		if (EQUIP)
		{
			guns += 1;
			array_push(inventory, gun);
			currently_equipped = len;
			hand = currently_equipped;
			
			with (inventory[currently_equipped])
			{
				equipped = true;
				in_hand = true;
			}
			if (len != 0)
			{
				with (inventory[0])
				{
					in_hand = false;
				}
			}
		}
	}
}

if (len != 0)
{
	if (WEAPON1) 
	{
		currently_equipped = 0;
		hand = currently_equipped;
	
		with (inventory[currently_equipped])
		{
			in_hand = true;
		}
		if (len > 1)
		{
			with (inventory[currently_equipped + 1])
			{
				reloading = false;
				in_hand = false;	
			}
		}
	}
	if (len > 1 && WEAPON2) 
	{
		currently_equipped = 1;
		hand = currently_equipped;
	
		with (inventory[currently_equipped])
		{
			in_hand = true;
		}
		with (inventory[currently_equipped - 1])
		{
			reloading = false;
			in_hand = false;	
		}
	}
}

// Remove gun
if (REMOVE_GUN) 
{
	oCursor.lerp_angle = true;
	
	if (len > 0)
	{
		with (inventory[currently_equipped]) 
		{
			reloading = false;
			in_hand = false;
		}
	}
	hand = -1;
}

// Drop gun
if (UNEQUIP_GUN && hand != -1)
{
	oCursor.lerp_angle = true;
	
	with (inventory[currently_equipped])
	{
		reloading = false;
		in_hand = false;
		equipped = false;
	}
	array_delete(inventory, currently_equipped, 1);
	currently_equipped = 0;
	
	guns -= 1;
	hand = -1;
}

// Kill player
if (hp <= 0 && !instance_exists(oDeathscreen)) 
{
	can_move = false;
	
	instance_create_layer(0,0, "Instances", oDeathscreen);
}

// Music discs
if (distance_to_object(oJukebox) < 10 && EQUIP)
{
	drawing = !drawing;

}

// Throwing grenade
if (GRENADE)
{
	var grenade = instance_create_layer(x,y, "Instances", oFlashGrenade);
	
	with (grenade) 
	{
		start_y = oPlayer.y;
		direction = other.inventory[other.currently_equipped].image_angle;	
	}
}

// Listener
audio_listener_position(x,y, 0);

// Vending machine
if (distance_to_object(oVendingMachine) < 10 && EQUIP)
{
	oVendingMachine.drawing_d = !oVendingMachine.drawing_d;
}

// Calling aerial support
if (!instance_exists(PLANES))
{
	if (CAS)
	{
		instance_create_layer(0,0, "Weapons", oF16);	
	}
}

// Removing and putting suit
var suit = instance_nearest(x,y, SUIT);

if (UNEQUIP_SUIT)
{
	with (equipped_suit) equi = false;
}
if (distance_to_object(suit) < 10)
{
	if (EQUIP)
	{
		if (suit.equi == false)
		{
			equipped_suit = suit;
			def_p = suit.defense_projectiles;
			def_e = suit.defense_explosion;
			def_t = suit.defense_toxicity;
			
			with (suit)
			{
				if (equi == false) then equi = true;
			}
		}
	}
}