# Singleton or global state to track if an item is being dragged
# You can create a singleton (Autoload) named "DragManager" that tracks dragging status

extends RigidBody2D
@export var is_dragging = false

# Reference to the AudioStreamPlayer2D node
@onready var audio_player = $AudioStreamPlayer2D
@onready var sprite = $Sprite  # Reference to the Sprite node
@onready var sprite_empty = $SpriteEmpty  # Reference to the SpriteEmpty node

# Custom sounds for pickup and drop
@export var pickup_sound: AudioStream
@export var drop_sound: AudioStream

# Called every frame to update the position if dragging
func _process(delta):
	if is_dragging:
		# Set the global position to the mouse position (centers the object on the cursor)
		global_position = get_global_mouse_position()
		# Hide the original sprite and show the SpriteEmpty
		sprite.visible = false
	else:
		# When not dragging, ensure the original sprite is visible
		sprite.visible = true

# Helper function to play the sound
func play_sound(sound: AudioStream) -> void:
	if audio_player != null and sound != null:
		audio_player.stream = sound  # Assign the sound stream
		audio_player.play()  # Play the sound

# Function to handle picking up the item
func pick_up_item() -> void:
	if !is_dragging and !DragManager.is_dragging:  # Ensure no other item is being dragged
		# Set dragging state to true and play the pickup sound
		is_dragging = true
		DragManager.is_dragging = true  # Update the global state
		play_sound(pickup_sound)  # Play pickup sound
		$Area2D.set_process_input(false)  # Disable input processing when picked up
		await get_tree().create_timer(0.5).timeout  # Wait for 0.5 seconds
		action01()  # Call action01 after picking up

# New function to handle action01
func action01() -> void:
	print("Action 01 executed!")

# Function to handle dropping the item
func drop_item() -> void:
	if is_dragging:
		# Set dragging state to false and play the drop sound
		is_dragging = false
		DragManager.is_dragging = false  # Update the global state
		play_sound(drop_sound)  # Play drop sound
		$Area2D.set_process_input(true)  # Re-enable input processing when dropped

# Input event handler
func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		print("im working")
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			# If left-clicked and not already dragging, pick up the object
			if !is_dragging and !DragManager.is_dragging:
				pick_up_item()  # Call the new function to pick up the item
			elif is_dragging:
				action01()  # If already dragging, perform the action
		else:
			# If right-clicked, drop the object
			if is_dragging:
				drop_item()  # Call the new function to drop the item
				print("drop")
