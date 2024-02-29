extends Node2D
@export var endScreen = preload("res://Scenes/EndScene/EndScene.tscn") as PackedScene


#var counter = player.counter

func _on_area_2d_body_entered(body):
	get_tree().reload_current_scene()

func _on_end_map_body_entered(body):
	if Global.enemyKilledCount >= 1:
		get_tree().change_scene_to_packed(endScreen)
	#if counter > 2:
	else:
		print("Error?")
