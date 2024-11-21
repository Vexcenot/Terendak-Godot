extends Node2D




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global_position = get_global_mouse_position()
	var tween := create_tween()
	tween.tween_property($Sprite2D, "frame", 1, 10)
	tween.tween_property($Sprite2D, "frame", 2, 10)
	
#func _process(delta: float) -> void:
	# Update the position of the scene to follow the cursor
	
