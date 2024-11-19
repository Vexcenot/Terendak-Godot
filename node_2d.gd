extends Node2D

# Reference to the player cursor
@export var item_pick_radius: float = 50.0

func _ready():
	pass

func _process(delta):
	# Detect mouse click (or any other input method)
	if Input.is_action_just_pressed("ui_left"):
		pick_up_or_drop_item()

func pick_up_or_drop_item():
	# Get the position of the player or cursor
	var player_position = self.position
	
	if Inventory.held_item == null:
		# Look for an item within the pick-up radius
		var items = get_tree().root.get_nodes_in_group("items")
		for item in items:
			if item.position.distance_to(player_position) < item_pick_radius:
				if Inventory.pick_up_item(item):
					print("Item picked up!")
					break
	else:
		# Drop the item if inventory is not empty
		Inventory.drop_item(player_position)
