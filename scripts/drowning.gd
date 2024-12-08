extends Area2D

# Replace with function body.


func _on_body_entered(body: Node2D) -> void:
	print("Convo Started")
	Dialogic.start("drowning")
	print("cain get!")
	Dialogic.timeline_ended.connect(drowning)
	
func drowning():
	Dialogic.timeline_ended.disconnect(drowning)
	print("ended")
