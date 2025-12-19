class_name slot_UI extends Button

var slot_data : Slot : set = set_slot

@onready var texture: TextureRect = $TextureRect


func _ready() -> void:
	texture.texture = null
	

func set_slot(value: Slot) -> void:
	slot_data = value
	if slot_data == null:
		return
	texture.texture = slot_data.item_data.texture	
