extends Button

func _ready():
	pressed.connect(_on_pressed)
	process_mode = Node.PROCESS_MODE_ALWAYS

func _on_pressed():
	get_tree().paused = false
	get_parent().queue_free()
