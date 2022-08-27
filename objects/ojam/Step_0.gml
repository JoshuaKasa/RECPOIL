// Gun jam
percent_jam += 1/15;
jamscale_position = animcurve_channel_evaluate(curve_jamscale, percent_jam);

vsp *= 0.9;
y_ -= vsp;
a -= 1/60;

if (a < 0) then instance_destroy();