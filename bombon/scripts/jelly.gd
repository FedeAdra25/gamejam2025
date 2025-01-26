extends "res://scripts/enemy_with_path.gd"

@onready var animatedSprite2d = $AnimatedSprite2D

func _ready() -> void:
<<<<<<< Updated upstream
=======
	#print("done this")
>>>>>>> Stashed changes
	super._ready()
	animatedSprite2d.play("default")
