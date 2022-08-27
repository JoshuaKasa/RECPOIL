drawing_g = false;
drawing_a = false;
drawing_d = false;

wps = [];
ams = [];

var i = 0;
while (object_exists(i)) 
{
	var obj = asset_get_index(object_get_name(i));
	
	if (object_get_parent(obj) == GUNS) then array_push(wps,obj);
	if (object_get_parent(obj) == AMMOES) then array_push(ams,obj);
	
	i++;
}

wheel_cursor = 0;