var current = variable_instance_get(other, to_give); 
var ammoes = irandom_range(20,50);

variable_instance_set(other, to_give, current + ammoes);
instance_destroy();