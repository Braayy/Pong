extends Node

var player1_score = 0
var player2_score = 0

func _on_scored(player):
	if player == 1:
		player1_score = player1_score + 1
	if player == 2:
		player2_score = player2_score + 1
	
	_rumble_control(player)
	
	get_node("%Player1 Score").text = str(player1_score)
	get_node("%Player2 Score").text = str(player2_score)

func _rumble_control(player):
	if Input.get_connected_joypads().size() > 0:
		if Game.local_multiplayer:
			Input.start_joy_vibration(Input.get_connected_joypads()[0], 1, 1, 1)
		elif player == 1:
			Input.start_joy_vibration(Input.get_connected_joypads()[0], 1, 1, 1)
