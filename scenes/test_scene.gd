extends Node

@export var pause_scene: PackedScene

var pause_instance: Control

func _process(_delta):
	if Input.is_action_just_pressed("pause"):
		toggle_pause()

func toggle_pause():
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
	
	
	
