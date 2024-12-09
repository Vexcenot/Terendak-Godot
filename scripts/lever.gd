extends Area2D

# Declare the lever state
var is_activated: bool = false

# Signal to notify when the lever state changes
signal lever_state_changed(activated: bool)

# Reference to the lever sprite (for changing visuals)
@onready var lever_sprite: Node2D = $Sprite2D

# Textures for the lever states
const TEXTURES: Dictionary = {
	'on': preload("res://Assets/charactermodels/Mask outline (1).png"),
	'off': preload("res://Assets/2dplatforming/Invisible Bridge.png")
}

func _ready() -> void:
	# Initialize the lever visuals
	update_lever_visuals()

func _process(delta: float) -> void:
	# Check if the "M" key is pressed
	if Input.is_action_just_pressed("toggle_lever"):
		toggle_lever()  # Toggle the lever state

func toggle_lever() -> void:
	# Toggle the lever state
	is_activated = !is_activated
	update_lever_visuals()  # Update the sprite or visuals based on the state
	emit_signal("lever_state_changed", is_activated)  # Notify connected objects
	DragManager.mask_equip = !DragManager.mask_equip

func update_lever_visuals() -> void:
	# Change the lever sprite based on activation state
	if is_activated:
		lever_sprite.texture = TEXTURES['on']
	else:
		lever_sprite.texture = TEXTURES['off']
		
