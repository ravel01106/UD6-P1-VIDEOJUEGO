extends CharacterBody2D
@onready var _animated_enemy_sprite = $AnimatedSprite2D

var velocity1 = Vector2(100,0)
func _physics_process(delta):
	_animated_enemy_sprite.play("idle")
	#velocity1.y += 7
	
	#if is_on_wall():
		#velocity1.x *= -1
		#$AnimatedSprite2D.flip_h = ! $AnimatedSprite2D.flip_h

	move_and_slide()

func _on_top_body_entered(body):
	if body.get_name() == "Player":
		queue_free()

func _on_sides_body_entered(body):
	if body.get_name() == "Player":
		body.respawn()
