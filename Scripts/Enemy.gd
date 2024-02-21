extends CharacterBody2D
@onready var _animated_enemy_sprite = $AnimatedSprite2D

var speed = -25
var facing_right = false

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(_delta):
	_animated_enemy_sprite.play("idle")
	if not is_on_floor():
		velocity.y += gravity * _delta
		
	if !$RayCast2D.is_colliding() && is_on_floor():
		flip()
	velocity.x = speed
	move_and_slide()

func flip():
	facing_right = !facing_right
	scale.x = abs(scale.x) * -1
	if facing_right:
		speed = abs(speed)
	else:
		speed = abs(speed) * -1

func _on_top_body_entered(body):
	if body.get_name() == "Player":
		queue_free()
		body.change_counter()

func _on_sides_body_entered(body):
	if body.get_name() == "Player":
		body.respawn()
