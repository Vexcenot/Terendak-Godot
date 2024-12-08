extends Control





func _on_play_1_pressed() -> void:
	get_tree().change_scene_to_file("res://scripts/mynameismaya.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()
