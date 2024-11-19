extends Area2D

# Signals
signal action01

# Variables
var item_picked_up = false
var cursor_default = preload("res://footagecrate-femalehand-grabbing@3X_png.png")
var cursor_picked_up = preload("res://pngtree-shovel-in-hand-shovel-photo_png-image_13806813.png.png")
var health = 100

# Called when the mouse enters the item
func _on_mouse_entered():
	Input.set_custom_mouse_cursor(cursor_picked_up)
	if item_picked_up == false:
		print("Mouse over item: Ready to pick up")

# Called when the mouse exits the item
func _on_mouse_exited():
	Input.set_custom_mouse_cursor(cursor_default)
	if item_picked_up == false:
		print("Mouse left item")

# Called every frame, handling mouse input


# Handle picking up the item
func _pick_up_item():
	item_picked_up = true
	print("Item picked up")
	# Play an animation here
	$AnimationPlayer.play("pick_up")

# Handle dropping the item
func _drop_item():
	item_picked_up = false
	print("Item dropped")
	var mouse_position = get_global_mouse_position()
	position = mouse_position
	Input.set_custom_mouse_cursor(cursor_default)

# Reduce health and perform an action when action01 signal is received

# Reduce the item's health
func _reduce_health(amount):
	health -= amount
	print("Health: %d" % health)
	if health <= 0:
		_destroy_or_next_level()

# Destroy the item or move to the next level
func _destroy_or_next_level():
	print("Item destroyed or next level")
	queue_free()  # Remove the item from the scene
	# Logic to move to next level can go here
