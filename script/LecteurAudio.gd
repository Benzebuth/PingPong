extends Node2D


func _ready():
	randomize()
	var rngint = randi()% 2
#	print(rngint)
	if rngint == 1:
		$AudioTick1.playing = true
	else:
		$AudioTick2.playing = true
