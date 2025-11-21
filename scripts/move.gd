class_name State
extends Node

@export var movement_speed = 100
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
	if parent.velocity.x < 1:
		parent.animations.play("walk_horizontal")
		parent.get_node("animation").flip_h = true
	elif parent.velocity.x > 1:
		parent.animations.play("walk_horizontal")
		parent.get_node("animation").flip_h = false
		
		
	return null
	
func process_physics(_delta: float) -> State:
	parent.velocity = parent.position.direction_to(target) * movement_speed
	if(parent.position.distance_to(target) > 10):
		parent.move_and_slide()
		if(parent.get_slide_collision_count() > 0):
			target = parent.position
			print("Collided!")
		return null
	return idle_state
