extends Node2D


var sfx_array = [load("res://music/angry_wizzard.ogg"), load("res://music/angry_wizzard.ogg"), load("res://music/spell.ogg"), load("res://music/flush_toilet.ogg")]
var cinematic_music = load("res://music/cinematic.ogg")
var level1_music = load("res://music/base.mp3")
@onready var animation = $AnimatedSprite2D

var first_frame = false
var change_scene = false


var scene
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation.play("default")
	scene = preload("res://levels/1_level.tscn").instantiate()
	MusicController.play_cinematic()

func _on_animated_sprite_2d_animation_finished() -> void:
	change_scene=true
	

func _on_animated_sprite_2d_frame_changed() -> void:
	if(first_frame):
		first_frame = true
		return
	$SfxPlayer.stream = sfx_array.pop_front()
	$SfxPlayer.play()


func _on_sfx_player_finished() -> void:
	if change_scene:
		get_tree().change_scene_to_file("res://levels/1_level.tscn")
