extends Sprite2D





func _on_lever_lever_state_changed(activated: bool) -> void:
		# Enable or disable the platform's collision
	# Show or hide the platform's Sprite2D
	$".".visible = activated
