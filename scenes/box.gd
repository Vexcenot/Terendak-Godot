extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func unlock():
	$close.queue_free()
	$open.visibility = true


func _on_item_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_pressed("leftclick"):
		DragManager.absolutewin = true


func _on_lock_body_entered(area):
	if area.is_in_group("sago"):
		print("sago")


func _on_lock_area_entered(area):
	if area.is_in_group("sago"):
		print("sago")
