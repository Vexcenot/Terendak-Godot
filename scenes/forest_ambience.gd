extends AudioStreamPlayer2D

func _on_finished() -> void:
	print("Audio finished, replaying...")
	play()
