extends Node2D

var speed = 1
var time = 40
var tween := create_tween()

func fuck():
	tween.tween_property($"2", "modulate:a", 0.0, 0)
	tween.tween_property($"3", "modulate:a", 0.0, 0)
	tween.tween_property($"4", "modulate:a", 0.0, 0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fuck()
	global_position = get_global_mouse_position()
	tween.tween_property($"1", "modulate:a", 1.0, speed)
	$"2".visible = true
	tween.tween_property($"2", "modulate:a", 1.0, speed)
	$"3".visible = true
	tween.tween_property($"2", "modulate:a", 0.0, speed)
	tween.tween_property($"1", "modulate:a", 0.0, speed)
	tween.tween_property($"3", "modulate:a", 1.0, speed)

#func _process(delta: float) -> void:
	# Update the position of the scene to follow the cursor
	
