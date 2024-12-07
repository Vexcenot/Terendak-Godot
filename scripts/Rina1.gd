extends Area2D

# Replace with function body.
var conversation_Rina = false
var conversation_Rina_1 = false
var dakan_2_2 = false


func _on_body_entered(body: Node2D) -> void:
	if conversation_Rina == false:
		print("Convo Started")
		Dialogic.start("Rina")
		Dialogic.timeline_ended.connect(ended)
		dakan_2_2 == true
	
func ended():
	Dialogic.timeline_ended.disconnect(ended)
	print("ended")
	
