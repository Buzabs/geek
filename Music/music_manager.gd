extends AudioStreamPlayer

var current_track := ""

func play_music(path: String):
	if current_track == path:
		return
	current_track = path
	stream = load(path)
	play()

func set_volume(db: float):
	volume_db = db
