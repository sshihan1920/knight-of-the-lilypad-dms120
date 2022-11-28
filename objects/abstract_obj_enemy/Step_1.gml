if (!instance_exists(track_target)) {
	track_target = instance_find(obj_player, 0);
}

if (!instance_exists(target) && !instance_exists(collision_line(x, y, track_target.x, track_target.y, abstract_obj_obstacle, true, true))) {
	dormant = false;
	target = track_target;
}

event_inherited();
