extends Area2D

@export var scene:PackedScene

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		var ERR = get_tree().change_scene_to_packed(scene)
		if ERR != OK:
			print("Failed to load scene", scene)
