extends Node2D
func _ready() -> void:
	#Dialogic.start("win")
	await get_tree().create_timer(0.5).timeout
	#play animations after this


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
