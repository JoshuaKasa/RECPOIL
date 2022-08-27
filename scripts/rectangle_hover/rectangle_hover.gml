function rectangle_hover(start_x,start_y, end_x,end_y)
{
	var mx = device_mouse_x_to_gui(0);
	var my = device_mouse_y_to_gui(0);
	
	return point_in_rectangle(mx,my, start_x,start_y, end_x,end_y);
}