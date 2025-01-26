extends Area2D

@onready var particles = $GPUParticles2D
@onready var bubbleSpawnSprite = $BubbleSpawn

func _on_body_entered(body: Node2D) -> void:
	if(body.is_in_group("player")):
		particles.emitting = true
		bubbleSpawnSprite.play("default")
