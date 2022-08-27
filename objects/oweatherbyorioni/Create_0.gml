delay = 10;
d = delay;

recoil = 20;
r = recoil;

accuracy = 8;

magazine = 2;
initial_m = magazine;
ammoe_type = "shotgun_ammoes";
ammoes = variable_instance_get(oPlayer, ammoe_type);

reloading = false;
reload_time = 100;
initial_r = reload_time;

equipped = false;
in_hand = false;

automatic = false;

reload_magazine = oDoubleBarrelMagazine;

shell = oShotgunShell;

bullets = 6;

durability = MAX_DURABILITY;
rounds_fired = 0;
jammed = false;
