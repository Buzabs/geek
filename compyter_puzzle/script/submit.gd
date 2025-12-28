extends Button

signal correct(correct: bool)
@export var slots: Array[TextureRect] = []
@export var required_textures: Array[Texture2D] = []

@export var ok_button: Button
@export var ok_icon_correct: Texture2D
@export var ok_icon_default: Texture2D


func _ready():
	ok_button.icon = ok_icon_default
	process_mode = Node.PROCESS_MODE_ALWAYS
	
func _pressed() -> void:
	print("kliknieto")
	if slots.size() != required_textures.size():
		print("Błąd: różna liczba slotów i tekstur")
		return

	for i in range(slots.size()):
		if slots[i].texture != required_textures[i]:
			ok_button.icon = ok_icon_default
			correct.emit(false)
			return   # JEDEN BŁĄD → KONIEC

	# jeśli DOTARLIŚMY TUTAJ → WSZYSTKIE OK
	ok_button.icon = ok_icon_correct
	GameSignals.solution_ok = true
	GameSignals.solution_checked.emit(true)
	print("EMIT TRUE")
