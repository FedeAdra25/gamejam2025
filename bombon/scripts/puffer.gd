extends Area2D
var CANTIDAD_DE_VECES_QUE_CORRIO_COLLIDED = 0
#desinflado
#choque
#empuja y luego infla
#inflado
#mata
@onready var sprite = $Sprite2D
@onready var col_sm = $CollisionShape2D
@onready var col_lg = $coliisionlarge
func _ready() -> void:
	col_lg.set_disabled(false)
	sprite.play("default")
	
func _on_body_entered(body: Node2D) -> void:
	#print(body)
	if(body.has_method("spring") && CANTIDAD_DE_VECES_QUE_CORRIO_COLLIDED == 0):
		body.spring(global_position)
		CANTIDAD_DE_VECES_QUE_CORRIO_COLLIDED = CANTIDAD_DE_VECES_QUE_CORRIO_COLLIDED + 1
		sprite.play("large")
		col_sm.set_disabled(true)
		col_lg.set_disabled(false)
	elif body.has_method("die"):
		body.die()
