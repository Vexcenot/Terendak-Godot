extends Area2D

# Reference to the TileMap walls
@onready var walls = $"../MazeTileMap"
@onready var pieces = []  # Hold references to all items in the maze
@onready var deposit_center = $"../Deposit"  # Node representing the deposit area

var carried_piece: Area2D = null  # Currently carried piece
var collected_pieces: Array = []  # To track deposited pieces

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
		carried_piece.global_position = global_position

func _on_body_entered(area):
	# Check if the cursor touches a wall
	if area.is_in_group("walls"):
		print("cursor hit a wall")
		reset_cursor()
		reset_all_pieces()

func reset_cursor():
	# Reset the mouse cursor to the center of the screen
	var center = get_viewport().get_visible_rect().size / 2
	Input.warp_mouse(center)
	global_position = center
	print("Cursor reset to center!")

func reset_all_pieces():
	#drops the carried piece and reset all pieces to their original positions
	if carried_piece:
		carried_piece.reset_position()
		carried_piece = null

	for piece in pieces:
		piece.reset_position()

func _on_area_entered(area: Area2D) -> void:
	#if entering a piece area, pick it up
	if area.is_in_group("pieces") and carried_piece == null:
		carried_piece = area
		area.start_carried()
		print("picked up a piece:", area.name)

	#if entering a deposit zone, deposit the piece
	elif area == deposit_center and carried_piece:
		reveal_piece_in_center(carried_piece)
		carried_piece = null #drop the piece
		check_victory_condition()
		
func reveal_piece_in_center(piece: Area2D) -> void:
	#move the piece to the deposit center and mark it as collected
	var center_position = deposit_center.global_position
	piece.reveal_in_center(center_position)
	collected_pieces.append(piece)
		
func check_victory_condition() -> void:
	#check if all pieces have been collected and deposited
	if collected_pieces.size() == 3:
		trigger_victory()
		
func trigger_victory() -> void:
	#triger victory scene
	print ("All pieces have been collected")
	get_tree().change_scene_to_file("res://scenes/final_cutscene.tscn")
	
	
