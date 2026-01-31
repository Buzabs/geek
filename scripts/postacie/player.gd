class_name Player
extends CharacterBody2D

@onready var animations = $animation
@onready var state_machine = $state_machine
	
var direction: Vector2 = Vector2.ZERO

func _ready() -> void:
	var spawn_name := "Spawn_" + GlobalC.spawn_id.capitalize()
	var spawn := get_tree().current_scene.get_node_or_null(spawn_name)

	if spawn:
		global_position = spawn.global_position
	add_to_group("player")
	state_machine.init(self)
	
func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)
	
func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)
	
func _process(delta: float) -> void:
	state_machine.process_frame(delta)
