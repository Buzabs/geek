extends Button

@export var load_scenes: String
@export var target_spawn: String 

func _ready():
	pressed.connect(_on_button_pressed)

func _on_button_pressed():
	
		GlobalC.spawn_id = target_spawn
		get_tree().change_scene_to_file(load_scenes)
