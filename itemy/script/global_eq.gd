extends Node

signal inventory_changed
signal used_item(bool)
var used := false
var pick:= false
var dialogue := false


var max_slots := 5
var selected_item: Texture2D = null
var selected_item_id: String = ""
var slots: Array = [] # slot = { texture, id }
var selected_index := -1   # który slot jest wybrany


func has_item(id: String) -> bool:
	for slot in slots:
		if slot["id"] == id:
			return true
	return false

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


func remove_item(id_item: String):
	for i in range(slots.size()):
		if slots[i]["id"] == id_item:
			slots.remove_at(i) 
			inventory_changed.emit()
	
		
	inventory_changed.emit()
			
	return
