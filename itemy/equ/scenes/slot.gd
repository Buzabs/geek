extends TextureButton
class_name SlotButton

@export var normal_texture: Texture2D
@export var selected_texture: Texture2D

func _ready():
	texture_normal = normal_texture

func set_selected(value: bool):
	texture_normal = selected_texture if value else normal_texture
