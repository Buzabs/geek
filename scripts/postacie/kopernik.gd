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

func dialogue_one():
			if GlobalEq.has_item("notka1") and  GlobalEq.has_item("notka2") and  GlobalEq.has_item("notka2") and  GlobalEq.has_item("notka2"):
				if GlobalEq.selected_item_id == "notka1" or GlobalEq.selected_item_id == "notka2" or  GlobalEq.selected_item_id == "notka3" or GlobalEq.selected_item_id == "notka4" : 
						DialogueManager.show_example_dialogue_balloon(load("res://Dialogi/kopernik.dialogue"), "k_misja")

						GlobalC.dialog = true
						GlobalEq.remove_item("notka1")
						GlobalEq.remove_item("notka2")
						GlobalEq.remove_item("notka3")
						GlobalEq.remove_item("notka4")
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

	

func _input_event(viewport, event, shape_idx):
	if not GlobalC.dialog:
		if event is InputEventMouseButton and event.pressed and can_interact and not GlobalC.dialog :	
			dialogue_one()
			return
	if GlobalC.dialog and not GlobalC.next_dialog:
		if event is InputEventMouseButton and event.pressed and can_interact and not GlobalC.next_dialog :
			DialogueManager.show_example_dialogue_balloon(load("res://Dialogi/kopernik.dialogue"), "konstelacje")
			return
	if GlobalC.next_dialog:
		if event is InputEventMouseButton and event.pressed and can_interact and not GlobalC.next_dialog :
			if GlobalEq.has_item("ziemia") and  GlobalEq.has_item("slonce") and  GlobalEq.has_item("mars") and  GlobalEq.has_item("jowisz") and  GlobalEq.has_item("saturn") and  GlobalEq.has_item("merkury") and  GlobalEq.has_item("venus"):
				DialogueManager.show_example_dialogue_balloon(load("res://Dialogi/kopernik.dialogue"), "planety2")
			DialogueManager.show_example_dialogue_balloon(load("res://Dialogi/kopernik.dialogue"), "planety_next")
	
