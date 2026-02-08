extends Area2D
var can_interact = false
var player_ref: Node = null


func _ready():
	
	body_entered.connect(_on_enter)
	body_exited.connect(_on_exit)
	$animacja.play("default")	
	
func _on_enter(body):
	if body.is_in_group("player"):
		can_interact = true
		player_ref = body
	
func _on_exit(body):
	if body == player_ref: 
		can_interact = false
		player_ref = null
		print("wyszedl")

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and can_interact and event.pressed  :
		if GlobalC.dialog:
			return
		if GlobalC.first_play_next :
			GlobalC.first_play_next = false
			DialogueManager.show_example_dialogue_balloon(load("res://Dialogi/anglia.dialogue"), "zielarka1")
			await DialogueManager.dialogue_ended
			DialogueManager.show_example_dialogue_balloon(load("res://Dialogi/anglia.dialogue"), "zielarka2")
			GlobalC.next_dialog= true
			GlobalC.first_play=true
			return
		else: 
			DialogueManager.show_example_dialogue_balloon(load("res://Dialogi/anglia.dialogue"), "zielarka2")
			return
