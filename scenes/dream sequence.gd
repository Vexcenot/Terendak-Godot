extends Node2D





func _on_lever_lever_state_changed(activated: bool) -> void:
		# Enable or disable the platform's collision
	$CollisionShape2D.disabled = !activated
	# Show or hide the platform's Sprite2D
	$Sprite2D.visible = activated
