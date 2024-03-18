extends CharacterBody3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5
const MID_AIR_JUMP_VELOCITY = 8.5
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

@onready var cammy := $Camera
@onready var camera := $Camera/Camera3D
@onready var weapon := $Flamethrower

func _unhandled_input(event: InputEvent): 
	if event is InputEventMouseButton:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
			if event.button_index == MOUSE_BUTTON_RIGHT and event.is_pressed():
				jump(true)  # Allow mid-air jump
	elif event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	elif Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event.is_action_pressed("ui_accept"):
			jump(false)  # Disallow mid-air jump

	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event is InputEventMouseMotion:
			cammy.rotate_y(-event.relative.x * 0.01)
			weapon.rotate_y(-event.relative.x * 0.01)
			camera.rotate_x(-event.relative.y * 0.01)
			camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-60), deg_to_rad(60))
			weapon.rotation.x = clamp(camera.rotation.x, deg_to_rad(-60), deg_to_rad(60))
			
func jump(allow_mid_air_jump):
	if is_on_floor():
		velocity.y = JUMP_VELOCITY
	elif allow_mid_air_jump:
		velocity.y = MID_AIR_JUMP_VELOCITY

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("left", "right", "forward", "back")
	var direction = (cammy.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
