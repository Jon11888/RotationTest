extends CharacterBody2D


var SPEED = 100.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 980
var coyoteTime = 0.0

func _physics_process(delta):
	


	if coyoteTime <= 0.95:
		velocity.y += gravity * delta
	if Input.is_key_pressed(KEY_SPACE) and coyoteTime>0.90:
		velocity.y = JUMP_VELOCITY
		coyoteTime = 0.0

	if Input.is_key_pressed(KEY_A) and not Input.is_key_pressed(KEY_D):
		velocity.x = -SPEED
	if Input.is_key_pressed(KEY_D) and not Input.is_key_pressed(KEY_A):
		velocity.x = SPEED
	if velocity.x >1 and (not (Input.is_key_pressed(KEY_D) or Input.is_key_pressed(KEY_A))):
		velocity.x = velocity.x/1.4
	if velocity.x <-1 and (not (Input.is_key_pressed(KEY_D) or Input.is_key_pressed(KEY_A))):
		velocity.x = velocity.x/1.4
	if (velocity.x >= -1 and velocity.x <= 1) and (not (Input.is_key_pressed(KEY_D) or Input.is_key_pressed(KEY_A))):
		velocity.x = 0

	move_and_slide()
	
func _process(delta):
	if not is_on_floor():
		coyoteTime = lerp(coyoteTime, 0.0, delta) #coyoteTime starts at 1.0 and moves towards 0.0 over time.
	if is_on_floor():
		coyoteTime = 1.0
	if Input.is_key_pressed(KEY_D) or Input.is_key_pressed(KEY_A):
		SPEED = lerp(SPEED, 125.0, 2*delta) #SPEED starts at 50.0 and moves towards 125.0 over time.
	else:
		SPEED = 50.0
