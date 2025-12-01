extends Node2D

func _ready():
	if randi() % 2 == 0:
		$TextureRect.texture = load("res://sprites/do_zdobycia/sus.png")
	else:
		$TextureRect.texture = load("res://sprites/do_zdobycia/lopata.png")
