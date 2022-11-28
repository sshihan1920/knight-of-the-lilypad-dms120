draw_sprite_ext(spr_lilypad_icon, image_index, 32, 32, 4, 4, 0, c_white, 1);
draw_sprite_ext(spr_jump_indicator, image_index, 32, 84, 4, 4, 0, c_white, 1);

for (i = 0; i < player.max_hp; i++) {
	if (i < player.hp) {
		draw_sprite_ext(spr_heart, image_index, 24 + 42 * i, 32, 4, 4, 0, c_white, 1);
	} else {
		draw_sprite_ext(spr_heart_empty, image_index, 24 + 42 * i, 32, 4, 4, 0, c_white, 1);
	}
}

for (i = 0; i < player.max_hp; i++) {
	if (i < (1 - player.jump_cd_timer/player.jump_cd_time) * player.max_hp) {
		draw_sprite_ext(spr_jump_bar, image_index, 24 + 42 * i, 84, 4, 4, 0, c_white, 1);
	} else {
		draw_sprite_ext(spr_jump_bar_empty, image_index, 24 + 42 * i, 84, 4, 4, 0, c_white, 1);
	}
}

for (i = 0; i < player.projectile_count; i++) {
	draw_sprite_ext(spr_projectile_indicator, image_index, 24 + 42 * i, 132, 4, 4, 0, c_white, 1);
}