// Position
x_pad += PAD_X * sensitivity;
y_pad += PAD_Y * sensitivity;

x_pad = clamp(x_pad, 0, display_get_gui_width());
y_pad = clamp(y_pad, 0, display_get_gui_height());

if (oPlayer2.hand == -1)
{
    x = lerp(x, x_pad, 0.5);
    y = lerp(y, y_pad, 0.5);
}

x_gui = x * ((camera_get_view_x(CAMERA) * camera_get_view_width(CAMERA)) / display_get_gui_width());
y_gui = y * ((camera_get_view_y(CAMERA) * camera_get_view_height(CAMERA)) / display_get_gui_height());

// Changing size
percent += 1/15;
position_size = animcurve_channel_evaluate(curve_size, percent);

image_xscale = position_size;
image_yscale = position_size;

// Lerping angle
if (image_angle > 360) then image_angle = 0;
if (lerp_angle == true) then image_angle = lerp(image_angle,0, 0.1);