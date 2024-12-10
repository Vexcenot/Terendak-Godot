extends Node2D

func _ready():
	Dialogic.start("intro_level 3")
	DragManager.talking = true
	Dialogic.timeline_ended.connect(Level2)
	
	
func Level2():
	print("All good to go!")
	DragManager.talking = false
