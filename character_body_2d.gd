extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var sprite_2d: AnimatedSprite2D = $Sprite2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var facing_left = false

func _physics_process(delta):
	# Apply gravity
	if not is_on_floor():
		velocity.y += gravity * delta
	
	# Handle Jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	# Handle Movement
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
		facing_left = direction < 0
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()
	
	# Handle Animations
	if not is_on_floor():
		sprite_2d.play("jumping")
	elif abs(velocity.x) > 1:
		sprite_2d.play("running")
	else:
		sprite_2d.play("idle")
	
	# Apply facing direction
	sprite_2d.flip_h = facing_left
