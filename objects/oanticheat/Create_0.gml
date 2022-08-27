locked_variables = [];
locked_values = [];
locked_from = [];

max_variables = [];
max_max = [];
max_from = [];

warnings = 0;
warning_time = 0;

previous_x = oCrosshair.x;
previous_y = oCrosshair.y;

anticheat_lock("max_hp", oPlayer.max_hp, oPlayer);
anticheat_lock("spd", oPlayer.spd, oPlayer);

anticheat_max("max_guns", 2, oPlayer);
anticheat_max("hp", 100, oPlayer);