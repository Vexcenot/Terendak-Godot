extends Area2D

var click_count: int = 0
const MAX_CLICKS = 6
var state: String = "default"
var spear_in: bool = false

# Load the new scenes you want to add
var NewScene1 = preload("res://scenes/log1.tscn")  # Scene after 3 clicks
# var NewScene2 = preload("res://log2.tscn")  # Scene after another 3 clicks

# Preload the sound files
var sounds = [
	preload("res://sounds/axe (1).wav"),
	preload("res://sounds/axe (2).wav"),
	preload("res://sounds/axe (3).wav"),
	preload("res://sounds/axe (4).wav"),
	preload("res://sounds/axe (5).wav")
]

# Called when the mouse button is pressed over the area
func _input_event(viewport, event, shape_idx):
	if spear_in and event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		click_count += 1
		print("Click count: ", click_count)
		
		# Play 1 random sound per click
		play_random_sound()

		if click_count == MAX_CLICKS:
			change_state(NewScene1)  # Change to the first new scene
#       elif click_count == MAX_CLICKS * 2:
#           change_state(NewScene2)  # Change to the second new scene

# Function to play a single random sound
func play_random_sound():
	# Choose a random sound from the list
	var random_sound = sounds[randi() % sounds.size()]
	
	# Create an AudioStreamPlayer instance
	var audio_player = AudioStreamPlayer.new()
	audio_player.stream = random_sound
	
	# Add the audio player as a child of the current scene
	get_tree().current_scene.add_child(audio_player)
	
	# Play the sound
	audio_player.play()

# Function to change state and load a new scene at the current location
func change_state(new_scene: PackedScene):
	# Instantiate the new scene
	var new_scene_instance = new_scene.instantiate()
	
	# Set the new scene's position to the current node's position
	new_scene_instance.global_position = global_position
	
	# Add the new scene instance as a child of the current scene
	get_tree().current_scene.add_child(new_scene_instance)
	
	# Optionally, you can change the state variable
	state = "changed"
	print("State changed to: ", state)
	
	# Disable further input processing after scene change
	set_process_input(false)
	print("Input processing disabled")

# Trigger when a body enters the area
func _on_body_entered(area):
	if area.is_in_group("spear"):
		print("Spear entered.")
		spear_in = true

# Trigger when a body exits the area
func _on_body_exited(area):
	if area.is_in_group("spear"):
		print("Spear exited.")
		spear_in = false
