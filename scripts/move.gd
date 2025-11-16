class_name State
extends Node

@export var movement_speed = 100
@export var idle_state: State
var dir_x
var dir_y

var parent: Player

var target: Vector2

func enter() -> void:
	target = parent.position
	target = parent.get_global_mouse_position()
	parent.animations.play("walk")
	dir_x = parent.direction.x
	dir_y = parent.direction.y
	
func exit() -> void:
	pass
	
func process_input(event: InputEvent) -> State:
	return null

func process_frame(_delta: float) -> State:
	if dir_x < 0:
		parent.animations.flip_h = true
	elif dir_x > 0:
		parent.animations.flip_h = false
		
	return null
	
func process_physics(_delta: float) -> State:
	parent.velocity = parent.position.direction_to(target) * movement_speed
	if(parent.position.distance_to(target) > 10):
		parent.move_and_slide()
		return null
	return idle_state
