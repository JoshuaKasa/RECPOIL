x_ += (lerp(follow.x,mouse_x, lerp_amount) - x_) * cam_speed;
y_ += (lerp(follow.y,mouse_y, lerp_amount) - y_) * cam_speed;

x = lerp(x,x_, cam_speed) + irandom_range(-shake_remain,shake_remain);
y = lerp(y,y_, cam_speed) + irandom_range(-shake_remain,shake_remain);
shake_remain = max(0, shake_remain - (1/shake_time) * shake_power);

width_pos = camera_get_view_width(cam) / 2;
height_pos = camera_get_view_height(cam) / 2;

camera_set_view_pos(cam, x - width_pos,y - height_pos);

scale_percent += 1/15;
position_scale = animcurve_channel_evaluate(curve_scale, scale_percent);
position_angle = animcurve_channel_evaluate(curve_angle, scale_percent);

camera_set_view_angle(cam, (position_angle * 1.5) * scale);

// Setting size
if (mouse_wheel_up()) 
{
	multx -= 16;
	multy -= 9;
}
else if (mouse_wheel_down()) 
{
	multx += 16;
	multy += 9;
}

xto_lerp = lerp(xto_lerp, multx + 256 * position_scale, 0.07);
yto_lerp = lerp(yto_lerp, multy + 144 * position_scale, 0.07);

camera_set_view_size(cam, xto_lerp,yto_lerp);	