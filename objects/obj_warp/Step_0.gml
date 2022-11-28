if (place_meeting(x, y, obj_player)) {
	room_instance_add(target_room, target_x, target_y, obj_player);
	room_goto(target_room);
}