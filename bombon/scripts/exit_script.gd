extends Node

func _input(event) -> void:
	if event.is_action_pressed("exit"):
		get_tree().quit(0)	
