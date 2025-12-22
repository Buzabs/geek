extends TextureButton
class_name SlotButton

signal texture_change(new_texture: Texture2D)

@export var selected_texture: Texture2D  # Tekstura dla TextureRect po zaznaczeniu
@export var target: TextureRect
@export var default_texture: Texture2D    # Tekstura domyślna TextureRect

var is_selected: bool = false  

func _ready():
	pressed.connect(Callable(self, "_on_pressed"))
	if target:
			target.texture = default_texture  # początkowa tekstura
			
func _on_pressed():
	if not target:
		return

	var parent_container = get_parent()  # reset wszystkich rodzeństwa w tym samym kontenerze
	for sibling in parent_container.get_children():
		if sibling is SlotButton:
			sibling.is_selected = false
			if sibling.target:
				sibling.target.texture = sibling.default_texture

	# Toggle własnego przycisku
	if not is_selected:
		target.texture = selected_texture
		is_selected = true
	else:
		target.texture = default_texture
		is_selected = false
