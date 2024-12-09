extends Node2D
var transition = preload("res://scenes/transition_chesto.tscn")

func trans(a, b):
	var speed = 0.5
	var delay = 1.4
	var tween := create_tween().set_parallel(true)
	tween.tween_property(a, "modulate:a", 0.0, speed)
	tween.tween_property(b, "modulate:a", 1.0, speed)
	await get_tree().create_timer(delay).timeout

func glow():
	var tween = get_tree().create_tween()
	tween.tween_property($WhiteGlow, "scale", Vector2(200,200), 50)
	pass

func flash():
	var instance = transition.instantiate()
	add_child(instance)
	
func winanimate():
		$AudioStreamPlayer.play()
		await trans($"1", $"2") # Adjust speed and delay as needed
		await trans($"2", $"3") # Adjust speed and delay as needed
		trans($"3", $"4")
		$"5".visible = true
		await get_tree().create_timer(1).timeout
		glow()
		await get_tree().create_timer(0.5).timeout
		flash()

func start_dialog():
	Dialogic.timeline_ended.connect(_on_timeline_ended)
	Dialogic.start("confused")

func _on_timeline_ended():
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)
	winanimate()



func _ready():
	global_position = get_global_mouse_position()
	await get_tree().create_timer(1).timeout
	start_dialog()
	
