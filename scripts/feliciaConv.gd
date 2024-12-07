extends Area2D

# Flag to track if the conversation has already been triggered
var conversation_Felicia = false


func _on_body_entered(body: Node2D) -> void:
	print("Convo Started")
	Dialogic.start("Felicia")
	Dialogic.timeline_ended.connect(ended)
	conversation_Felicia = true
	
func ended():
	Dialogic.timeline_ended.disconnect(ended)
	print("ended")
