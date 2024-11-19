extends Node2D

# Counter to keep track of sagos in the basket
var sago_count: int = 0

# Sound players
var count_up_sound: AudioStreamPlayer2D
var count_down_sound: AudioStreamPlayer2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Load AudioStreamPlayer2D nodes and check for null values
	count_up_sound = $CountUpSound
	count_down_sound = $CountDownSound
	
	if count_up_sound == null:
		print("Error: CountUpSound node not found!")
	if count_down_sound == null:
		print("Error: CountDownSound node not found!")

func _on_area_2d_body_entered(area):
	if area.is_in_group("sago"):
		sago_count += 1
		print("Sago entered. Current count: ", sago_count)
		
		# Play count up sound if available
		if count_up_sound:
			count_up_sound.play()
		
		# Check if we reached the goal count of 8
		if sago_count >= 6:
			print("Basket is full!")
			await get_tree().create_timer(1.5).timeout
			get_tree().change_scene_to_file("res://scenes/win_condition.tscn")
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_area_2d_body_exited(area):
	if area.is_in_group("sago"):
		sago_count = max(sago_count - 1, 0) # Prevents negative count
		print("Sago exited. Current count: ", sago_count)
		
		# Play count down sound if available
		if count_down_sound:
			count_down_sound.play()
