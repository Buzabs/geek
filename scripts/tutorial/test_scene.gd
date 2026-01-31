extends Node

@export var pause_scene: PackedScene

func _process(_delta):
	
	if Input.is_action_just_pressed("pause"):
		if get_tree().paused:
			get_tree().paused = false
			get_parent().queue_free()
			return
		Pausa.toggle_pause(pause_scene)

	
	
