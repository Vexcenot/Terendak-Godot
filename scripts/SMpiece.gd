extends Area2D

@export var unique_id: int  # Unique identifier for each item
@export var sprite_path: String  # Path to the sprite texture

var original_position: Vector2  # To reset the item's position
var is_being_carried: bool = false  # Whether the item is being carried
var is_deposited: bool = false #keeps track the piece is deposited

func _ready() -> void:
	original_position = global_position  # Save the starting position
	$Sprite2D.texture = load(sprite_path)  # Load the sprite texture dynamically

func reset_position() -> void:
	global_position = original_position  # Reset to original position

func start_carried() -> void:
	is_being_carried = true

func stop_carried() -> void:
	is_being_carried = false

func reveal_in_center(center_position: Vector2) -> void:
	global_position = center_position  # Move the item to the center
	set_process(false)  # Stop further updates
	is_being_carried = false
	
