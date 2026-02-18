extends Area2D

@export var open = Texture2D
@export var sprite = Sprite2D
@export var item: Area2D
@export var item2: Area2D
@export var id_przedmiotu: String

var can_interact = false
var player_ref: Node = null

func _ready():
	if GlobalC.was_open.get(id_przedmiotu, false):
		sprite.texture = open
		if item != null:
			item.visible = true
			return
	if item != null :
		item.visible = false
	if item2 != null:
		item2.visible = false
	body_entered.connect(_on_enter)
	body_exited.connect(_on_exit)

		
func _on_enter(body):
	if body.is_in_group("player"):
		can_interact = true
		player_ref = body
		print("Gracz wszedł w obiekto")

func _on_exit(body):
	if body == player_ref: 
		can_interact = false
		player_ref = null
		print("Gracz wyszedł z obiektu")
		
func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed  and can_interact:
		GlobalC.was_open[id_przedmiotu] = true
		sprite.texture = open
		if item != null:
			item.visible = true
		if item2 != null:
			item2.visible = true
