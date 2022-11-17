collided_obj = noone;
var collision_list = ds_list_create();
instance_place_list(x, y, hobj_enemy, collision_list, false);
for (i = 0; i < ds_list_size(collision_list); i++) {
	var obj = collision_list[| i];
	show_debug_message(obj);
	if (ds_list_find_index(collided_list, obj) == -1) {
		collided_obj = collision_list[| i];
		ds_list_add(collided_list, collided_obj);
		break;
	}
}

delete(collision_list);