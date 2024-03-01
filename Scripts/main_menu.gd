class_name MainMenu
extends Control

@onready var start_button = $MarginContainer/HBoxContainer/VBoxContainer/StartButton as Button
@onready var exit_button = $MarginContainer/HBoxContainer/VBoxContainer/ExitButton as Button

@export var start_level = preload("res://Scenes/MainMenu/main_scene.tscn") as PackedScene

func _ready():
	$MusicMenuAudio.play()
	start_button.button_down.connect(on_start_pressed)
	exit_button.button_down.connect(on_exit_pressed)

func on_start_pressed() -> void:
	$MusicMenuAudio.stop()
	get_tree().change_scene_to_packed(start_level)

func on_exit_pressed() -> void:
	get_tree().quit()
