extends Area2D

@export var target_spawn_id= Vector2(45.0, 67.0)
@export var player : Player 
var can_interact = false
var rzut : String
var dialog
var balloon


func rzucanie(rzut):
	player.visible = false
	$animation.play(rzut)		
	await $animation.animation_finished	
	player.position = target_spawn_id	
	if GlobalEq.selected_item_id == "kamyk" :
			GlobalEq.remove_item("kamyk")
	if GlobalEq.selected_item_id == "kamyczek" :
			GlobalEq.remove_item("kamyczek")
			
	if rzut == "udany_rzut":
		
		dialog = DialogueManager.show_example_dialogue_balloon(load("res://Dialogi/anglia.dialogue"), "newton_jablko")
		await get_tree().process_frame  # poczekaj aż się zbuduje
		balloon = dialog.get_child(0)
		balloon.position = Vector2(90,25)
		
		await DialogueManager.dialogue_ended
		await get_tree().create_timer(0.5).timeout
		
		dialog = DialogueManager.show_example_dialogue_balloon(load("res://Dialogi/anglia.dialogue"), "przeniesienie")
		await get_tree().process_frame  # poczekaj aż się zbuduje
		balloon = dialog.get_child(0)
		balloon.position = Vector2(90, 25)
		
		$animation.play("przeniesienie")
		await $animation.animation_finished	
		get_tree().change_scene_to_file("res://scenes/tutorial/test_scene.tscn")
		DialogueManager.show_example_dialogue_balloon(load("res://Dialogi/Tutorial.dialogue"), "powrot")
		
	player.visible = true



func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed   :
		if GlobalEq.selected_item_id == "proca":
				rzucanie("udany_rzut")
				
				MusicManager.set_volume(-10)
				GlobalEq.remove_item("proca")
				GlobalEq.remove_item("kamyk")
				GlobalEq.remove_item("kamyczek")
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
			
