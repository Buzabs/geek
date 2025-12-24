extends Control


@export var slots: Array[TextureRect] = []
@export var required_textures: Array[Texture2D] = []

@export var ok_button: Button
@export var ok_icon_correct: Texture2D
@export var ok_icon_default: Texture2D

func check_solution():
	if slots.size() != required_textures.size():
		print("Błąd: różna liczba slotów i tekstur")
		return

	for i in slots.size():
		if slots[i].texture != required_textures[i]:
			ok_button.icon = ok_icon_default
			return

	# jeśli pętla przeszła cała → wszystko OK
	ok_button.icon = ok_icon_correct
