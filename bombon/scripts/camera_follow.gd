extends Camera2D

@onready var player = %Player
var moveCamera = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		print(player.position)
	if moveCamera:
		position += Vector2(delta * 100, 0)
		


func _on_area_2d_body_entered(body: Node2D) -> void:
	if(body.is_in_group("player")):
		moveCamera = true
