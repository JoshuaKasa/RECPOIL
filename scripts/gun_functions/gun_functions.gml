function drop_empty_magazine(weapon)
{
	var empty_mag = instance_create_layer(oPlayer.x,oPlayer.y, "Bullets", weapon.reload_magazine);

	with (empty_mag)
	{
		motion_add(weapon.image_angle + irandom_range(-8,8), irandom_range(-2,-4));	
	}
}

function create_shell()
{
	var wp = oPlayer.inventory[oPlayer.currently_equipped];
	
	instance_create_layer(wp.x + irandom_range(-3,3),wp.y + irandom_range(-3, 3), "Bullets", shell);
}

function use_weapon(weapon)
{
	// Get ammoes
	ammoes = variable_instance_get(oPlayer, ammoe_type);
	
	// Using weapon
	if (equipped == true)
	{
		if (in_hand == true)
		{
			// Weapon
			var angle = point_direction(oPlayer.x,oPlayer.y, MOUSE_X,MOUSE_Y);

			x = oPlayer.x + lengthdir_x(25, angle);
			y = oPlayer.y + lengthdir_y(25, angle);

			recoil = lerp(recoil, 0,0.3);
			x -= lengthdir_x(recoil, image_angle);
			y -= lengthdir_y(recoil, image_angle);

			image_angle = angle;

			if (image_angle > 90) && (image_angle < 270) then image_yscale = -1;
			else image_yscale = 1;
			
			var button = (automatic == true) ?SHOOT_AUTOMATIC : SHOOT;
			
			if (delay > 0) then delay -= 1;
			if (button && delay == 0 && magazine > 0 && reloading == false)
			{
				if (jammed == false)
				{
					// Gun jam
					rounds_fired += 1;
					durability -= power(1.5, (durability / MAX_DURABILITY)) / 10;
					durability = clamp(durability, 0.5, MAX_DURABILITY);
				
					if (1 > irandom(durability * 100)) then jammed = true;
				
					// Shooting
					audio_play_sound(sound, 10, false);
					audio_sound_pitch(sound, random_range(0.95,1.25));
					
					magazine -= 1;
					delay = d;
					recoil = r;
				
					create_shell();
	
					display_mouse_set(display_mouse_get_x(),display_mouse_get_y() - irandom_range(weapon.recoil * 15, weapon.recoil * 20));

					oPlayer.x -= lengthdir_x(recoil/4, image_angle);
					oPlayer.y -= lengthdir_y(recoil/4, image_angle);
					oPlayer.percent = 0;
				
					oCursor.percent = 0;
				
					for (var i = 1; i <= bullets; i++)
					{
						with (instance_create_layer(x,y, "Bullets", oBullet))
						{
							dam = other.damage;
							
							speed = 25;
							direction = other.image_angle + irandom_range(-weapon.accuracy,weapon.accuracy);
							image_angle = direction;
							image_xscale = max(1,speed/sprite_width);
						}
					}
				
					// Screenshake
					with (oCamera)
					{
						scale_percent = 0;
						scale = choose(-1,1);
					}
				}
				else
				{
					// Jam gun
					jam_gun();
				}
			}

			// Ammoes
			var rel = (revolver == true) ? RELOAD : RELOAD_AUTOMATIC;
			
			if (magazine == 0 && reloading == false || rel && reloading == false)
			{
				if (ammoes > 0) 
				{
					oPlayer.percent_reload_start = 0;
					oPlayer.alpha_reload = 1;	

					reloading = true;
				}
			}
			
			// Unjamming gun
			if (jammed == true && UNJAM)
			{
				jammed = false;
				
				// Creating jam manager
				instance_destroy(oJam);
	
				var inst = instance_create_layer(x,y, "Instances", oJam);
	
				with (inst)
				{
					text = "Unjammed!";
					x_ = other.x + 10;
					y_ = other.y - 5;
					percent_jam = 0;
				}
			}
		}
	}
	else
	{
		image_angle = oscillate(-10,10, 120);
		image_xscale = oscillate(1,1.1, 120, 2);
		image_yscale = oscillate(1,1.1, 120, 4);
	}
}

function draw_weapon_ammoes()
{
	draw_set_halign(fa_left);
	draw_set_font(fFont);
	draw_sprite_ext(sAmmoes, 1, oPlayer.UI_ammo_start,10, 1,1, 0,c_white, 0.5);
	draw_set_color(c_ltgray);
	draw_text(oPlayer.UI_ammo_start + 1,20, string(magazine) + " / " + string(ammoes));	
}

function draw_weapon()
{	
	if (equipped == true)
	{
		if (in_hand == true) then draw_self();
	}
	else draw_self();
}

function reload()
{	
	if (reloading == true)
	{
		with (oCursor)
		{
			lerp_angle = false;
			image_angle += 360/30;
		}
		
		reload_time -= 1;
		
		if (reload_time == initial_r/2) then drop_empty_magazine(self);
		
		if (reload_time == 0)
		{
			if (revolver == true)
			{
				magazine = clamp(ammoes, 0,magazine + 1);
				ammoes = clamp(ammoes - 1, 0,9999);
				variable_instance_set(oPlayer, ammoe_type, ammoes);
			}
			else
			{
				magazine = clamp(ammoes, 0,initial_m);
				ammoes = clamp(ammoes - magazine, 0,9999);
				variable_instance_set(oPlayer, ammoe_type, ammoes);
			}
			
			reloading = false;
			reload_time = initial_r;
			
			jammed = false;
			
			with (oCursor) lerp_angle = true;
		}
	}
}

function is_sniper(offset_view = 1)
{
	// Camera managment
	if (in_hand == true)
	{
		with (oCamera)
		{
			xto_lerp = lerp(xto_lerp, (xto * offset_view) * position_scale + 0.7, 0.1);
			yto_lerp = lerp(yto_lerp, (yto * offset_view) * position_scale + 0.7, 0.1);
			
			camera_set_view_size(cam, xto_lerp,yto_lerp);
		}
	}
}

function jam_gun()
{
	// Creating jam manager
	instance_destroy(oJam);
	
	var inst = instance_create_layer(x,y, "Instances", oJam);
	
	with (inst)
	{
		text = "Jammed!";
		x_ = other.x + 10;
		y_ = other.y - 5;
		percent_jam = 0;
	}
}