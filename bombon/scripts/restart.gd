extends Sprite2D

func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://levels/title_screen.tscn")