extends AnimatedSprite2D

var playerPhysics: RigidBody2D
var flag_deleteado = false

func _ready() -> void:
	playerPhysics = %PlayerPhysics
	play("idle")

func _process(delta: float) -> void:
	if flag_deleteado:
		play("die")
		return
	var velocity = playerPhysics.linear_velocity
	if velocity.x > 0:
		if flip_h:
			flip_h = false
		play("walk")
	if velocity.x < 0:
		if !flip_h:
			flip_h = true
		play("walk")
	if velocity.y < -0.01:
		play("up")
	elif velocity.y > 0.01 && playerPhysics.linear_velocity.y > 0.01: # valga la redundancia
		play("down")
	elif abs(velocity.x) <= 0.4:
		play("idle")
	speed_scale = playerPhysics.linear_velocity.length() * delta
	global_position = playerPhysics.global_position
	
func _on_player_physics_deleteado(value: Variant) -> void:
	flag_deleteado = true
