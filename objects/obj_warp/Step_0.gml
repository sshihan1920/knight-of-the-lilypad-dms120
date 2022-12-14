var collided_obj = instance_place(x, y, obj_player);

if (instance_exists(collided_obj)) {
	if (target_x != -1 && target_y != -1) {
		collided_obj.persistent = true;
		collided_obj.x = target_x;
		collided_obj.y = target_y;
	}
	room_goto(target_room);
}