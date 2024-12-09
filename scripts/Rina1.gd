extends Area2D

func _on_body_entered(body: Node2D) -> void:
	print("Convo Started")
	Dialogic.start("Rina")
	Dialogic.timeline_ended.connect(ended)

		
func ended():
	Dialogic.timeline_ended.disconnect(ended)
	get_tree().change_scene_to_file("res://scenes/world.tscn")
	print("ended")
	
