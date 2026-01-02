extends Node


var player_pos := Vector2.ZERO


func _ready():
	await get_tree().process_frame
	print(get_tree().current_scene)


func save_from_scene(scene):
		var player = scene.get_node("Player")
		player_pos = player.global_position
	

func load_to_scene(scene):
		var player = scene.get_node("Player")
		player.global_position = player_pos
