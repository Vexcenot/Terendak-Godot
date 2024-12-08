extends Area2D

# Replace with function body.
@onready var canvas_layer = $On

func _process(delta: float) -> void:
	if DragManager.mask_equip == true:
		canvas_layer.visible = true
	if DragManager.mask_equip == false:
		canvas_layer.visible = false


func _on_body_entered(body: Node2D) -> void:
	if DragManager.mask_equip == true:
		print("Convo Started")
		Dialogic.start("depression")
		DragManager.talking = true
		print("cain get!")
		Dialogic.timeline_ended.connect(ended)
	if DragManager.mask_equip == false:
		Dialogic.start("Dakan A Intro")
		DragManager.talking = true
		Dialogic.timeline_ended.connect(mask)
	
func ended():
	Dialogic.timeline_ended.disconnect(ended)
	print("ended")
	DragManager.talking = false
	
func mask():
	Dialogic.timeline_ended.disconnect(mask)
	print("ended")
	DragManager.talking = false
