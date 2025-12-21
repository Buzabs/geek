extends HBoxContainer

var max_slots := 5

func _ready():
	GlobalEq.inventory_changed.connect(refresh)

	for i in range(max_slots):
		var btn = TextureButton.new()
		btn.custom_minimum_size = Vector2(64, 64)
		add_child(btn)

	refresh()

func refresh():
	for i in range(max_slots):
		var btn = get_child(i)
		if i < GlobalEq.slots.size():
			btn.texture_normal = GlobalEq.slots[i]
		else:
			btn.texture_normal = null
			
func _pressed():
	for child in get_parent().get_children():
		if child is SlotButton:
			child.set_selected(false)

	set_selected(true)
