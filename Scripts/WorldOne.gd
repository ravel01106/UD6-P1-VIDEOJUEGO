extends Node2D
@export var endScreen = preload("res://Scenes/EndScene/endScene.tscn") as PackedScene

func _ready():
	Global.resetCounterSignal.connect(_on_area_2d_body_entered)

func _on_area_2d_body_entered(body):
	Global.resetCounter(0)
	get_tree().reload_current_scene()

func _on_end_map_body_entered(body):
	if Global.enemyKilledCount >= 1:
		get_tree().change_scene_to_packed(endScreen)
