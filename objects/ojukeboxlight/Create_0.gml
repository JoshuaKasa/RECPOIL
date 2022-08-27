// Setting jukebox general variables
randomize();

x = oJukebox.x;
y = oJukebox.y;

image_alpha = 0.3;

// Creating jukebox light
time = 0;

blackness = 0.6;
enum stateb {
	black,
	changing_black,
	changing_white,
	white
}
state = stateb.white;
state_timer = 0;

// Audio emitter
emit = audio_emitter_create();
max_distance = 150;
drop = 10;
s = 0;

audio_falloff_set_model(audio_falloff_linear_distance);
audio_emitter_position(emit, x,y, 0);
audio_emitter_falloff(emit, drop,max_distance, 1);