extends KinematicBody2D

### attributs
export (int) var vitesse_player_two = 40
export (int) var speed_bot = 17

var motion: = Vector2.ZERO
var playertwo: = "player2" setget set_player_name, get_player_name
var mode_bot: = false
var id_ball_recu: = 0

###Methods
func _physics_process(_delta):
	if mode_bot:
		mouvement_bot()
	else:
		mouvement_player()
	
	motion = move_and_slide(motion, Vector2.ZERO)
	motion.y = lerp(motion.y, 0, 0.04)
	
func mouvement_bot():
	motion.x = 0
	if instance_from_id(id_ball_recu):
		var ball_obj_pos = instance_from_id(id_ball_recu)
		var bot_move = position.direction_to(ball_obj_pos.position)
		if bot_move.y > 0:
			motion.y += speed_bot
		elif bot_move.y < 0:
			motion.y += -speed_bot

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

# est-ce que case coché
func _on_Hud_bot_mode_signal(bot_on_off):
	mode_bot = bot_on_off

# Reception de l'id de l'instance de ball
func _on_Main_id_ball_bot(id_de_balle):
	id_ball_recu = id_de_balle
