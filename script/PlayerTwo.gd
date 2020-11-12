extends KinematicBody2D

### attributs
export (int) var vitesse_player_two = 50
var motion: = Vector2.ZERO
var playertwo = "player2" setget set_player_name, get_player_name

###Methods
func _ready():
	pass # Replace with function body.

func _physics_process(_delta):
	mouvement_player()
	
	motion = move_and_slide(motion, Vector2.ZERO)
	motion.y = lerp(motion.y, 0, 0.04)

func mouvement_player():
	motion.x = 0
	if Input.is_action_pressed("ui_up_player2"):
		motion.y += -vitesse_player_two
	if Input.is_action_pressed("ui_down_player2"):
		motion.y += vitesse_player_two

func set_player_name(parma1):
	playertwo = parma1

func get_player_name():
	return playertwo
