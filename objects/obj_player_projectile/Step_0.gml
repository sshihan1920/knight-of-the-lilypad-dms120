event_inherited();

if (collided_obj != noone) {
	collided_obj.hp--;
	collided_obj.knockback(unit_v2(move_v), 1.5);
}