extends Area2D

var lookup = false


func _on_body_entered(body: Node2D) -> void:
	print("I see something")
	if lookup == false and DragManager.dakan_1 == true:
		print("eh?")
		Dialogic.start("lookup")
		print("cain get!")
		DragManager.talking = true
		lookup = true
		Dialogic.timeline_ended.connect(ended)
		
	if lookup == false and DragManager.dakan_1 == true and DragManager.mask_equip == true:
		print("Convo Started")
		Dialogic.start("lookup_masked")
		print("cain get!")
		DragManager.talking = true
		lookup = true
		Dialogic.timeline_ended.connect(masked_ended)
	
	
func ended():
	Dialogic.timeline_ended.disconnect(ended)
	DragManager.talking = false
	print("ended")
	
func masked_ended():
	Dialogic.timeline_ended.disconnect(masked_ended)
	DragManager.talking = true
	
	
