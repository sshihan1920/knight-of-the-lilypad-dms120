if (!instance_exists(origin)) {
	instance_destroy();
}

collided_obj = instance_place(x, y, obj_player);

if (instance_exists(collided_obj)) {
	collided_obj.hp--;
	if (instance_exists(origin)) collided_obj.knockback(unit_v2(new Vector2(collided_obj.x - origin.x, collided_obj.y - origin.y)), 0.5);	
	screenshake(10, 5, 0.4);
	instance_destroy();
}

if (instance_exists(origin)) x = origin.x + offset.x;
if (instance_exists(origin)) y = origin.y + offset.y;