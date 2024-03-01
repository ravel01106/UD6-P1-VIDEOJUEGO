extends CharacterBody2D

const SPEED = 600.0
const JUMP_VELOCITY = -1200.0

@onready var _animated_sprite = $AnimatedSprite2D
@onready var _label_counter = $"../CanvasLayer/EnemiesKilledCounter"


var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var customGravity = 1000
var counter = 0

func _ready():
	Global.killedEnemySignal.connect(change_counter)

func _physics_process(delta):

	if not is_on_floor():
		velocity.y += customGravity * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		$JumpAudio.play()
		velocity.y = JUMP_VELOCITY

	var direction = Input.get_axis("ui_left", "ui_right")
	velocity.x = direction * SPEED

	if direction != 0:
		_animated_sprite.flip_h = (direction == -1)
	update_animations(direction)

	move_and_slide()
	walk_sound(velocity)

func walk_sound(velocity):
	if velocity.x != 0 and is_on_floor():
		if (Input.is_action_just_pressed("ui_left") or Input.is_action_just_pressed("ui_right")):
			$WalkAudio.play()
	else:
		$WalkAudio.stop()

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
  
func change_counter(killedEnemySignal):
	_label_counter.text = "Enemies Killed: " + str(Global.enemyKilledCount)


