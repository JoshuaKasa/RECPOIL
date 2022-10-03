if (opener == oPlayer.id)
{
	if (mouse_wheel_up() && wheel_cursor > 0) then wheel_cursor--;
	else if (mouse_wheel_down() && wheel_cursor < array_length(wps) - 6) then wheel_cursor++;
}
else
{
	if (SCROLL_UP && wheel_cursor > 0) then wheel_cursor--;
	else if (SCROLL_DOWN && wheel_cursor < array_length(wps) - 6) then wheel_cursor++;
}