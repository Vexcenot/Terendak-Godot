# Inventory.gd
extends Node

var held_item: Node = null

func pick_up_item(item: Node):
	if held_item == null:
		held_item = item
		item.queue_free()
		return true
	return false

func drop_item(player_position: Vector2):
	if held_item != null:
		held_item.position = player_position
		get_tree().root.add_child(held_item)
		held_item = null
