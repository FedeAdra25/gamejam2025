extends Button

var scene
func _ready() -> void:
	scene = preload("res://levels/initial_cinematic.tscn").instantiate()
func _on_pressed() -> void:
	print(scene)
	get_tree().change_scene_to_file("res://levels/initial_cinematic.tscn")
