extends Area2D


@onready var canvas_layer = $On


func _process(delta: float) -> void:
	if DragManager.mask_equip == true:
		canvas_layer.visible = true
	if DragManager.mask_equip == false:
		canvas_layer.visible = false

func _on_body_entered(body: Node2D) -> void:
	print("Convo Started")
	Dialogic.start("Worm Quest")
	DragManager.talking = true
	Dialogic.timeline_ended.connect(dakan)

func dakan():
	Dialogic.timeline_ended.disconnect(dakan)
	print("ended")
	DragManager.talking = false
	
