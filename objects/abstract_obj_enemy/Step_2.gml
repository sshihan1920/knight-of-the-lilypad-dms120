event_inherited();

if (stunned) {
	st_timer--;
	if (st_timer == 0) {
		stunned = false;
	}
}

if (!stunned) {
	if (!handle_collision_x(obj_player, cur_v) && !handle_collision_x(abstract_obj_grappleable, cur_v)) {
		x += cur_v.x;
	}
	if (!handle_collision_y(obj_player, cur_v) && !handle_collision_y(abstract_obj_grappleable, cur_v)) {
		y += cur_v.y;	
	}
	handle_collision_push(obj_player);
	handle_collision_push(abstract_obj_grappleable);
}

if (equals_v2(cur_v, new Vector2(0, 0)) && enemy_state == EnemyState.Move)
	enemy_state = EnemyState.Idle;
if (!equals_v2(cur_v, new Vector2(0, 0)) && enemy_state == EnemyState.Idle)
	enemy_state = EnemyState.Move;
	
var d_angle = point_direction(x, y, x + cur_v.x, y + cur_v.y);
if (d_angle >= 90 && d_angle < 270)
	enemy_direction = EnemyDirection.Left;
else if (magnitude_v2(cur_v) != 0)
	enemy_direction = EnemyDirection.Right;

x = clamp(x, sprite_half_size, room_width - sprite_half_size);
y = clamp(y, sprite_half_size, room_height - sprite_half_size);

if (hp <= 0) {
	// enter death state
	// handle death anim
	instance_destroy();
}