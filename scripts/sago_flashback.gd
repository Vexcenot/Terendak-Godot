extends Node2D

func _ready():
	sagoflashback()

func sagoflashback():
	Dialogic.start("Sagoflashback")
	Dialogic.timeline_ended.connect(ended)
	
func ended():
	Dialogic.timeline_ended.disconnect(ended)
	print("ended")
	get_tree().change_scene_to_file("res://scenes/Level 3.tscn")
