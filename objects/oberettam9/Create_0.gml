delay = 6;
d = delay;

recoil = 2;
r = recoil;

accuracy = 3;

magazine = 15;
initial_m = magazine;

ammoe_type = "pistol_ammoes";
ammoes = variable_instance_get(oPlayer, ammoe_type);

reloading = false;
reload_time = 120;
initial_r = reload_time;

equipped = false;
in_hand = false;

automatic = false;

reload_magazine = oSmallMagazine;

shell = oPistolShell;

bullets = 1;

durability = MAX_DURABILITY;
rounds_fired = 0;
jammed = false;
