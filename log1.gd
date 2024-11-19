extends Area2D

var click_count: int = 0
const MAX_CLICKS = 3
var state: String = "default"

# Load the new scene you want to add on top
var NewScene = preload("res://log2.tscn")  # Replace with your actual scene path

# Preload the breaking sound effects
var breaking_sounds = [
	preload("res://sounds/axe (1).wav"),  # Replace with actual sound paths
	preload("res://sounds/axe (2).wav"),
	preload("res://sounds/axe (3).wav"),
	preload("res://sounds/axe (4).wav"),
	preload("res://sounds/axe (5).wav"),
]

# Called when the mouse button is pressed over the area
func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		click_count += 1
		print("Click count: ", click_count)
		
		# Play a random breaking sound
		play_random_breaking_sound()

		if click_count >= MAX_CLICKS:
			change_state()

# Function to change state and spawn the new scene at the current location
func change_state():
	# Instantiate the new scene
	var new_scene_instance = NewScene.instantiate()
	
	# Set the new scene's position to the current node's position
	new_scene_instance.global_position = global_position
	
	# Add the new scene instance as a child of the current scene
	get_tree().current_scene.add_child(new_scene_instance)
	
	# Optionally, you can change the state variable
	state = "changed"
	print("State changed to: ", state)

# Function to play a random breaking sound
func play_random_breaking_sound():
	# Choose a random index from the breaking_sounds array
	var random_index = randi() % breaking_sounds.size()
	
	# Create an AudioStreamPlayer node
	var audio_player = AudioStreamPlayer.new()
	audio_player.stream = breaking_sounds[random_index]
	
	# Add it as a child to the current node and play the sound
	add_child(audio_player)
	audio_player.play()
	
