extends TextureButton
class_name Slot

@onready var icon = $Icon
var current_item: ItemData = null

func set_item(item: ItemData):
	current_item = item
	if icon:
		icon.texture = item.icon

func clear():
	current_item = null
	if icon:
		icon.texture = null
