event_inherited();

if (!handle_collision_x(abstract_obj_obstacle, cur_v)) {
	x += cur_v.x;	
}
if (!handle_collision_y(abstract_obj_obstacle, cur_v)) {
	y += cur_v.y;	
}
handle_collision_push(abstract_obj_obstacle);

x = clamp(x, sprite_half_size, room_width - sprite_half_size);
y = clamp(y, sprite_half_size, room_height - sprite_half_size);