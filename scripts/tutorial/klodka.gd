extends Sprite2D


@export var klodka: Sprite2D

func _ready():
	GameSignals.solution_checked.connect(_odbierz)
	if GlobalC.open:
		klodka.visible= false
		return
	klodka.visible= true


func _odbierz():
	if GameSignals.solution_ok:
		klodka.visible= false
	
	
