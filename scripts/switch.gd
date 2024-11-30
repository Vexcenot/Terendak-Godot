extends Area2D

# Declare the lever state (acts as the "score")
var is_activated: bool = false

# Signal to notify when the lever state changes
signal lever_state_changed(activated: bool)

# Reference to the lever sprite (for changing visuals)
@onready var lever_sprite: Sprite2D = $Sprite2D

# Textures for the lever states
const TEXTURES: Dictionary = {
	'on': preload("res://Assets/charactermodels/Dakan pressed.png"),
	'off': preload("res://Assets/charactermodels/Dakan1.png")
}

func _ready() -> void:
	update_lever_visuals()  # Initialize visuals

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("toggle_lever"):
		toggle_lever()

func toggle_lever() -> void:
	# Toggle the lever state
	is_activated = !is_activated
	update_lever_visuals()  # Update the visuals
	emit_signal("lever_state_changed", is_activated)  # Notify other objects

func update_lever_visuals() -> void:
	# Update sprite texture and visibility
	if is_activated:
		lever_sprite.texture = TEXTURES['on']
		lever_sprite.visible = true  # Make the sprite visible
	else:
		lever_sprite.texture = TEXTURES['off']
		lever_sprite.visible = false  # Make the sprite invisible
