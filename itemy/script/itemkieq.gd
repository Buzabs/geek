extends Area2D


@export var item_icon: Texture2D
@export var item_id: String = "sword"
@export var amount: int = 1

var can_pick := false
var player_ref: Node = null

func _ready():
	body_entered.connect(_on_enter)
	body_exited.connect(_on_exit)

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
	if can_pick and Input.is_action_just_pressed("click"):
			if GlobalEq.add_item(item_icon):
				queue_free()
