extends Area2D

@export var target_spawn_id= Vector2(45.0, 67.0)
@export var player : Player 
var can_interact = false
var rzut : String


func rzucanie(rzut):
	player.visible = false
	$animation.play(rzut)		
	await $animation.animation_finished	
	player.position = target_spawn_id	
	if rzut == "udany_rzut":
		DialogueManager.show_example_dialogue_balloon(load("res://Dialogi/anglia.dialogue"), "newton_jablko")
	player.visible = true
	if GlobalEq.selected_item_id == "kamyk" :
			GlobalEq.remove_item("kamyk")
	if GlobalEq.selected_item_id == "kamyczek" :
			GlobalEq.remove_item("kamyczek")


func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed   :
		if GlobalEq.selected_item_id == "proca":
				rzucanie("udany_rzut")
				MusicManager.play_music("res://soundtracki/the_chamber_of_celestial_peace_loop.wav")
				MusicManager.set_volume(-10)
				GlobalEq.remove_item("proca")
				GlobalC.first_puzzle_open = false
				GlobalC.dialog = false
				GlobalC.open= false
				GlobalC.first_play = true
				GlobalC.first_play_next = true
				GlobalC.next_dialog = false
				GlobalC.rzut=true
				return
		if GlobalC.dialog and  GlobalC.rzut :
			if  GlobalEq.selected_item_id == "kamyk" or GlobalEq.selected_item_id == "kamyczek"  :	
				
				rzucanie("nieudany_rzut")
				GlobalC.rzut = false
			
				return
			
