extends Node2D

@onready var audio = $AudioStreamPlayer2D

func _ready() -> void:
	print("audio is", audio)
	#audio.play()
