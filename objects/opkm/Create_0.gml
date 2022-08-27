delay = 5;
d = delay;

recoil = 5;
r = recoil;

accuracy = 6;

magazine = 250;
initial_m = magazine;
ammoe_type = "rifle_ammoes";
ammoes = variable_instance_get(oPlayer, ammoe_type);

reloading = false;
reload_time = 480;
initial_r = reload_time;

equipped = false;
in_hand = false;

automatic = true;

reload_magazine = oBoxMagazine;

shell = oAssaultrifleShell;

bullets = 1;

durability = MAX_DURABILITY;
rounds_fired = 0;
jammed = false;
