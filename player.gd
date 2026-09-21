extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -600.0

var START_POS = position


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	if Input.is_action_just_pressed("reset"):
		position = START_POS

	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if direction < 0:
		$Sprite2D.flip_h = false
	elif direction > 0:
		$Sprite2D.flip_h = true

	move_and_slide()
