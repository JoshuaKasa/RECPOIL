delay = 35;
d = delay;

recoil = 9;
r = recoil;

accuracy = 5;

magazine = 8;
initial_m = magazine;
ammoe_type = "shotgun_ammoes";
ammoes = variable_instance_get(oPlayer, ammoe_type);

reloading = false;
reload_time = 100;
initial_r = reload_time;

equipped = false;
in_hand = false;

automatic = false;

reload_magazine = oBlank;

shell = oShotgunShell;

bullets = 3;

durability = MAX_DURABILITY;
rounds_fired = 0;
jammed = false;
