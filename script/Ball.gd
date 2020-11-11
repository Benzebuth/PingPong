extends RigidBody2D
class_name BallOfGame

#Attributs
export var thrust: = Vector2(-0,0)
var torque = 0
var direction_actuel: = -1 # 1 pour droite -1 pour gauche (modif via main script)


#Methods
func _ready():
	setting_ball(direction_actuel)
	linear_velocity = thrust

func setting_ball(direction_actu):
	if direction_actu == 1:
		thrust = Vector2(-5,0)
	if direction_actu == -1:
		thrust = Vector2(5,0)

func _integrate_forces(state):
	if direction_actuel == 1:
		apply_central_impulse(thrust) 

	if direction_actuel == -1:
		apply_central_impulse(-thrust) 


func _on_Ball_body_entered(body):
	if body.has_method("get_player_name"):
		direction_actuel *= -1
		
