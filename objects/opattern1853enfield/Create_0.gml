delay = 0;
d = delay;

recoil = 20;
r = recoil;

accuracy = 1;

magazine = 1;
initial_m = magazine;
ammoe_type = "musket_ammoes";
ammoes = variable_instance_get(oPlayer, ammoe_type);

reloading = false;
reload_time = 960;
initial_r = reload_time;

equipped = false;
in_hand = false;

automatic = false;

reload_magazine = oBlank;

shell = oMusketShell;

bullets = 1;

durability = MAX_DURABILITY;
rounds_fired = 0;
jammed = false;
