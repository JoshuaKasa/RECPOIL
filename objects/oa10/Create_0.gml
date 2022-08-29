image_xscale = choose(-1,1);
dir = image_xscale;

xspeed = 4;

bullets = irandom_range(50,60);
shooting_time = 2.5 * room_speed;
fire_speed = irandom_range(20,45); 

x = (dir == 1) ? -900 : room_width + 900;
y = oPlayer.y - 200;

bombing_timer = 15 * room_speed;

pointx = 0;
pointy = 0;

audio_play_sound(sndA10Flying, 1, false);