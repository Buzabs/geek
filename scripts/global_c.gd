extends Node

var loaded: int = 0

var collected_items := {}

func _ready():
	await get_tree().process_frame
	print(get_tree().current_scene)
