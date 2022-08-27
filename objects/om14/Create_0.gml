delay = 5;
d = delay;

recoil = 4;
r = recoil;

accuracy = 1;

magazine = 20;
initial_m = magazine;
ammoe_type = "rifle_ammoes";
ammoes = variable_instance_get(oPlayer, ammoe_type);

reloading = false;
reload_time = 180;
initial_r = reload_time;

equipped = false;
in_hand = false;

automatic = false;

reload_magazine = oSemiMagazine;

shell = oAssaultrifleShell;

bullets = 1;

durability = MAX_DURABILITY;
rounds_fired = 0;
jammed = false;
