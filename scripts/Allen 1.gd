extends Area2D

# Replace with function body.
var conversation_Allen = false

func _on_body_entered(body: Node2D) -> void:
	if conversation_Allen == false:
		print("Convo Started")
		Dialogic.start("Allen")
		
		Dialogic.timeline_ended.connect(ScaryMaze)
		conversation_Allen = true
	
func ScaryMaze():
	print("All good to go!")
	get_tree().change_scene_to_file("res://scenes/Before_Scary_Maze.tscn")
	
