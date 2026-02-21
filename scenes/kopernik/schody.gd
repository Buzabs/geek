extends Area2D

var can_interact: bool = false
var player_ref: Node = null

func _ready():
	body_entered.connect(_on_enter)
	body_exited.connect(_on_exit)	
	
func _on_enter(body):
	if body.is_in_group("player"):
		can_interact = true
		player_ref = body


func _on_exit(body):
	if body == player_ref: 
		can_interact = false
		player_ref = null
		
func _input_event(viewport: Viewport, event: InputEvent, shape_idx: int) :
	if event is InputEventMouseButton and event.pressed and can_interact :
		DialogueManager.show_example_dialogue_balloon(load("res://Dialogi/kopernik.dialogue"), "schody")
