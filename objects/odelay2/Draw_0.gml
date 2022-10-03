var x_start = CONTROLLER_X_ROOM - curs.sprite_width/2;
var x_end = CONTROLLER_X_ROOM + curs.sprite_width/2;
var y_start = CONTROLLER_Y_ROOM + curs.sprite_height/4 + 2;
var y_end = CONTROLLER_Y_ROOM + curs.sprite_height/4 + 2;

draw_set_color(c_dkgray);
draw_rectangle(x_start,y_start, x_end,y_end, false);

start_value = (array_length(oPlayer2.inventory) == 0) ? 0 : oPlayer2.inventory[oPlayer2.currently_equipped].delay;
end_value = (array_length(oPlayer2.inventory) == 0) ? 0 : oPlayer2.inventory[oPlayer2.currently_equipped].d;

draw_set_color(c_ltgray);
if (start_value != end_value) then draw_rectangle(x_start,y_start, lerp(x_start, x_end, 1 - start_value / end_value),y_end, false);