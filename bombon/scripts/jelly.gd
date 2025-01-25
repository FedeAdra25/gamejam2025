extends Area2D

const SPEED = 100
var currentDirection = 1
var moveCycles = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if moveCycles <= 100:
		moveCycles += 1
		global_position += Vector2(0, currentDirection * SPEED * delta)
	elif moveCycles <= 200:
		moveCycles += 1
		global_position += Vector2(0, currentDirection * SPEED * delta * -1)
	else:
		moveCycles = 0

func _on_body_entered(body: Node2D) -> void:
	if(body.has_method("die")):
		body.die()
