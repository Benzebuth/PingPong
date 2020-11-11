extends Control


var last_key_presse
var array_of_bind


func _ready():
	var event = InputEventKey.new()
	event.scancode = KEY_T
	InputMap.add_action('test')
	InputMap.action_add_event('test', event)

	

func _input(event):
	if event is InputEventKey :
		last_key_presse = event
#		print(last_key_presse.scancode)


### Remapping de touche
func _on_Button_p1mod_up_pressed():
	var new_bind = last_key_presse
	InputMap.action_erase_events("ui_up_player1")
	InputMap.action_add_event("ui_up_player1", new_bind)
	$HBoxContainer/ZoneBoutonP1/HBoxContainerP1/Button_p1mod_up.text = str(new_bind.as_text())

func _on_Button_p1mod_down_pressed():
	var new_bind = last_key_presse
	InputMap.action_erase_events("ui_down_player1")
	InputMap.action_add_event("ui_down_player1", new_bind)
	$HBoxContainer/ZoneBoutonP1/HBoxContainerP1/Button_p1mod_down.text = str(new_bind.as_text())
	

func _on_Button_p2mod_up_pressed():
	var new_bind = last_key_presse
	InputMap.action_erase_events("ui_up_player2")
	InputMap.action_add_event("ui_up_player2", new_bind)
	$HBoxContainer/ZoneBoutonP2/HBoxContainer/Button_p2mod_up.text = str(new_bind.as_text())


func _on_Button_p2mod_down_pressed():
	var new_bind = last_key_presse
	InputMap.action_erase_events("ui_down_player2")
	InputMap.action_add_event("ui_down_player2", new_bind)
	$HBoxContainer/ZoneBoutonP2/HBoxContainer/Button_p2mod_down.text = str(new_bind.as_text())
		

func _on_Button_toggled(button_pressed):
	if button_pressed:
		$HBoxContainer/ZoneBoutonPause/Button/AnimatedSprite.play("pause")
		get_tree().paused = true
	else:
		$HBoxContainer/ZoneBoutonPause/Button/AnimatedSprite.play("play")
		get_tree().paused = false

