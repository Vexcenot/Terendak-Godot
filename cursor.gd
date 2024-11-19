extends Node2D
@onready var hand = $hand1
@onready var fist = $hand2

enum {HAND, FIST, SPEAR}




# This function is called every frame
func _process(delta: float) -> void:
	# Update the position of the scene to follow the cursor
	global_position = get_global_mouse_position()
	fisting()
	clicking()
	punch_fist()
	punching()



#sprite assingments
func fisting():
	if DragManager.is_dragging == true:
		$hand1.frame = FIST;
	else:
		$hand1.frame = HAND;
		
		
#clenches everytime clicking
var is_right_clicking = false

#right click becomes hand and doesnt become fist again until left clicks again
func clicking():
	if Input.is_action_just_pressed("rightclick"):
		is_right_clicking = true
		$hand1.frame = HAND
	elif Input.is_action_just_pressed("leftclick"):
			is_right_clicking = false
	if not is_right_clicking:
		if Input.is_action_pressed("leftclick"):
			$hand1.frame = FIST
		else:
			$hand1.frame = HAND
	



#becomes fist when hovering over log
func punching():
	if Input.is_action_just_pressed("leftclick") and logged == true:
		$AnimationPlayer.stop(true)
		$AnimationPlayer.play("punch")
		$hand1.frame = FIST;
		
var logged = false

func punch_fist():
	if logged == true:
		$hand1.frame = FIST;
		
func _on_punch_area_entered(area: Area2D) -> void:
	if area.is_in_group("log"):
		logged = true

func _on_punch_area_exited(area: Area2D) -> void:
	if area.is_in_group("log"):
		logged = false
