var collided_obj = instance_place(x, y, obj_player);

if (instance_exists(collided_obj)) {
	collided_obj.hp--;
	if (instance_exists(origin)) collided_obj.knockback(unit_v2(move_v), 0.5);	
	screenshake(10, 5, 0.4);
	instance_destroy();
}

collided_obj = instance_place(x, y, abstract_obj_obstacle);

if (instance_exists(collided_obj)) {
	instance_destroy();
}