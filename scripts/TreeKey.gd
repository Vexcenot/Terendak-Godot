extends Area2D

# Replace with function body.


func _on_body_entered(body: Node2D) -> void:
	print("Convo Started")
	Dialogic.start("Treekey")
	print("cain get!")
	Dialogic.timeline_ended.connect(ended)
	
	
func ended():
	Dialogic.timeline_ended.disconnect(ended)
	print("ended")
	await get_tree().create_timer(3).timeout  # 3-second delay
	get_tree().change_scene_to_file("res://scenes/LEvel 2.tscn")
