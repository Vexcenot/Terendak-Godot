extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Dialogic.start("Level 2 Intro")
	DragManager.talking = true
	Dialogic.timeline_ended.connect(Level2)
	
	
func Level2():
	print("All good to go!")
	DragManager.talking = false
