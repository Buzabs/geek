extends CanvasLayer

@onready var back := $Control/Back
@onready var exit := $Control/Exit
@onready var volume := $Control/Volume2

@onready var volume_menu:= $Control/Volume


func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS

	
	volume_menu.visible = false
	back.visible = true
	exit.visible = true
	volume.visible = true



func _on_volume_pressed() -> void:
	back.visible = false
	exit.visible = false
	volume.visible = false
	
	volume_menu.visible = true
