event_inherited();

if (enemy_state == EnemyState.Knockback) {
	var t_scale = (-power(kb_timer/(kb_time/power(kb_max_sp, 1/kb_exp)), kb_exp) + kb_max_sp) * kb_rscale;
	var t_vec = scale_v2(kb_vector, t_scale);
	x += t_vec.x;
	y += t_vec.y;
	kb_timer++;
	delete(t_vec);
	if (t_scale == 0) {
		kb_timer = 0;
		enemy_state = EnemyState.Move;
	}
}

if (!handle_collision_x(obj_player) && !handle_collision_x(hobj_enemy)) {
	x += cur_v.x;
}

if (!handle_collision_y(obj_player) && !handle_collision_y(hobj_enemy)) {
	y += cur_v.y;
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
	instance_destroy(id);
}