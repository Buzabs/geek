extends Button


@export var required_id: Array[int]
@export var slots: Array[Area2D]

@export var ok_button: Button

@export var ok_icon_default: Texture2D
var target_spawn_id: String = "left"

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
	GlobalC.spawn_id = target_spawn_id
	
	get_tree().change_scene_to_file("res://scenes/level_1/sad.tscn")
	GlobalC.cos()
	GlobalC.wake_up = false
