extends Button



@export var slots: Array[Area2D]
@export var ok_button: Button
@export var ok_icon_default: Texture2D

var wymagania = {
	0: 2,
	1: 3,
	2: 0,
	3: 1
}

var target_spawn_id: String = "left"

func _ready():
	ok_button.icon = ok_icon_default
	process_mode = Node.PROCESS_MODE_ALWAYS
	
	
func _pressed():
	var pierwszy = slots[0]
	var drugi = slots[1]

	if not wymagania.has(pierwszy.index):
		return

	if drugi.index != wymagania[pierwszy.index]:
		return
	
	GlobalC.spawn_id = target_spawn_id
	get_tree().change_scene_to_file("res://scenes/level_1/sad.tscn")
	GlobalC.next_dialog = false
	GlobalC.koniec_pryzmat()
	GlobalC.wake_up = true
