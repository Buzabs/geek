extends Node

signal inventory_changed


var slot_ids := []
var max_slots := 5
var selected_item: Texture2D = null
var selected_item_id: String = ""
# slot = { texture, id }
var slots: Array = []

var selected_index := -1   # który slot jest wybrany

func add_item(texture: Texture2D, id: String) -> bool:
	if slots.size() >= max_slots:
		return false

	slots.append({
		"texture": texture,
		"id": id,
	})
	print("Added item:", id, " slots now:", slots.size())
	inventory_changed.emit()
	return true
	
	
