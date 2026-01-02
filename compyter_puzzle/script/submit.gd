extends Button



@export var required_id: Array[int]
@export var slots: Array[Control]

@export var ok_button: Button
@export var ok_icon_correct: Texture2D
@export var ok_icon_default: Texture2D

var puzzle_name := "Puzzle1"

func _ready():
	ok_button.icon = ok_icon_default
	process_mode = Node.PROCESS_MODE_ALWAYS
	
	
func _pressed():
	if slots.size() != required_id.size():
		return

	for i in range(slots.size()):
		var selector = slots[i]
		if selector.index != required_id[i]:
			return

	
	ok_button.icon = ok_icon_correct
	GameSignals.solution_ok = true
	GameSignals.solution_checked.emit(true)
	print("EMIT TRUE")
