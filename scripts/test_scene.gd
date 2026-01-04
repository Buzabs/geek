extends Node

@export var pause_scene: PackedScene

func _process(_delta):
	if Input.is_action_just_pressed("pause"):
		Pausa.toggle_pause(pause_scene)

	
	
