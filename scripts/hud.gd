extends CanvasLayer


@onready var camera = $"../Camera2D"  # Replace with your actual camera node's path

func _process(delta: float) -> void:
	if camera:
		# Synchronize the CanvasLayer's offset with the camera's global position
		self.offset = camera.global_position
