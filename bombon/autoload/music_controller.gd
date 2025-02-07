extends Node

var menu_music = load("res://music/menu.ogg")
var cinematic_music = load("res://music/cinematic.ogg")
var level_music = [load("res://music/base.ogg"), load("res://music/2nd.ogg"), load("res://music/3rd.ogg"), load("res://music/4th.ogg")]

@onready var music_node:AudioStreamPlayer = $Music
@onready var sfx:AudioStreamPlayer = $Sfx


func play_menu():
	if(!music_node.playing || !music_node.stream == menu_music):
		music_node.stream = menu_music
		music_node.play()

func play_cinematic():
	music_node.stream = cinematic_music
	music_node.play()

func play_level(number):
	if music_node.stream == cinematic_music:
		music_node.stop()
		music_node.volume_db = 10
	var playback_position = music_node.get_playback_position()
	music_node.stream = level_music[number]
	music_node.play(playback_position)
	
func play_button():
	sfx.play(0.04)
	
