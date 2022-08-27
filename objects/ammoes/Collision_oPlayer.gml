var current = variable_instance_get(oPlayer, to_give); 
var ammoes = irandom_range(20,50);

variable_instance_set(oPlayer, to_give, current + ammoes);
instance_destroy();