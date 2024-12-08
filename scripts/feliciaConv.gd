extends Area2D

# Flag to track if the conversation has already been triggered
var conversation_Felicia = false


func _on_body_entered(body: Node2D) -> void:
	if conversation_Felicia == false:
		talk()

	
func talk():
		print("Convo Started")
		Dialogic.start("Felicia")
		DragManager.talking = true
		Dialogic.timeline_ended.connect(ended)
		conversation_Felicia = true
	
func ended():
	Dialogic.timeline_ended.disconnect(ended)
	print("ended")
	DragManager.talking = false
