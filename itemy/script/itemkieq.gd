extends Area2D

@export var item_icon: Texture2D
@export var item_id: String 

@export var itemSFX: AudioStreamPlayer2D

var used :=  false
var can_pick := false
var player_ref: Node = null

func _ready():
	if is_in_group("planets") :
		if  GlobalC.next_dialog :
			visible= true
	if GlobalC.collected_items.get(item_id, false):
		queue_free()
		return
	body_entered.connect(_on_enter)
	body_exited.connect(_on_exit)
		

func collect():
	GlobalC.collected_items[item_id] = true	
	if item_id == "potka":
		GlobalC.next()
	if item_id == "portal_open":
		DialogueManager.show_example_dialogue_balloon(preload("res://Dialogi/Tutorial.dialogue"), "find")
		GlobalEq.dialogue = true
	queue_free()
		
func _on_enter(body):
	if body.is_in_group("player") and GlobalEq.pick :
		can_pick = true
		player_ref = body
	

func _on_exit(body):
	if body == player_ref:
		can_pick = false
		player_ref = null
		

func _process(_delta):		
	if is_in_group("planets") and GlobalC.rzut:
		if not GlobalC.next_dialog :
			visible = false
	if can_pick and Input.is_action_just_pressed("items") and visible :
			if GlobalEq.add_item(item_icon, item_id)  :
				itemSFX.play()
				collect()
				queue_free()
