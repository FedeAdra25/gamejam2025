extends Button

var scene
func _ready() -> void:
	scene = preload("res://levels/title_screen.tscn").instantiate()
func _on_pressed() -> void:
	MusicController.play_button()
	get_tree().change_scene_to_file("res://levels/title_screen.tscn")
