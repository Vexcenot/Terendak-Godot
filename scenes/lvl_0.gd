extends Node2D


func _ready():
	Chesto()

func Chesto():
	Dialogic.start("chesto")
	Dialogic.timeline_ended.connect(ended)
	
func ended():
	Dialogic.timeline_ended.disconnect(ended)
	print("ended")
	
