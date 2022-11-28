if (paused) {
	if (!surface_exists(paused_surf)) {
	    if (paused_surf == -1) {
	        instance_deactivate_all(true);
	    }
	    paused_surf = surface_create(display_get_gui_width(), display_get_gui_height());
	    surface_set_target(paused_surf);
	    draw_surface(application_surface, 0, 0);
	    surface_reset_target();
	} else {
	    draw_surface(paused_surf, 0, 0);
		draw_set_font(fn_start_menu);
	    draw_set_alpha(0.5);
	    draw_rectangle_colour(0, 0, display_get_gui_width(), display_get_gui_height(), c_black, c_black, c_black, c_black, false);
	    draw_set_alpha(1);
	    draw_set_halign(fa_center);
	    draw_text_transformed_colour(display_get_gui_width()/2, display_get_gui_height()/2, "PAUSED", 2, 2, 0, c_white, c_white, c_white, c_white, 1);
	    draw_set_halign(fa_left);
    }
}