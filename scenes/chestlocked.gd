extends Area2D


func _on_body_entered(body: Node2D) -> void:
	print("eh")
	if DragManager.chest_quest_complete == true:
		Dialogic.start("keyget")
		DragManager.talking = true
		Dialogic.timeline_ended.connect(key)
		
func key():
	Dialogic.timeline_ended.disconnect(key)
	DragManager.talking = false
	DragManager.mask_equip = false
	get_tree().change_scene_to_file("res://scenes/win_condition_chesto.tscn")
