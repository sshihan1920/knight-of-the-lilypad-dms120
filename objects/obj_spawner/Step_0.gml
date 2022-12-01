if (spawner_timer == 0) {
	spawner_timer = spawner_time;
	instance_create_layer(x, y, "Instances", instance_type);
}

spawner_timer--;