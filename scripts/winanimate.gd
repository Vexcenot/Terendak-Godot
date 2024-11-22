extends Node2D
var transition = preload("res://scenes/transition.tscn")

func trans(a, b):
	var speed = 0.5
	var delay = 1.4
	var tween := create_tween().set_parallel(true)
	tween.tween_property(a, "modulate:a", 0.0, speed)
	tween.tween_property(b, "modulate:a", 1.0, speed)
	await get_tree().create_timer(delay).timeout

func glow():
	var tween = get_tree().create_tween()
	tween.tween_property($WhiteGlow, "scale", Vector2(100,100), 50)
	pass

func flash():
	var instance = transition.instantiate()
	add_child(instance)

func _ready():
	global_position = get_global_mouse_position()
	# Start the dialog transition
	await trans($"1", $"2") # Adjust speed and delay as needed
	await trans($"2", $"3") # Adjust speed and delay as needed
	trans($"3", $"4")
	$"5".visible = true
	await get_tree().create_timer(1).timeout
	glow()
	await get_tree().create_timer(2).timeout
	flash()
