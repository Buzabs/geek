extends Area2D


var can_interact = false
var player_ref: Node = null

var movement_cursor = load("res://sprites/Other/movement_cursor.png")
var dialogue_cursor = load("res://sprites/Other/dialogue_cursor.png")


func _ready():
	if not GlobalC.next_dialog:
			visible = false
	if not GlobalC.wake_up :
		$animation.play("open_eyes")	
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
		print("wyszedl")


func _input_event(viewport, event, shape_idx):
	if  GlobalC.next_dialog  :
		visible = true
		if event is InputEventMouseButton and can_interact and event.pressed  and GlobalC.wake_up:
			
			if GlobalC.first_play :
				$animation.play("wake_up")	
				GlobalC.wake_up = false
				
				
				GlobalC.first_play = false
				
				DialogueManager.show_example_dialogue_balloon(load("res://Dialogi/anglia.dialogue"), "newton_spotkanie")
				await DialogueManager.dialogue_ended
				DialogueManager.show_example_dialogue_balloon(load("res://Dialogi/anglia.dialogue"), "newton_lisc")
				GlobalC.first_play_next  = true
			
				return
			else:
				DialogueManager.show_example_dialogue_balloon(load("res://Dialogi/anglia.dialogue"), "newton_lisc")
				return
			

func _on_mouse_entered() -> void:
	Input.set_custom_mouse_cursor(dialogue_cursor)
	

func _on_mouse_exited() -> void:
	Input.set_custom_mouse_cursor(movement_cursor)
