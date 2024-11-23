extends RigidBody2D

# Array of textures to choose from
var textures: Array = [
	preload("res://textures/shave3.png"),
	preload("res://textures/shave2.png"),
	preload("res://textures/shave1.png")
]

func _ready() -> void:
	# Pick a random texture from the array
	var random_texture = textures[randi() % textures.size()]
	
	# Assign the texture to the sprite (if the node has a Sprite2D as a child)
	var sprite = $Sprite2D
	if sprite:
		sprite.texture = random_texture
		
		# Adjust the z-order (example: randomize z-order for demonstration)
		sprite.z_index = randi() % 10  # Random z_index between 0 and 9
