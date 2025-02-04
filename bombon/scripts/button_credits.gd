extends Button

@onready var audio = $AudioStreamPlayer

var scene
var was_pressed = false
func _ready() -> void:
	scene = preload("res://levels/credits.tscn").instantiate()

func _on_pressed() -> void:
	MusicController.play_button()
	get_tree().change_scene_to_file("res://levels/credits.tscn")
