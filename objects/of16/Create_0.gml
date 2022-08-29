image_xscale = choose(-1,1);
dir = image_xscale;

xspeed = 7;

bullets = irandom_range(50,60);
shooting_time = 1 * room_speed;
fire_speed = irandom_range(25,50); 

x = (dir == 1) ? -1000 : room_width + 1000;
y = oPlayer.y - 200;

bombing_timer = 15 * room_speed;

pointx = 0;
pointy = 0;

audio_play_sound(sndF16Flying, 1, false);