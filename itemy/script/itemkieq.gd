extends Area2D

@export var item_icon: Texture2D
@export var item_id: String 

var used :=  false
var can_pick := false
var player_ref: Node = null

func _ready():
	if GlobalC.collected_items.get(item_id, false):
		queue_free()
		return
	body_entered.connect(_on_enter)
	body_exited.connect(_on_exit)
		

func collect():
	GlobalC.collected_items[item_id] = true
	queue_free()	
		
func _on_enter(body):
	if body.is_in_group("player"):
		can_pick = true
		player_ref = body
		print("Gracz wszedł w item")

func _on_exit(body):
	if body == player_ref:
		can_pick = false
		player_ref = null
		print("Gracz wyszedł z itemu")

func _process(_delta):		
	if can_pick and Input.is_action_just_pressed("items"):
			if GlobalEq.add_item(item_icon, item_id):
				collect()
				queue_free()
