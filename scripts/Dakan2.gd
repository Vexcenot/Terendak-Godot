extends Area2D

# Replace with function body.


func _on_body_entered(body: Node2D) -> void:
	if DragManager.rina_conversation_1 == true:
		print("Convo Started")
		Dialogic.start("Worm Quest")
		Dialogic.timeline_ended.connect(dakan)
		DragManager.dakan_2_intro = true

func dakan():
	Dialogic.timeline_ended.disconnect(dakan)
	print("ended")
	
