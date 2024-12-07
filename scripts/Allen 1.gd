extends Area2D

# Replace with function body.
var conversation_Allen = false

func _on_body_entered(body: Node2D) -> void:
	if conversation_Allen == false:
		print("Convo Started")
		Dialogic.start("Allen")
		Dialogic.timeline_ended.connect(ended)
		conversation_Allen = true
	
func ended():
	Dialogic.timeline_ended.disconnect(ended)
	print("ended")
	
