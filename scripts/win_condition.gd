extends Node2D
#func _ready() -> void:
	#$AudioStreamPlayer.play()
	#await get_tree().create_timer(.2).timeout

@onready var transition: AnimationPlayer = $Transition
@onready var canvas_layer: CanvasLayer = $CanvasLayer
@onready var color_rect: ColorRect = $CanvasLayer/ColorRect



func _ready():
	transition.play("fadeout")
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Level 3.tscn")
	DragManager.is_dragging = false
	DragManager.lastworm = false

	
