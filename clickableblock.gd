extends RigidBody2D

# This signal will be emitted when the item is collected
signal item_collected(item_name)

# Item properties
@export var item_name: String = "default_item"

# Called when the item is clicked
func _on_item_clicked(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			# Print a message to the console when the item is clicked
			print("Item clicked: ", item_name)

# Optional: Reset item visibility if needed
func reset_item():
	show()


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	connect("input_event", Callable(self, "_on_item_clicked"))
