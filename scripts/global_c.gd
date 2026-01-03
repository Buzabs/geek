extends Node



var collected_items := {}

func _ready():
	await get_tree().process_frame
	print(get_tree().current_scene)
