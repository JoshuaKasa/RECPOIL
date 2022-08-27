delay = 4;
d = delay;

recoil = 1;
r = recoil;

accuracy = 2;

magazine = 30;
initial_m = magazine;
ammoe_type = "pistol_ammoes";
ammoes = variable_instance_get(oPlayer, ammoe_type);

reloading = false;
reload_time = 180;
initial_r = reload_time;

equipped = false;
in_hand = false;

automatic = true;

reload_magazine = oMagazine;

shell = oPistolShell;

bullets = 1;

durability = MAX_DURABILITY;
rounds_fired = 0;
jammed = false;
