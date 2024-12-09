extends Node2D

func _ready():
	intro()

func intro():
	Dialogic.start("vorms")

	Dialogic.timeline_ended.connect(ended)
	
func ended():
	Dialogic.timeline_ended.disconnect(ended)
	print("ended")
