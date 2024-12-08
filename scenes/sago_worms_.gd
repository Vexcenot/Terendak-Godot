extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Dialogic.start("Level 2 Intro")
	DragManager.talking = true
	Dialogic.timeline_ended.connect(level_2)
	
func level_2():
	Dialogic.timeline_ended.disconnect(level_2)
	DragManager.talking = false
