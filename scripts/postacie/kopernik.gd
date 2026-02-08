extends Area2D
var can_interact = false
var player_ref: Node = null


func _ready():
	$animation.play("default")
	body_entered.connect(_on_enter)
	body_exited.connect(_on_exit)	
	
func _on_enter(body):
	if body.is_in_group("player"):
		can_interact = true
	
func _on_exit(body):
	if body == player_ref: 
		can_interact = false



func _input_event(viewport, event, shape_idx):
	if not GlobalC.next_dialog:
		if event is InputEventMouseButton and event.pressed and can_interact and not GlobalC.next_dialog :	
			if GlobalEq.has_item("notka1") and  GlobalEq.has_item("notka2") and  GlobalEq.has_item("notka2") and  GlobalEq.has_item("notka2"):
				if GlobalEq.selected_item_id == "notka1" or GlobalEq.selected_item_id == "notka2" or  GlobalEq.selected_item_id == "notka3" or GlobalEq.selected_item_id == "notka4" : 
					DialogueManager.show_example_dialogue_balloon(load("res://Dialogi/kopernik.dialogue"), "k_misja")
					await DialogueManager.dialogue_ended
					DialogueManager.show_example_dialogue_balloon(load("res://Dialogi/kopernik.dialogue"), "konstelacje")
					GlobalC.next_dialog = true
					return
			if GlobalC.first_play:
				GlobalC.open = true
				GlobalEq.pick = true
				GlobalC.first_play= false
				DialogueManager.show_example_dialogue_balloon(load("res://Dialogi/kopernik.dialogue"), "start")
				await DialogueManager.dialogue_ended
				DialogueManager.show_example_dialogue_balloon(load("res://Dialogi/kopernik.dialogue"), "start2")
				return
			else:
				DialogueManager.show_example_dialogue_balloon(load("res://Dialogi/kopernik.dialogue"), "start2")
				return
		return
	if GlobalC.next_dialog:
		DialogueManager.show_example_dialogue_balloon(load("res://Dialogi/kopernik.dialogue"), "konstelacje")
		return
