extends Node2D

###Methods
func _ready():
	randomize()
	var rngint = randi()% 2
	if rngint == 1:
		$AudioTick1.playing = true
	else:
		$AudioTick2.playing = true
