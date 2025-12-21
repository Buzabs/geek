extends Node

signal inventory_changed

var slots := []
var max_slots := 5

func add_item(texture: Texture2D) -> bool:
	print("PRZED:", slots.size())
	if slots.size() >= max_slots:
		return false

	slots.append(texture)
	print("PO:", slots.size())

	inventory_changed.emit()
	return true
