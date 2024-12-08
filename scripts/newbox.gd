extends Node2D



#enables the win parameters
func unlock():
	$box.frame = 1
	$box/Button.disabled = false
	print("fuck")

#detects if key is inside box
func _on_lock_body_entered(area):
	if area.is_in_group("sago"):
		unlock()
		$AudioStreamPlayer2D.play()

#win button
func _on_button_pressed() -> void:
	print("boop")
	DragManager.absolutewin = true
