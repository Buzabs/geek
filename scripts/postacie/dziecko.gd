extends Area2D
var can_interact = false
var player_ref: Node = null
@export var item_icon: Texture2D

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
			if GlobalEq.selected_item_id == "nitka" or GlobalEq.selected_item_id == "kamyczek" or GlobalEq.selected_item_id == "galazka":
				_proca()
				GlobalC.dialog = false
				return
			if GlobalC.first_play_zielarka:
				GlobalC.first_play_zielarka= false
				DialogueManager.show_example_dialogue_balloon(load("res://Dialogi/anglia.dialogue"), "proca")
				await DialogueManager.dialogue_ended
				DialogueManager.show_example_dialogue_balloon(load("res://Dialogi/anglia.dialogue"), "proca2")
				return
			else: 
				DialogueManager.show_example_dialogue_balloon(load("res://Dialogi/anglia.dialogue"), "proca2")
				return
			
