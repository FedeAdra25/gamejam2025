extends Node2D

@onready var animation = $AnimatedSprite2D
var scene
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation.play("default")
	scene = preload("res://levels/1_level.tscn").instantiate()

func _on_animated_sprite_2d_animation_finished() -> void:
	print(scene)
	get_tree().change_scene_to_file("res://levels/1_level.tscn")
