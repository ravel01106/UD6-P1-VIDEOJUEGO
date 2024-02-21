extends CharacterBody2D

const SPEED = 600.0
const JUMP_VELOCITY = -800.0

@onready var _animated_sprite = $AnimatedSprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var customGravity = 1000


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += customGravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	velocity.x = direction * SPEED
	
	if direction != 0:
		_animated_sprite.flip_h = (direction == -1)
	update_animations(direction)
	#if direction:
	#	if velocity.x > 0:
	#		_animated_sprite.flip_h = false 
	#	elif velocity.x < 0:
	#		_animated_sprite.flip_h = true
	#	_animated_sprite.play("walk")
	#else:
	#	velocity.x = move_toward(velocity.x, 0, SPEED)
	#	_animated_sprite.play("idle")
	move_and_slide()
func update_animations(direction):
	if is_on_floor():
		if direction == 0:
			_animated_sprite.play("idle")
		else :
			_animated_sprite.play("walk")
	else:
		if velocity.y < 0:
			_animated_sprite.play("jump") 
		elif velocity.y > 0:
			_animated_sprite.play("fall")
			
func respawn():
	get_tree().reload_current_scene()
