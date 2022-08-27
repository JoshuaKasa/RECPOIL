delay = 5;
d = delay;

recoil = 2;
r = recoil;

accuracy = 3;

magazine = 30;
initial_m = magazine;
ammoe_type = "pistol_ammoes";
ammoes = variable_instance_get(oPlayer, ammoe_type);

reloading = false;
reload_time = 200;
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
