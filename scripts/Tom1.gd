extends Area2D

# Replace with function body.
var conversation_Tom = false
var conversation_Tom_2 = true

func _on_body_entered(body: Node2D) -> void:
	if conversation_Tom == false:
		print("Convo Started")
		Dialogic.start("Tom")
		DragManager.talking = true
		Dialogic.timeline_ended.connect(ended)
		conversation_Tom = true
		conversation_Tom_2 = false
	if conversation_Tom_2 == false:
		print("convo 2 started")
		Dialogic.start("Tom 2")
		Dialogic.timeline_ended.connect(Tommy)
	
func ended():
	Dialogic.timeline_ended.disconnect(ended)
	DragManager.talking = false
	print("ended")
	
func Tommy():
	Dialogic.timeline_ended.disconnect(Tommy)
