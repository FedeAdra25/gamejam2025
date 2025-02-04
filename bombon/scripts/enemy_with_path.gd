extends Area2D

@export var SPEED:float = 300.0
@export var amountToMove: Vector2
@export var boomerang: bool
@export var start_delay = 0.0
@export var DELAY = 5.0

@onready var initialPosition = global_position

var moving_towards = false
var desiredPosition: Vector2
var swap_delay = 0

func _ready() -> void:
	desiredPosition = initialPosition + amountToMove
	swap_delay = DELAY
	moving_towards = true
	#print("done that")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if start_delay > 0:
		start_delay-= delta
		return
	var newPos = Vector2(
		move_toward(global_position.x, desiredPosition.x, delta * SPEED),
		move_toward(global_position.y, desiredPosition.y, delta * SPEED))
	global_position = newPos
	if(newPos == global_position) && boomerang:
		#Arrived to desiredPosition, swap variables after delay
		swap_delay -= delta
		if swap_delay <= 0:
			swap_delay = DELAY
			var aux = desiredPosition
			desiredPosition = initialPosition
			initialPosition = aux
			moving_towards = !moving_towards

func _on_body_entered(body: Node2D) -> void:
	if(body.has_method("die")):
		body.die()
