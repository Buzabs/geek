extends Sprite2D

@export var open_lock : Texture2D
@export var klodka: Sprite2D
@export var icon_default: Texture2D



func _ready():
	klodka.icon = icon_default
	

	

func _input_event(_viewport, event, _shape_idx):
	if GlobalC.open:
		klodka.icon = open_lock
		
