if ((x > room_width || x < 0 || y > room_height || y < 0)
	|| (compare_direction_v2(move_v, new Vector2(origin.x - x, origin.y - grapple_offset - y))
	&& point_distance(x, y, origin.x, origin.y - grapple_offset) > distance_const)
	|| point_distance(x, y, origin.x, origin.y - grapple_offset) > grapple_max_distance
	|| !instance_exists(target) && target != noone) {
	retracting = true;
}

if (retracting) {
	if (instance_exists(target)) {
		if (object_get_parent(target.object_index) == abstract_obj_enemy) target.enemy_state = EnemyState.Move;
		target = noone;
	}
	if (point_distance(x, y, origin.x, origin.y - grapple_offset) < distance_const) {
		if (variable_instance_exists(origin, "grapple")) origin.grapple = noone;
		instance_destroy(id);
	}
	nmove_v = scale_v2(unit_v2(new Vector2(origin.x - x, origin.y - grapple_offset - y)), sp);
	return;
}

if (instance_exists(target)) {
	if (point_distance(x, y, origin.x, origin.y - grapple_offset) < distance_const) {
		if (variable_instance_exists(origin, "grapple")) origin.grapple = noone;
		if (object_get_parent(target.object_index) == abstract_obj_enemy) target.enemy_state = EnemyState.Move;
		instance_destroy(id);
	}
	halt();
	var grapple_direction = new Vector2(target.x - origin.x, target.y - origin.y - grapple_offset);
	var grapple_distance = min(magnitude_v2(grapple_direction), grapple_distance_scale);
	var grapple_vector = scale_v2(unit_v2(grapple_direction), (grapple_distance/grapple_distance_scale) * grapple_sp);
	
	if (origin.grapple_weight > target.grapple_weight) {
		add_to_mod_v(negative_v2(grapple_vector), target);
		target.interp_mod = 0.05;
	} else if (origin.grapple_weight < target.grapple_weight) {
		add_to_mod_v(grapple_vector, origin);
		origin.interp_mod = 0.05;
	} else {
		add_to_mod_v(scale_v2(grapple_vector, 0.5), origin);
		add_to_mod_v(scale_v2(grapple_vector, -0.5), target);
		target.interp_mod = 0.05;
		origin.interp_mod = 0.05;
	}
	return;
}

nmove_v = scale_v2(unit_v2(new Vector2(follow_target.x - x, follow_target.y - y)), sp);

var collided_obj = noone;
var collision_list = ds_list_create();
collision_point_list(x, y, abstract_obj_grappleable, false, true, collision_list, false);
for (i = 0; i < ds_list_size(collision_list); i++) {
	var obj = collision_list[| i];
	if (obj != id && obj != origin && obj.object_index != obj_grapple) {
		collided_obj = collision_list[| i];
		break;
	}
}

delete(collision_list);

if (instance_exists(collided_obj)) {
	target = collided_obj;
	
	if (target.grapple_weight == GrappleWeight.Interactive) {
		target = noone;
		retracting = true;
		halt();
		return;
	} else if (object_get_parent(target.object_index) == abstract_obj_enemy) {
		target.enemy_state = EnemyState.Special;
	}
	
	grapple_distance_scale = point_distance(origin.x, origin.y - grapple_offset, target.x, target.y);
}

move_timer--;
if (move_timer != 0) {
	nmove_v = move_v;	
} else {
	move_timer = move_time;	
}