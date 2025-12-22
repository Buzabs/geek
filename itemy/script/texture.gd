
extends TextureRect

@export var default_texture: Texture2D  # Tekstura początkowa


var current_texture: Texture2D

func _ready():
	# Ustawiamy początkową teksturę
	texture = default_texture
	current_texture = default_texture
	# Podłączamy wszystkie SlotButton w drzewie rodzica
	_connect_slot_buttons(get_parent())

func _connect_slot_buttons(node):
	for child in node.get_children():
		if child is SlotButton:
			child.texture_change.connect(Callable(self, "_on_texture_change"))
		_connect_slot_buttons(child)

func _on_texture_change(new_texture: Texture2D):
	# Jeśli kliknięty przycisk jest już aktywny, przywracamy domyślną
	if current_texture == new_texture:
		texture = default_texture
		current_texture = default_texture
	else:
		texture = new_texture
		current_texture = new_texture
