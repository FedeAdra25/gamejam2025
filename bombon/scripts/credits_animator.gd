extends Node2D

@onready var animator = $Sprite2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animator.play("default")
