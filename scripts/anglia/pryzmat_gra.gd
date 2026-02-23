extends Area2D

@export var promien: Array[Texture2D]
@onready var sprite := $Pryzmat
@export var textures: Array[Texture2D]
@export var id: int

var index := 0

var wymagania = {
	0: 2,
	2: 0
	
}



func _ready():
	add_to_group("pryzmat")
	input_event.connect(_on_input_event)


func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == MOUSE_BUTTON_LEFT \
	and event.pressed:

		index = (index + 1) % textures.size()
		sprite.texture = textures[index]

		sprawdz_uklad()


func sprawdz_uklad():
	var p1 = null
	var p2 = null

	# znajdź oba pryzmaty po id
	for p in get_tree().get_nodes_in_group("pryzmat"):
		if p.id == 1:
			p1 = p
		elif p.id == 2:
			p2 = p

	if not wymagania.has(p1.index):
		$"../promien".texture = promien[0]
		return

	if p2.index != wymagania[p1.index]:
		$"../promien".texture = promien[0]
		return
	else:
		$"../promien".texture = promien[1]
		return
	
