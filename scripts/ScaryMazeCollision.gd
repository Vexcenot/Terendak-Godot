extends Area2D

# Reference to the TileMap walls
@onready var walls = $"../MazeTileMap"

func _ready() -> void:
	print("cursor is ready")
	var center = get_viewport().get_visible_rect().size / 2
	global_position = center
	Input.warp_mouse(center) #makes sure mouse starts at centre as well
	
	

func _process(delta):
	# Update the cursor's position to follow the mouse
	global_position = get_viewport().get_camera_2d().get_global_mouse_position()
   # This will show the cursor position in the console
	

func _on_body_entered(area):
	# Check if the cursor touches a wall
	if area.is_in_group("walls"):
		print("cursor hit a wall")
		reset_cursor()

func reset_cursor():
	# Reset the mouse cursor to the center of the screen
	var center = get_viewport().get_visible_rect().size / 2
	Input.warp_mouse(center)
	print("Cursor reset to center!")
