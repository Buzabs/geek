extends Area2D
var can_interact = false
var player_ref: Node = null


func _ready():
	$animacja.play("default")
	body_entered.connect(_on_enter)
	body_exited.connect(_on_exit)	
	
func _on_enter(body):
	if body.is_in_group("player"):
		can_interact = true
	
func _on_exit(body):
	if body == player_ref: 
		can_interact = false

func _input_event(viewport, event, shape_idx):
	if GlobalC.next_dialog:
		
		return
	if event is InputEventMouseButton and event.pressed and can_interact and not GlobalC.next_dialog :
		GlobalC.open = true
		if GlobalC.first_play:
			GlobalC.first_play= false
			DialogueManager.show_example_dialogue_balloon(load("res://Dialogi/anglia.dialogue"), "babcia1")
			await DialogueManager.dialogue_ended
			DialogueManager.show_example_dialogue_balloon(load("res://Dialogi/anglia.dialogue"), "babcia2")
			return
		if not GlobalC.next_dialog : 
			DialogueManager.show_example_dialogue_balloon(load("res://Dialogi/anglia.dialogue"), "babcia2")
			return
