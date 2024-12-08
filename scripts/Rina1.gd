extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if DragManager.rina_conversation_1 == false:
		print("Convo Started")
		Dialogic.start("Rina")
		Dialogic.timeline_ended.connect(ended)
		DragManager.rina_conversation_1 = true
	if DragManager.rina_conversation_1 and DragManager.dakan_2_intro == true:
		print("To Sago Event!")
		Dialogic.start("Rina_1")
		Dialogic.timeline_ended.connect(worms)
	
		
func Sago_Event():
	print("All good to go!")
	get_tree().change_scene_to_file("res://scenes/world.tscn")
	
func ended():
	Dialogic.timeline_ended.disconnect(ended)
	print("ended")
	
func worms():
	Dialogic.timeline_ended.disconnect(worms)
	print("worms")
