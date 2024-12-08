extends Node2D

# Preload the sound files
var sounds = [
	preload("res://sounds/axe (1).wav"),
	preload("res://sounds/axe (2).wav"),
	preload("res://sounds/axe (3).wav"),
	preload("res://sounds/axe (4).wav"),
	preload("res://sounds/axe (5).wav")
]

# Preload the scenes to spawn
var scene1 = preload("res://scenes/newlog1.tscn")
var scene2 = preload("res://scenes/newlog2.tscn")

# Tracks how many times the log got clicked on
var click_count: int = 0
var health: int = 12
# Randomized sound playback
var audio_player: AudioStreamPlayer = AudioStreamPlayer.new()

# Called when the node enters the scene tree for the first time
func _ready():
	randomize()  # Seed the random number generator

# Click event
func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("leftclick") and click_count < health:
		click_count += 1
		print("Log clicked", click_count, "times.")
		play_random_sound()
		
		# Check for specific click counts to spawn scenes
		if click_count == health/2:
			spawn_scene(scene1)
		elif click_count == health:
			spawn_scene(scene2)
			Dialogic.start("Sago Worms Exposed")
			process_mode = Node.PROCESS_MODE_DISABLED

# Function to play a random sound
func play_random_sound():
	var random_sound = sounds[randi() % sounds.size()]
	audio_player.stream = random_sound
	if not audio_player.is_playing():
		get_tree().current_scene.add_child(audio_player)
		audio_player.play()

# Function to spawn a scene with the same position, rotation, and scale
func spawn_scene(scene: PackedScene) -> void:
	var instance = scene.instantiate()

	# Copy the position, rotation, and scale from the current log
	instance.position = position
	instance.rotation = rotation
	instance.scale = scale
	
	# Add the new scene instance to the current scene
	get_tree().current_scene.add_child(instance)
