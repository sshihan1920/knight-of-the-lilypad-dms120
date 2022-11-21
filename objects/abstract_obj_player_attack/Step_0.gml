collision_list = ds_list_create();
instance_place_list(x, y, abstract_obj_enemy, collision_list, false);
for (i = 0; i < ds_list_size(collision_list); i++) {
	var obj = collision_list[| i];
	if (ds_list_find_index(collided_list, obj) == -1) {
		ds_list_add(collided_list, obj);
		on_hit(obj);
		break;
	}
}

ds_list_clear(collision_list);