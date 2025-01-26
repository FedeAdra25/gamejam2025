extends Button

@export var scene : PackedScene

func _ready() -> void:
	print(scene)

func _on_pressed() -> void:
	print(scene)
	scene.instantiate()
	get_tree().change_scene_to_packed(scene)
