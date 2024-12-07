extends Area2D

# Reference to the TileMap walls
@onready var walls = $"../MazeTileMap"
@onready var pieces = []  # Hold references to all items in the maze
@onready var deposit_center = $"../Deposit"  # Node representing the deposit area
@onready var fake_piece = $"../Piece_Fake"  # Reference to the fake piece in the scene
@onready var reset_cooldown_timer = $Resetcooldowntimer  # Timer node for reset immunity

var carried_piece: Area2D = null  # Currently carried piece
var collected_pieces: Array = []  # To track deposited pieces
var initial_window_size = Vector2.ZERO

func _ready() -> void:
	#Initialize the cursor
	var center = get_viewport().get_visible_rect().size / 2
	global_position = center
	Input.warp_mouse(center) #makes sure mouse starts at centre as well
	
	#collect all pieces in the maze
	pieces = get_tree().get_nodes_in_group("pieces")

func _process(delta):
	# Update the cursor's position to follow the mouse
	global_position = get_viewport().get_camera_2d().get_global_mouse_position()
   
	#Make the carried piece follow the cusor
	if carried_piece:
		var target_position = global_position
		carried_piece.global_position = carried_piece.global_position.lerp(target_position, 0.2)
		
	if get_viewport().get_visible_rect().size != initial_window_size:
		reset_all_pieces()  # Reset pieces when the window size changes
		initial_window_size = get_viewport().get_visible_rect().size  # Update the window size tracker
		
func _on_body_entered(area):
	# Check if the cursor touches a wall
	if area.is_in_group("walls"):
		print("cursor hit a wall")
		reset_cursor()
		reset_all_pieces()
		
func get_viewport_center() -> Vector2:
	# Dynamically calculates the center of the viewport
	var viewport_rect = get_viewport().get_visible_rect()
	return viewport_rect.size / 2
		
func reset_cursor() -> void:
	# Reset the mouse cursor to the center of the screen
	var center = get_viewport_center()
	Input.warp_mouse(center)
	global_position = center
	print("Cursor reset to center!")
	print("Viewport center:", get_viewport().get_visible_rect().size/ 2)




func reset_all_pieces():
	#drops the carried piece and reset all pieces to their original positions
	if carried_piece:
		carried_piece.reset_position()
		carried_piece = null

	for piece in pieces:
		if not piece.is_deposited:
			piece.reset_position() #only undeposited pieces

func _on_area_entered(area: Area2D) -> void:
	#if entering a piece area, pick it up
	if area.is_in_group("pieces") and carried_piece == null and area.is_deposited == false:
		carried_piece = area
		area.start_carried()
		print("picked up a piece:", area.name)

	#if entering a deposit zone, deposit the piece
	elif area == deposit_center and carried_piece:
		reveal_piece_in_center(carried_piece)
		carried_piece = null #drop the piece
		check_victory_condition()
		
	elif area.is_in_group("fake_pieces"):
		Dialogic.start("fake piece")
		
		
func reveal_piece_in_center(piece: Area2D) -> void:
	#move the piece to the deposit center and mark it as collected
	var center_position = deposit_center.global_position
	piece.global_position = deposit_center.global_position
	piece.scale = Vector2(2, 2)
	piece.is_deposited = true #marks the piece as deposited
	collected_pieces.append(piece)


func check_victory_condition() -> void:
	#check if all pieces have been collected and deposited
	if collected_pieces.size() == 3:
		trigger_victory()
		
func trigger_victory() -> void:
	#triger victory scene
	print ("All pieces have been collected")
	
	#play dialogic timeline 
	Dialogic.start("End Scene")
	Dialogic.timeline_ended.connect(ended)
	
func ended():
	Dialogic.timeline_ended.disconnect(ended)
	print("ended")
	get_tree().change_scene_to_file("res://scenes/final_cutscene.tscn")
