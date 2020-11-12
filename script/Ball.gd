extends RigidBody2D
class_name BallOfGame

#Attributs
onready var sound_tick_sc_ = preload("res://scene/LecteurAudio.tscn")

export var thrust: = Vector2(-0,0)
var torque = 0
var direction_actuel: = -1 # 1 pour droite -1 pour gauche (modif via main script)

#Methods
func _ready():
	setting_ball(direction_actuel)
	linear_velocity = thrust

###On applique les force et impulsion etc ici
func _integrate_forces(_state):
	if direction_actuel == 1:
		apply_central_impulse(thrust) 

	if direction_actuel == -1:
		apply_central_impulse(-thrust) 

func setting_ball(direction_actu):
	if direction_actu == 1:
		thrust = Vector2(-5,0)
	if direction_actu == -1:
		thrust = Vector2(5,0)

func _on_Ball_body_entered(body):
	var newsound = sound_tick_sc_.instance()
	add_child(newsound)
	if body.has_method("get_player_name"):
		direction_actuel *= -1
	
	
