// handle movement key presses
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_up = keyboard_check(ord("W"));
key_down = keyboard_check(ord("S"));

var h_move = key_right - key_left;
var v_move = key_down - key_up;

nmove_v = add_v2(scale_v2(unit_v2(new Vector2(h_move, v_move)), sp), mod_v);

// handle non movement key presses
key_grapple = keyboard_check_pressed(ord("X"));
key_grapple_released = keyboard_check_released(ord("X"));


if (key_grapple && !instance_exists(grapple)) {
	grapple = instance_create_layer(x, y, layer, obj_grapple, 
	{
		origin: id,
		follow_target: cursor,
	});
}

if (key_grapple_released) {
	player_state = PlayerState.Move;
	if (instance_exists(grapple)) {
		grapple.retracting = true;
		grapple = noone;
	}
}

key_projectile = mouse_check_button_pressed(mb_right);

if (key_projectile) {
	instance_create_layer(x, y - projectile_offset, layer, obj_player_projectile,
	{
		origin: id,
		move_v: unit_v2(new Vector2(cursor.x - x, cursor.y - y - projectile_offset)),
	});
}

key_sword = mouse_check_button_pressed(mb_left);

if (key_sword) {
	sword = instance_create_layer(x, y, layer, obj_sword,
	{
		origin: id,
		angle: point_direction(x, y, cursor.x, cursor.y),
	});
	player_state = PlayerState.Attack;
}

if (player_state == PlayerState.Attack && !instance_exists(sword)) {
	player_state = PlayerState.Move;
}

key_jump_attack = keyboard_check_pressed(vk_space);

if (key_jump_attack) {
	player_state = PlayerState.Prejump;
	jump_timer = 0;
}

if (player_state == PlayerState.Prejump) {
	if (floor(image_index) == 13) {
		player_state = PlayerState.Jump;
		held_v = nmove_v;
	}
}

if (player_state == PlayerState.Postjump) {
	if (floor(image_index) == 23) {
		player_state = PlayerState.Move;	
	}
}

if (player_state == PlayerState.Jump) {
	image_index = 20;
	nmove_v = held_v;
	y -= jump_max_speed/power_ext(jump_time/2, jump_exp) * power_ext(jump_time/2 - jump_timer, jump_exp);
	jump_timer++;

	if (jump_timer == jump_time + 1) {
		instance_create_layer(x, y, layer, obj_jump_attack,
		{
			origin: id,
		});
		player_state = PlayerState.Postjump;
	}
}