extends Node2D

var local_multiplayer = false

func _ready():
	pass

func _process(delta):
	if Input.is_action_just_pressed("player2_toggle"):
		local_multiplayer = not local_multiplayer
