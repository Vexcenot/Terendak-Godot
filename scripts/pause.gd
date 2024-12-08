extends Control



func resume():
	get_tree().paused = false
	$AnimationPlayer.play_backwards("pause animation")
	DragManager.paused = false



func pause():
	get_tree().paused = true
	$AnimationPlayer.play("pause animation")
	DragManager.is_dragging = false
	DragManager.paused = true

func testEsc():
	if Input.is_action_just_pressed("esc") and !get_tree().paused:
		pause()
	elif Input.is_action_just_pressed("esc") and get_tree().paused:
		resume()


func _on_resume_pressed():
	resume()

func _on_restart_pressed():
	resume()
	get_tree().reload_current_scene()

func _on_stop_pressed():
	resume()
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _process(delta):
	testEsc()


func _on_winarea_body_entered(body: Node2D) -> void:
	pass # Replace with function body.


func _on_winarea_body_exited(body: Node2D) -> void:
	pass # Replace with function body.


func _on_p_button_pressed() -> void:
	pause()
	
