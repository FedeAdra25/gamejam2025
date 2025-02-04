extends "res://scripts/enemy_with_path.gd"

@onready var audio = $AudioStreamPlayer

func _ready() -> void:
	super._ready()
	audio.play()

func _process(delta: float) -> void:
	var pos = global_position
	super._process(delta)
	if(!audio.playing && moving_towards):
		audio.play()
