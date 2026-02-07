extends Area2D

var player_ref: Node = null
var can_interact = false
var rzut : String


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

func rzucanie(rzut):
	player_ref.visible = false
	$animation.play(rzut)		
	await $animation.animation_finished	
	player_ref.visible = true
	if GlobalEq.selected_item_id == "kamyk" :
			GlobalEq.remove_item("kamyk")
	if GlobalEq.selected_item_id == "kamyczek" :
			GlobalEq.remove_item("kamyczek")


func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed  and can_interact :
		if GlobalEq.selected_item_id == "proca":
				rzucanie("udany_rzut")
				GlobalEq.remove_item("proca")
				DialogueManager.show_example_dialogue_balloon(load("res://Dialogi/anglia.dialogue"), "newton_jabłko")
				return
		if GlobalC.dialog and  GlobalC.rzut :
			if  GlobalEq.selected_item_id == "kamyk" or GlobalEq.selected_item_id == "kamyczek"  :		
				rzucanie("nieudany_rzut")
				GlobalC.rzut = false
			
				return
			
