extends RigidBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -300.0
const JUMP_COOLDOWN = 0.3
var currentVelocity:float = 0.0
var timePressed = 0
var jumpCooldown = 0
var isJumping = false
var isCurrent = false
@onready var playerDiesSfx = $PlayerSfx/PlayerDying
@onready var playerJumpSfx = $PlayerSfx/PlayerJumping
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	jumpCooldown -= delta
	if isCurrent:
		apply_central_impulse(Vector2(0,JUMP_VELOCITY))
	if Input.is_action_just_pressed("jump") && jumpCooldown <= 0.0:
		playerJumpSfx.play()
		isJumping = true
		jumpCooldown = JUMP_COOLDOWN
	# Handle jump.
	if Input.is_action_pressed("jump") && isJumping:
		if timePressed < 0.3:
			timePressed += delta
			apply_central_impulse(Vector2(0,JUMP_VELOCITY))
		else:
			isJumping = false
	else:
		timePressed = 0
	if Input.is_action_just_released("jump"):
		isJumping = false
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		apply_central_impulse(Vector2(direction * 100,0))
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func die() -> void:
	print("Moriste peteeeeeeeeeeeeeeeeeeeee")
	playerDiesSfx.play()
	
func current() -> void:
	isCurrent = !isCurrent

func sponge_jump() -> void:
	apply_central_impulse(Vector2(0,JUMP_VELOCITY * 25))
