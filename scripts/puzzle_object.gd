extends Area2D

var is_clicked: bool = false
var can_interact := false
var player_ref: Node = null

func _ready():
	body_entered.connect(_on_enter)
	body_exited.connect(_on_exit)

func _on_enter(body):
	if body.is_in_group("player"):
		can_interact = true
		player_ref = body
		print("Gracz wszedł w obiekto")

func _on_exit(body):
	if body == player_ref:
		can_interact = false
		player_ref = null
		print("Gracz wyszedł z obiektu")

@export var computer_ui: PackedScene

func _input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed and can_interact:
		
		var ui = computer_ui.instantiate()
		get_tree().root.add_child(ui)
		if not GlobalC.first_puzzle_open:
			GlobalC.first_puzzle_open = true
			await get_tree().create_timer(0.5).timeout
			DialogueManager.show_example_dialogue_balloon(load("res://Dialogi/tutorial.dialogue"), "kod")
