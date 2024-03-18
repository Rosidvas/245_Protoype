extends MeshInstance3D

@onready var flame = $flame

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Handle left mouse button press and release events
func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.is_pressed():
			on_left_mouse_pressed()
		else:
			on_left_mouse_released()

# Define action to perform on left mouse press
func on_left_mouse_pressed():
	print("Left mouse button pressed!")
	flame.visible = true

# Define action to perform on left mouse release
func on_left_mouse_released():
	print("Left mouse button released!")
	flame.visible = false
