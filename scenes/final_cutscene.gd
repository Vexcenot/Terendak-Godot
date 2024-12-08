extends Node2D


func _ready():
	outro()

func outro():
	Dialogic.start("outro")
	Dialogic.timeline_ended.connect(ended)
	
func ended():
	Dialogic.timeline_ended.disconnect(ended)
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
