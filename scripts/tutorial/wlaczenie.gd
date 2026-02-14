extends Area2D


var can_interact = false
var player_ref: Node = null

@onready var portalSFX = $portalSFX

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
				GlobalC.dialog = false
				GlobalC.open= false
				GameSignals.solution_ok = false
				GlobalC.first_play = true
				GlobalC.first_play_next = true
				GlobalC.next_dialog = false
				player_ref.visible = false
				$portal.play("open")
				GlobalEq.remove_item("portal_open")
				await $portal.animation_finished
				portalSFX.play()
				DialogueManager.show_example_dialogue_balloon(load("res://Dialogi/Tutorial.dialogue"), "portal")	
				$portal.play("open_portal")
				await $portal.animation_finished
				DialogueManager.show_example_dialogue_balloon(load("res://Dialogi/Tutorial.dialogue"), "wessanie")	
				$portal.play("teleportation")		
				#await get_tree().create_timer(2.5).timeout
				await $portal.animation_finished
				MusicManager.play_music("res://soundtracki/magical_theme.wav")
				MusicManager.set_volume(-10)
				await get_tree().create_timer(0.1).timeout
				get_tree().change_scene_to_file("res://scenes/kopernik/obserwatorium.tscn")
				DialogueManager.show_example_dialogue_balloon(load("res://Dialogi/kopernik.dialogue"), "poczatek")
