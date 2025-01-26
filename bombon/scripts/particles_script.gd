extends Area2D

@onready var particles = $GPUParticles2D
@onready var bubbleSpawnSprite = $BubbleSpawn

func _on_body_entered(body: Node2D) -> void:
	print("collision with player")
	print(body.get_groups())
	if(body.is_in_group("player")):
		particles.emitting = true
		bubbleSpawnSprite.play("default")
