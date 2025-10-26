class_name State
extends Node

@export var movement_speed = 400
@export var idle_state: State

var parent: Player

var target: Vector2

func enter() -> void:
	target = parent.position
	target = parent.get_global_mouse_position()
	
func exit() -> void:
	pass
	
func process_input(event: InputEvent) -> State:
	return null

func process_frame(_delta: float) -> State:
	return null
	
func process_physics(_delta: float) -> State:
	parent.velocity = parent.position.direction_to(target) * movement_speed
	if(parent.position.distance_to(target) > 10):
		parent.move_and_slide()
		return null
	return idle_state
