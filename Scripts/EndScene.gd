extends Control
@export var start_level = preload("res://Scenes/MainMenu/main_scene.tscn") as PackedScene
@onready var _label_counter = $MarginContainer/VBoxContainer/VBoxContainer/Info

@onready var restart_button = $MarginContainer/HBoxContainer/VBoxContainer/Restart as Button
@onready var exit_button = $MarginContainer/HBoxContainer/VBoxContainer/Exit as Button

# Called when the node enters the scene tree for the first time.
func _ready():
	$EndSceneAudio.play()
	restart_button.button_down.connect(_on_restart_pressed)
	exit_button.button_down.connect(_on_exit_pressed)
	_label_counter.text = "Enemies killed: " + str(Global.enemyKilledCount)

func _on_restart_pressed() -> void:
	get_tree().change_scene_to_packed(start_level)

func _on_exit_pressed() -> void:
	get_tree().quit()
