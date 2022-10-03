speed -= 1/60;

alive_time -= 1;
if (alive_time <= 0) then instance_destroy();