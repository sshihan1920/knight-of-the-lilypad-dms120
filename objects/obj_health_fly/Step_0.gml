if (repath_timer == 0) {
	var new_x = random_range(move_v.x - sp, move_v.x + sp);
	var new_y = random_range(move_v.y - sp, move_v.y + sp);
	
	nmove_v = normal_cap_v2(new Vector2(new_x, new_y), sp);
	repath_timer = repath_time;
} else {
	nmove_v = move_v;	
}

repath_timer = max(0, repath_timer - 1);

var collided_obj = instance_place(x, y, obj_player);
if (instance_exists(collided_obj)) {
	collided_obj.hp++;
	instance_destroy();
}