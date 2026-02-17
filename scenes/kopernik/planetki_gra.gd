extends Area2D




@export var id_planety : Array[String]
@export var planeta: Array[Texture2D]= []
@export var item_icon: Array[Texture2D]
@export var target:NodePath

@export var slot_id : String
@export var default: Texture2D

var index : int = -1


func _ready():
	
	if GlobalC.textura_planetki.has(slot_id):
		index = GlobalC.textura_planetki[slot_id]
		if index >= 0 and index < planeta.size():
			get_node(target).texture = planeta[index]

func ustaw_planetke(index):
	GlobalEq.remove_item(GlobalEq.selected_item_id)
	get_node(target).texture = planeta[index]
	GlobalC.textura_planetki[slot_id] = index

func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if get_node_or_null(target).texture == default:
			index = id_planety.find(GlobalEq.selected_item_id)
			if index!= -1:
				ustaw_planetke(index)
				
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_RIGHT and event.pressed :
		if GlobalEq.slots.size() >= 5:
			return false
		if GlobalC.textura_planetki.has(slot_id):	
			index = GlobalC.textura_planetki[slot_id]
			if get_node_or_null(target).texture == planeta[index]:
				GlobalEq.add_item(item_icon[index],id_planety[index])
				get_node_or_null(target).texture = default
				index = -1
				GlobalC.textura_planetki[slot_id] = index
		
