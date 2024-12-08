extends Node2D


func _ready():
	spidergramps()

func spidergramps():
	Dialogic.start("spidergramps")

	Dialogic.timeline_ended.connect(ended)
	
func ended():
	Dialogic.timeline_ended.disconnect(ended)
	print("ended")
	get_tree().change_scene_to_file("res://scenes/LEvel 2.tscn")
