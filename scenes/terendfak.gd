extends Sprite2D


# Rotation speed in degrees per second
@export var rotation_speed: float = 90.0

func _process(delta: float) -> void:
	# Convert degrees to radians and rotate
	rotation += deg_to_rad(rotation_speed) * delta
