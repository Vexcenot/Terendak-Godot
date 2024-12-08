extends Sprite2D


# Track if the dialogue has been triggered
var dialogue_triggered = false

# Area2D signal
func _on_area_entered(area):
	# Check if the player entered the area and the dialogue hasn't been triggered
	if area.is_in_group("player") and not dialogue_triggered:
		dialogue_triggered = true  # Mark as triggered
		Dialogic.start("Felicia")
		DragManager.talking = true
		Dialogic.timeline_ended.connect(uhh)
		
func uhh():
	Dialogic.timeline_ended.disconnect(uhh)
	print("uhh")
	DragManager.talking = false
