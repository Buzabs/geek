extends Area2D

@export var load_scenes: String

func _ready():
	await get_tree().process_frame
	print(get_tree().current_scene.scene_file_path)

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:		
		get_tree().change_scene_to_file(load_scenes)
