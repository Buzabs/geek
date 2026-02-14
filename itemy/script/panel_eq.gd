extends HBoxContainer 

var max_slots := 5 

func _ready(): 
	GlobalEq.inventory_changed.connect(refresh)
	for i in range(max_slots):
		var btn = SlotButton.new()
		btn.custom_minimum_size = Vector2(32, 32)
		add_child(btn)

	refresh()
		
func refresh():
	for i in range(max_slots):
		var btn = get_child(i)

		if i < GlobalEq.slots.size():
			btn.texture_normal = GlobalEq.slots[i].texture
			btn.item_id = GlobalEq.slots[i].id
		else:
			btn.texture_normal = null

func _pressed(): 
	for child in get_parent().get_children(): 
		if child is SlotButton: 
			child.set_selected(false) 
		child.set_selected(true)
