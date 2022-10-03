hp = 100;
max_hp = 100;

guns = 0;
max_guns = 2;
inventory = [];
currently_equipped = -1;
hand = -1;

spd = 1.5;

can_move = true;

curve_x = animcurve_get_channel(cRecoil, "x");
curve_y = animcurve_get_channel(cRecoil, "y");
percent = 1;

hop_percent = 0;
hop_curve = animcurve_get_channel(cMovement, "hop");

UI_timer = 0;
UI_on = true;

UI_x_start = GW + 259;
UI_default_x = UI_x_start;
UI_x_end = GW - 5;

UI_ammo_start = -259;
UI_default_ammo = UI_ammo_start;
UI_ammo_end = 5;

curve_start = animcurve_get_channel(cReload, "start");
percent_reload_start = 0;
position_reload_start = 0;

alpha_reload = 1;

shotgun_ammoes = 200;
musket_ammoes = 200;
pistol_ammoes = 200;
sniper_ammoes = 200;
rifle_ammoes = 200;

music_discs = [];
drawing = false;

audio_listener_orientation(0,1,0,0,0,1);

equipped_suit = -1;
def_p = 0;
def_e = 0;
def_t = 0;

showing = false;