extends Sprite2D

func _ready():
	MusicManager.play_music("res://soundtracki/Magic Town.mp3")
	MusicManager.set_volume(-10)
	MusicManager.process_mode = Node.PROCESS_MODE_ALWAYS
