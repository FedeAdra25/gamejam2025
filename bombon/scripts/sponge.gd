extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if (body.has_method("sponge_jump")):
		body.get_angle_to(global_position)
		body.sponge_jump(gravity_point_center)
		
