delay = 0;
d = 200;

recoil = 35;
r = recoil;

accuracy = 1;

magazine = 5;
initial_m = magazine;
ammoe_type = "sniper_ammoes";
ammoes = variable_instance_get(oPlayer, ammoe_type);

reloading = false;
reload_time = 350;
initial_r = reload_time;

equipped = false;
in_hand = false;

automatic = false;

reload_magazine = oBlank;

shell = oSniperShell;

bullets = 1;

durability = MAX_DURABILITY;
rounds_fired = 0;
jammed = false;
