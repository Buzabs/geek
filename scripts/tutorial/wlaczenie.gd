extends Area2D

var load_scenes = "res://scenes/level_1/anglia.tscn"

var solution_ok: bool = false
var can_interact = false
var player_ref: Node = null



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

		


	
func _input_event(viewport, event, shape_idx):
	if not GameSignals.solution_ok:
		return
	if event is InputEventMouseButton and event.pressed  and can_interact :
		if GlobalEq.selected_item_id == "portal_open":
				GlobalEq.remove_item("potka")
				GlobalEq.remove_item("sus")
				GlobalEq.remove_item("ciii")
				player_ref.visible = false
				$portal.play("open")
				GlobalEq.remove_item("portal_open")
				await $portal.animation_finished
				DialogueManager.show_example_dialogue_balloon(load("res://Dialogi/Tutorial.dialogue"), "portal")	
				$portal.play("open_portal")
				await $portal.animation_finished
				DialogueManager.show_example_dialogue_balloon(load("res://Dialogi/Tutorial.dialogue"), "wessanie")	
				$portal.play("teleportation")		
				#await get_tree().create_timer(2.5).timeout
				await $portal.animation_finished
				get_tree().change_scene_to_file(load_scenes)
