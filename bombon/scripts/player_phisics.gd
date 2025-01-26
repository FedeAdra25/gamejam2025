extends RigidBody2D

@export var SPEED = 300.0
@export var JUMP_VELOCITY = -300.0
@export var JUMP_COOLDOWN = 0.3
@export var FUERZA_ESPONJA = 40
@export var FUERZA_PEZ_GLOBO = 40
var currentVelocity:float = 0.0
var timePressed = 0
var jumpCooldown = 0
var isJumping = false
var isCurrent = false
var deathflag = false
var deathtimer = 0.0
signal deleteado(value)

@onready var playerDiesSfx = $PlayerSfx/PlayerDying
@onready var playerJumpSfx = $PlayerSfx/PlayerJumping
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	jumpCooldown -= delta
	if (deathflag && deathtimer < 2.0):
		deathtimer += delta
		set_gravity_scale(0)
		return
	if (deathflag && deathtimer > 2.0):
		get_tree().reload_current_scene()
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


func die() -> void:
	deathflag = true
	emit_signal("deleteado", true)
	playerDiesSfx.play()
	
func current() -> void:
	isCurrent = !isCurrent

func sponge_jump(sponge_position:Vector2) -> void:
	var direccionDeSalto = Vector2((sponge_position.x - global_position.x) * -1, (sponge_position.y - global_position.y) * -1)
	apply_central_impulse(direccionDeSalto * FUERZA_ESPONJA)

func spring(obj_pos) -> void:
	var direccionDeSalto = Vector2((obj_pos.x - global_position.x) * -1, (obj_pos.y - global_position.y) * -1)
	apply_central_impulse(direccionDeSalto * FUERZA_PEZ_GLOBO)
