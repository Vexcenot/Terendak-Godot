extends Area2D

var dakan = false
# Replace with function body.
@onready var canvas_layer = $On

func _process(delta: float) -> void:
	if DragManager.mask_equip == true:
		canvas_layer.visible = true
	if DragManager.mask_equip == false:
		canvas_layer.visible = false


func _on_body_entered(body: Node2D) -> void:
	if dakan == false:
		print("Depression")
		Dialogic.start("depression")
		DragManager.talking = true
		dakan = true
		Dialogic.timeline_ended.connect(ended)
	
func ended():
	Dialogic.timeline_ended.disconnect(ended)
	print("ended")
	DragManager.talking = false

	

	
	
