extends Node2D
#func _ready() -> void:
	#$AudioStreamPlayer.play()
	#await get_tree().create_timer(.2).timeout



func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	DragManager.is_dragging = false
	DragManager.lastworm = false
	
