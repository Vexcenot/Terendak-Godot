extends Area2D

# Replace with function body.


func _on_body_entered(body: Node2D) -> void:
	if DragManager.dakan_1 == true:
		print("Key Get!")
		Dialogic.start("Treekey")
		DragManager.talking = true
		Dialogic.timeline_ended.connect(ended)
	
	
func ended():
	Dialogic.timeline_ended.disconnect(ended)
	print("A key???")
	DragManager.talking = false
	DragManager.chest_quest_complete = true
	
	
