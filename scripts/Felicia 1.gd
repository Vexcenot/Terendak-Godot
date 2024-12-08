extends Area2D

# Replace with function body.
var conversation_Felicia = false

func _on_body_entered(body: Node2D) -> void:
	if conversation_Felicia == false:
		print("Convo Started")
		Dialogic.start("Felicia")
		Dialogic.timeline_ended.connect(ended)
		conversation_Felicia = true
	
func ended():
	Dialogic.timeline_ended.disconnect(ended)
	print("ended")
	
