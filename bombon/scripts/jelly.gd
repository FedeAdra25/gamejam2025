extends "res://scripts/enemy_with_path.gd"

@onready var animatedSprite2d = $AnimatedSprite2D

func _ready() -> void:
	print("done this")
	super._ready()
	animatedSprite2d.play("default")