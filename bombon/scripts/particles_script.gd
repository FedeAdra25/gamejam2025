extends Area2D

@onready var particles = $GPUParticles2D
@onready var bubbleSpawnSprite = $BubbleSpawn
@onready var audio = $AudioStreamPlayer

func _process(delta: float) -> void:
	if(!audio.playing && particles.emitting):
		audio.play()

func _on_body_entered(body: Node2D) -> void:
	if(body.is_in_group("player")):
		particles.emitting = true
		bubbleSpawnSprite.play("default")
		
