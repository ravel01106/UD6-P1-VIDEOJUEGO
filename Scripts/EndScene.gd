extends Control
@export var start_level = preload("res://Scenes/MainMenu/main_scene.tscn") as PackedScene
@onready var _label_counter = $MarginContainer/VBoxContainer/EndInfo

# Called when the node enters the scene tree for the first time.
func _ready():
	$MusicMenuAudio.play()
	_label_counter.text = "Enemies killed: " + str(Global.enemyKilledCount)



func _on_start_button_pressed():
	get_tree().change_scene_to_packed(start_level)
		
func _on_exit_button_pressed():
	get_tree().quit()
