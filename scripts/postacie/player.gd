class_name Player
extends CharacterBody2D

@onready var animations = $animation
@onready var state_machine = $state_machine
	
var direction: Vector2 = Vector2.ZERO

func _ready() -> void:
	var spawn = get_tree().current_scene.get_node_or_null(
		"spawn_" + GlobalC.spawn_id
	)
	print("Spawn node:", spawn)
	if spawn:
		var player = get_tree().current_scene.get_node("Player")
		player.global_position = spawn.global_position

	add_to_group("player")
	state_machine.init(self)

	
func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)
	
func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)
	
func _process(delta: float) -> void:
	state_machine.process_frame(delta)
