extends Area2D


var can_interact = false
var player_ref: Node = null


func _ready():
	if not GlobalC.next_dialog:
			visible = false
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


func pryzmat() -> void:
	get_tree().change_scene_to_file("res://scenes/level_1/pryzmat_gra.tscn")

func _input_event(viewport, event, shape_idx):
	if  GlobalC.next_dialog:
		visible = true
		if event is InputEventMouseButton and can_interact and event.pressed  :
			GlobalC.dialog= true
			if GlobalC.first_play :
				$animation.play("wake_up")	

				GlobalC.first_play = false
				
				DialogueManager.show_example_dialogue_balloon(load("res://Dialogi/anglia.dialogue"), "newton_spotkanie")
				await DialogueManager.dialogue_ended
				DialogueManager.show_example_dialogue_balloon(load("res://Dialogi/anglia.dialogue"), "newton_lisc")
				GlobalC.first_play_zielarka = true
			
				return
			else:
				DialogueManager.show_example_dialogue_balloon(load("res://Dialogi/anglia.dialogue"), "newton_lisc")
				return
			
