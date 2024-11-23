extends CanvasLayer

var level = preload("res://scenes/win_condition.tscn")
@onready var transition: AnimationPlayer = $Transition

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	transition.play("fadein")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	get_tree().change_scene_to_file("res://scenes/win_condition.tscn")
