if (!keyboard_check_pressed(ord("P"))) exit;

paused = !paused;
if (!paused) {
    instance_activate_all();
    surface_free(paused_surf);
    paused_surf = -1;
}