if (!bbox_right || !bbox_bottom || bbox_left >= room_width || bbox_top >= room_height
	|| (instance_exists(origin) && point_distance(x, y, origin.x, origin.y) > player_projectile_range)) {
	instance_destroy();
}

x += scale_v2(move_v, timer/time).x;
y += scale_v2(move_v, timer/time).y;

timer = min(time, timer + 1);