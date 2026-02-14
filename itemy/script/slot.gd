extends TextureButton
class_name SlotButton

@export var selected_texture: Texture2D
@export var target: TextureRect
@export var default_texture: Texture2D

var item_id: String = ""
var is_selected := false

func _ready():
	pressed.connect(_on_pressed)
	if target:
		target.texture = default_texture


	

func _on_pressed():
	if not target:
		return
	if item_id != "" and not GlobalEq.has_item(item_id):
		item_id = ""
		return
	# reset rodzeństwa
	for sibling in get_parent().get_children():
		if sibling is SlotButton:
			sibling.is_selected = false
			if sibling.target:
				sibling.target.texture = sibling.default_texture

	# zaznacz TEN
	if not is_selected:
		is_selected = true
		target.texture = selected_texture
		GlobalEq.selected_item = selected_texture
		GlobalEq.selected_item_id = item_id
		if GlobalEq.selected_item_id != "":
			print("Wybrano:", item_id)
	else:
		is_selected = false
		target.texture = default_texture
		GlobalEq.selected_item = null
		GlobalEq.selected_item_id = ""
	
