extends Node2D

onready var ball_obj = preload("res://scene/Ball.tscn").instance()
onready var new_goal = preload("res://scene/Goal.tscn").instance()
onready var audio_sc = preload("res://scene/AudioCrowdWin.tscn")

var scorePone: = 0
var scorePtwo: = 0
var direction_actuel_ball: = 1
onready var monTimer = $TimerBut


signal cest_le_but

func _ready():
	ball_obj.position = Vector2(500,300)
	add_child(ball_obj)
	

### Goal pour P2
func _on_Goal_Gauche_body_entered(body):
	
	var newcrowdsound = audio_sc.instance()
	add_child(newcrowdsound)
	emit_signal("cest_le_but")
	add_child(new_goal)
	scorePtwo += 1
	$Hud/HBoxContainer/CenterContainer/HBoxContainer/score_P2.text = str(scorePtwo)
	new_goal.get_node("Score_p2").text = str(scorePtwo)
	body.queue_free() # ball delete
	monTimer.start()

### Goal pour P1
func _on_Goal_Droite_body_entered(body):
	
	var newcrowdsound = audio_sc.instance()
	add_child(newcrowdsound)
	emit_signal("cest_le_but")
	add_child(new_goal)
	scorePone += 1
	$Hud/HBoxContainer/CenterContainer/HBoxContainer/score_P1.text = str(scorePone)
	new_goal.get_node("Score_p1").text = str(scorePone)
	body.queue_free() # ball delete
	monTimer.start()



### GESTION DE LA BALL sur le terrain (2 area gauche/droite)
func _on_Area2DGauche_body_entered(body):
#	print("ZONE GAUCHE => ACTIVE ", direction_actuel_ball)
	if body.get("direction_actuel"):
		body.direction_actuel = -1
		direction_actuel_ball = body.direction_actuel

func _on_Area2DDroite_body_entered(body):
#	print("ZONE DROITE => ACTIVE ", direction_actuel_ball)
	if body.get("direction_actuel"):
		body.direction_actuel = 1
		direction_actuel_ball = body.direction_actuel

### Replacer la ball et donner le bon sens de départ
func _on_TimerBut_timeout():
#	print("Timeout du timer")
	remove_child(new_goal)
	direction_actuel_ball *= -1
	ball_obj = load("res://scene/Ball.tscn").instance()
	if direction_actuel_ball == 1:
		ball_obj.position = Vector2(550, 300)
	if direction_actuel_ball == -1:
		ball_obj.position = Vector2(450, 300)
		
	ball_obj.setting_ball(direction_actuel_ball)
	add_child(ball_obj)

