extends Area2D

const SPEED = 100
var currentDirection = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position += Vector2(currentDirection * SPEED * delta,0)
	


func _on_body_entered(body: Node2D) -> void:
	if(body.has_method("die")):
		body.die()
