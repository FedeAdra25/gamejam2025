extends AnimatedSprite2D

var playerPhysics: RigidBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	playerPhysics = %PlayerPhysics
	play("walk_left")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
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
	print("velocity -> ", velocity, "linear velocity -> ", playerPhysics.linear_velocity)
	speed_scale = playerPhysics.linear_velocity.length() * delta
	#print(speed_scale)
	global_position = playerPhysics.global_position
	
