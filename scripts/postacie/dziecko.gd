extends Area2D
var can_interact = false
var player_ref: Node = null

@export var item_icon: Texture2D

var movement_cursor = load("res://sprites/Other/movement_cursor.png")
var dialogue_cursor = load("res://sprites/Other/dialogue_cursor.png")

func _ready():
	
	body_entered.connect(_on_enter)
	body_exited.connect(_on_exit)	
	
func _on_enter(body):
	if body.is_in_group("player"):
		can_interact = true
	
func _on_exit(body):
	if body == player_ref: 
		can_interact = false

func _proca():
		GlobalEq.remove_item("nitka")
		GlobalEq.remove_item("galazka")
		GlobalEq.add_item(item_icon, "proca")

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and can_interact :
		if GlobalC.dialog:
			if GlobalC.can_craft  and  GlobalEq.has_item("nitka") and  GlobalEq.has_item("galazka") :
				if GlobalEq.selected_item_id == "galazka" or GlobalEq.selected_item_id == "nitka":
					_proca()
					GlobalC.dialog = false
					return
			if GlobalC.first_play_next :
				GlobalC.first_play_next = false
				DialogueManager.show_example_dialogue_balloon(load("res://Dialogi/anglia.dialogue"), "proca")
				await DialogueManager.dialogue_ended
				DialogueManager.show_example_dialogue_balloon(load("res://Dialogi/anglia.dialogue"), "proca2")
				GlobalC.can_craft = true
				return
			else: 
				DialogueManager.show_example_dialogue_balloon(load("res://Dialogi/anglia.dialogue"), "proca2")
				return
			
