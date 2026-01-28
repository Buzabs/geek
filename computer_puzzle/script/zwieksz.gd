extends Button
@export var manager: NodePath

func _ready():
	pressed.connect(_on_pressed)
	process_mode = Node.PROCESS_MODE_ALWAYS
	
	
func _on_pressed():
	var m = get_node_or_null(manager)
	if m:
		m.set_next()
