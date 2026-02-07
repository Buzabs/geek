extends Node

var pause_instance: CanvasLayer

func toggle_pause(pause_scene):
	if get_tree().paused:
		# wznów grę
		get_tree().paused = false
		if pause_instance:
			pause_instance.queue_free()
	else:
		# pauza
		get_tree().paused = true
		pause_instance = pause_scene.instantiate()
		add_child(pause_instance)
