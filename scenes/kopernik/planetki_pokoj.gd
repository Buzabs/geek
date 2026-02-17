extends Area2D

var player_ref: Node = null
var can_open: bool
var movement_cursor = load("res://sprites/Other/movement_cursor.png")

func _ready():
	body_entered.connect(_on_enter)
	body_exited.connect(_on_exit)

func _on_enter(body):
	if get_tree().current_scene.get_name() == "TestScene":
		if body.is_in_group("player") && !GlobalC.isLocked:
			can_open = true
			player_ref = body
	else:
		if body.is_in_group("player"):
			can_open = true
			player_ref = body
		

func _on_exit(body):
	if body == player_ref:
		can_open = false
		player_ref = null
	
func _input_event(_viewport, event, _shape_idx):
	if GlobalC.open:
		if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed and can_open:
			can_open = false
			if GlobalC.next_dialog:
				get_tree().change_scene_to_file("res://scenes/kopernik/planetki_gra.tscn")
				Input.set_custom_mouse_cursor(movement_cursor)
				return
			DialogueManager.show_example_dialogue_balloon(load("res://Dialogi/kopernik.dialogue"), "nie_tykac")		
				
		
			
			
