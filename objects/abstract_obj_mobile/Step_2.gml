calc_new_move_vector();
normalize_move_by_state();

if (knockbacked) {
	var t_scale = (-power(kb_timer/(kb_time/power(kb_max_sp, 1/kb_exp)), kb_exp) + kb_max_sp) * kb_rscale;
	var t_vec = scale_v2(kb_vector, t_scale);
	x += t_vec.x;
	y += t_vec.y;
	kb_timer++;
	delete(t_vec);
	if (t_scale == 0) {
		kb_timer = 0;
		knockbacked = false;
	}
}