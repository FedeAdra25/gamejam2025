extends Area2D

@onready var animator = $Sprite2D


func _on_body_entered(body: Node2D) -> void:
	if (body.is_in_group("player") && body.has_method("sponge_jump")):
		body.sponge_jump(global_position)
		animator.play("bounce")
