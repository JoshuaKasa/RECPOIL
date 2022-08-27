delay = 12;
d = delay;

recoil = 7.5;
r = recoil;

accuracy = 7;

magazine = 32;
initial_m = magazine;
ammoe_type = "shotgun_ammoes";
ammoes = variable_instance_get(oPlayer, ammoe_type);

reloading = false;
reload_time = 260;
initial_r = reload_time;

equipped = false;
in_hand = false;

automatic = true;

reload_magazine = oDrumMagazine;

shell = oShotgunShell;

bullets = 3;

durability = MAX_DURABILITY;
rounds_fired = 0;

jammed = false;