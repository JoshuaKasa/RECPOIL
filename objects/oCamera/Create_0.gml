cam = view_camera[0];

follow = oPlayer;

width_pos = camera_get_view_width(cam) / 2;
height_pos = camera_get_view_height(cam) / 2;

x_ = follow.x - 100;
y_ = follow.y - 100;

cam_speed = 0.15;
lerp_amount = 0.09;

xto_lerp = 256;
yto_lerp = 144;
xto = 320;
yto = 180;

curve_scale = animcurve_get_channel(cCamera, "scale");
curve_angle = animcurve_get_channel(cCamera, "rotation");
scale_percent = 0;

scale = choose(-1,1);

multx = 0;
multy = 0;

shake_time = 0;
shake_power = 0;
shake_remain = shake_power;