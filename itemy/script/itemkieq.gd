extends Area2D



@export var item_icon: Texture2D

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == MOUSE_BUTTON_RIGHT \
	and event.pressed:
		print("kliknieto")
		if GlobalEq.add_item(item_icon):
			queue_free()
