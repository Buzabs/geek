extends Area2D

@export var open = Texture2D
@export var sprite = Sprite2D
@export var item: Area2D

var can_open:= false
var player_ref: Node = null

func _ready():
	if item != null:
		item.visible = false
	body_entered.connect(_on_enter)
	body_exited.connect(_on_exit)

func _on_enter(body):
	if body.is_in_group("player"):
		can_open = true
		player_ref = body
		

func _on_exit(body):
	if body == player_ref:
		can_open = false
		player_ref = null
		
		
func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed  and can_open:
		sprite.texture = open
		if item != null:
			item.visible = true
