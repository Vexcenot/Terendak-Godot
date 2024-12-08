extends Area2D

# Replace with function body.


func _on_body_entered(body: Node2D) -> void:
	print("Convo Started")
	Dialogic.start("Depression")
	print("cain get!")
	Dialogic.timeline_ended.connect(ended)
	
func ended():
	Dialogic.timeline_ended.disconnect(ended)
	print("ended")
	queue_free()
