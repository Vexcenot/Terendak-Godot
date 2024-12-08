extends Node2D



func _ready():
	BSM()

func BSM():
	Dialogic.start("BeforeScaryMaze")
	Dialogic.timeline_ended.connect(ended)
	
func ended():
	Dialogic.timeline_ended.disconnect(ended)
	print("ended")
	get_tree().change_scene_to_file("res://scenes/scary_maze.tscn")
