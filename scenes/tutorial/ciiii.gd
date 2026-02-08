extends AnimatedSprite2D



func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if GlobalEq.selected_item_id == "ciii":
					DialogueManager.show_example_dialogue_balloon(load("res://Dialogi/Tutorial.dialogue"), "ciii")
					if PrismSwap.ciiii:
						$".".play("ciii")
