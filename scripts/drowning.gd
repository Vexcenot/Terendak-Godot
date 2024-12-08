extends Area2D

# Replace with function body.


func _on_body_entered(body: Node2D) -> void:
	print("drowning!")
	Dialogic.start("drowning")
	print("oh no!")
	Dialogic.timeline_ended.connect(drowning)
	
func drowning():
	Dialogic.timeline_ended.disconnect(drowning)
	print("ended")
