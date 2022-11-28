event_inherited();

if (equals_v2(cur_v, new Vector2(0, 0)) && player_state == PlayerState.Move)
	player_state = PlayerState.Idle;
if (!equals_v2(cur_v, new Vector2(0, 0)) && player_state == PlayerState.Idle)
	player_state = PlayerState.Move;
if (grapple != noone && grapple.target != noone) 
	player_state = PlayerState.Grapple;
	
var d_angle = point_direction(x, y, x + cur_v.x, y + cur_v.y);
if (d_angle >= 45 && d_angle < 135)
	player_direction = PlayerDirection.Up;
else if (d_angle >= 135 && d_angle < 225)
	player_direction = PlayerDirection.Left;
else if (d_angle >= 225 && d_angle < 315)
	player_direction = PlayerDirection.Down;
else if (magnitude_v2(cur_v) != 0)
	player_direction = PlayerDirection.Right;
	
handle_sprite_by_state();

if (player_state == PlayerState.Prejump || player_state == PlayerState.Postjump)
	return;

if (!collidable) {
	x += cur_v.x;
	y += cur_v.y;
} else {
	if (!handle_collision_x(abstract_obj_obstacle, cur_v)) {
		x += cur_v.x;	
	}
	if (!handle_collision_y(abstract_obj_obstacle, cur_v)) {
		y += cur_v.y;	
	}
	handle_collision_push(abstract_obj_obstacle);
}

x = clamp(x, sprite_half_size, room_width - sprite_half_size);
y = clamp(y, sprite_half_size, room_height - sprite_half_size);

if (hp <= 0) {
	room_goto(rm_death_screen);	
}