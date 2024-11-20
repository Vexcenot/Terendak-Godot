extends Node

# The item currently held in the inventory (null means no item)
var held_item: Node = null

#resets drag on start
func _ready():
	DragManager.is_dragging = false
	DragManager.lastworm == false

func _process(delta: float) -> void:
	wintime()

# Function to pick up the item
func pick_up_item(item: Node):
	if held_item == null:
		held_item = item
		item.queue_free()  # Remove the item from the scene
		print("Item picked up!")
		return true
	return false

# Function to drop the item
func drop_item(player_position: Vector2):
	if held_item != null:
		# Place the item in front of the player
		held_item.position = player_position
		get_tree().root.add_child(held_item)  # Add item back to the scene
		held_item = null  # Empty the inventory
		print("Item dropped!")
		
func wintime():
	if DragManager.lastworm and DragManager.is_dragging:
		$AudioStreamPlayer2D.play()
		await get_tree().create_timer(.2).timeout
		get_tree().change_scene_to_file("res://scenes/win_condition.tscn")
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		print("WIN")
