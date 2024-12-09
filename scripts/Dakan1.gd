extends Area2D

# Replace with function body.
@onready var canvas_layer = $On

func _process(delta: float) -> void:
	if DragManager.mask_equip == true:
		canvas_layer.visible = true
	if DragManager.mask_equip == false:
		canvas_layer.visible = false


func _on_body_entered(body: Node2D) -> void:
	if DragManager.mask_equip == true and DragManager.chest_quest_complete == false and DragManager.dakan_1 == false:
		print("Depression")
		Dialogic.start("depression")
		DragManager.talking = true
		Dialogic.timeline_ended.connect(ended)
	if DragManager.mask_equip == false:
		Dialogic.start("Dakan A Intro")
		DragManager.talking = true
		Dialogic.timeline_ended.connect(mask)
	
func ended():
	Dialogic.timeline_ended.disconnect(ended)
	print("ended")
	DragManager.dakan_1 = true
	DragManager.chest_quest = true
	DragManager.talking = false
	
func mask():
	Dialogic.timeline_ended.disconnect(mask)
	print("ended")
	DragManager.talking = false
	

	
	
